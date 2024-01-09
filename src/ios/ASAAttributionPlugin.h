#import <Cordova/CDVPlugin.h>

@interface ASAAttributionPlugin : CDVPlugin

- (void)fetchAttributionToken:(CDVInvokedUrlCommand *)command;

@end
