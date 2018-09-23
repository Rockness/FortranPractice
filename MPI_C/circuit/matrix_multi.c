/*================================================================
*   Copyright (C) 2018 Rocky Zhang. All rights reserved.
*   
*   file name  ：matrix_multi.c
*   created by : Rocky
*   date       ：2018.09.23
*   description：
*
================================================================*/

#include<stdio.h>
#include<stdlib.h>
#include"matrix_multi.h"


int** serial_cal_matrix(int** m1,int col1,int ran1,int** m2,int col2,int ran2){


  if(ran1!=col2){
    printf("ERROR: two matrixes don't match in dimension!\n");
    return ((void *)0);
  }


  int **result = malloc(sizeof(int*)*col1);
  for(int i=0;i<col1;i++) result[i] = malloc(sizeof(int)*ran2);
  set_2Dmatrix_zero(result,col1,ran2);

  for(int d1=0;d1<col1;d1++){
    for(int d3=0;d3<ran2;d3++){

      int sum = 0;

      for(int d2=0;d2<ran1;d2++){
        sum += m1[d1][d2]*m2[d2][d3];
      }

      result[d1][d3] = sum;
    }
  }

  return result;
}



void print_2Dmatrix(int** matrix,int d1,int d2){
  for(int i=0;i<d1;i++){
     for(int j=0;j<d2;j++){
        printf("%d ",matrix[i][j]);
     }
     printf("\n");
  }
}



void set_2Dmatrix_zero(int** matrix,int d1,int d2){
  for(int i=0;i<d1;i++){
    for(int j=0;j<d2;j++){
      matrix[i][j] = 0;
    }
  }
 } 
