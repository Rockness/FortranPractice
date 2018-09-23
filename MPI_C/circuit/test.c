/*================================================================
*   Copyright (C) 2018 Rocky Zhang. All rights reserved.
*   
*   file name  ：test.c
*   created by : Rocky
*   date       ：2018.09.21
*   description：
*
================================================================*/

#include<stdio.h>
#include<stdlib.h>

int main(){

  int **array;
  array  = malloc(sizeof(int*)*4);
  for(int i=0;i<4;i++){
    array[i] = malloc(sizeof(int)*4);
  }
  
  for(int i=0;i<4;i++) for(int j=0;j<4;j++) array[i][j] = 0;

  for(int i=0;i<4;i++){
    for(int j=0;j<4;j++){
      printf("%d ",array[i][j]);
    }
    printf("\n");
  }

  return 0;
}
