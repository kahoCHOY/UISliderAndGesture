//
//  ViewController.m
//  UISliderAndGesture
//
//  Created by kaho on 2022/5/9.
//

/// ios 13 12 出现手势冲突

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.bgView];
    [self.bgView addSubview:self.slider];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView)];
    tap.delegate = self;
    [self.bgView addGestureRecognizer:tap];
}

- (void)tapView {
    NSLog(@"kk=tapView");
}

- (void)sliderUp {
    NSLog(@"kk=sliderUp");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    BOOL b = CGRectContainsPoint(self.bgView.frame, [touches.anyObject locationInView:self.view]);
    if (!b) {
        NSLog(@"kk=touchbegin");
    } else {
        NSLog(@"kk=拦截了");
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    CGPoint p = [gestureRecognizer locationInView:self.bgView];
    return !CGRectContainsPoint(self.slider.frame, p);
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 350, 80)];
        _bgView.center = self.view.center;
        _bgView.backgroundColor = UIColor.orangeColor;
    }
    return _bgView;
}

- (UISlider *)slider {
    if (!_slider) {
        _slider = [[UISlider alloc]initWithFrame:CGRectMake(10, 10, 300, 20)];
        [_slider addTarget:self action:@selector(sliderUp) forControlEvents:UIControlEventTouchUpInside];
        [_slider addTarget:self action:@selector(sliderUp) forControlEvents:UIControlEventTouchUpOutside];
        [_slider addTarget:self action:@selector(sliderUp) forControlEvents:UIControlEventTouchCancel];
    }
    return _slider;
}

@end
