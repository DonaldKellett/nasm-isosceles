# nasm-isosceles

A simple, non-interactive program in Netwide Assembler v2.13.03 (for MacOSX) which prints out an isosceles triangle using whitespace, asterisks and newlines

## How to assemble and run

If you are using a Mac and have Netwide Assembler v2 (or later) installed, simply run the command `nasm -fmacho64 isosceles.asm && ld isosceles.o && ./a.out` in the Terminal after changing directory to the directory containing the file `isosceles.asm`.  You can check whether you have version 2 or above of NASM by executing `nasm -v` in the command line.

If you are using Linux, you cannot assemble and run this program as-is but chainging a few codes here are there (for system calls) should suffice.  It is not known what fraction of the source code in `isosceles.asm` needs to be modified in order for it to run on Windows.

## Modifying the height (no. of lines) of the isosceles triangle

In order to make the printed triangle taller or shorter, simply change the value under the labels `maxLines` and `dataSize` accordingly.  `maxLines` is the number of lines of the triangle you want to print and `dataSize` should be calculated (manually, unfortunately) from your `maxLines` using the formula `dataSize = 2 * maxLines * (2 * maxLines + 1) / 2 - maxLines * (maxLines + 1) / 2`.  For example, in the default case where `maxLines = 20`, `dataSize = 2 * 20 * (2 * 20 + 1) / 2 - 20 * (20 + 1) / 2 = 40 * 41 / 2 - 20 * 21 / 2 = 820 - 210 = 610`.

## Credits

Although I did technically write this program myself, it wouldn't be possible without constantly referring to the code examples (specifically `triangle.asm`) provided in [this NASM tutorial](http://cs.lmu.edu/~ray/notes/nasmtutorial/).
