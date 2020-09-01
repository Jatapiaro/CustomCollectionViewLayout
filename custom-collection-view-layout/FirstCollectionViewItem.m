//
//  FirstCollectionViewItem.m
//  custom-collection-view-layout
//
//  Created by Jacobo Tapia on 9/1/20.
//

#import "FirstCollectionViewItem.h"

@interface FirstCollectionViewItem ()

@property (nonatomic, weak) IBOutlet NSTextField *label;

@end

@implementation FirstCollectionViewItem {
    NSString *_letters;
}

- (instancetype)init
{
    self = [super init];
    if (self)
        _letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [self _generateRandomColor].CGColor;
    _label.stringValue = [self _randomStringWithLength:5];
}

- (NSColor *)_generateRandomColor
{
    return [NSColor colorWithRed:rand() % 255 green:rand() % 255 blue:rand() % 255 alpha:1.0];
}

- (NSString *)_randomStringWithLength:(int)length
{
    NSMutableString *randomString = [NSMutableString stringWithCapacity: length];

    for (int i = 0; i < length; i++) {
        [randomString appendFormat: @"%C", [_letters characterAtIndex: arc4random_uniform([_letters length])]];
    }

    return randomString;
}

@end
