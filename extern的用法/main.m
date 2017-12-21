//
//  main.m
//  extern的用法
//
//  Created by 张文勇 on 2017/12/21.
//  Copyright © 2017年 张文勇. All rights reserved.
//

#import <Foundation/Foundation.h>


#pragma mark --extern 作用3引用另外一个文件中的函数

 extern void print_a(void);

int main()
{
    
   
    
    
    print_a();
    
    
    return 0;
}

#pragma mark ---extern 作用2。引用 不在同一个文件中的变量
int main2()
{
    
    
    extern int a;
    
    
    printf("%d\n",a);
    
    return 0;
    
}

#pragma mark -- extern 的作用1。在一个文件中饮用变量
void print()
{
    
    //引用同一个文件中的变量。引用同一个文件中的变量 引用同一个文件中的变量
    extern int num;
 
    printf("%d\n",num);
    
}


int main1(int argc, const char * argv[]) {
    @autoreleasepool {
   
        print();
        
    }
    return 0;
}

//全局变量 
int num  = 0;



