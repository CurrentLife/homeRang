//
//  SWHomeViewController.m
//  CurrentLife
//
//  Created by mac on 15/11/22.
//  Copyright © 2015年 itcast. All rights reserved.
//
/*
 //1001   -- app_id
 //5bV9JhaMn2GJ5MZe --平台标示符
 //加密规则:sign=md5(app_id + lon+lat + time + key)
 */

#import "SWHomeViewController.h"
#import "SWLoginViewController.h"
#import "SWLocationManger.h"
#import "SWHomeModel.h"
#import "SWHeaderViewCell.h"
#import "SWTableViewCell.h"
#import "SWStoreViewCell.h"
#import "SWGuessTableViewCell.h"
#import "SWFunction.h"
#import <CoreLocation/CoreLocation.h>
#define kUITableViewHeightForHeader 78/2.0
@interface SWHomeViewController ()<CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) SWHeaderViewCell * header;
//主体模型
@property (nonatomic, strong)SWHomeModel * homeModel;



@end

@implementation SWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载
    [self showLoadView];
    
    //MBProgressHUD第三方框架 加载
    [self performSelector:@selector(dismissLoadView) withObject:nil afterDelay:1.0];
    [self showToast:@"你输没输"];
    self.leftBtn.hidden = YES;//首页不显示leftBtn

   
    //加载数据
    [self loadDataUp];
    
    
//    //    1.设置自动计算高度
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//
////    //    2.6.3之后的版本(包括6.3)需要预设高度
////    self.tableView.estimatedRowHeight = 44.0f;
//    self.tableView.rowHeight =44.0f;

    
    //*******定位***********
    [SWLocationManger localSuccess:^(CLLocationCoordinate2D coordinate2D) {
        SNSLog(@"%f",coordinate2D.latitude);//维度
        SNSLog(@"%f",coordinate2D.longitude);//经度
        
    } withError:^(NSError *error) {
        SNSLog(@"%@",error);
    }];
    
    
 
    
    //给 tableView设置 header
    _header =[[NSBundle mainBundle]loadNibNamed:@"SWHeaderViewCell" owner:nil options:nil].firstObject;
//    _header.backgroundColor = [UIColor redColor];
    _header.frame = CGRectMake(0, 0, KUIScreenWidth, (425 - 88)/2.0);
//    [_header.imageView setImage:[UIImage imageNamed:@"123"]];
    
    _tableView.tableHeaderView = _header;
    /*  水平和垂直 滑动条*/
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    
    self.automaticallyAdjustsScrollViewInsets =NO;
//    self.tableView.bounces  = NO;
//    self.tableView.bouncesZoom = NO;
    

  

    
}

#pragma mark--切换到登陆见面
-(void)loginMethod{
    SWLoginViewController * loginVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SWLoginViewController"];
   //影藏tabbar
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    [app.tab  showOrHiddenTabBarView:YES];
    [self.navigationController pushViewController:loginVC animated:YES];
     
}


#pragma  mark -- 加载首页数据（接口文档）
-(void)loadDataUp{
    AFHTTPSessionManager * manger =[[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:@"http://www.qd-life.com /?anu=api/1/index/get_index_info"]];
//    1.配置所有接收文件类型
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    //2.配置可接收的文件类型
//    manger.responseSerializer.acceptableContentTypes =[NSSet setWithObject:@"text/html"];
    
#pragma 拼接参数
    NSMutableDictionary * stringDict = [NSMutableDictionary dictionary];
    [stringDict setValue:@"120.38" forKey:@"lon"];
    [stringDict setValue: @"36.06"forKey:@"lat"];
  
    NSString * stringTime = [NSString stringWithFormat:@"%f",[[NSDate date]timeIntervalSince1970]];
    [stringDict setValue:stringTime forKey:@"time"];
    
  
  NSString *signStr = [NSString stringWithFormat:@"%@%@%@%@%@",APP_ID,stringDict[@"lon"],stringDict[@"lat"],stringDict[@"time"],APP_IDENTIFER];
    
    //

    NSString *md5String = [MD5 MD5Encrypt:signStr];

    [stringDict  setValue:md5String forKey:@"sign"];
    //添加app_id
    [stringDict setValue:APP_ID forKey:@"app_id"];
    
    SNSLog(@"%@",stringDict);
    
//  ********** 首页 GET请求,先拿值***********
    
    [SWAFHTTPClient getHomewithParams:stringDict withSuccessBlock:^(SWHomeModel *HomeModel) {
//        SNSLog(@"%@",HomeModel);//***************************//
//        SWFocus * f= HomeModel.focus.list[2];
//        SNSLog(@"%@",f.title);
        
        
        //home 拿到 模型数据
       _homeModel = HomeModel;
       _header.model = HomeModel;
       [self.tableView reloadData];
        
    } withFailedBlock:^(NSError *error) {
        SNSLog(@"%@",error);
        
    }];

}


