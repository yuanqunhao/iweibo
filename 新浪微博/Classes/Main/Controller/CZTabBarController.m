//
//  CZTabBarController.m
//  新浪微博
//
//  Created by 袁群豪 on 15/11/17.
//  Copyright © 2015年 袁群豪. All rights reserved.
//

#import "CZTabBarController.h"
#import "CZTabBar.h"
@implementation CZTabBarController
- (void)viewDidLoad{
    [super viewDidLoad];
    CZTabBar *czTabBar = [[CZTabBar alloc]init];
    /**
     *  设置czTabBar选中的颜色
     */
    czTabBar.selectenTitleColor = [UIColor orangeColor];
    
    czTabBar.titleColor = [UIColor grayColor];
    
    [self setValue:czTabBar forKey:@"tabBar"];
    /**
     *  初始化4个子控制器,就会有4个UITabBarButton
     */
    [self setupChildContrs];
}
- (void)setupChildContrs{
    /**
     第1个
     */
    UIViewController *vc1 = [[UIViewController alloc]init];
    vc1.view.backgroundColor = [UIColor lightGrayColor];
    
    [self addchildVC:vc1 Title:@"首页" ImgName:@"tabbar_home"];
    /**
     第2个
     */
    UIViewController *vc2 = [[UIViewController alloc]init];
    vc2.view.backgroundColor = [UIColor grayColor];
    
    [self addchildVC:vc2 Title:@"信息" ImgName:@"tabbar_message_center"];
    /**
     第3个
     */
    UIViewController *vc3 = [[UIViewController alloc]init];
    vc3.view.backgroundColor = [UIColor lightGrayColor];
    
    [self addchildVC:vc3 Title:@"发现" ImgName:@"tabbar_discover"];
    /**
     第4个
     */
    UIViewController *vc4 = [[UIViewController alloc]init];
    vc4.view.backgroundColor = [UIColor lightGrayColor];
    
    [self addchildVC:vc4 Title:@"我" ImgName:@"tabbar_profile"];
}

- (void)addchildVC:(UIViewController *)vc Title:(NSString *)title ImgName:(NSString *)imgName
{

    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    /**
     *  设置UITabBarButton的文字和图片
     */
    
    nav.tabBarItem.title =title;
    
    nav.tabBarItem.image = [UIImage imageNamed:imgName];
    /**
     *  设置选中的图片和文字
     */
    NSString *selectedImgName = [imgName stringByAppendingString:@"_selected"];

    
    UIImage *selectedImg = [UIImage imageNamed:selectedImgName];
    /**
     *  返回一个没有渲染效果的图片,
        UIImageRenderingModeAlwaysOriginal 和UIImageRenderingModeAlwaysTemplate,
        是 UITabBarButton选中图片的一个技巧
     */
   selectedImg = [selectedImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = selectedImg;
    [self addChildViewController:nav ];

}
/**
 *  监听tabBar的选中
 */
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    [tabBar setNeedsLayout];
    
    
}
@end
