//
//  ChatTableViewController.m
//  testDemo
//
//  Created by 威威孙 on 2017/7/27.
//  Copyright © 2017年 威威孙. All rights reserved.
//

#import "ChatTableViewController.h"

@interface ChatTableViewController ()

@end

@implementation ChatTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //创建图片
    
    
//    CGRect rect = CGRectMake(0, 0, 300, 300);
//    
//    
//    UIImage *image = [[UIImage alloc]init];
//    
//    
//    UIGraphicsBeginImageContext(CGSizeMake(300, 300));
//    
//    
//    [image drawInRect: rect];
//    
//    
//    image = UIGraphicsGetImageFromCurrentImageContext();
//    
//    
//    
//    
//    
//    //绘制背景
//    
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    
//    [image drawInRect: rect];
//    
//    
//    UIColor *color = RGBA(239,240,239, 1);
//    
//    
//    CGContextSetFillColorWithColor(context, [color CGColor]);
//    
//    
//    CGContextSetBlendMode(context, kCGBlendModeNormal);
//    
//    
//    CGContextFillRect(context, rect);
//    
//    
//    image = UIGraphicsGetImageFromCurrentImageContext();
//    
//    
//    
//    
//    
//    //绘制文字
//    
//    
//    CGContextDrawPath(context, kCGPathStroke);
//    
//    
//    NSDictionary* attributes =@{NSForegroundColorAttributeName:RGBA(232,233,235, 1),
//                                
//                                
//                                NSFontAttributeName:DEFAULT_TITLE_FONT_SECOND}; //在词典中加入文本的颜色 字体 大小
//    
//    
//    NSString *text = [NSString stringWithFormat:@"豆芽         %@(%@)", [UserInfo shareInstance].nickName, [UserInfo shareInstance].vCard.accountID];
//    
//    
//    [text drawInRect:CGRectMake(50, 140, 200, 20) withAttributes:attributes];
//    
//    
//    //返回绘制的新图形
//    
//    
//    image = UIGraphicsGetImageFromCurrentImageContext();
//    
//    
//    UIGraphicsEndImageContext();
//    
//    
//    
//    
//    
//    //旋转图片
//    
//    
//    UIImage *routateImage = [Common rotateImage:image];
//    
//    
//    
//    
//    
//    //剪裁图片
//    
//    
//    CGRect copyRect = CGRectMake(40,100,180,80);
//    
//    
//    CGImageRef imageRef = routateImage.CGImage;
//    
//    
//    CGImageRef imagePartRef = CGImageCreateWithImageInRect(imageRef,copyRect);
//    
//    
//    UIImage * copyImage = [UIImage imageWithCGImage:imagePartRef];
//    
//    
//    CGImageRelease(imagePartRef);
//    
//    
//    
//    
//    
//    UIColor *bgColor = [UIColor colorWithPatternImage:copyImage];
    
    
    [self.tableView setBackgroundColor:[UIColor blueColor]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
