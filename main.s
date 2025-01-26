! SPARC assembly for Solaris
! System calls for Solaris:
! 4 for write
! 1 for exit

        .section ".text"
        .align 4
        .global _start

_start:
        ! Save frame pointer
        save    %sp, -96, %sp   ! Create stack frame

        ! Write system call
        mov     4, %g1          ! System call number for write
        mov     1, %i0          ! File descriptor 1 is stdout
        sethi   %hi(message), %i1
        or      %i1, %lo(message), %i1
        mov     14, %i2         ! Message length
        ta      8               ! Make system call

        ! Exit system call
        mov     1, %g1          ! System call number for exit
        mov     0, %i0          ! Return code 0
        ta      8               ! Make system call

        ! Restore frame (we never get here due to exit)
        ret
        restore                 ! Delay slot

        .section ".rodata"
        .align 4
message:
        .asciz "Hello, World!\n"
