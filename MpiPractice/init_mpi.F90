module init_mpi
!use mod
use mpi
use data_type
!implicit
implicit none
!private variable

!public variable
  integer(mpi_int_kind),public :: &
    ierr,&
    MPI_COMM,&
    my_id,&
    nproc
!public function
  public :: init

contains

!function member
  subroutine init
    !use mpi
    implicit none

    call MPI_INIT(ierr)
    call MPI_COMM_RANK(MPI_COMM,my_id,ierr)
    call MPI_COMM_SIZE(MPI_COMM,nproc,ierr)
  end subroutine
  
  subroutine finalize
    use mpi
    implicit none
    call MPI_FINALIZE(ierr)
  end subroutine

end module
