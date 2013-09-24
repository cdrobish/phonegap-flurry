//
//  CDVFlurry.h
//  Flurry
//
//  Created by xu.li on 9/23/13.
//
//

#import <Cordova/CDV.h>

@interface CDVFlurry : CDVPlugin

- (void)startSession:(CDVInvokedUrlCommand *)command;
- (void)startSessionWithOptions:(CDVInvokedUrlCommand *)command;
- (void)pauseBackgroundSession:(CDVInvokedUrlCommand *)command;

- (void)setAppVersion:(CDVInvokedUrlCommand *)command;
- (void)getFlurryAgentVersion:(CDVInvokedUrlCommand *)command;
- (void)setShowErrorInLogEnabled:(CDVInvokedUrlCommand *)command;
- (void)setDebugLogEnabled:(CDVInvokedUrlCommand *)command;
- (void)setLogLevel:(CDVInvokedUrlCommand *)command;
- (void)setSessionContinueSeconds:(CDVInvokedUrlCommand *)command;
- (void)setSecureTransportEnabled:(CDVInvokedUrlCommand *)command;
- (void)setCrashReportingEnabled:(CDVInvokedUrlCommand *)command;

- (void)logEvent:(CDVInvokedUrlCommand *)command;
- (void)logEventWithParameters:(CDVInvokedUrlCommand *)command;
- (void)logError:(CDVInvokedUrlCommand *)command;
- (void)logTimedEvent:(CDVInvokedUrlCommand *)command;
- (void)logTimedEventWithParameters:(CDVInvokedUrlCommand *)command;
- (void)endTimedEventWithParameters:(CDVInvokedUrlCommand *)command;

- (void)logAllPageViews:(CDVInvokedUrlCommand *)command;
- (void)logPageView:(CDVInvokedUrlCommand *)command;
- (void)setUserID:(CDVInvokedUrlCommand *)command;
- (void)setAge:(CDVInvokedUrlCommand *)command;
- (void)setGender:(CDVInvokedUrlCommand *)command;
- (void)setLocation:(CDVInvokedUrlCommand *)command;

- (void)setSessionReportsOnCloseEnabled:(CDVInvokedUrlCommand *)command;
- (void)setSessionReportsOnPauseEnabled:(CDVInvokedUrlCommand *)command;
- (void)setBackgroundSessionEnabled:(CDVInvokedUrlCommand *)command;
- (void)setEventLoggingEnabled:(CDVInvokedUrlCommand *)command;
- (void)setPushToken:(CDVInvokedUrlCommand *)command;

@end
