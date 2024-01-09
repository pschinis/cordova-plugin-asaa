#import "ASAAttributionPlugin.h"
#import <AdServices/AdServices.h>

@implementation ASAAttributionPlugin

- (void)fetchAttributionToken:(CDVInvokedUrlCommand *)command {
    [self.commandDelegate runInBackground:^{
        // Runtime check for AdServices framework availability
        if (@available(iOS 14.3, *)) {
            NSError *error = nil;
            NSString *attributionToken = [AAAttribution attributionTokenWithError:&error];

            CDVPluginResult* pluginResult = nil;
            if (error) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:error.localizedDescription];
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:attributionToken];
            }

            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } else {
            // AdServices framework not available
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"AdServices framework is not available."];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    }];
}

@end
