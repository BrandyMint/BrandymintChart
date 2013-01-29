//
//  KeepEdgeView.h
//  BrandymintChart
//
//  Created by DenisDbv on 30.01.13.
//  Copyright (c) 2013 denisdbv@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeepEdgeView : UIView
{
    @private
    BOOL mouseSwiped;
    BOOL isPainting;
    CGPoint prevOrgPoint;
    CGPoint startPoint;
    CGPoint stopPoint;
    int demoIdx;
}

- (id)initWithFrame: (CGRect) frame demoIdx: (int) anIndex;

@end
