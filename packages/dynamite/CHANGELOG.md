## 0.5.0+1

 - **REFACTOR**: change package file structure. ([6696e6ea](https://github.com/nextcloud/neon/commit/6696e6ead1751462e233afb5eab22a458e0c9e73))
 - **FIX**(dynamite): Escape HTML in docs. ([063730f4](https://github.com/nextcloud/neon/commit/063730f448be7c9806183a844ad3fab4275e8580))
 - **FIX**(dynamite): Escape wireNames. ([5915c570](https://github.com/nextcloud/neon/commit/5915c57035879db20ba7700924dffaf70255b549))

## 0.5.0

> Note: This release has breaking changes.

 - **REFACTOR**: Lower Dart SDK constraint to ^3.0.0. ([d4d149f9](https://github.com/nextcloud/neon/commit/d4d149f9b19650abebe1abef03f6f4202cfd2416))
 - **REFACTOR**(dynamite): use schema.nullable instead of parameters. ([c56cee5a](https://github.com/nextcloud/neon/commit/c56cee5a2424e72efddef13ad29e34d26d857779))
 - **REFACTOR**(dynamite): add identifier to the schema. ([9ddfed36](https://github.com/nextcloud/neon/commit/9ddfed36f1d2685e14c9bf3d168f3e00ad3b16a9))
 - **REFACTOR**(dynamite): use reference to import package:built_value/serializer.dart. ([a3f25b64](https://github.com/nextcloud/neon/commit/a3f25b64d1f6b1862fe251d338392a63d544ac09))
 - **REFACTOR**(dynamite): use a custom allocator to handle the part directive. ([c788f23d](https://github.com/nextcloud/neon/commit/c788f23d9c0229502d7060f1b432f59d9970ad1a))
 - **REFACTOR**(dynamite): move spec loading into the State. ([f5c68aa1](https://github.com/nextcloud/neon/commit/f5c68aa1ca4b3e8a7551b1728f6b9e58e8845639))
 - **REFACTOR**(dynamite): handle `AssetId`s in the State. ([9c5c5417](https://github.com/nextcloud/neon/commit/9c5c5417a040f7b3ece2c4df4e8bd9f91fdf7296))
 - **FIX**(dynamite): Add missing docs about request body. ([1be37446](https://github.com/nextcloud/neon/commit/1be374469ec80cafe078d8329557fb0a8cb8e222))
 - **FIX**(dynamite): Fix request body serialization and defaults. ([5c856555](https://github.com/nextcloud/neon/commit/5c8565550c62835128ac317bfd24976466fb151e))
 - **FIX**(dynamite): Suggest correct coverage ignore patterns in README. ([766e7755](https://github.com/nextcloud/neon/commit/766e7755dd30a8316a064894e7466346609edab2))
 - **FIX**(dynamite): resolve Uint8List into TypeResultBase. ([f3f7f3a4](https://github.com/nextcloud/neon/commit/f3f7f3a480f80fde3cd66c648582d35b55bb37a1))
 - **FIX**(dynamite): prefix package:collection imports. ([41f6b039](https://github.com/nextcloud/neon/commit/41f6b039dcbd20a630cfd448719e9c28fe91c485))
 - **FEAT**(dynamite): add `Built` interface to the generated interfaces. ([a83cd273](https://github.com/nextcloud/neon/commit/a83cd273897aad476017a693fc07d5bd3e3443ee))
 - **FEAT**(dynamite): Warn about unused coverage ignore patterns from config. ([91aab2f9](https://github.com/nextcloud/neon/commit/91aab2f95d700877db0b3555c4c02ceaebcfa274))
 - **BREAKING** **REFACTOR**(dynamite,dynamite_runtime): Remove DynamiteRawResponse. ([4cdd5fd6](https://github.com/nextcloud/neon/commit/4cdd5fd6906e1d0a5e253c6660a1aafa462341e5))
 - **BREAKING** **REFACTOR**(dynamite): Always use the same parameter name for the request body. ([bc63af17](https://github.com/nextcloud/neon/commit/bc63af1740958a967af9087c1841af3b6a06fc2f))
 - **BREAKING** **REFACTOR**(dynamite_runtime): Make ResponseConverter sync. ([ece8c6e0](https://github.com/nextcloud/neon/commit/ece8c6e046652bf6281318d6f2f8633ecc548f2c))
 - **BREAKING** **REFACTOR**(dynamite): Make interfaces sealed. ([cdb2d4a4](https://github.com/nextcloud/neon/commit/cdb2d4a4204a4216e1f329ebb5080ba4fb7b1c02))
 - **BREAKING** **FIX**(dynamite): Reserve builder interface method keywords. ([b278269c](https://github.com/nextcloud/neon/commit/b278269ca10bdef8d7f74328b9683cc485b03f0b))
 - **BREAKING** **FIX**(dynamite): Handle nullable generics and serializers correctly. ([d126c5bf](https://github.com/nextcloud/neon/commit/d126c5bfd7ef0d515a03404f5eff3d3baef740bc))

## 0.4.0

> Note: This release has breaking changes.

 - **REFACTOR**(dynamite): remove toFieldName as toDartName already escapes reserved class names. ([fa5fa4e2](https://github.com/nextcloud/neon/commit/fa5fa4e2f57af3f491ae083afec27d2c99d0f386))
 - **REFACTOR**(dynamite): simplify mimetype resolving. ([917bac4f](https://github.com/nextcloud/neon/commit/917bac4ff611f74f30c3864b16145ca9ce3eea4c))
 - **REFACTOR**(dynamite): remove unused resolvedInterfaces. ([688bba79](https://github.com/nextcloud/neon/commit/688bba797b595f42268cda4f86ab288306bd3b4d))
 - **REFACTOR**(dynamite): split JsonSchema into per type classes. ([ffa5b328](https://github.com/nextcloud/neon/commit/ffa5b3280f7588f7c2e7bae73428538d23f97169))
 - **REFACTOR**(dynamite): remove Schema.ofs getter and utilize null promotion in ofs generation. ([79aa8872](https://github.com/nextcloud/neon/commit/79aa887282e3b09fa4ade9b548e4a091ebed7892))
 - **REFACTOR**(dynamite): rename Schema to JsonSchema. ([ad4d6add](https://github.com/nextcloud/neon/commit/ad4d6add7d0cf5338dabe38cacb28d693e6c6028))
 - **REFACTOR**(dynamite): move Schema into a separate library. ([8d2e44db](https://github.com/nextcloud/neon/commit/8d2e44db7cc7cd94e79d5c8535d1b99cfc24b291))
 - **FIX**(dynamite): support all default value types. ([4098e783](https://github.com/nextcloud/neon/commit/4098e7834366b274e849e5f416aed0a684bbc9f9))
 - **FIX**(dynamite): allow default values and validators in atomic allOf types. ([39459c9a](https://github.com/nextcloud/neon/commit/39459c9a28253ec687a37f236d0547d24404800b))
 - **FEAT**(dynamite): do not rely on the openapi spec for type resolving. ([59252c76](https://github.com/nextcloud/neon/commit/59252c76265f8d6afd784ff41974436979bdd538))
 - **FEAT**(dynamite_runtime): add support for number validators. ([90f5924c](https://github.com/nextcloud/neon/commit/90f5924c3ba0787e7a155f0d07fea0a16bb2ff4e))
 - **FEAT**(dynamite_runtime): add validators that accept dynamic also working on JsonObject. ([6e8ec22f](https://github.com/nextcloud/neon/commit/6e8ec22f4dd894ab949a130214d293c246c13083))
 - **FEAT**(dynamite): support jsonschema meta-data annotations. ([9658bf4b](https://github.com/nextcloud/neon/commit/9658bf4b6e91df3630326bf79681b5352198c592))
 - **FEAT**(dynamite): cache deserialized default values. ([b3124a5c](https://github.com/nextcloud/neon/commit/b3124a5cb01a3f0a8c5ff06e772d914cef3ecc0f))
 - **BREAKING** **FEAT**(dynamite): type unique arrays as BuiltSet. ([21be1f71](https://github.com/nextcloud/neon/commit/21be1f71b0f2afa91d9d14d2d10f354dcec13665))

## 0.3.0

> Note: This release has breaking changes.

 - **REFACTOR**(dynamite): externalize url path generation. ([c42e100c](https://github.com/nextcloud/neon/commit/c42e100cf307f8a456c98ff0df5dfc5d71c0db25))
 - **REFACTOR**(dynamite): use logger to display warnings. ([4fb4ce3a](https://github.com/nextcloud/neon/commit/4fb4ce3a14d993ace352e8ca3374bb12d6b5475f))
 - **REFACTOR**: Stop using spread list operator. ([bb8a2965](https://github.com/nextcloud/neon/commit/bb8a29651b371166131e8254afa36550802c8f8a))
 - **REFACTOR**(dynamite): deduplicate object interface generation. ([13f783cf](https://github.com/nextcloud/neon/commit/13f783cf8a3f08e5e29f8f43cbf7f98784753440))
 - **REFACTOR**(dynamite): unify allOf and object generation. ([fb84f5a6](https://github.com/nextcloud/neon/commit/fb84f5a6574678490b732115cd8d338c75233282))
 - **REFACTOR**(dynamite): move defaults and validation methods to the interface. ([f2c6a174](https://github.com/nextcloud/neon/commit/f2c6a174f7b42ead486ad5f2c941bfe1e526f222))
 - **REFACTOR**(dynamite): directly write to the code body StringBuffer. ([ea9e05cb](https://github.com/nextcloud/neon/commit/ea9e05cbc17716c3599c69570272ba7bb42706b0))
 - **REFACTOR**(dynamite): prefer using allocator over an emitter. ([61fa838b](https://github.com/nextcloud/neon/commit/61fa838bfdfd1cf601b250a62d5d3e28b5bc303b))
 - **REFACTOR**(dynamite): externalize response type resolving. ([a16cc4b1](https://github.com/nextcloud/neon/commit/a16cc4b176cbb4135113a2cddcc6ff2d389793f9))
 - **REFACTOR**(dynamite): split mimetype resolving and parameter generation. ([db32d953](https://github.com/nextcloud/neon/commit/db32d953e987d619457e91555d1a61d3ed39599b))
 - **REFACTOR**(dynamite): split parameter resolving and generation. ([c68be1d0](https://github.com/nextcloud/neon/commit/c68be1d071dbd71838a786d9b39cd00a82829419))
 - **REFACTOR**(dynamite): prefer using TypeReference over emitter. ([afdb0841](https://github.com/nextcloud/neon/commit/afdb0841a3935e35d1d3eb2d8dcbe069d5e80856))
 - **REFACTOR**(dynamite_runtime): rework DynamiteRawResponse. ([e7f2f351](https://github.com/nextcloud/neon/commit/e7f2f351057f90ab83d18af63684b7c50e617855))
 - **PERF**(dynamite): use memoization for for better performance. ([b25c4089](https://github.com/nextcloud/neon/commit/b25c408935c537e9d590080b34f1194ed8ac319b))
 - **FIX**(dynamite): json schema reference resolving. ([a3c55c16](https://github.com/nextcloud/neon/commit/a3c55c16a3f84793b39e53c24d6191ea6d092a4e))
 - **FIX**(dynamite): append `_test` to test file names. ([3e661503](https://github.com/nextcloud/neon/commit/3e6615037c74fe9f6d18379c61addcea2cca46b4))
 - **FIX**(dynamite): always require content for a request body. ([a5388620](https://github.com/nextcloud/neon/commit/a5388620eb55db4d62525e12cc8616af0cbeb896))
 - **FIX**(dynamite): inherrit _defaults and _validate hooks in allOf. ([af959dbf](https://github.com/nextcloud/neon/commit/af959dbf7c6cd495124adbe5ca0fa3670ffea54a))
 - **FIX**(dynamite): allow boolean values for Schema.additionalProperties. ([3266d742](https://github.com/nextcloud/neon/commit/3266d742c221d63e14db4e6abee06c278383161b))
 - **FIX**(dynamite): recursively use  for generic in TypeResult.dartType. ([fb14a15d](https://github.com/nextcloud/neon/commit/fb14a15d8aa373f2117b881ff6382cee312028eb))
 - **FIX**(dynamite): more resilient doc comment generation. ([e09495f8](https://github.com/nextcloud/neon/commit/e09495f82916a17ddf827441427f6c8b718799c3))
 - **FIX**(dynamite): build config to allow built_value_generator running inside dynamite. ([83e66243](https://github.com/nextcloud/neon/commit/83e6624378c79d534e6e3440721e48e7a9e518f7))
 - **FIX**(dynamite): only allow a single contenttype for parameters. ([e7b503dd](https://github.com/nextcloud/neon/commit/e7b503dd1c0a88c5b95a853d6f43a46e9fdc97e1))
 - **FEAT**(dynamite_runtime): add dynamite serializer. ([187e0cee](https://github.com/nextcloud/neon/commit/187e0cee717cfdd917c302a5b536fb65a55073d8))
 - **FEAT**(dynamite_runtime): use http.Request in generated code. ([c9d0b243](https://github.com/nextcloud/neon/commit/c9d0b243accd8d70601260797c5168f09ef61ee7))
 - **FEAT**(dynamite): Remove need for double fix and format. ([3f159419](https://github.com/nextcloud/neon/commit/3f159419e43e547bdd47d2158604c441982977a6))
 - **FEAT**(dynamite): allow escaping reserved method names. ([aa19a9a4](https://github.com/nextcloud/neon/commit/aa19a9a444aca6798075d3d2f70d573abc6babaa))
 - **BREAKING** **REFACTOR**(dynamite,dynamite_runtime): Always send cookies for all requests. ([e37b7753](https://github.com/nextcloud/neon/commit/e37b775314601e9281d7336939e4b1eb95b98b55))
 - **BREAKING** **REFACTOR**(dynamite_runtime): Remove executeRequest and executeRawRequest methods. ([eb9e018c](https://github.com/nextcloud/neon/commit/eb9e018c8b12135537268b22566e1eb9518541ed))
 - **BREAKING** **REFACTOR**(dynamite_runtime): validate status code in the dynamite serializer. ([bc6f7d9f](https://github.com/nextcloud/neon/commit/bc6f7d9fb622ee803a2f8df203e43bdae890d5f7))
 - **BREAKING** **REFACTOR**(dynamite,dynamite_runtime,nextcloud): generated clients no longer implement http.Client. ([392e18fa](https://github.com/nextcloud/neon/commit/392e18faa6bb1ba72f22a56184ba0c43ef6b28d4))
 - **BREAKING** **FIX**(dynamite): Use maxItems instead of maxLength to optimize arrays. ([57d8df40](https://github.com/nextcloud/neon/commit/57d8df4046b2661f850fa4a15dc5f89c313bbfb8))
 - **BREAKING** **FIX**(dynamite,nextcloud): escape http methods as reserved method names. ([48233c58](https://github.com/nextcloud/neon/commit/48233c58638da047ca1a6216ecc44d7dd363f77e))
 - **BREAKING** **FEAT**(dynamite): Show field names in oneOf/anyOf validation errors. ([9d236ebc](https://github.com/nextcloud/neon/commit/9d236ebce59da3b9c0e85f2765df36a0ab9f6445))

## 0.2.0

> Note: This release has breaking changes.

 - **REFACTOR**(dynamite): prefer final over var. ([d4cfedad](https://github.com/nextcloud/neon/commit/d4cfedad9207887b107f5f7642d452bbf2c19dcc))
 - **REFACTOR**(dynamite): remove unnecessary casts. ([5f180065](https://github.com/nextcloud/neon/commit/5f180065f089b3ee618ddc3fa6f3f9ceb740edfd))
 - **REFACTOR**(dynamite): remove unnecessary parenthesis. ([86121af4](https://github.com/nextcloud/neon/commit/86121af46293cb8ae4763629be9df12763f908b2))
 - **REFACTOR**(dynamite): use const for typeresults and custom serializers. ([6d69f9c4](https://github.com/nextcloud/neon/commit/6d69f9c45990f863eab86ac5c68cc5354a99fd5f))
 - **REFACTOR**(dynamite): only use raw strings where necessary. ([48dec25f](https://github.com/nextcloud/neon/commit/48dec25feb457475583f139aa277de83946a0f6e))
 - **PERF**(dynamite): Only initialize clients with tag once. ([1c8f0b5b](https://github.com/nextcloud/neon/commit/1c8f0b5b460c5cb34037e1fa8b6f1717f18b05ea))
 - **FIX**(dynamite): Add Type as keyword. ([aeb54bc0](https://github.com/nextcloud/neon/commit/aeb54bc052cf7452be1a5cf46a93cb31f4f8aceb))
 - **FIX**(dynamite): serialization of someOfs with an array member. ([8e895ff6](https://github.com/nextcloud/neon/commit/8e895ff6750d7b084c8d26f3bfaa57f97667f8f9))
 - **FIX**(dynamite): prefix serializers with $ and use a the private field where possible. ([450883f9](https://github.com/nextcloud/neon/commit/450883f9fb2545607d99827582f86e4f0f8fcd87))
 - **FIX**(dynamite): escape RegExp names. ([2bd9ab48](https://github.com/nextcloud/neon/commit/2bd9ab4855ba3e7709e3136fbe58f4bad36d11cf))
 - **FIX**(dynamite): fix reference to enum types. ([a486a9db](https://github.com/nextcloud/neon/commit/a486a9dbf29e5ab5b6ff42cdc0c91520eb40a7a7))
 - **FIX**(dynamite): do not add . to empty lines. ([29abd811](https://github.com/nextcloud/neon/commit/29abd8110e80ca60dda6c3143ff0cbe7809606b6))
 - **FIX**(dynamite): do not split tags at /. ([c206858d](https://github.com/nextcloud/neon/commit/c206858dbc9dbead99fa610449ac89c4c01bf2df))
 - **FEAT**(dynamite): document generated libraries and add support for all info fields. ([671e1b11](https://github.com/nextcloud/neon/commit/671e1b11174351d68337498e34ffe37872b6e664))
 - **FEAT**(dynamite): use named imports for uri/uri. ([b84324e6](https://github.com/nextcloud/neon/commit/b84324e677279fdad8d62a0ab228084a1b65ae5c))
 - **FEAT**(dynamite): remove dependency on universal_io in the generated code. ([a43b8df0](https://github.com/nextcloud/neon/commit/a43b8df01565fcc94e2a171d6d4a274a49af0080))
 - **FEAT**(dynamite): use named imports for dynamite_runtime/http_client. ([1a111fb4](https://github.com/nextcloud/neon/commit/1a111fb49b8b29d6d2462c88cb2bc3b2a066aaa2))
 - **FEAT**(dynamite): use named imports for built_value/standard_json_plugin. ([4fc34fc8](https://github.com/nextcloud/neon/commit/4fc34fc8c1370d60f8920980ebd394bb0b1f5c01))
 - **FEAT**(dynamite): let code_builder name the dynamite_utils import. ([13838b90](https://github.com/nextcloud/neon/commit/13838b90cc4cef36deb66e0e90e8a73e41acd2a8))
 - **FEAT**(dynamite): add doc comments someOf extensions. ([3cf2f17c](https://github.com/nextcloud/neon/commit/3cf2f17cb0da2e6acb6b14994036ff19fd76f9b4))
 - **FEAT**(dynamite): add doc comments to enums. ([33148f88](https://github.com/nextcloud/neon/commit/33148f88a52de8cad8d1d25fbc9dd350ac19bf6e))
 - **FEAT**(dynamite): add doc comments to built classes. ([0be1fbae](https://github.com/nextcloud/neon/commit/0be1fbae28866518ab2be05114bf6e0ef63ed7ec))
 - **FEAT**(dynamite): add doc comments generated someOfs. ([2a67f060](https://github.com/nextcloud/neon/commit/2a67f060658741fdaed8f9beafbc2b5f543e652c))
 - **FEAT**(dynamite): add doc comments to serializers. ([485386ac](https://github.com/nextcloud/neon/commit/485386ac61bdfc4e502ffd6f91799bbb438d82d9))
 - **FEAT**(dynamite): add generated by comment to warn about manual changes. ([f63dd039](https://github.com/nextcloud/neon/commit/f63dd039fa55a3602a6e27a23a0b0e51f7782004))
 - **FEAT**(dynamite): document clients. ([2ac0a29e](https://github.com/nextcloud/neon/commit/2ac0a29e5ee1cdced044bf6ccfbc58150d06e4af))
 - **BREAKING** **REFACTOR**(dynamite): do not double escape names. ([c4df466a](https://github.com/nextcloud/neon/commit/c4df466a2dc4218b26b5e9e059c6b9103cc2e73f))
 - **BREAKING** **REFACTOR**(dynamite_runtime): make authentication optional. ([24653100](https://github.com/nextcloud/neon/commit/24653100cce43aa5567b7b94bc5c8535ea26c273))
 - **BREAKING** **REFACTOR**(dynamite_runtime): use named parameters for executeRequest methods. ([c022dfb5](https://github.com/nextcloud/neon/commit/c022dfb5cdbd48ead5573d2212f46d8fc1920716))
 - **BREAKING** **REFACTOR**(dynamite): remove unecessary allOf interfaces. ([62fe4187](https://github.com/nextcloud/neon/commit/62fe41872443f8c45ebe7866ed2de126038b8886))
 - **BREAKING** **REFACTOR**(dynamite): do not name generated libraries. ([0df67796](https://github.com/nextcloud/neon/commit/0df6779617b4e5c0eb11e13cd1d43289d9dc18c2))
 - **BREAKING** **FEAT**(dynamite,nextcloud): drop userAgent parameter. ([9d7d86a8](https://github.com/nextcloud/neon/commit/9d7d86a80b1f124ec5e6452ec59b5635f1e9a037))
 - **BREAKING** **FEAT**(dynamite): allow clients from the http package. ([bff69c34](https://github.com/nextcloud/neon/commit/bff69c345130d50d957f057f99d06697fb026568))

## 0.1.0

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.

