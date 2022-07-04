/********* app-group-file-sharing.m Cordova Plugin Implementation *******/

#import "AppGroupsUserDefaults.h"
#import <Cordova/CDV.h>
#import <Cordova/CDVPluginResult.h>

@interface app-group-file-sharing : CDVPlugin {
  // Member variables go here.
}
- (void) load:(CDVInvokedUrlCommand*)command;
@end

@implementation app-group-file-sharing

- (void) load:(CDVInvokedUrlCommand*)command
{
    // load the options
    NSDictionary* arguments = [command.arguments objectAtIndex:0];
    NSString* strPath = [arguments objectForKey:@"path"];
    NSString* suite = [arguments objectForKey:@"suite"];

    NSString *callbackResult = [[[[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:suite] path] stringByAppendingPathComponent:strPath]];

    // give the callback
    CDVPluginResult* pluginResult = nil;
    if(callbackResult != nil)
    {
      pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:callbackResult];
    } else {
      pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end