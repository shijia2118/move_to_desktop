import 'package:flutter_test/flutter_test.dart';
import 'package:move_to_desktop/move_to_desktop.dart';
import 'package:move_to_desktop/move_to_desktop_platform_interface.dart';
import 'package:move_to_desktop/move_to_desktop_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMoveToDesktopPlatform with MockPlatformInterfaceMixin implements MoveToDesktopPlatform {
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool> moveToDesktop() {
    throw UnimplementedError();
  }
}

void main() {
  final MoveToDesktopPlatform initialPlatform = MoveToDesktopPlatform.instance;

  test('$MethodChannelMoveToDesktop is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMoveToDesktop>());
  });

  test('getPlatformVersion', () async {
    MoveToDesktop moveToDesktopPlugin = MoveToDesktop();
    MockMoveToDesktopPlatform fakePlatform = MockMoveToDesktopPlatform();
    MoveToDesktopPlatform.instance = fakePlatform;

    expect(await moveToDesktopPlugin.moveToDesktop(), '42');
  });
}
