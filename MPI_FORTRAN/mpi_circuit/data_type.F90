module data_type
!use mod

!implicit
implicit none

!private variable

!public variable
  integer,parameter:: &
    int_kind = selected_int_kind(6), &
    mpi_int_kind = selected_int_kind(6),&
    real_kind = selected_real_kind(5,20),&
    bit_len = 16
!function member

end module
