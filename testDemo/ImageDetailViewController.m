//
//  ImageDetailViewController.m
//  testDemo
//
//  Created by XYCoder on 2017/4/20.
//  Copyright © 2017年 XYCoder. All rights reserved.
//

#import "ImageDetailViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>

@interface ImageDetailViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIImageView *imageView1;
@property (nonatomic,strong) UIImageView *imageView2;
@property (nonatomic,strong) UIImageView *imageView3;
@property (nonatomic,strong) UIImageView *imageView4;
@property (nonatomic,strong) UIImageView *imageView5;

@end

@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = false;
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatImages];
    //测试UIimage<->unsiged char
    [self convertImageFormatTest];
    //测试灰度处理
    [self convertGrayTest];
    
    //测试负底片
    [self convertReColorTest];
    [self convertReColorTest1];
    
    //美白
    [self convertHighLightTest];
}

-(void)configImagePickerController{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    NSString *mediaType = (__bridge NSString *)kUTTypeImage;
    imagePicker.mediaTypes = [NSArray arrayWithObjects:mediaType, nil];
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:true completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
}

-(void)convertHighLightTest{
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    unsigned char *imageData = [self convertUIimageToData:image];
    unsigned char *imageGrayData = [self imageHighLightWithImageData:imageData width:image.size.width height:image.size.height];
    UIImage *imageNew = [self convertDataToImage:imageGrayData imageSource:image];
    self.imageView5.image = imageNew;
}

-(void)convertReColorTest{
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    unsigned char *imageData = [self convertUIimageToData:image];
    unsigned char *imageGrayData = [self imageReColorWithImageData:imageData width:image.size.width height:image.size.height];
    UIImage *imageNew = [self convertDataToImage:imageGrayData imageSource:image];
    self.imageView3.image = imageNew;
}

-(void)convertReColorTest1{
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    unsigned char *imageData = [self convertUIimageToData:image];
    unsigned char *imageData1 = [self imageGrayWithImageData:imageData imageWidth:image.size.width imageHeight:image.size.height];
    unsigned char *imageGrayData = [self imageReColorWithImageData:imageData1 width:image.size.width height:image.size.height];
    UIImage *imageNew = [self convertDataToImage:imageGrayData imageSource:image];
    self.imageView4.image = imageNew;
}

-(void)convertGrayTest{
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    unsigned char *imageData = [self convertUIimageToData:image];
    unsigned char *imageGrayData = [self imageGrayWithImageData:imageData imageWidth:image.size.width imageHeight:image.size.height];
    UIImage *imageNew = [self convertDataToImage:imageGrayData imageSource:image];
    self.imageView2.image = imageNew;
}

-(void)convertImageFormatTest{
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    unsigned char *imageData = [self convertUIimageToData:image];
    UIImage *imageNew = [self convertDataToImage:imageData imageSource:image];
    self.imageView1.image = imageNew;
}

-(void)creatImages{
    
    UIScrollView *scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREENSIZE.width, SCREENSIZE.height)];
    [self.view addSubview:scrollview];
    
    
    CGFloat imageWidth = (SCREENSIZE.width - 15*3)/2.0f;
    for (int i = 0; i<6; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(15 +i%2 *(15 + imageWidth),15 +i/2*(180 +15) , imageWidth, 180)];
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.backgroundColor = [UIColor colorWithRandomColor];
        [scrollview addSubview:imageView];
        
        switch (i) {
            case 0:
                self.imageView = imageView;
                imageView.image = [UIImage imageNamed:@"1.jpg"];
                break;
            case 1:
                self.imageView1 = imageView;
                break;
            case 2:
                self.imageView2 = imageView;
                break;
            case 3:
                self.imageView3 = imageView;
                break;
            case 4:
                self.imageView4 = imageView;
                break;
            case 5:
                self.imageView5 = imageView;
                break;
            default:
                break;
        }
    }
    scrollview.contentSize = CGSizeMake(SCREENSIZE.width, 700);
}


/**
 1.UIimage->CGImage
 2.CGColorSpace 颜色空间
 3.分配bit级空间
 4.CGBitMap
 5.渲染

 @param image 图像
 @return 无符号指针
 */
-(unsigned char *)convertUIimageToData:(UIImage *)image{
    
    CGImageRef imageRef = [image CGImage];
    CGSize size = image.size;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //每个像素点对应4个byte R G B A
    //malloc内存分配
    void *data = malloc(size.width *size.height *4);
    
    //bitsPerComponent
    CGContextRef contentRef = CGBitmapContextCreate(data, size.width, size.height, 8, 4*size.width, colorSpace, kCGImageAlphaPremultipliedLast |kCGBitmapByteOrder32Big);
    
    //渲染
    CGContextDrawImage(contentRef, CGRectMake(0, 0, size.width, size.height), imageRef);
    
    //释放
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(contentRef);
    
    return (unsigned char*)data;
}


-(UIImage *)convertDataToImage:(unsigned char*)imageData imageSource:(UIImage *)imageSource{
    CGFloat width = imageSource.size.width;
    CGFloat height = imageSource.size.height;
    
    NSInteger dataLength = width *height *4;
    
    CGDataProviderRef privider = CGDataProviderCreateWithData(NULL, imageData, dataLength, NULL);
    int bitsPerComponent = 8;
    int bitsPrePixel = 32;
    int bytePerRow = 4*width;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitMapInfo = kCGBitmapByteOrder32Big;
    CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
    
    CGImageRef imageRef = CGImageCreate(width, height, bitsPerComponent, bitsPrePixel, bytePerRow, colorSpace, bitMapInfo, privider, NULL, NO, renderingIntent);
    
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    
    CFRelease(imageRef);
    CGColorSpaceRelease(colorSpace);
    CGDataProviderRelease(privider);
    
    return image;
}

