//
//  LGSearchBar.m
//  学习微博
//
//  Created by 唐磊guang on 15/12/19.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGSearchBar.h"
#import "UIView+Extension.h"
@implementation LGSearchBar


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        self.leftViewMode = UITextFieldViewModeAlways;
        self.backgroundColor = [UIColor redColor];
        self.clearButtonMode = UITextFieldViewModeAlways;
        UIImage *image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        
        imageView.width = imageView.image.size.width+10;
        imageView.height = imageView.image.size.width;
        imageView.contentMode = UIViewContentModeCenter;
        self.leftView = imageView;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

//注意这里要用self调用init才会调用initWithFrame方法
+(id)searchBar
{
    //是不可以的因为UITextField的init会调用它的父类initWithFrame，而不是自己定义的。
//    return [[UITextField alloc]init];
    return [[self alloc]init];
}
@end
