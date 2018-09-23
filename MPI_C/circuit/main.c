/*================================================================
*   Copyright (C) 2018 Rocky Zhang. All rights reserved.
*   
*   file name  ：main.c
*   created by : Rocky
*   date       ：2018.09.22
*   description：
*
================================================================*/

#include<stdio.h>
#include<stdlib.h>
#include"matrix_multi.h"

//matrix dimension: m1[D1][D2],m2[D2][D3]
const int D1 = 3;
const int D2 = 3;
const int D3 = 3;


int main(){
  
  int **m1 = (int**)malloc(sizeof(int*)*D1);
  for(int i=0;i<D1;i++){
    m1[i] = (int*)malloc(sizeof(int)*D2);
  }
  set_2Dmatrix_zero(m1,D1,D2);
  print_2Dmatrix(m1,D1,D2);  

  int **m2 = malloc(sizeof(int*)*D2);
  for(int i=0;i<D3;i++){
    m2[i] = malloc(sizeof(int)*D3);
  }
  set_2Dmatrix_zero(m2,D1,D2);
  print_2Dmatrix(m2,D2,D3);

  int **result = malloc(sizeof(int*)*D1);
  for(int i=0;i<D1;i++) result[i] = malloc(sizeof(int)*D2);
   
  result = serial_cal_matrix(m1,D1,D2,m2,D2,D3);

  print_2Dmatrix(result,D1,D3);


  return 0;
}
