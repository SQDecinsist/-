//
//  SQNewFeatureViewController.m
//  彩票
//
//  Created by Mac on 16/3/29.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQNewFeatureViewController.h"
#import "SQNewFeatureCollectionViewCell.h"
#import "SQTabBarController.h"

#define SQNewFeatureItemCount 4

@interface SQNewFeatureViewController ()
@property (nonatomic, weak) UIImageView *guideImageV;

/** preOffsetX*/
@property (assign, nonatomic) CGFloat preOffsetX;

/** button*/
@property (weak, nonatomic) UIButton *startBtn;
@end

@implementation SQNewFeatureViewController

static NSString * const reuseIdentifier = @"Cell";

- (UIButton *)startBtn{
    if (!_startBtn) {
        
        UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [startBtn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        //为什么要先去自适应大小,再设置位置
        [startBtn sizeToFit];
        
        //        startBtn.frame = CGRectMake(self.collectionView.w * 3.5, <#CGFloat y#>, self.collectionView.w * 0.5, self.collectionView.h * 0.7)
        [self.collectionView addSubview:startBtn];
        [startBtn addTarget:self action:@selector(startBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _startBtn = startBtn;
    }
    return _startBtn;
}

- (void)startBtnClick{
    SQTabBarController *tabBarVC = [[SQTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVC;
}

- (instancetype)init{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.minimumLineSpacing = 0;
    flow.minimumInteritemSpacing = 0;
    flow.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.height);
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [super initWithCollectionViewLayout:flow];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[SQNewFeatureCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.pagingEnabled = YES;
    //不允许弹簧效果
    self.collectionView.bounces = NO;
    
    
    //添加子类
    [self setUp];
}

- (void)setUp{
    //添加引导线
    UIImageView *guideLImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    guideLImageV.x -= 150;
    [self.collectionView addSubview:guideLImageV];
    
    
    //思lu: 先添加一个,然后滚动的时候再进行图片的替换
    //添加动图guide
    UIImageView *guideImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    guideImageV.x += 55;
    [self.collectionView addSubview:guideImageV];
    self.guideImageV = guideImageV;
    
    
    //添加text1
    UIImageView *text1ImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    text1ImageV.center = CGPointMake(self.collectionView.w * 0.5, self.collectionView.h * 0.7);
    [self.collectionView addSubview:text1ImageV];
    
    //添加text2
    UIImageView *text2ImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText2"]];
    text2ImageV.center = CGPointMake(self.collectionView.w * 0.5, self.collectionView.h * 0.8);
//    text2ImageV.center = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.8);
    [self.collectionView addSubview:text2ImageV];
    
    
    
}

//在滚动完毕的时候进行动画
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat offsetX = scrollView.contentOffset.x - self.preOffsetX;
    
    
    //设置动画
    self.guideImageV.x += 2 * offsetX;
    [UIView animateWithDuration:0.3 animations:^{
        self.guideImageV.x -= offsetX;
    }];
    
    
    //记录当前偏移量
    self.preOffsetX = scrollView.contentOffset.x;
    
    
    //当前页数
    NSInteger page = scrollView.contentOffset.x / self.collectionView.w;      //scrollView.w;  //[UIScreen mainScreen].bounds.size.width;
    
    NSLog(@"%@",self.collectionView);
    NSLog(@"%@",scrollView);
    NSLog(@"%ld",page);
    if (page == SQNewFeatureItemCount - 1) {
        self.startBtn.center = CGPointMake(self.collectionView.w * (SQNewFeatureItemCount - 0.5), self.collectionView.h * 0.7);
    }
    
    
    //设置图片
    self.guideImageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%ld",page + 1]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return SQNewFeatureItemCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SQNewFeatureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
//    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"guide%ldBackground568h",indexPath.item + 1]]];
//    imageV.frame = cell.bounds;
//    [cell.contentView addSubview:imageV];
//    cell.backgroundColor = [UIColor redColor];
    
    //封装以上代码,给数据就创建cell
    
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%ldBackground568h",indexPath.item + 1]];
    cell.image = image;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
