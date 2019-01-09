# Pmod-SSD
 Digilent Pmod SSD seven-segment display Verilog module. On the Arty S7 board, LED2 LED3 LED4 LED5 should flash. If the seven segment displays don't light up the module might be plugged in the wrong sockets. Use the top rows of the JC and JD socets.

Uncomment the lines corresponding to these signals in the constraints (.xcd) file for your board. Different boards use different pins so the file must be the exact one for the board you are using.

* **Clock signal**
  * CLK12MHZ (Both the *set_* and *create_* lines)

* **LEDs**
  * led[0]
  * led[1]
  * led[2]
  * led[3]

* **PMOD Header JC**
  * jc[0]
  * jc[1]
  * jc[2]
  * jc[3]

* **PMOD Header JD**
  * jd[0]
  * jd[1]
  * jd[2]
  * jd[3]


 * https://reference.digilentinc.com/reference/pmod/pmodssd/reference-manual
 * https://store.digilentinc.com/pmod-ssd-seven-segment-display/
 
