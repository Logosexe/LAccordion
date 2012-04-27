//
//  ItemButton.m
//  Accordion
//
//  Created by Tomek Janik on 3/29/12.
//  Copyright (c) 2012 Logos All rights reserved.
//

#import "ItemButton.h"
#import "Item.h"

@implementation ItemButton

@synthesize status, delegate, itemTitle;

- (id)initWithFrame:(CGRect)frame andDelegate:(Item*)theDelegate
{
    self = [super initWithFrame:frame];
    if (self) {
		delegate = theDelegate;
		status = STATUS_COLLAPSED;
		itemTitle = [[UILabel alloc] init];
		[self addSubview:itemTitle];
    }
    return self;
}

- (void)setStatus:(ItemStatus)st{
	status = st;
	delegate.status = st;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
