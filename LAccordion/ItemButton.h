//
//  ItemButton.h
//  Accordion
//
//  Created by Tomek Janik on 3/29/12.
//  Copyright (c) 2012 Logos All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Item.h"
@class Item;

typedef enum {
	STATUS_EXPANDED,
	STATUS_COLLAPSED
} ItemStatus;

@interface ItemButton : UIButton {
	ItemStatus status;
	Item *delegate;
	UILabel *itemTitle;
}

@property (nonatomic) ItemStatus status;
@property (nonatomic) Item *delegate;
@property (nonatomic) UILabel *itemTitle;

- (id)initWithFrame:(CGRect)frame andDelegate:(Item*)theDelegate;
- (void)setStatus:(ItemStatus)st;
@end