#pragma mark -- UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ( section ==0 || section == 1) {
        return 1;
    }else if (section == 2){
        return _homeModel.guess.list.count;
    }
    else{
        return 0;
    }

  
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section == 0) {
        
        static NSString *identifier = @"SWTableViewCell";
        
        SWTableViewCell *cell =[tableView  dequeueReusableCellWithIdentifier:identifier];
        if (cell== nil) {
            
            cell = [[[UINib nibWithNibName:identifier bundle:nil]
                     instantiateWithOwner:self options:nil]objectAtIndex:0];//实例化（将对象创建出来）
        }
        if (_homeModel != nil) {
            //给cell 模型 赋值，（会调用模型的set放法）
            cell.list = _homeModel.group;
        }
        return  cell;
    }
    else if (indexPath.section == 1){
        
        static NSString * identifier = @"SWStoreViewCell";
        
        SWStoreViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (cell == nil) {
            cell =[[[UINib nibWithNibName:identifier bundle:nil] instantiateWithOwner:self options:nil]objectAtIndex:0];
        }
        if (_homeModel !=nil) {
            cell.list =_homeModel.famous;
        }
        return  cell;
    }
    else if(indexPath.section == 2){
        
        static NSString *identifer = @"SWGuessTableViewCell";
        
        SWGuessTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifer];
        
        if ( cell == nil) {
            cell = [[[UINib nibWithNibName:identifer bundle:nil]instantiateWithOwner:self options:nil]objectAtIndex:0];
            
    
        }
        
        if (_homeModel != nil) {
            
            cell.model = _homeModel.guess.list[indexPath.row];
         
            
        }

   
        return cell;
    
    }else{
        return NULL;
    }
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0){
       return 190;
    }else if (indexPath.section == 1){
        return 220;
    }
   
    return  120;

        
}

//设置cell的header 的高度

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else
        return kUITableViewHeightForHeader;
}

//设置 cell 的 header 的frame
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KUIScreenWidth, kUITableViewHeightForHeader)];
    view.backgroundColor = [UIColor whiteColor];
    //cell header view  zhong  de 灰色隔条
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KUIScreenWidth, 6)];
    line.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:line];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
    
    title.textColor = [UIColor colorWithRed:233/255.0 green:76/255.0 blue:80/255.0 alpha:1.0];
    
    [view addSubview:title];
    
    UIView *sep = [[UIView alloc]initWithFrame:CGRectMake(0, kUITableViewHeightForHeader - 0.5, KUIScreenWidth, 0.5)];
    sep.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:sep];
    
    if (section == 1) {
        title.text = @"名店推荐";
    }else if (section == 2){
        title.text = @"猜你喜欢";
    }
    
    return view;
    
}

#pragma mark -- 设置cell 的高度



#pragma mark -- 分组代理方法
- (void)didItemSelected:(NSInteger)index{

    NSLog(@"我点击了第%ld个",index);
    
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return (425 - 88) / 2.0;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
