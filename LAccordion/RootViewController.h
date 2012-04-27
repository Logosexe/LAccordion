//
//  RootViewController.h
//  Accordion
//
//  Created by Tomek Janik on 3/29/12.
//  Copyright (c) 2012 Logos All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Item.h"

@interface RootViewController : UIViewController {
	NSMutableArray *items;
	
	int padding, subItemsPadding;
	int defHeight;
}

-(void) collapseOrExpand:(id)sender;
-(void) setItems;

@end
