
## Project Overview

This project simulates a **Synchronous FIFO (First-In-First-Out)** buffer designed in Verilog. The design and simulation are carried out using **Xilinx Vivado 2023.2**. The FIFO is a key element in digital systems to buffer data between two components running at the same clock rate.

### Features
- **FIFO Type**: Synchronous FIFO (single clock domain).
- **FIFO Depth**: Configurable via parameter.
- **Data Width**: Configurable via parameter.
- **Control Signals**: `empty`, `full`, `read_en`, `write_en`.

---

## Design Files

- **`fifo.v`**: The Verilog implementation of the FIFO.
- **`fifo_tb.v`**: The Verilog testbench to validate the FIFO operation.
- **`constraints.xdc`**: Constraints file (optional for hardware implementation).

---

## FIFO Design Overview

The FIFO is implemented using registers (flip-flops) and includes control logic to manage reading and writing operations.

### Key Signals:
- **Inputs**: 
  - `clk`: Clock signal.
  - `reset_n`: Active-low reset.
  - `write_en`: Write enable.
  - `read_en`: Read enable.
  - `data_in`: Data input.
- **Outputs**: 
  - `data_out`: Data output.
  - `full`: Indicates when FIFO is full.
  - `empty`: Indicates when FIFO is empty.
  

---

## Testbench Description

The **`fifo_tb.v`** file tests the FIFO functionality through various scenarios:
- Writing data into the FIFO.
- Reading data from the FIFO.
- Checking `full` and `empty` conditions.
- Simulating overflow and underflow cases.

### Test Cases:
1. **Reset Condition**: Verify FIFO is empty after reset.
2. **Write Operation**: Fill the FIFO with data and check for the `full` signal.
3. **Read Operation**: Read data from FIFO and check for the `empty` signal.
4. **Overflow**: Attempt to write when the FIFO is full.
5. **Underflow**: Attempt to read when the FIFO is empty.

---

## Simulation Steps

### 1. Setup Project in Vivado:
   - Open **Xilinx Vivado 2023.2** and create a new project.
   - Add the design (`fifo.v`) and testbench (`fifo_tb.v`) files to the project.

### 2. Run Behavioral Simulation:
   - Set `fifo_tb.v` as the top module.
   - Click on **Run Simulation** > **Run Behavioral Simulation**.
   
### 3. Analyze Waveforms:
   - Use the Vivado waveform viewer to verify signal transitions (`full`, `empty`, `data_in`, `data_out`, etc.).
   - Check the correct operation of the FIFO in both normal and edge cases (overflow/underflow).

---


## Conclusion

This project provides a basic simulation of a Synchronous FIFO buffer. By following the steps, you can simulate, analyze, and verify the correct operation of the FIFO using Xilinx Vivado 2023.2.

### Future Work
- Implement an **asynchronous FIFO** for cross-clock domain communication.
- Add more advanced features like `almost_full` and `almost_empty` signals.
