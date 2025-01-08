; Library: syscalls
; These functions wrap Linux syscalls for compatibility with the System V ABI calling convention.
; 
; - Arguments 0–3: Passed directly (rdi, rsi, rdx).
; - Arguments 4–6: Adjustments are needed:
;     - 4th argument: Move from rcx to r10.
; - Caller is responsible for saving r10, rcx, and rax.

section .text
global read, write, open, close, stat, fstat, lstat, poll, lseek
global mmap, mprotect, munmap, brk
global exit

; ssize_t read(int fd, void buf[.count], size_t count);
read:
    mov eax, 0x00
    syscall
    ret

; ssize_t write(int fd, const void buf[.count], size_t count);
write:
    mov eax, 0x01
    syscall
    ret

; int open(const char *pathname, int flags, mode_t mode);
open:
    mov eax, 0x02
    syscall
    ret

; int close(int fd);
close:
    mov eax, 0x03
    syscall
    ret

; int stat(const char *restrict pathname, struct stat *restrict statbuf);
stat:
    mov eax, 0x04
    syscall
    ret

; int fstat(int fd, struct stat *statbuf);
fstat:
    mov eax, 0x05
    syscall
    ret

; int lstat(const char *restrict pathname, struct stat *restrict statbuf);
lstat:
    mov eax, 0x06
    syscall
    ret

; int poll(struct pollfd *fds, nfds_t nfds, int timeout);
poll:
    mov eax, 0x07
    syscall
    ret

; off_t lseek(int fd, off_t offset, int whence);
lseek:
    mov eax, 0x08
    syscall
    ret

; void *mmap(void addr[.length], size_t length, int prot, int flags, int fd, off_t offset);
mmap:
    mov eax, 0x09
    mov r10, rcx
    syscall
    ret

; int mprotect(void addr[.len], size_t len, int prot);
mprotect:
    mov eax, 0x0a
    syscall
    ret

; int munmap(void addr[.length], size_t length);
munmap:
    mov eax, 0x0b
    syscall
    ret

; int brk(void *addr);
brk:
    mov eax, 0x0c
    syscall
    ret

; void exit(int status);
exit:
    mov eax, 0x3c
    syscall
    ret
