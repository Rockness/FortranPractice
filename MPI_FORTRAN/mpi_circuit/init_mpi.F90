module init_mpi
!----------------------------use mod
  use mpi
  use data_type
!----------------------------implicit
  implicit none
!----------------------------private variable
  private

!----------------------------public variable
  integer(mpi_int_kind),public :: &
    ierr,&
    MPI_COMM,&
    my_id,&
    nproc

  real(real_kind),public :: &
    timer_b,&!timer begin
    timer_e!timer end
!----------------------------function definition
  public :: init, &
            finalize, &
            timer_begin,&
            timer_end,&
            get_timer
contains

!----------------------------function realization
!mpi init
  subroutine init
    !use mpi
    implicit none

    call MPI_INIT(ierr)
    call MPI_COMM_RANK(MPI_COMM,my_id,ierr)
    call MPI_COMM_SIZE(MPI_COMM,nproc,ierr)
  end subroutine

!mpi calculate time:start timer
  subroutine timer_begin
    use mpi
    implicit none
    call MPI_BARRIER(MPI_COMM,ierr)
    timer_b = MPI_WTIME()
  end subroutine

!mpi calculate time:end timer
  subroutine timer_end
    use mpi
    implicit none
    call MPI_BARRIER(MPI_COMM,ierr)
    timer_e = MPI_WTIME()
  end subroutine

!mpi calculate time: get timer
  function get_timer()
    implicit none
    real(real_kind) :: get_timer
    get_timer = timer_e - timer_b
  end function

!mpi finalize
  subroutine finalize
    use mpi
    implicit none
    call MPI_FINALIZE(ierr)
  end subroutine

end module
