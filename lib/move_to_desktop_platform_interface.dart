import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'move_to_desktop_method_channel.dart';

abstract class MoveToDesktopPlatform extends PlatformInterface {
  /// Constructs a MoveToDesktopPlatform.
  MoveToDesktopPlatform() : super(token: _token);

  static final Object _token = Object();

  static MoveToDesktopPlatform _instance = MethodChannelMoveToDesktop();

  /// The default instance of [MoveToDesktopPlatform] to use.
  ///
  /// Defaults to [MethodChannelMoveToDesktop].
  static MoveToDesktopPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MoveToDesktopPlatform] when
  /// they register themselves.
  static set instance(MoveToDesktopPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> moveToDesktop() {
    throw UnimplementedError('moveToDesktop() has not been implemented.');
  }
}
