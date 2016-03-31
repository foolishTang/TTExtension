//
//  LGTextView.h
//  学习微博
//
//  Created by 唐磊guang on 15/12/24.
//  Copyright (c) 2015年 唐磊guang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LGTextView;
@protocol LGTextViewDelegate <NSObject>

@optional
-(void)LGTextViewValueChange:(LGTextView *)textView;

@end


@interface LGTextView : UITextView

@property (nonatomic ,weak)id<LGTextViewDelegate> LGDelegate;

@property (nonatomic , copy)NSString *placehoder;

@property (nonatomic , strong)UIColor *placehoderColor;
@end
