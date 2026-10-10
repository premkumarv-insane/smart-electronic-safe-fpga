library verilog;
use verilog.vl_types.all;
entity failsafe_vlg_check_tst is
    port(
        LEDG0           : in     vl_logic;
        LEDG1           : in     vl_logic;
        LEDG2           : in     vl_logic;
        LEDG3           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end failsafe_vlg_check_tst;
