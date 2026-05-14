# To clear provious Settings
clear -all

# Initialize coverage collection through -init enables all the coverage categories through type all - Coverage APP (which enables code and functional coverage)
check_cov -init -type all -model {statement branch expression toggle functional}

# Analyze RTL + Assertions (compilation)
analyze -sv12 fifo_rtl.v fifo_properties.sv

# Elaborate DUT (TOP MUST BE fifo)(synthesis and design hierarchy)
elaborate -top fifo -create_related_covers {precondition witness}

# Define clock and reset - Setup CLOCK and RESET
clock clk
reset !rst_n

# Prove all properties
prove -all -with_ppd -save_ppd -orchestration on

# Measure coverage - displays the summary of the coverage
check_cov -measure
