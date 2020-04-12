#import "WirecardPlugin.h"
#import "MoipSDK.h"
#import "MPKCreditCard.h"
#import "MPKUtilities.h"

@implementation WirecardPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"wirecard"
            binaryMessenger:[registrar messenger]];
  WirecardPlugin* instance = [[WirecardPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"encryptCard" isEqualToString:call.method]) {

    [MoipSDK importPublicKey:call.arguments[@"publicKey"]];
    MPKCreditCard *creditCard = [MPKCreditCard new];
    creditCard.number = call.arguments[@"number"];
    creditCard.cvc = call.arguments[@"cvc"];
    creditCard.expirationMonth = call.arguments[@"expirationMonth"];
    creditCard.expirationYear = call.arguments[@"expirationYear"];
      
    result([MoipSDK encryptCreditCard:creditCard]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
