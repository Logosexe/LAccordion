//
//  RootViewController.m
//  Accordion
//
//  Created by Tomek Janik on 3/29/12.
//  Copyright (c) 2012 Logos All rights reserved.
//

#import "RootViewController.h"
#import "Item.h"
#import "ItemButton.h"

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		
        
		UIImage *bg = [UIImage imageNamed:@"bg"];
		UIImageView *bgView = [[UIImageView alloc] initWithImage:bg];
		bgView.frame = CGRectMake(0, 0, 320, 640);
		[self.view addSubview:bgView];
		
		padding = 55;
		defHeight = 55;
		subItemsPadding = 35;
    }
    return self;
}

-(void) setItems{
	items = [[NSMutableArray alloc] init];
	
	float yOffset = 50;
	for(int i = 0; i < 5; i++){
		Item *item = [[Item alloc] initWithFrame:CGRectMake(0, yOffset, 320, defHeight)];
		item.backgroundColor = [UIColor clearColor];
		
		
		UIView *bgBottomBorder = [[UIView alloc] initWithFrame:CGRectMake(0, defHeight-2, 320, 2)];
		
		UIView *bgBottomMarginTop = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
		bgBottomMarginTop.backgroundColor = [UIColor whiteColor];
		bgBottomMarginTop.alpha = 0.2;
		
		UIView *bgBottomMarginBottom = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
		bgBottomMarginBottom.backgroundColor = [UIColor blackColor];
		bgBottomMarginBottom.alpha = 0.2;
		
		[bgBottomBorder addSubview:bgBottomMarginTop];
		[bgBottomBorder addSubview:bgBottomMarginBottom];
		[item addSubview:bgBottomBorder];
		item.bottomBorder = bgBottomBorder;
		
		float y2Offset = padding;
		NSMutableArray *subItems = [[NSMutableArray alloc] init];
		for(int j = 0; j < 4; j++){
			Item *subItem = [[Item alloc] initWithFrame:CGRectMake(40, y2Offset, 320, defHeight)];
			subItem.backgroundColor = [UIColor clearColor];
			[subItems addObject:subItem];
			[subItem setTitle:[NSString stringWithFormat:@"Sub item %d", j]];
			y2Offset += subItemsPadding;
		}
		NSLog(@"subItems count %d", [subItems count]);
		[item addChildItems:subItems];
		
		[self.view addSubview:item];
		
		ItemButton *bt = [[ItemButton alloc] initWithFrame:CGRectMake(0, 0, 320, defHeight) andDelegate:item];
		bt.backgroundColor = [UIColor clearColor];

		bt.itemTitle.text = @"Item Button";
		bt.itemTitle.textColor = [UIColor whiteColor];
		bt.itemTitle.backgroundColor = [UIColor clearColor];
		bt.itemTitle.frame = CGRectMake(20, 0, 100, defHeight);
		[bt addTarget:self action:@selector(collapseOrExpand:) forControlEvents:UIControlEventTouchDown];
		[item addSubview:bt];
		
		
		[items addObject:item];

		yOffset += padding;
	}
}

-(void) collapseOrExpand:(id)sender{
	NSLog(@"click");
	
	Item *it = ((ItemButton*)sender).delegate;
	
	if( it.status == STATUS_EXPANDED ){
		it.status = STATUS_COLLAPSED;
	} else {
		it.status = STATUS_EXPANDED;
	}
	
	
	[self moveAndCollapseItemsWith:it];
}

-(void) moveAndCollapseItemsWith:(Item*)object{


	Item *i = [items objectAtIndex:0];
	float offset = i.frame.origin.y;
	int	height = defHeight;
	int index = 0;
	NSLog(@"subitems vount %d", [i.subItems count]);
	for(Item* item in items){
		if(index > 0){
			Item *i = [items objectAtIndex:index-1];
			offset = i.frame.origin.y+padding;
			if([i isEqual:object]){
				if(i.status == STATUS_EXPANDED)
					offset += ([i.subItems count]) * subItemsPadding+(subItemsPadding/2);
			} 
		}
		
		if([item isEqual:object]){
			if(item.status == STATUS_EXPANDED)
				height = ([item.subItems count]+1) * subItemsPadding+(subItemsPadding);
			else height = defHeight;
		} else {
			item.status = STATUS_COLLAPSED;
			height = defHeight;
		}
		
		[UIView animateWithDuration:0.5f
							  delay:0
							options:UIViewAnimationCurveEaseInOut
						 animations:^{
							 item.frame = CGRectMake(item.frame.origin.x, offset, item.frame.size.width, height);
							 item.bottomBorder.frame = CGRectMake(0, height-2, 320, 2);
						 } completion:^(BOOL finished){
							 
						 }];
		index++;
	}
 
	
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
