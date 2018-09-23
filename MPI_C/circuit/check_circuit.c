/*================================================================
*   Copyright (C) 2018 Rocky Zhang. All rights reserved.
*   
*   file name  ：check_circuit.c
*   created by : Rocky
*   date       ：2018.09.19
*   description：
*
================================================================*/

#include<stdio.h> 
#include"mpi.h"

int main(int argc,char *argv[]){
  /*variable declaration*/
  int my_id,nprocs;

  MPI_Init(&argc,&argv);
  MPI_Comm_rank(MPI_COMM_WORLD,&my_id);
  MPI_Comm_size(MPI_COMM_WORLD,&nprocs);

  printf("%d) hello world!\n",my_id);

  MPI_Finalize();
  return 0;
}
