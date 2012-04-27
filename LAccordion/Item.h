//
//  Item.h
//  Accordion
//
//  Created by Tomek Janik on 3/29/12.
//  Copyright (c) 2012 Logos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemButton.h"
@class ItemButton;


@interface Item : UIScrollView{
	NSMutableArray *subItems;
	ItemButton *button;
	ItemStatus status;
	UILabel *label;
	UIView *bottomBorder;
}

@property (nonatomic) NSMutableArray *subItems;
@property (nonatomic) ItemButton *button;
@property (nonatomic) ItemStatus status;
@property (nonatomic) UILabel *label;
@property (nonatomic) UIView *bottomBorder;


-(void)addChildItems:(NSMutableArray*)items;
-(void)setStatus:(ItemStatus)st;
-(void)setTitle:(NSString*)text;
@end
