#import "MoveToDesktopPlugin.h"

@implementation MoveToDesktopPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"move_to_desktop"
            binaryMessenger:[registrar messenger]];
  MoveToDesktopPlugin* instance = [[MoveToDesktopPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"move_to_desktop" isEqualToString:call.method]) {
      [[UIApplication sharedApplication] performSelector:@selector(suspend)];
      result(@(YES));
  } else if ([@"move_to_front" isEqualToString:call.method]) {
      // 使用以下代码将应用程序从后台拉起到前台
      UIResponder *appDelegate = (UIResponder *)[UIApplication sharedApplication].delegate;
      if ([appDelegate isKindOfClass:[UIResponder class]]) {
          [appDelegate becomeFirstResponder];
      }
      result(@(YES));
  } else {
      result(FlutterMethodNotImplemented);
  }
}

@end
