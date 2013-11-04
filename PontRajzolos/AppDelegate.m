//
//  AppDelegate.m
//  PontRajzolos
//
//  Created by Robert Sallai on 28/10/13.
//  Copyright (c) 2013 Robert Sallai. All rights reserved.
//

#import "AppDelegate.h"
#import "GridView.h"
#import "PointView.h"
#import "Coordinate.h"

#import <QuartzCore/CAAnimation.h>

@interface AppDelegate()

#pragma mark IBOutlets

@property (weak) IBOutlet NSView *mainView;
@property (weak) IBOutlet NSTextField *numberTextField;
@property (weak) IBOutlet NSTableView *coordTableView;

#pragma mark model
@property (strong, nonatomic) NSMutableArray *coordinates;
@property (strong, nonatomic) GridView *gridView;


@end


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.gridView = [[GridView alloc] initWithFrame:CGRectMake(0, 0, 700, 700)];
    [self.mainView addSubview:self.gridView];
    self.coordinates = [[NSMutableArray alloc] init];
}
- (IBAction)drawAll:(NSButton *)sender {
    
    
    int number = [[self.numberTextField stringValue] intValue];
    [self.coordinates removeAllObjects];
    
    
    CATransition *transition = [CATransition animation];
    [transition setType:kCATransitionFade];
    
    [self.mainView setAnimations:[NSDictionary dictionaryWithObject:transition forKey:@"subviews"]];
    [self.mainView setWantsLayer:YES];
    
    
    for (int n = 1; n <= number; n++) {
    
        Coordinate *coordinate = [[Coordinate alloc] init];
        coordinate.x = (n + 2) / sqrt(n * n * n + 1.0f);
        coordinate.y = pow(n * n + 1.0f, 1 / (double)n);
        
        PointView *subView = [[PointView alloc] initWithFrame:CGRectMake( round(coordinate.x * 300) - 5, round(coordinate.y * 300) - 5, 10, 10)];
        [[self.gridView animator] addSubview:subView];
        [self.coordinates addObject:coordinate];
    }
    
    [self.coordTableView reloadData];

}

#pragma mark NSTableView data source methods

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    if( [tableColumn.identifier isEqualToString:@"index"] )
    {
        cellView.textField.stringValue = [NSString stringWithFormat:@"%d", (int)row + 1];
    }
    
    else if ([tableColumn.identifier isEqualToString:@"xcord"]){
        Coordinate *coordinate = [self.coordinates objectAtIndex:row];
        cellView.textField.stringValue = [NSString stringWithFormat:@"%lf", coordinate.x];
    }
    
    else if ([tableColumn.identifier isEqualToString:@"ycord"]){
        Coordinate *coordinate = [self.coordinates objectAtIndex:row];
        cellView.textField.stringValue = [NSString stringWithFormat:@"%lf", coordinate.y];
    }
    
    return cellView;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.coordinates count];
}

- (IBAction)clearAll:(NSButton *)sender {
    
    [self.gridView.subviews makeObjectsPerformSelector: @selector(removeFromSuperview)];
    [self.coordinates removeAllObjects];
    [self.coordTableView reloadData];
}

@end
