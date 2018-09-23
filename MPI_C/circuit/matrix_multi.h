/*================================================================
*   Copyright (C) 2018 Rocky Zhang. All rights reserved.
*   
*   file name  ：matrix_multi.h
*   created by : Rocky
*   date       ：2018.09.21
*   description：
*
================================================================*/


#ifndef _MATRIX_MULTI_H
#define _MATRIX_MULTI_H

//serial matrix multiplication: m1[col1][ran1]*m2[col2][ran2]
int** serial_cal_matrix(int** m1,int col1,int ran1,int** m2,int col2,int ran2);

//set matrix value to zero: matrix[d1][d2] = 0
void set_2Dmatrix_zero(int** matrix,int d1,int d2);

//print matrix value: matrix[d1][d2]
void print_2Dmatrix(int** matrix,int d1,int d2);

#endif
