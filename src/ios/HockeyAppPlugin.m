//
//  HockeyAppPlugin.m
//

#import <HockeySDK/HockeySDK.h>

#import "HockeyAppPlugin.h"

@implementation HockeyAppPlugin

#pragma mark Initialization

- (void)pluginInitialize
{
    NSString * hockeyAppKey = @"ee2e2bc4d443909a2d510ec3b72c85de";
    if( hockeyAppKey!=nil && [hockeyAppKey isEqualToString:@""]==NO && [hockeyAppKey rangeOfString:@"HOCKEY_APP_KEY"].location == NSNotFound ){
        
        [[BITHockeyManager sharedHockeyManager] configureWithBetaIdentifier:hockeyAppKey
                                                             liveIdentifier:hockeyAppKey
                                                                   delegate:self];
        
        [[BITHockeyManager sharedHockeyManager] startManager];
        [[BITHockeyManager sharedHockeyManager].authenticator authenticateInstallation];
    }
    
    NSLog(@"HockeyApp Plugin initialized");
}

#pragma mark Plugin methods

- (void)forcecrash:(CDVInvokedUrlCommand *)command {
  __builtin_trap();
}

@end
