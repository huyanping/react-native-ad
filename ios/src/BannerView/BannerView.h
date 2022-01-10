//
//  BannerView.h
//  react-native-ad
//
//  Created by 程强 on 2020/11/12.
//

#import <UIKit/UIKit.h>
#import <React/RCTComponent.h>
NS_ASSUME_NONNULL_BEGIN




@interface BannerView : UIView
-(void) setCodeId:(NSString *) codeid;
-(void) setAdWidth:(NSString *) adWidth;
-(void) setAdSize:(NSString *) adSize;
-(void) loadBannerView;
@property (nonatomic, copy) RCTBubblingEventBlock onAdLayout;
@property (nonatomic, copy) RCTBubblingEventBlock onAdError;
@property (nonatomic, copy) RCTBubblingEventBlock onAdClick;
@property (nonatomic, copy) RCTBubblingEventBlock onAdClose;
@end

NS_ASSUME_NONNULL_END
