//
//  ViewController.m
//  TomCat
//
//  Created by apple on 15/12/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//用于图片显示
@property (weak, nonatomic) IBOutlet UIImageView *tomImageView;

@end

@implementation ViewController
//触摸头部
- (IBAction)TouchHeadOnClick:(UIButton *)sender {
    [self tomAnimateWith:@"knockout" imageCount:81];
    
}
//- (void)clearImage{
//    self.tomImageView.animationImages=nil;
//}

//点击吃小鸟
- (IBAction)ClickEat:(UIButton *)sender {
    [self tomAnimateWith:@"eat" imageCount:40];
   
}
//封装好的播放动画数组
#pragma mark ----------执行动画数组
- (void)tomAnimateWith:(NSString *)fileName imageCount:(NSInteger)imageCount{
    //0.如果动画正在执行  我们就直接不执行一下代码
    if (self.tomImageView.isAnimating) {
        return;
    }
    //就是执行一段动画
    //1.首先创建图片数组
    NSMutableArray *tomImages=[NSMutableArray array];
    for (int i=0; i<imageCount; i++) {
        NSString *imageName=[NSString stringWithFormat:@"%@_%02d.jpg",fileName,i];
        //创建图片的第一种创发(图片多的时候内存溢出)
        //UIImage *image=[UIImage imageNamed:imageName];
        
        //这种方式获取图片不会有内存溢出的问题
        NSString *path=[[NSBundle mainBundle]pathForResource:imageName ofType:nil];
        UIImage *image=[UIImage imageWithContentsOfFile:path];
        [tomImages addObject:image];
        
    }
    //2.设置动画过程
    //2.1添加动画执行的图片数组
    [self.tomImageView setAnimationImages:tomImages];
    //2.2设置动画执行的时间
    [self.tomImageView setAnimationDuration:self.tomImageView.animationImages.count*0.1];
    //2.2设置动画的执行次数
    [self.tomImageView setAnimationRepeatCount:1];
    
    //2.3设置动画开始执行
    [self.tomImageView startAnimating];
    //3在动画结束之后要清空数组
    //    [self performSelector:@selector(clearImage) withObject:nil afterDelay:self.tomImageView.animationDuration];
    [self.tomImageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.tomImageView.animationDuration];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
