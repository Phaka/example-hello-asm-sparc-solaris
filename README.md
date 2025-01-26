# Hello World in SPARC Assembly (Solaris)

A simple Hello World implementation in SPARC assembly language for Solaris systems. This implementation demonstrates how SPARC assembly differs between Solaris and Linux, reflecting Solaris's heritage as the original SPARC operating system.

## Installation

On a Solaris system, you'll need the Sun Studio/Oracle Developer Studio tools or the GNU toolchain:

```bash
pkg install developer/gnu-binutils developer/gcc
```

## Running

Using GNU tools:
```bash
as -o main.o main.s
ld -o hello main.o
./hello
```

Using Sun Studio tools:
```bash
as -o main.o main.s
ld -o hello main.o
./hello
```

## Code Explanation

The Solaris implementation demonstrates several key differences from the Linux version, particularly in how system calls are handled and how the stack frame is managed. These differences reflect Solaris's heritage as the original SPARC operating system.

### Key Differences from Linux SPARC

Stack Frame Management:
- Uses explicit save/restore instructions
- Creates a standard 96-byte stack frame
- Follows Solaris ABI requirements for stack alignment

System Call Interface:
- Uses trap 8 (ta 8) instead of Linux's trap 0x10
- System call numbers are Solaris-specific
- Parameters passed in %i registers instead of %o registers after save
- More structured calling convention inherited from SunOS

Register Usage:
- Uses %i (input) registers after save instruction
- %g (global) registers used consistently with Linux
- Register windowing fully utilized for parameter passing

### SPARC Architectural Features

The implementation demonstrates several SPARC features:
- Register windows with save/restore instructions
- Delayed branching (shown in the restore instruction)
- Big-endian byte ordering
- Fixed-width instruction encoding

### Historical Context

Solaris was the original operating system for SPARC architecture, and its conventions reflect this heritage:
- More structured system call interface
- Strict adherence to SPARC ABI
- Traditional Unix system call numbering
- Consistent stack frame management

This implementation provides better debugging support than its Linux counterpart because:
- Stack frames are properly maintained
- Register windows are used as designed
- System calls follow traditional Unix conventions
- Frame pointers are always valid

The code demonstrates how Solaris maintains closer alignment with the original SPARC architecture design principles, particularly in its use of register windows and stack frame management.
