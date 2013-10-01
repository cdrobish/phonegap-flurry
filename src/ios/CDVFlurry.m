//
//  CDVFlurry.m
//  Flurry
//
//  Created by xu.li on 9/23/13.
//
//

#import "CDVFlurry.h"

@implementation CDVFlurry

#pragma mark Session
- (void)startSession:(CDVInvokedUrlCommand *)command
{
    NSString* key = [command.arguments objectAtIndex:0];
    if (key != nil) {
        // enable event logging
        [Flurry setEventLoggingEnabled:YES];
        
        [Flurry startSession:key];
        [self sendOKResult:command];
    } else {
        [self sendErrorResult:command WithMessage:@"App key was null."];
    }
}

- (void)startSessionWithOptions:(CDVInvokedUrlCommand *)command
{
    NSString* key = [command.arguments objectAtIndex:0];
    NSDictionary* options = [command.arguments objectAtIndex:1];
    if (options == nil) {
        [self startSession:command];
    } else if (key == nil) {
        [self sendErrorResult:command WithMessage:@"App key was null."];
    } else {
        // enable event logging
        [Flurry setEventLoggingEnabled:YES];
        
        [Flurry startSession:key withOptions:options];
        [self sendOKResult:command];
    }
}

- (void)pauseBackgroundSession:(CDVInvokedUrlCommand *)command
{
    [Flurry pauseBackgroundSession];
    [self sendOKResult:command];
}

#pragma mark Pre-session Calls
- (void)setAppVersion:(CDVInvokedUrlCommand *)command
{
    [self sendNonImplementedErrorResult:command];
}

- (void)getFlurryAgentVersion:(CDVInvokedUrlCommand *)command
{
    [self sendNonImplementedErrorResult:command];
}

- (void)setShowErrorInLogEnabled:(CDVInvokedUrlCommand *)command
{
    [self sendNonImplementedErrorResult:command];
}

- (void)setDebugLogEnabled:(CDVInvokedUrlCommand *)command
{
    BOOL enabled = [[command.arguments objectAtIndex:0] boolValue];
    [Flurry setDebugLogEnabled:enabled];
    [self sendOKResult:command];
}

- (void)setLogLevel:(CDVInvokedUrlCommand *)command
{
    [self sendNonImplementedErrorResult:command];
}

- (void)setSessionContinueSeconds:(CDVInvokedUrlCommand *)command
{
    [self sendNonImplementedErrorResult:command];
}

- (void)setSecureTransportEnabled:(CDVInvokedUrlCommand *)command
{
    [self sendNonImplementedErrorResult:command];
}

- (void)setCrashReportingEnabled:(CDVInvokedUrlCommand *)command
{
    [self sendNonImplementedErrorResult:command];
}

/*
 JS arguments:
    eventName String
 */
- (void)logEvent:(CDVInvokedUrlCommand *)command
{    
    NSString* eventName = [command.arguments objectAtIndex:0];
    if (eventName != nil) {
        [Flurry logEvent:eventName];
        [self sendOKResult:command];
    } else {
        [self sendErrorResult:command WithMessage:@"Event name was null."];
    }
}

/*
 JS arguments:
    eventName String
    parameters Object
 */
- (void)logEventWithParameters:(CDVInvokedUrlCommand *)command
{
    NSString* eventName = [command.arguments objectAtIndex:0];
    NSDictionary* parameters = [command.arguments objectAtIndex:1];
    if (parameters == nil) {
        [self sendErrorResult:command WithMessage:@"Event parameters was null."];
    } else if (eventName == nil) {
        [self sendErrorResult:command WithMessage:@"Event name was null."];
    } else {
        [Flurry logEvent:eventName withParameters:parameters];
        [self sendOKResult:command];
    }
}

- (void)logError:(CDVInvokedUrlCommand *)command
{
    [self sendNonImplementedErrorResult:command];
}

/*
 JS arguments:
    eventName String
    timed Boolean
 */
