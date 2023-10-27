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
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
