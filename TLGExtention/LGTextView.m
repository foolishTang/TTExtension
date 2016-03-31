//
//  LGTextView.m
//  学习微博
//
//  Created by 唐磊guang on 15/12/24.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import "LGTextView.h"
#import "UIView+Extension.h"
@interface LGTextView()

@property (nonatomic , weak)UILabel *placeLabel;

@end

@implementation LGTextView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *label = [[UILabel alloc]init];
        self.font = [UIFont systemFontOfSize:18];
        label.textColor = [UIColor lightGrayColor];
        
        label.text = @"发个什么吧..";
        
        label.backgroundColor = [UIColor clearColor];
        //注意
        label.font = self.font;
        label.numberOfLines = 0;
        
        [self addSubview:label];
        self.placeLabel = label;
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(TextViewValueChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

-(void)layoutSubviews
{
    CGFloat labelX = 5;
    CGFloat labelY = 7.5;
    CGFloat labelW = self.width-2*labelX;
    
    CGRect rect = [self.placehoder boundingRectWithSize:CGSizeMake(labelW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.placeLabel.font} context:nil];
    CGFloat lableH = rect.size.height;
    
    self.placeLabel.frame = CGRectMake(labelX, labelY, labelW, lableH);
}

-(void)setPlacehoder:(NSString *)placehoder
{
    self.placeLabel.text = placehoder;
    _placehoder = [placehoder copy];
    //这个方法会调用layout方法
    [self setNeedsLayout];
}

-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.placeLabel.font = font;
}

-(void)setPlacehoderColor:(UIColor *)placehoderColor
{
    self.placeLabel.textColor = placehoderColor;
    [self setNeedsLayout];
}

-(void)TextViewValueChange
{
    self.placeLabel.hidden = self.text.length != 0;
    [self.LGDelegate LGTextViewValueChange:self];

}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextViewTextDidChangeNotification object:self];
}
@end
