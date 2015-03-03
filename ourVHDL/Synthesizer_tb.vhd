-- Author : Peter Crinklaw

-- Testbench for Synthesizer.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
use work.SynthesizerPackage.all;

-- entity declaration for your testbench.Dont declare any ports here
ENTITY Synthesizer_tb IS
  
END Synthesizer_tb;

ARCHITECTURE behavior OF Synthesizer_tb IS
    -- Clock period definitions
	constant clk_period : time := 10 ns;
   
	signal clk 					: std_logic;
	signal reset_n       		: std_logic;
	signal phase_increments   	: PHASE_INCS;
	signal start_note_n			: ARRAY_0TO7;
	signal end_note_n			: ARRAY_0TO7;
	signal wave_shapes			: std_logic_vector(7 downto 0);
	signal waveSum				: std_logic_vector(15 downto 0);
   
component Synthesizer is
port (
	-- system signals
	clk         		: in  std_logic;
	reset_n       		: in  std_logic;
  
	-- Frequency control
	--Bottom 16 bits are for first oscillator, next 16 are for second, next 16 are for third
	phase_increments   	: in  PHASE_INCS;
	
	-- Envelope control
	start_note_n		: in ARRAY_0TO7;
	end_note_n			: in ARRAY_0TO7;

	wave_shapes			: in std_logic_vector(7 downto 0);
	
	waveSum				: out std_logic_vector(15 downto 0)
  );
end component;
   
BEGIN

v: Synthesizer
	port map(
		clk => clk,
		reset_n => reset_n,
		phase_increments => phase_increments,
		start_note_n => start_note_n,
		end_note_n => end_note_n,
		wave_shapes => wave_shapes,
		waveSum => waveSum
	);
   
	reset_n <= '1';	
	wave_shapes <= "00111001";

   -- Stimulus process
	stim_proc: process
	begin        
        wait for 40 ns;
		
		l1: for i in 0 to 7 loop
			phase_increments(i) <= x"0000000000000000";
			start_note_n(i) <= '1';
			end_note_n(i) <= '1';
		end loop;
		
        wait for 100 ns;
		
		
		phase_increments(0) <= x"0000" & x"0100" & x"0010" & x"0001";
		start_note_n(0) <= '0';
		
		wait for 10 ns;
		
		start_note_n(0) <= '1';

        wait;
  end process;
  
  
     -- Clock process definitions( clock with 50% duty cycle is generated here.
   clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;  --for 0.5 ns signal is '0'.
        clk <= '1';
        wait for clk_period/2;  --for next 0.5 ns signal is '1'.
   end process;

END;