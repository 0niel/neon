import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/platform/platform.dart';

/// iOS specific platform information.
///
/// See:
///   * [NeonPlatform] to initialize and acquire an instance
///   * `LinuxNeonPlatform` for the Linux implementation
@immutable
class IOSNeonPlatform implements NeonPlatform {
  /// Creates a new Android Neon platform.
  const IOSNeonPlatform();

  /// Registers this platform.
  static void registerWith() {
    NeonPlatform.instance = const IOSNeonPlatform();
  }

  @override
  bool get canUseCamera => true;

  @override
  bool get canUsePushNotifications => false;

  @override
  bool get canUseQuickActions => true;

  @override
  bool get canUseWebView => true;

  @override
  bool get canUseWindowManager => false;

  @override
  bool get canUseSharing => true;

  @override
  bool get canUsePaths => true;

  @override
  void init() {}

  @override
  Future<void> saveFileWithPickDialog(String fileName, String mimeType, Uint8List data) async {
    await FilePicker.platform.saveFile(
      fileName: fileName,
      bytes: data,
    );
  }
}
