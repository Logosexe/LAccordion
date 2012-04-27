//
//  Item.m
//  Accordion
//
//  Created by Tomek Janik on 3/29/12.
//  Copyright (c) 2012 Logos All rights reserved.
//

#import "Item.h"

@implementation Item

@synthesize subItems, button, label, status, bottomBorder;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		subItems = [[NSMutableArray alloc] init];
		status = STATUS_COLLAPSED;
		label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentLeft;
		label.textColor = [UIColor whiteColor];
		label.text = @"";
		[self addSubview:label];
	}
	return self;
}

-(void)addChildItems:(NSMutableArray*)items{
	for(Item *item in items){
		[subItems addObject:item];
		[self addSubview:item];
	}
}

-(void)setTitle:(NSString*)text{
	label.text = text;
}
@end
