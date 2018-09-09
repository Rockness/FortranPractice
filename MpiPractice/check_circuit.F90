program main
  !use mod
  use check_circuit_mod
  use init_mpi

  !implicit
  implicit none

  !variable definition
  
  !main program
  call init

  call check_circuit

  call finalize

  stop
end
