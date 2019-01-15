![logo](https://raw.githubusercontent.com/signalius/FPGA_Verilog_Examples/master/www/logo.png)

## Two most important Verilog guideline
* Guideline #1: When modeling sequential logic, use nonblocking assignments. 
* Guideline #2: When modeling latches, use nonblocking assignments

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

