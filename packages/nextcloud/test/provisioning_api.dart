import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';

Future main() async {
  await run(await getDockerImage());
}

Future run(final DockerImage image) async {
  group('provisioning_api', () {
    late DockerContainer container;
    late TestNextcloudClient client;
    setUp(() async {
      container = await getDockerContainer(image);
      client = await getTestClient(container);
    });
    tearDown(() => container.destroy());

    test('Get current user', () async {
      final user = await client.provisioningApi.getCurrentUser();
      expect(user.ocs.data.id, 'user1');
      expect(user.ocs.data.getDisplayName(), 'User One');
      expect(user.ocs.data.displaynameScope, 'v2-federated');
      expect(user.ocs.data.language, 'en');
    });

    test('Get user by username', () async {
      final user = await client.provisioningApi.getUser(userId: 'user1');
      expect(user.ocs.data.id, 'user1');
      expect(user.ocs.data.getDisplayName(), 'User One');
      expect(user.ocs.data.displaynameScope, 'v2-federated');
      expect(user.ocs.data.language, 'en');
    });
  });
}