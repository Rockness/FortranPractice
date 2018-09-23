module check_circuit_mod
!use mod
use data_type
use init_mpi
!implicit
implicit none

!variable definition

!function definition
public :: &
  trans_binary, &
  trans_logical, &
  check_circuit

!function realization
contains
  
  !-------------------------transfer decimal to binaryfunction trans_binary(num)
  function trans_binary(num)
    !use mod
    use data_type
  
    !implicit
    implicit none
  
    !pass & return  variable
    integer(int_kind) :: &
      num, &
      trans_binary(16)
  
    !local variable
      integer(int_kind) :: &
      i, &
      r
    !main function
    do i=1,bit_len
      trans_binary(bit_len-i+1) = IBITS(num,i-1,1)
    end do
  
    return
  end function
  
  !------------------------transfer 0-1 integer array to logical array
  function trans_logical(array)
    !use mod
    use data_type
  
    !implicit
    implicit none
  
    !pass & return variable definition
    integer(int_kind) :: array(16)
    logical :: trans_logical(16)
  
    !local variable definition
    integer :: i!loop counter
  
    !main function
    do i=1,16
      if(array(i)==1) then
        trans_logical(i) = .true.
      else
        trans_logical(i) = .false.
      end if
    end do
  
    return
  end function
  
  
  !------------------------check every circuit logic combination
  subroutine check_circuit
    !use mod
    use init_mpi
    
    !implicit
    implicit none
  
    !interface definition
!    interface
!      function trans_binary(num)
!        use data_type
!        implicit none
!        integer(int_kind) :: &
!        num,  &
!        trans_binary(16)
!      end function
!  
!      function trans_logical(array)
!        use data_type
!        implicit none
!        integer(int_kind) :: array(16)
!        logical :: trans_logical(16)
!      end function
!    end interface
  
    !pass & return variable definition
    
    !local variable definition
    integer(int_kind) :: temp(16)
    logical :: l(16)
    integer(int_kind) :: i !loop counter
    integer :: r !array output index
  
    !main funcition
    do i=0,2**16-1
      if(my_id==mod(i,nproc)) then
         temp = trans_binary(i)
         l = trans_logical(temp)
         if( (l(1).or.l(2)) .and. ((.not.l(2)).or.(.not.l(4))) .and. (l(3).or.l(4)) &
           .and. ((.not.l(4)).or.(.not.l(5))) .and. (l(5).or.(.not.l(6)))           &
           .and. (l(6).or.(.not.l(7))) .and. (l(6).or.l(7))                         &
           .and. (l(7).or.(.not.l(16))) .and. (l(8).or.(.not.l(9)))                 &
           .and. ((.not.l(8)).or.(.not.l(14))) .and. (l(9).or.l(10))                &
           .and. (l(9).or.(.not.l(10))) .and. ((.not.l(10)).or.(.not.l(11)))        &
           .and. (l(10).or.l(12)) .and. (l(11).or.l(12))                            &
           .and. (l(13).or.l(14)) .and. (l(14).or.(.not.l(15)))                     &
           .and. (l(15).or.l(16))                                                   &
           ) then
          write(*,'(I1,a,16I1)') my_id,') ',(temp(r),r=1,16) 
        end if
      end if
    end do
  
    return
  end subroutine

  

end module
