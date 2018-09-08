program main
!use mod

!implicit
implicit none

!variable definition
  integer,parameter :: mpi_int_kind = selected_int_kind(2)

  integer(mpi_int_kind) :: a = 127

  integer :: array(8)

  integer :: i

  logical :: log_array(4) = (/.true.,.false.,.true.,.false./)

!main program
  write(*,*) log_array(1).and.log_array(2).and.log_array(3)
    
  write(*,*) IAND(5,2),IAND(5,1),NOT(IBITS(a,0,1))
!  do i = 1,8
!    array(9-i) = IBITS(a,i-1,1)
!  end do
!
!  write(*,'(8I1)') (array(i),i=1,8)


end program
