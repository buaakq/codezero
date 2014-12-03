
.align 4
.section .kernel
.incbin "build/kernel.elf"

.align 4
.section .containers
.incbin "build/conts/containers.elf"
