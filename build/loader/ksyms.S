
/*
 * build/loader/ksyms.S autogenerated from build/kernel.elf.
 * by /usr/bin/scons
 *
 * This file is included by the loader sources so that any
 * kernel symbol address can be known in advance and stopped
 * at by debuggers before virtual memory is enabled.
 */

.section .text
.align 4
.global break_virtual
.type break_virtual, function
.equ break_virtual, 0x14eb4
