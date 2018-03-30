# Questions 15-Relocation

The program `relocation.py` allows you to see how address translations are
performed in a system with base and bounds registers. See the `README` for
details.

## Warmup

Run with seeds 1, 2, and 3, and compute whether each virtual address generated
by the process is in or out of bounds. If in bounds, compute the translation.

Please answer the questions, by giving the result and - if asked - an
explanation, why you got the result. Write your answers in [markdown syntax][] in
the new file `ANSWERS.md.` Please use the *template_answers.md* as a template for your file. If you need to include console output of your simulations for your answers, please use the *template_answers_output.md* as a template for a new file **ANSWERS_OUTPUT.md.**

## Questions

1. Run with these flags: `-s 3 -n 10`. What value do you have set `-l` (the
   bounds register) to in order to ensure that all the generated virtual
   addresses are within bounds?

1. Run with these flags: `-s 7 -n 10 -l 200`. What is the maximum value that
   base can be set to, such that the address space still fits into physical
   memory in its entirety (explanation)?

1. Run some of the same problems above, but with larger address spaces (-a) and
   physical memories (-p). How does increasing effect the results (explanation)?

1. For each virtual address, either write down the physical address it
   translates to OR write down that it is an out-of-bounds address (a
   segmentation violation). For this problem, you should assume a simple virtual
   address space of a given size.

   ```text
   ARG phys mem size 16k

Base-and-Bounds register information:

  Base   : 0x00001a25 (decimal 6693)
  Limit  : 512

Virtual Address Trace
  VA  0: 0x0000022a (decimal:  554) --> PA or segmentation violation?
  VA  1: 0x00000372 (decimal:  882) --> PA or segmentation violation?
  VA  2: 0x000000b4 (decimal:  180) --> PA or segmentation violation?
  VA  3: 0x000000e6 (decimal:  230) --> PA or segmentation violation?
  VA  4: 0x0000001d (decimal:   29) --> PA or segmentation violation?
  VA  5: 0x00000077 (decimal:  119) --> PA or segmentation violation?
  VA  6: 0x00000009 (decimal:    9) --> PA or segmentation violation?
  VA  7: 0x000000a0 (decimal:  160) --> PA or segmentation violation?
  VA  8: 0x0000020e (decimal:  526) --> PA or segmentation violation?
  VA  9: 0x000003f5 (decimal: 1013) --> PA or segmentation violation?
    ```

[markdown syntax]: https://guides.github.com/features/mastering-markdown/