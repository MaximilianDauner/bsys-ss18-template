# Questions 4-Process-Run Simulation

This program, `process-run.py`, allows you to see how process states change as programs run and either use the CPU (e.g., perform an add instruction) or do I/O (e.g., send a request to a disk and wait for it to complete). See the README for details.

Please answer the questions, by giving the result and an **explanation**, why you got the result. Sometimes it could be helpful, if you compare your result with results of earlier questions. Write your answers in [markdown syntax][]  in the new file `ANSWERS.md.` Please use the *template_answers.md* as a template for your file. If you need to include console output of your simulations for your answers, please use the *template_answers_output.md* as an template for a new file **ANSWERS_OUTPUT.md**.

1. Run the program with the following flags:

    ```text
   ./process-run.py -l 5:100,5:100
    ```

    What should the CPU utilization be (e.g., the percent of time the CPU is in use?) Why do you know this? Use the `-c` and `-p` flags to see if you were right.

2. Now run with these flags:

    ```text
   ./process-run.py -l 7:100,2:0
    ```

    These flags specify one process with 7 instructions (all to use the CPU), and one that simply issues an I/O and waits for it to be done. How long does it take to complete both processes? Use `-c` and `-p` to find out if you were right.

3. Now switch the order of the processes:

    ```text
   ./process-run.py -l 2:0,7:100
    ```

    What happens now? Does switching the order matter? Why? (As always, use `-c` and `-p` to see if you were right)

4. We’ll now explore some of the other flags. One important flag is `-S`, which determines how the system reacts when a process issues an I/O. With the flag set to `SWITCH_ON_END`, the system will NOT switch to another process while one is doing I/O, instead waiting until the process is completely finished. What happens when you run the following two processes, one doing I/O and the other doing CPU work? (`-l 2:0,7:100 -c -S SWITCH_ON_END`)

5. Now, run the same processes, but with the switching behavior set to switch to another process whenever one is WAITING for I/O (`-l 2:0,7:100 -c -S SWITCH_ON_IO`). What happens now? Use `-c` and `-p` to confirm that you are right.

6. One  important behavior is what to do when an I/O completes. With `-I IO_RUN_LATER`, when an I/O completes, the process that issued it is not necessarily run right away; rather, whatever was running at the time keeps running. What happens when you run this combination of processes?

    ```text
   ./process-run.py -l 4:0,3:100,4:100,6:100 -L 4 -S SWITCH_ON_IO -I IO_RUN_LATER -c -p
    ```

   Are system resources being effectively utilized?

7. Now run the same processes, but with `-I IO_RUN_IMMEDIATE` set, which immediately runs the process that issued the I/O. How does this behavior differ? Why might running a process that just completed an I/O again be a good idea?

8. Now run with some randomly generated processes, e.g., `-s 1 -l 3:50,3:50, -s 2 -l 3:50,3:50, -s 3 -l 3:50,3:50`. See if you can predict how the trace will turn out. What happens when you use `-I IO_RUN_IMMEDIATE` vs. `-I IO_RUN_LATER`? What happens when you use `-S SWITCH_ON_IO` vs. `-S SWITCH_ON_END`?

9. Now take a look at the following stats.

    ```text
    Stats: Total Time 13
    Stats: CPU Busy 8 (61.54%)
    Stats: IO Busy  8 (61.54%)
    ```

    As you can see above, the trace takes 13 clock ticks to run, the CPU and IO device are each busy for 8 ticks.
    What are possible flags, with which the program ran?

10. Now take a look at a different result.

    ```text
    Stats: Total Time 31
    Stats: CPU Busy 5 (16.13%)
    Stats: IO Busy  25 (80.65%)
    ```
    As you can see, the CPU is only busy less than 20% of the time. On the other hand, the IO device, is quite busy. What are possible flags this time?


[markdown syntax]: https://guides.github.com/features/mastering-markdown/