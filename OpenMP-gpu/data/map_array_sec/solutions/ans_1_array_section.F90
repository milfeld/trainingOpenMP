program main
  integer, parameter :: n=16
  integer :: a=2, version=0
!!integer, :: x(n), y(n)
  integer, allocatable :: x(:), y(:)

!! TODO 1:  Give x and y allocatable attributes
!!          and allocate them dynamically
   allocate( x(n), y(n) )

   do i=1,n; x(i)=1; y(i)=1; enddo  !! init

   !! Create a target region and 
   !! one thread executes the loop
   !! TODO 1: Create a target region and 
   !!         no map required for allocatable arrays
   !!         FYI: one thread executes the loop
   !!         compile and run 

   !$omp target                         !! TODO 1
      do i=1,n; y(i)=a*x(i)+y(i); enddo           !! axpy loop
   !$omp end target


   do i=1,n; if(y(i) /= 3) stop("y != 3"); enddo  !! validate loop

#ifdef _OPENMP
   print*, "Passed OpenMP ", _OPENMP
#else
   print*, "Passed OpenMP off"
#endif

   !! TODO 2:  Do axpy on last half of vectors
   !!          Modify map, axpy loop and the validate loop
end program
