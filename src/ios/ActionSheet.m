//
//  ActionSheet.m
//
// Created by Olivier Louvignes on 2011-11-27
// Updated on 2012-08-04 for Cordova ARC-2.1+
//
// Copyright 2011-2012 Olivier Louvignes. All rights reserved.
// MIT Licensed

#import "ActionSheet.h"

@implementation ActionSheet

@synthesize callbackId = _callbackId;

- (void)create:(CDVInvokedUrlCommand*)command {

	self.callbackId = command.callbackId;
	NSDictionary *options = [command.arguments objectAtIndex:0];

	// Compiling options with defaults
	NSString *title = [options objectForKey:@"title"] ?: @"";
	NSString *style = [options objectForKey:@"style"] ?: @"black-translucent";
	//NSString *style = [options objectForKey:@"style"] ?: @"default";
	NSArray *items = [options objectForKey:@"items"];
	NSInteger cancelButtonIndex = [[options objectForKey:@"cancelButtonIndex"] intValue] ?: false;
	NSInteger destructiveButtonIndex = [[options objectForKey:@"destructiveButtonIndex"] intValue] ?: false;

	// Create actionSheet
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title
												   delegate:self
										  cancelButtonTitle:nil
									 destructiveButtonTitle:nil
										  otherButtonTitles:nil];

	// Style actionSheet, defaults to UIActionSheetStyleDefault
	if([style isEqualToString:@"black-opaque"]) actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
	else if([style isEqualToString:@"black-translucent"]) actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
	else actionSheet.actionSheetStyle = UIActionSheetStyleDefault;

	// Fill with elements
	for(int i = 0; i < [items count]; i++) {
		[actionSheet addButtonWithTitle:[items objectAtIndex:i]];
	}
	// Handle cancelButtonIndex
	if([options objectForKey:@"cancelButtonIndex"]) {
		actionSheet.cancelButtonIndex = cancelButtonIndex;
	}
	// Handle destructiveButtonIndex
	if([options objectForKey:@"destructiveButtonIndex"]) {
		actionSheet.destructiveButtonIndex = destructiveButtonIndex;
	}

	// Toggle ActionSheet
    [actionSheet showInView:self.webView.superview];

}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {

	// Build returned result
	NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
	[result setObject:[NSNumber numberWithInteger:buttonIndex] forKey:@"buttonIndex"];

	// Create Plugin Result
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:result];

	// Checking if cancel was clicked
	if (buttonIndex != actionSheet.cancelButtonIndex) {
		//Call  the Failure Javascript function
		[self writeJavascript: [pluginResult toErrorCallbackString:self.callbackId]];
	// Checking if destructive was clicked
	} else if (buttonIndex != actionSheet.destructiveButtonIndex) {
		//Call  the Success Javascript function
		[self writeJavascript: [pluginResult toSuccessCallbackString:self.callbackId]];
	// Other button was clicked
	} else {
		//Call  the Success Javascript function
		[self writeJavascript: [pluginResult toSuccessCallbackString:self.callbackId]];
	}

}

@end
