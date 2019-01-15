![logo](https://raw.githubusercontent.com/signalius/FPGA_Verilog_Examples/master/www/logo.png)

## Most important Verilog guidelines
* Guideline #1: When modeling sequential logic use nonblocking assignments. 
* Guideline #2: When modeling latches use nonblocking assignments
* Guideline #3: When modeling combinational logic with an always block, use blocking assignments
* Guideline #4: When modeling both sequential and combinational logic within the same always block, use nonblocking assignments
* Guideline #5: Do not mix blocking and nonblocking assignments in the same always block
* Guideline #6: Do not make assignments to the same variable from more than one always block
![source](http://www.sunburst-design.com/papers/CummingsSNUG2000SJ_NBA.pdf)

What is combinational logic?
```
Combinational logic uses only the present inputs to determine the output 
Combinational logic is used to implement basic boolean operations 
```

What is sequential logic?
```
Sequential logic uses both present inputs and previous outputs to determine the current input
Sequential logic is used to create memory elements
Sequential logic uses the feedbacks from the output to inputs
```

## 7 segment led display
* Simplest 7 segment led display [example](https://github.com/signalius/FPGA_Verilog_Examples/tree/master/Example_7seg_led_display) [SystemVerilog]
* PmodSSD drive - double 7 segment led display [example](https://github.com/signalius/FPGA_Verilog_Examples/tree/master/Example_7seg_led_display_PmodSSD) [SystemVerilog]

