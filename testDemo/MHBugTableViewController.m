//
//  MHBugTableViewController.m
//  testDemo
//
//  Created by XYCoder on 2017/4/13.
//  Copyright © 2017年 XYCoder. All rights reserved.
//

#import "MHBugTableViewController.h"
#import "MHBugTableViewCell.h"
#import "XYNewIntroduceView.h"
@interface MHBugTableViewController ()

@end

@implementation MHBugTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    self.automaticallyAdjustsScrollViewInsets = false;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MHBugTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MHBugTableViewCell class])];
    
    [[XYNewIntroduceView sharedIntroudence]showIntroduceWithItems:@[[XYIntroduceItemObj itemWithRect:CGRectMake(SCREENSIZE.width -80, 20, 60, 44) type:XYIntrodeceItemTypeOval cornerRadius:10]]];
    
    [XYNewIntroduceView sharedIntroudence].clickBlock = ^(){
        [[XYNewIntroduceView sharedIntroudence]hiddenIntroduce];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREENSIZE.height -64;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MHBugTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MHBugTableViewCell class])];
    cell.contentView.backgroundColor = [UIColor colorWithRandomColor];
    cell.textLabel1.text = @"蕲上次啊啊UCC阿巴斯不擦框架吃爱哭不是擦拭擦素材库办事擦拭擦萨斯你擦拭康巴什擦什么擦库上半身出门必定会被擦伤不擦卡U币拭擦没事 插卡版所采才开始擦哭吧撒不撒擦擦开始爆发安康杯擦没事插卡式发美女打开吧餐上次卡背CKABC 艾尔肯活不惨akbekhbca煎熬不出卡看不出啊上班擦拭布擦边按库存阿卡Cuba";
    [cell.imageView1 sd_setImageWithURL:[NSURL URLWithString:@"http://oe7fx58st.bkt.clouddn.com/WestgateNewcastleYLS2.jpg"]];
    return cell;
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
