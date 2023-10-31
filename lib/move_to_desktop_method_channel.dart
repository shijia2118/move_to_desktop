import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'move_to_desktop_platform_interface.dart';

/// An implementation of [MoveToDesktopPlatform] that uses method channels.
class MethodChannelMoveToDesktop extends MoveToDesktopPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('move_to_desktop');

  @override
  Future<bool> moveToDesktop() async {
    final result = await methodChannel.invokeMethod<bool>('move_to_desktop');
    return result??false;
  }

  @override
  Future<bool> moveToFront() async {
    final result = await methodChannel.invokeMethod<bool>('move_to_front');
    return result??false;
  }
}
