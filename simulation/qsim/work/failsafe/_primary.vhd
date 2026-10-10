library verilog;
use verilog.vl_types.all;
entity failsafe is
    port(
        SW0             : in     vl_logic;
        SW1             : in     vl_logic;
        SW2             : in     vl_logic;
        SW3             : in     vl_logic;
        SW4             : in     vl_logic;
        SW5             : in     vl_logic;
        LEDG0           : out    vl_logic;
        LEDG1           : out    vl_logic;
        LEDG2           : out    vl_logic;
        LEDG3           : out    vl_logic
    );
end failsafe;
