//
//  ViewController.m
//  UISegmentedControl
//
//  Created by 谢鑫 on 2019/7/17.
//  Copyright © 2019 Shae. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kNumber (self.segmentedControl.numberOfSegments)
@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UISegmentedControl *segmentedControl;
@end

@implementation ViewController
- (UIScrollView *)scrollView{
    if (_scrollView==nil) {
        _scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
        _scrollView.contentSize=CGSizeMake(kScreenWidth*kNumber, 0);
        _scrollView.backgroundColor=[UIColor yellowColor];
        _scrollView.pagingEnabled=YES;
        _scrollView.showsHorizontalScrollIndicator=NO;
        _scrollView.delegate=self;
    }
    return _scrollView;
}
- (UISegmentedControl *)segmentedControl{
    if (_segmentedControl==nil) {
        _segmentedControl=[[UISegmentedControl alloc]initWithItems:@[@"最新",@"最热",@"经典"]];
        _segmentedControl.tintColor=[UIColor redColor];
        _segmentedControl.selectedSegmentIndex=0;
        [_segmentedControl addTarget:self action:@selector(changeIndex) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentedControl;
}
-(void)changeIndex{
    CGFloat offsetX=self.scrollView.contentOffset.x;
    CGFloat x=offsetX/kScreenWidth;
    int index=(int)round(x);
    self.segmentedControl.selectedSegmentIndex=index;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView=self.segmentedControl;
    [self.view addSubview:[self scrollView]];
    for (int i=0; i<kNumber; i++) {
        
    }
}


@end
