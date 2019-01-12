//
//  ViewController.m
//  Test
//
//  Created by SaremcoTech on 31/07/2018.
//  Copyright © 2018 SaremcoTech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    //Find Smallest missing integer in two arrays
    
    NSMutableArray *A = [[NSMutableArray alloc] init];
    [A addObject:[NSNumber numberWithInteger:1]];
    [A addObject:[NSNumber numberWithInteger:2]];
    [A addObject:[NSNumber numberWithInteger:1]];
    [A addObject:[NSNumber numberWithInteger:6]];
    [A addObject:[NSNumber numberWithInteger:5]];

    NSMutableArray *B = [[NSMutableArray alloc] init];
    [B addObject:[NSNumber numberWithInteger:1]];
    [B addObject:[NSNumber numberWithInteger:2]];
    [B addObject:[NSNumber numberWithInteger:1]];
    [B addObject:[NSNumber numberWithInteger:3]];
    [B addObject:[NSNumber numberWithInteger:3]];
    printf("Smallest missing integer == %d \n\n", [self smallestInteger:A :B]);

    
    //Find Odd, Even, Positive, Negative, Min, Max and sum of numbers in array
    int numberArray[] = {4,4,12,3,6};
    
    int size = sizeof(numberArray) / sizeof(int);
    [self smallProblems:numberArray andSize:size];
    
}
-(int) smallestInteger : (NSMutableArray*) A :  (NSMutableArray *) B {

    for (int i = 0; i < A.count; i++) {
        if (B[i] > A[i]) {
            
            [A replaceObjectAtIndex:i withObject:B[i]];
            
        }
    }
    
    NSArray *sortedA = [A sortedArrayUsingDescriptors:
                             @[[NSSortDescriptor sortDescriptorWithKey:@"intValue"
                                                             ascending:YES]]];
    
    int smallestInteger =  1;
    
    for (int i = 0; i < sortedA.count; i++)
    {
        if (sortedA[i] <= 0)
            continue;
        else if ([sortedA[i] intValue] == smallestInteger)
        {
            smallestInteger++;
        }
        
    }

    return smallestInteger;
    
}

-(void) smallProblems : (int [])array andSize : (int)size
{
   
    int min = array[0];
    int max = array[0];
    int sum = 0;

    int sortedArray[size];
    for (int k = 0; k < size; k++) {
       

        if (array[k] < min) {
            min = array[k];
            sortedArray[k] = min;
        }
        if (array[k] > max) {
            max = array[k];
        }
        
        sum = sum + array[k];
        
        if (array[k] >=0) {
            printf("Positive Number == %d  \n\n", array[k] );
        }
        else
        {
            printf("Negative Number == %d  \n\n", array[k] );
        }
        
        if (array[k] % 2 ==0) {
            printf("Even Number == %d  \n\n", array[k] );
            
        }
        else
        {
            printf("Odd Number == %d  \n\n", array[k] );
            
        }
       
    }
    
    printf("min Number == %d  \n\n", min );
    printf("max Number == %d  \n\n", max );
    printf("Sum of Numbers == %d  \n\n", sum );

    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
