import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:move_to_desktop/move_to_desktop_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelMoveToDesktop platform = MethodChannelMoveToDesktop();
  const MethodChannel channel = MethodChannel('move_to_desktop');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.moveToDesktop(), '42');
  });
}
