//
//  XYLittleFunctionTableVC.m
//  testDemo
//
//  Created by 威威孙 on 2017/5/5.
//  Copyright © 2017年 威威孙. All rights reserved.
//

#import "XYLittleFunctionTableVC.h"
#import "XYCollectionBrawer.h"
#import "TestCollectionViewCell.h"
#import "XYImageModel.h"
//#import "KRViewController.h"
@interface XYLittleFunctionTableVC ()
@property (nonatomic ,strong)NSMutableArray *dataArray;
@property (nonatomic ,strong)NSMutableArray *imagesArray;
@end

@implementation XYLittleFunctionTableVC

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@"面部识别（开搞）",@"二维码（未做）",@"蓝牙（未做）",@"WiFi（未做）",@"陀螺仪（未做）", nil];
    }
    return _dataArray;
}

-(NSMutableArray *)imagesArray{
    if (!_imagesArray) {
        _imagesArray = [NSMutableArray arrayWithObjects:@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",nil];
    }
    return _imagesArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSString *dateStr = @"2016-10-20 12:20:30";
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd hh-mm-ss"];
//    NSDate *date = [NSDate date];
//    NSTimeInterval inter = [date timeIntervalSince1970];
//    NSString *str =[NSString stringWithFormat:@"%ld",(long)inter];
//    LxDBAnyVar(str);
    
    self.tableView.tableFooterView = [UIView new];
    
    
//    ButtonTest *button = [ButtonTest new];
//    [self.navigationController pushViewController:button animated:YES];
    
    [self functionUseTimesDurtionBlock:^{
        
//        for (int i = 0; i<100; i++) {
//            swiftViewController *swift = [[swiftViewController alloc]init];
//            [swift Player];
//        }
    }];
    
//    1498787375000
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
//    [dateFormatter setDateFormat:@"yyyy.MM.dd"];
//    NSString *time = [dateFormatter stringFromDate:[[NSDate alloc]initWithTimeIntervalSince1970:[@"1498787375" integerValue]]];
//    LxDBAnyVar(time);
    
    
}

-(void)test{
    LxDBAnyVar(@"Swift调用OC的测试方法");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableView class])];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    swiftViewController *swift = [[swiftViewController alloc]init];
    [swift Player];
    
//    KRViewController *kr = [[KRViewController alloc]init];
//    [self.navigationController pushViewController:kr animated:YES];
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
