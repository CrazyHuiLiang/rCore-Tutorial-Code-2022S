# rCore-Tutorial-Code-2022S

目录结构

```text
/bootloader                 内核依赖的运行在 M 特权级的 SBI 实现，本项目中我们使用 RustSBI
/os                         我们的内核实现
```

## 实验步骤

### 环境搭建

> http://rcore-os.cn/rCore-Tutorial-Book-v3/chapter0/5setup-devel-env.html#id4

硬件: m1 MBP

#### 安装编辑器

安装 vscode 以及 *RISC-V Support* 与 *rust-analyzer* 插件


#### 安装rust

```bash
# 安装
curl https://sh.rustup.rs -sSf | sh

# 当前shell中生效
source $HOME/.cargo/env

# 查看rust版本
rustc --version

# 接下来安装一些Rust相关的软件包
rustup target add riscv64gc-unknown-none-elf
cargo install cargo-binutils
rustup component add llvm-tools-preview
rustup component add rust-src
```

# 安装 riscv64 gcc 

下载 <https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-apple-darwin.tar.gz>

```bash
# 解压压缩包
tar -xf riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-apple-darwin.tar.gz

# 将解压文件移动至家目录下的 Applications 目录中
mv riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-apple-darwin ~/Applications/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-apple-darwin

# 添加环境变量
export PATH=/Users/huiliang/Applications/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-apple-darwin/bin:$PATH
```

#### 安装 QEMU 7.0 版本

```bash
brew install qemu
```


