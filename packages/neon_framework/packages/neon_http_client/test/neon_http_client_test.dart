import 'package:cookie_store/cookie_store.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:interceptor_http_client/interceptor_http_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_http_client/src/interceptors/interceptors.dart';
import 'package:neon_http_client/src/neon_http_client.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';

class _MockCookieStore extends Mock implements CookieStore {}

class _MockInterceptor extends Mock implements HttpInterceptor {}

class _FakeUri extends Fake implements Uri {}

void main() {
  final uri = Uri.parse('http://example.com');
  Request fakeRequest() {
    return Request('PUT', uri);
  }

  StreamedResponse fakeResponse() {
    return StreamedResponse(const Stream.empty(), 200);
  }

  final mockedClient = MockClient((request) async {
    return Response.fromStream(fakeResponse());
  });
  late NeonHttpClient client;

  setUpAll(() {
    registerFallbackValue(_FakeUri());
    registerFallbackValue(fakeResponse());
    registerFallbackValue(fakeRequest());
  });

  tearDown(() {
    client.close();
  });

  group(NeonHttpClient, () {
    test('adds user agent', () {
      client = NeonHttpClient(
        baseURL: Uri(),
        userAgent: 'NeonTest',
      );

      expect(
        client.interceptors,
        contains(isA<BaseHeaderInterceptor>()),
      );
    });

    test('adds cookie store', () {
      final cookieStore = _MockCookieStore();

      client = NeonHttpClient(
        baseURL: Uri(),
        cookieStore: cookieStore,
      );

      expect(
        client.interceptors,
        contains(isA<CookieStoreInterceptor>()),
      );
    });

    test('adds authorization throttling interceptor before cookie store', () {
      final cookieStore = _MockCookieStore();

      client = NeonHttpClient(
        baseURL: Uri(),
        cookieStore: cookieStore,
      );

      expect(
        client.interceptors.first,
        isA<AuthorizationThrottlingInterceptor>(),
      );
    });

    group('interceptors', () {
      late HttpInterceptor interceptor;

      setUp(() {
        interceptor = _MockInterceptor();

        client = NeonHttpClient(
          baseURL: Uri(),
          client: mockedClient,
          interceptors: [interceptor],
        );
      });

      test('does not intercept', () async {
        when(() => interceptor.shouldInterceptRequest(any())).thenReturn(false);
        when(() => interceptor.shouldInterceptResponse(any())).thenReturn(false);

        final request = Request('GET', uri);
        await client.send(request);

        verifyNever(
          () => interceptor.interceptRequest(
            request: any(named: 'request'),
          ),
        );
        verifyNever(
          () => interceptor.interceptResponse(
            response: any(named: 'response'),
            url: any(named: 'url'),
          ),
        );
      });

      test('does intercept', () async {
        when(() => interceptor.shouldInterceptRequest(any())).thenReturn(true);
        when(() => interceptor.shouldInterceptResponse(any())).thenReturn(true);
        when(
          () => interceptor.interceptRequest(request: any(named: 'request')),
        ).thenReturn(fakeRequest());
        when(
          () => interceptor.interceptResponse(response: any(named: 'response'), url: any(named: 'url')),
        ).thenReturn(fakeResponse());

        final request = Request('GET', uri);
        await client.send(request);

        verify(
          () => interceptor.interceptRequest(
            request: any(named: 'request', that: equals(request)),
          ),
        ).called(1);
        verify(
          () => interceptor.interceptResponse(
            response: any(named: 'response'),
            url: any(named: 'url', that: equals(uri)),
          ),
        ).called(1);
      });

      test('rethrows http.ClientExceptions', () async {
        final exception = DynamiteStatusCodeException(Response('', 404));
        when(() => interceptor.shouldInterceptRequest(any())).thenReturn(true);
        when(
          () => interceptor.interceptRequest(request: any(named: 'request')),
        ).thenThrow(exception);

        expect(client.get(uri), throwsA(exception));

        when(() => interceptor.shouldInterceptRequest(any())).thenReturn(true);
        when(() => interceptor.interceptRequest(request: any(named: 'request'))).thenReturn(fakeRequest());
        when(() => interceptor.shouldInterceptResponse(any())).thenReturn(true);
        when(
          () => interceptor.interceptResponse(response: any(named: 'response'), url: any(named: 'url')),
        ).thenThrow(exception);

        expect(client.get(uri), throwsA(exception));
      });

      test('rethrows non-http.ClientExceptions as InterceptionFailure', () async {
        when(() => interceptor.shouldInterceptRequest(any())).thenReturn(true);
        when(
          () => interceptor.interceptRequest(request: any(named: 'request')),
        ).thenThrow(StateError('message'));

        expect(
          client.get(uri),
          throwsA(
            isA<InterceptionException>().having(
              (e) => e.uri,
              'uri',
              uri,
            ),
          ),
        );

        when(() => interceptor.shouldInterceptRequest(any())).thenReturn(true);
        when(() => interceptor.interceptRequest(request: any(named: 'request'))).thenReturn(fakeRequest());
        when(() => interceptor.shouldInterceptResponse(any())).thenReturn(true);
        when(
          () => interceptor.interceptResponse(response: any(named: 'response'), url: any(named: 'url')),
        ).thenThrow(StateError('message'));

        expect(
          client.get(uri),
          throwsA(
            isA<InterceptionException>().having(
              (e) => e.uri,
              'uri',
              uri,
            ),
          ),
        );
      });
    });

    group('timeout', () {
      test('does not time out without timeout', () async {
        client = NeonHttpClient(
          baseURL: Uri(),
          client: MockClient((request) async {
            await Future<void>.delayed(const Duration(milliseconds: 10));

            return Response.fromStream(fakeResponse());
          }),
        );

        expect(
          client.get(uri),
          completion(isA<Response>()),
        );
      });

      test('does time out', () async {
        client = NeonHttpClient(
          baseURL: Uri(),
          timeLimit: const Duration(milliseconds: 3),
          client: MockClient((request) async {
            await Future<void>.delayed(const Duration(milliseconds: 10));

            return Response.fromStream(fakeResponse());
          }),
        );

        expect(
          client.get(uri),
          throwsA(isA<HttpTimeoutException>()),
        );
      });
    });
  });
}
