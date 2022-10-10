/* 控制内核内存布局的链接脚本以使内核运行在 qemu 虚拟机上 */
OUTPUT_ARCH(riscv)
ENTRY(_start)
BASE_ADDRESS = 0x80200000;

SECTIONS
{
    . = BASE_ADDRESS;
    skernel = .;

    /*
        代码段（code segment/text segment）是指存放执行代码的内存区域
        这部分区域的大小确定，通常属于只读
        在代码段中，也有可能包含一些只读的常数变量
    */
    stext = .;
    .text : {
        *(.text.entry)
        *(.text .text.*)
    }

    . = ALIGN(4K);
    etext = .;
    srodata = .;
    .rodata : {
        *(.rodata .rodata.*)
        *(.srodata .srodata.*)
    }

    /*
        数据段（data segment）通常是指用来存放程序中已初始化的全局变量的一块内存区域
        数据段属于静态内存分配
    */
    . = ALIGN(4K);
    erodata = .;
    sdata = .;
    .data : {
        *(.data .data.*)
        *(.sdata .sdata.*)
    }
    /* 
        bss段，通常是指用来存放程序中未初始化的全局变量的一块内存区域
        bss是英文Block Started by Symbol的简称，bss段属于静态内存分配
        SBSS：small bss，近数据
    */
    . = ALIGN(4K);
    edata = .;
    .bss : {
        *(.bss.stack)
        sbss = .;
        *(.bss .bss.*)
        *(.sbss .sbss.*)
    }

    . = ALIGN(4K);
    ebss = .;
    ekernel = .;

    /DISCARD/ : {
        *(.eh_frame)
    }
}