- (void)logTimedEvent:(CDVInvokedUrlCommand *)command
{
    NSString* eventName = [command.arguments objectAtIndex:0];
    BOOL timed = [[command.arguments objectAtIndex:1] boolValue];
    if (eventName == nil) {
        [self sendErrorResult:command WithMessage:@"Event name was null."];
    } else {
        [Flurry logEvent:eventName timed:timed];
        [self sendOKResult:command];
    }
}

/*
 JS arguments:
    eventName String
    parameters Object
    timed Boolean
*/
- (void)logTimedEventWithParameters:(CDVInvokedUrlCommand *)command
{
    NSString* eventName = [command.arguments objectAtIndex:0];
    NSDictionary* parameters = [command.arguments objectAtIndex:1];
    BOOL timed = [[command.arguments objectAtIndex:2] boolValue];
    
    if (parameters == nil) {
        [self sendErrorResult:command WithMessage:@"Event parameters was null."];
    } else if (eventName == nil) {
        [self sendErrorResult:command WithMessage:@"Event name was null."];
    } else {
        [Flurry logEvent:eventName withParameters:parameters timed:timed];
        [self sendOKResult:command];
    }
}

/*
 JS arguments:
    eventName String
    parameters Object
 */
- (void)endTimedEventWithParameters:(CDVInvokedUrlCommand *)command
{
    NSString* eventName = [command.arguments objectAtIndex:0];
    NSDictionary* parameters = [command.arguments objectAtIndex:1];
    
    if (eventName == nil) {
        [self sendErrorResult:command WithMessage:@"Event name was null."];
    } else {
        [Flurry endTimedEvent:eventName withParameters:parameters];
        [self sendOKResult:command];
    }
}

#pragma mark Page View
- (void)logAllPageViews:(CDVInvokedUrlCommand *)command
{
    [self sendNonImplementedErrorResult:command];
}

- (void)logPageView:(CDVInvokedUrlCommand *)command
{
    [Flurry logPageView];
    [self sendOKResult:command];
}

#pragma mark User info
- (void)setUserID:(CDVInvokedUrlCommand *)command
{
    [self sendNonImplementedErrorResult:command];
}

- (void)setAge:(CDVInvokedUrlCommand *)command
{
    [self sendNonImplementedErrorResult:command];
}

- (void)setGender:(CDVInvokedUrlCommand *)command
{
    [self sendNonImplementedErrorResult:command];
}

#pragma mark Location
- (void)setLocation:(CDVInvokedUrlCommand *)command
{
    [self sendNonImplementedErrorResult:command];
}

#pragma mark Session reporting
- (void)setSessionReportsOnCloseEnabled:(CDVInvokedUrlCommand *)command
{
    [self sendNonImplementedErrorResult:command];
}

- (void)setSessionReportsOnPauseEnabled:(CDVInvokedUrlCommand *)command
{
    [self sendNonImplementedErrorResult:command];
}

- (void)setBackgroundSessionEnabled:(CDVInvokedUrlCommand *)command
{
    [self sendNonImplementedErrorResult:command];
}

- (void)setEventLoggingEnabled:(CDVInvokedUrlCommand *)command
{
    BOOL enabled = [[command.arguments objectAtIndex:0] boolValue];
    [Flurry setEventLoggingEnabled:enabled];
    [self sendOKResult:command];
}

- (void)setPushToken:(CDVInvokedUrlCommand *)command
{
    [self sendNonImplementedErrorResult:command];
}

#pragma mark misc

- (void)sendOKResult:(CDVInvokedUrlCommand *)command
{
    [self.commandDelegate sendPluginResult:[self createOKResult]
                                callbackId:command.callbackId];
}

- (void)sendErrorResult:(CDVInvokedUrlCommand *)command WithMessage:(NSString *)message
{
    [self.commandDelegate sendPluginResult:[self createErrorResultWithMessage:message]
                                callbackId:command.callbackId];
}

- (void)sendNonImplementedErrorResult:(CDVInvokedUrlCommand *)command
{
    [self.commandDelegate sendPluginResult:[self createErrorResultWithMessage:@"Not implemented"]
                                callbackId:command.callbackId];
}

- (CDVPluginResult *)createOKResult
{
    return [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
}

- (CDVPluginResult *)createErrorResultWithMessage:(NSString *)message
{
    return [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:message];
}

@end
