//
//  ActionSheet.h
//
// Created by Olivier Louvignes on 2011-11-27
// Updated on 2012-08-04 for Cordova ARC-2.1+
//
// Copyright 2011-2012 Olivier Louvignes. All rights reserved.
// MIT Licensed

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface ActionSheet : CDVPlugin <UIActionSheetDelegate> {
}

#pragma mark - Properties

@property (nonatomic, copy) NSString* callbackId;

#pragma mark - Instance methods

- (void)create:(CDVInvokedUrlCommand*)command;

@end
