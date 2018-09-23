program main
  !use mod
  use check_circuit_mod
  use init_mpi
  use data_type
  !implicit
  implicit none

  !variable definition
  real(real_kind) :: time 
  integer(kind=8) :: k,n,m=0

  !format
  100 format(f30.19)
    
  !main program

  call init
  
  call timer_begin
  write(*,100) timer_b

  call check_circuit
!  do k = 1,10
!    do n = 1,2**30,1
!      m = m + 1
!    end do
!  end do

  call timer_end
  write(*,100) timer_e

  if(my_id == 0) then
    time = get_timer()
    write(*,'(a,f30.19,a)') 'total time: ',time, ' s'
  end if

  call finalize

  stop
end