//处理灰度
-(unsigned char*)imageGrayWithImageData:(unsigned char*)imageData imageWidth:(CGFloat)imageWidth imageHeight:(CGFloat)imageHeight{
    //1.分配内存空间 == image == width*heignt *4(每个像素占用字节数)
    unsigned char *resultData = malloc(imageWidth * imageHeight * sizeof(unsigned char) *4);
    memset(resultData, 0, imageWidth * imageHeight * sizeof(unsigned char) *4);//填充内容
    
    for (int h = 0; h<imageHeight; h++) {
        for (int w = 0; w<imageWidth; w++) {
            unsigned int imageIndex = h *imageWidth +w;
            
            unsigned char bitMapRed = *(imageData +imageIndex *4);
            unsigned char bitMapGreen = *(imageData +imageIndex *4 +1);
            unsigned char bitMapBlue = *(imageData +imageIndex *4 +2);
            
            int bitMap = bitMapRed *77/255 +bitMapGreen *151/255 +bitMapBlue *88/255;
//            int bitMap = (bitMapRed +bitMapGreen +bitMapBlue)/3;//两者这都可以,上面方法官方推荐
            unsigned char newBitMap = (bitMap>255)?255:bitMap;
            memset(resultData +imageIndex *4, newBitMap, 1);//resultData +imageIndex *4 以像素为单位处理
            memset(resultData +imageIndex *4 +1, newBitMap, 1);
            memset(resultData +imageIndex *4 +2 , newBitMap, 1);
        }
    }
    return resultData;
}

//负底片效果
-(unsigned char *)imageReColorWithImageData:(unsigned char *)imageData width:(CGFloat)width height:(CGFloat)height{
    //1.分配内存空间 == image == width*heignt *4(每个像素占用字节数)
    unsigned char *resultData = malloc(width * height * sizeof(unsigned char) *4);
    memset(resultData, 0, width * height * sizeof(unsigned char) *4);//填充内容
    
    for (int h = 0; h<height; h++) {
        for (int w = 0; w<width; w++) {
            unsigned int imageIndex = h *width +w;
            
            unsigned char bitMapRed = *(imageData +imageIndex *4);
            unsigned char bitMapGreen = *(imageData +imageIndex *4 +1);
            unsigned char bitMapBlue = *(imageData +imageIndex *4 +2);
            
            unsigned char bitMapRedNew = 255 - bitMapRed;
            unsigned char bitMapGreenNew = 255 - bitMapGreen;
            unsigned char bitMapblueNew = 255 - bitMapBlue;
            
            memset(resultData +imageIndex *4, bitMapRedNew, 1);//resultData +imageIndex *4 以像素为单位处理
            memset(resultData +imageIndex *4 +1, bitMapGreenNew, 1);
            memset(resultData +imageIndex *4 +2 , bitMapblueNew, 1);
        }
    }
    return resultData;
}

//美白（高亮）处理 ==>>映射表（最简单）
-(unsigned char *)imageHighLightWithImageData:(unsigned char *)imageData width:(CGFloat)width height:(CGFloat)height{
    //1.分配内存空间 == image == width*heignt *4(每个像素占用字节数)
    unsigned char *resultData = malloc(width * height * sizeof(unsigned char) *4);
    memset(resultData, 0, width * height * sizeof(unsigned char) *4);//填充内容
    
    NSArray *colorsArraybase = @[@"55",@"110",@"155",@"185",@"220",@"240",@"250",@"255"];
    NSMutableArray *colorArray = [NSMutableArray array];
    int beforeNum = 0;
    for (int i = 0; i<8; i++) {
        NSString *numStr= [colorsArraybase objectAtIndex:i];
        int num = [numStr intValue];
        float step = 0;
        if (i == 0) {
            step = num/32.0f;
            beforeNum = num;
        }else{
            step = (num - beforeNum)/32.0f;
        }
        for (int j = 0; j<32; j++) {
            int newNum = 0;
            if (i == 0) {
                newNum = (int)(j*step);
            }else{
                newNum = (int)(beforeNum +j*step);
            }
            NSString *newNumStr = [NSString stringWithFormat:@"%d",newNum];
            [colorArray addObject:newNumStr];
        }
        beforeNum = num;
    }
    
    for (int h = 0; h<height; h++) {
        for (int w = 0; w<width; w++) {
            unsigned int imageIndex = h *width +w;
            
            unsigned char bitMapRed = *(imageData +imageIndex *4);
            unsigned char bitMapGreen = *(imageData +imageIndex *4 +1);
            unsigned char bitMapBlue = *(imageData +imageIndex *4 +2);
            
            NSString *redStr = [colorArray objectAtIndex:bitMapRed];
            NSString *greenStr = [colorArray objectAtIndex:bitMapGreen];
            NSString *blueStr = [colorArray objectAtIndex:bitMapBlue];
            
            unsigned char bitMapRedNew = redStr.intValue;
            unsigned char bitMapGreenNew = greenStr.intValue;
            unsigned char bitMapblueNew = blueStr.intValue;
            
            memset(resultData +imageIndex *4, bitMapRedNew, 1);//resultData +imageIndex *4 以像素为单位处理
            memset(resultData +imageIndex *4 +1, bitMapGreenNew, 1);
            memset(resultData +imageIndex *4 +2 , bitMapblueNew, 1);
        }
    }
    return resultData;
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

@end
