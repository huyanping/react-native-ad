//
//  FeedAdManager.m
//  datizhuanqian
//
//  Created by ivan zhang on 2019/9/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <React/RCTViewManager.h>
#import "BannerView.h"

@interface BannerManager : RCTViewManager

@end


@implementation BannerManager

RCT_EXPORT_MODULE(BannerView)

RCT_EXPORT_VIEW_PROPERTY(onAdLayout, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onAdError, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onAdClick, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onAdClose, RCTBubblingEventBlock)

- (BannerView *)view
{
  return [[BannerView alloc] init];
}

RCT_CUSTOM_VIEW_PROPERTY(codeid, NSString, BannerView)
{
  if (json) {
    [view  setCodeId:json];
  }
}

RCT_CUSTOM_VIEW_PROPERTY(adWidth, NSString, BannerView)
{
  if (json) {
    [view  setAdWidth:json];
  }
}

RCT_CUSTOM_VIEW_PROPERTY(adSize, NSString, BannerView)
{
  if (json) {
    [view  setAdSize:json];
  }
}

@end
