module failsafe (

    input  SW0,
    input  SW1,
    input  SW2,
    input  SW3,

    input  SW4,       // ENTER
    input  SW5,       // RESET

    output LEDG0,     // LOCKED
    output LEDG1,     // AUTHENTICATING
    output LEDG2,     // OPEN
    output LEDG3      // ERROR
);

    // ------------------------------------------------
    // State definitions
    // ------------------------------------------------

    parameter LOCKED_STATE = 3'd0;
    parameter STEP1_STATE  = 3'd1;
    parameter STEP2_STATE  = 3'd2;
    parameter STEP3_STATE  = 3'd3;
    parameter OPEN_STATE   = 3'd4;
    parameter ERROR_STATE  = 3'd5;

    reg [2:0] state;

    // 4-bit switch input
    wire [3:0] password;

    assign password = {SW3, SW2, SW1, SW0};


    // ------------------------------------------------
    // FSM
    // SW4 is used as ENTER/clock
    // SW5 is RESET
    // ------------------------------------------------

    always @(posedge SW4 or posedge SW5) begin

        if (SW5) begin

            state <= LOCKED_STATE;

        end

        else begin

            case (state)

                // ------------------------------------
                // Waiting for first authentication
                // ------------------------------------

                LOCKED_STATE:
                begin
                    if (password == 4'b1011)
                        state <= STEP1_STATE;
                    else
                        state <= ERROR_STATE;
                end


                // ------------------------------------
                // Waiting for second authentication
                // ------------------------------------

                STEP1_STATE:
                begin
                    if (password == 4'b0110)
                        state <= STEP2_STATE;
                    else
                        state <= ERROR_STATE;
                end


                // ------------------------------------
                // Waiting for third authentication
                // ------------------------------------

                STEP2_STATE:
                begin
                    if (password == 4'b1101)
                        state <= STEP3_STATE;
                    else
                        state <= ERROR_STATE;
                end


                // ------------------------------------
                // Waiting for fourth authentication
                // ------------------------------------

                STEP3_STATE:
                begin
                    if (password == 4'b0011)
                        state <= OPEN_STATE;
                    else
                        state <= ERROR_STATE;
                end


                // ------------------------------------
                // Safe OPEN
                // ------------------------------------

                OPEN_STATE:
                begin
                    state <= OPEN_STATE;
                end


                // ------------------------------------
                // Incorrect sequence
                // ------------------------------------

                ERROR_STATE:
                begin
                    state <= LOCKED_STATE;
                end


                default:
                begin
                    state <= LOCKED_STATE;
                end

            endcase

        end

    end


    // ------------------------------------------------
    // LED outputs
    // ------------------------------------------------

    assign LEDG0 = (state == LOCKED_STATE);

    assign LEDG1 = (state == STEP1_STATE) ||
                   (state == STEP2_STATE) ||
                   (state == STEP3_STATE);

    assign LEDG2 = (state == OPEN_STATE);

    assign LEDG3 = (state == ERROR_STATE);

endmodule