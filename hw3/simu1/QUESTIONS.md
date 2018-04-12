# Questions 16-Segmentation

This program allows you to see how address translations are performed in a
system with segmentation. See the `README` for details.

## Warm-up

First let’s use a tiny address space to translate some addresses. Here’s a
simple set of parameters with a few different random seeds; can you translate
the addresses?

```text
      ./segmentation.py -a 256 -b 0 -l 40 -p 1024 -B 1024 -L 40 -s 0
      ./segmentation.py -a 256 -b 0 -l 40 -p 1024 -B 1024 -L 40 -s 1
      ./segmentation.py -a 256 -b 0 -l 40 -p 1024 -B 1024 -L 40 -s 2
```

## Questions

1. Now, let’s see if we understand this tiny address space we’ve constructe (using the parameters from the warm-up above). What is the highest legal virtual address in segment 0?
    1. What about the lowest legal virtual address in
   segment 1?
    2. What are the lowest and highest illegal addresses in this entire address space?
    3. Finally, how would you run segmentation.py with the -A flag to
   test if you are right?

2. Let’s say we have a tiny 16-byte address space in a 128-byte physical memory.
   What base and bounds would you set up, so as to get the simulator to generate
   the following translation results for the specified address stream: valid, valid, valid, violation, ..., violation, valid, valid? Assume the following
   parameters:

   ```text
     ./segmentation.py -a 16 -p 128
         -A 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
         -b ? -l ? -B ? -L ?
   ```

3. Assuming we want to generate a problem where roughly 90% of the
   randomly-generated virtual addresses are valid (i.e., not segmentation
   violations). How should you configure the simulator to do so? Which
   parameters are important (Explanation!)?

4. Now, assuming we have an 128-byte address space in a 256-byte physical memory.

   ```text
   ARG address space size 128
   ARG phys mem size 256

   Virtual Address Trace
   VA  0: 0x00000062 (decimal:   98) --> SEG?
   VA  1: 0x00000068 (decimal:  104) --> SEG?
   VA  2: 0x00000057 (decimal:   87) --> SEG?
   VA  3: 0x00000029 (decimal:   41) --> SEG?
   VA  4: 0x00000020 (decimal:   32) --> SEG?
   ```

   Can you compute whether an address is in segment 0 or 1? How (Explanation)?

5. For each virtual address, either write down the physical address (hex and
   decimal) it translates to OR write down that it is an out-of-bounds address
   (a segmentation violation). For this problem, you should assume a simple
   address space with two segments: the top bit of the virtual address can thus
   be used to check whether the virtual address is in segment 0 (topbit=0) or
   segment 1 (topbit=1). Note that the base/limit pairs given to you grow in
   different directions, depending on the segment, i.e., segment 0 grows in the
   positive direction, whereas segment 1 in the negative.

    ```text
    ARG address space size 512
    ARG phys mem size 16k

    Segment register information:

    Segment 0 base  (grows positive) : 0x0000011f (decimal 287)
    Segment 0 limit                  : 128

    Segment 1 base  (grows negative) : 0x00000800 (decimal 2048)
    Segment 1 limit                  : 256

    Virtual Address Trace
    VA  0: 0x00000068 (decimal:  104) --> PA or segmentation violation?
    VA  1: 0x000001d8 (decimal:  472) --> PA or segmentation violation?
    VA  2: 0x000000c0 (decimal:  192) --> PA or segmentation violation?
    VA  3: 0x000001a9 (decimal:  425) --> PA or segmentation violation?
    VA  4: 0x000000e3 (decimal:  227) --> PA or segmentation violation?
    VA  5: 0x00000002 (decimal:    2) --> PA or segmentation violation?
    VA  6: 0x000000e7 (decimal:  231) --> PA or segmentation violation?
    VA  7: 0x00000192 (decimal:  402) --> PA or segmentation violation?
    VA  8: 0x000000da (decimal:  218) --> PA or segmentation violation?
    VA  9: 0x0000014d (decimal:  333) --> PA or segmentation violation?
    VA 10: 0x0000012a (decimal:  298) --> PA or segmentation violation?
    VA 11: 0x00000018 (decimal:   24) --> PA or segmentation violation?
    VA 12: 0x00000187 (decimal:  391) --> PA or segmentation violation?
    VA 13: 0x000000e4 (decimal:  228) --> PA or segmentation violation?
    VA 14: 0x0000019c (decimal:  412) --> PA or segmentation violation?
    ```

   How did you solve this question?

6. Assuming we have a 128-byte virtual address space in a 512-byte physical address space as shown below.

    ```text
    ------------ virtual address 0                  ------------ 0
    |          |                                    |          |
    |----------| 64                                 |          |
    |   seg0   |                                    |          |
    |----------| 87                                 |----------| 343
    |          |                                    |   seg0   |
    |          |                                    |----------|
    |          |                                    |          |
    |          |                                    |----------| 412
    |          |                                    |   seg1   |
    |----------| 120                                |----------|
    |   seg1   |                                    |          |
    |----------| 128 virtual address max            |----------| 512 physical address max
    ```

    Compute for the following virtual addresses the physical address.

    ```text
    Virtual Address Trace
    VA  0: 0x00000049 (decimal: 73)  --> PA?
    VA  1: 0x00000051 (decimal: 81)  --> PA?
    VA  2: 0x0000007E (decimal: 107) --> PA?
    VA  3: 0x0000007B (decimal: 123) --> PA?
    ```
