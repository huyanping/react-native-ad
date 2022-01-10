//
//  BannerView.m
//  react-native-ad
//
//  Created by 程强 on 2020/11/12.
//

#import "BannerView.h"
#include "AdBoss.h"
#import <BUAdSDK/BUNativeExpressAdManager.h>
#import <BUAdSDK/BUNativeExpressAdView.h>

#import <BUAdSDK/BUAdSDK.h>
#import <UIKit/UIKit.h>
@interface BannerView ()<BUNativeExpressBannerViewDelegate>
@property(nonatomic, strong) NSString *_codeid;
@property(nonatomic, strong) NSString *_adWidth;
@property(nonatomic, assign) CGSize _adAdSize;
@property(nonatomic, strong) BUNativeExpressBannerView *bannerView;

@end

@implementation BannerView

- (void)setCodeId:(NSString *)codeid {
    self._codeid = codeid;
    NSLog(@"开始 加载Feed广告 codeid: %@", self._codeid);
    
    if (self._codeid && self._adAdSize.width > 0 && self._adAdSize.height > 0) {
        [self loadBannerView];
    }
    
}

- (void)setAdWidth:(NSString *)adWidth {
    self._adWidth = adWidth;
    NSLog(@"开始 加载Feed广告 width : %@", self._adWidth);
}

-(void)setAdSize:(NSString *)adSize
{
    
    NSLog(@"开始 加载banner广告 adsiez : %@", adSize);
    BUSize *imgSize = [BUSize sizeBy:BUProposalSize_Banner600_90];

    if ([adSize containsString:@"90"]) {
        imgSize = [BUSize sizeBy:BUProposalSize_Banner600_90];
    }else if ([adSize containsString:@"100"]){
        imgSize = [BUSize sizeBy:BUProposalSize_Banner640_100];
    }else if ([adSize containsString:@"150"]){
        imgSize = [BUSize sizeBy:BUProposalSize_Banner600_150];
    }else if ([adSize containsString:@"260"]){
        imgSize = [BUSize sizeBy:BUProposalSize_Banner600_260];
    }else if ([adSize containsString:@"286"]){
        imgSize = [BUSize sizeBy:BUProposalSize_Banner600_286];
    }else if ([adSize containsString:@"300"]){
        imgSize = [BUSize sizeBy:BUProposalSize_Banner600_300];
    }else if ([adSize containsString:@"388"]){
        imgSize = [BUSize sizeBy:BUProposalSize_Banner690_388];
    }else if ([adSize containsString:@"400"]){
        imgSize = [BUSize sizeBy:BUProposalSize_Banner600_400];
    }else if ([adSize containsString:@"500"]){
        imgSize = [BUSize sizeBy:BUProposalSize_Banner600_500];
    }
    
    self._adAdSize = CGSizeMake(imgSize.width, imgSize.height);
    
    if (self._codeid && self._adAdSize.width > 0 && self._adAdSize.height > 0) {
        [self loadBannerView];
    }
}
-(void) loadBannerView
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
//    BUSize *imgSize = [BUSize sizeBy:BUProposalSize_Banner600_90];
    self.bannerView = [[BUNativeExpressBannerView alloc]initWithSlotID:self._codeid rootViewController:[AdBoss getRootVC] adSize:CGSizeMake(width, self._adAdSize.height)];
    self.bannerView.frame = self.bounds;
    self.bannerView.delegate = self;
    [self.bannerView loadAdData];
    [self addSubview:self.bannerView];
    self.bannerView.frame = CGRectMake(0, 0, width, self._adAdSize.height);
//    self.frame = CGRectMake(0, 0, width, imgSize.height);
    self.frame = [UIScreen mainScreen].bounds;
//    self.backgroundColor = [UIColor redColor];
}



/**
 This method is called when bannerAdView ad slot loaded successfully.
 @param bannerAdView : view for bannerAdView
 */
- (void)nativeExpressBannerAdViewDidLoad:(BUNativeExpressBannerView *)bannerAdView
{
    CGFloat adWidth = bannerAdView.bounds.size.width;
    CGFloat adHeight = bannerAdView.bounds.size.height;
    self.onAdLayout(@{
        @"width":@(adWidth),
        @"height":@(adHeight)
    });
}

/**
 This method is called when bannerAdView ad slot failed to load.
 @param error : the reason of error
 */
- (void)nativeExpressBannerAdView:(BUNativeExpressBannerView *)bannerAdView didLoadFailWithError:(NSError *_Nullable)error
{
    self.onAdError(@{
      @"message":[error localizedDescription],
    });
}

/**
 This method is called when rendering a nativeExpressAdView successed.
 */
- (void)nativeExpressBannerAdViewRenderSuccess:(BUNativeExpressBannerView *)bannerAdView
{
    
}

/**
 This method is called when a nativeExpressAdView failed to render.
 @param error : the reason of error
 */
- (void)nativeExpressBannerAdViewRenderFail:(BUNativeExpressBannerView *)bannerAdView error:(NSError * __nullable)error
{
    
}

/**
 This method is called when bannerAdView ad slot showed new ad.
 */
- (void)nativeExpressBannerAdViewWillBecomVisible:(BUNativeExpressBannerView *)bannerAdView
{
    
}

/**
 This method is called when bannerAdView is clicked.
 */
- (void)nativeExpressBannerAdViewDidClick:(BUNativeExpressBannerView *)bannerAdView
{
    BUD_Log(@"Banner ad clicked");
    self.onAdClick(@{
        @"message": @"Banner been clicked",
      });

}

/**
 This method is called when the user clicked dislike button and chose dislike reasons.
 @param filterwords : the array of reasons for dislike.
 */
- (void)nativeExpressBannerAdView:(BUNativeExpressBannerView *)bannerAdView dislikeWithReason:(NSArray<BUDislikeWords *> *_Nullable)filterwords
{
    BUD_Log(@"Banner ad dislike");
    self.onAdClose(@{
        @"message": @"Banner been dislike",
      });
    [self.bannerView loadAdData];
}

/**
 This method is called when another controller has been closed.
 @param interactionType : open appstore in app or open the webpage or view video ad details page.
 */
- (void)nativeExpressBannerAdViewDidCloseOtherController:(BUNativeExpressBannerView *)bannerAdView interactionType:(BUInteractionType)interactionType
{
    
}



@end
