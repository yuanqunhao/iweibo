//
//  CZTabBar.m
//  新浪微博
//
//  Created by 袁群豪 on 15/11/18.
//  Copyright © 2015年 袁群豪. All rights reserved.
//

#import "CZTabBar.h"

@implementation CZTabBar
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        NSLog(@"%s",__func__);
    }
//    NSLog(@"%zd",frame);
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self enumerSubinTabbar];
   
}

- (void)enumerSubinTabbar{
    for (id subview in self.subviews) {
        //        NSLog(@"%@",[subview class]);
        if ([subview isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [self enumerSubinTabbarBtn:subview];
        }
    }
}
- (void)enumerSubinTabbarBtn:(UIView *)btn{
    for (id subview in btn.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UILabel")]) {
            UILabel *titleLabel = subview;
            if ([self.selectedItem.title isEqualToString:titleLabel.text]) {
                /**
                 *  选中状态
                 */
                titleLabel.textColor = self.selectenTitleColor;

            }else{
                /**
                 *  非选中状态
                 */
                titleLabel.textColor = self.titleColor;
            
            }
        }
    }
    

}
@end
