
import 'move_to_desktop_platform_interface.dart';

class MoveToDesktop {
  Future<bool> moveToDesktop() {
    return MoveToDesktopPlatform.instance.moveToDesktop();
  }
}
