-- Author: Peter Crinklaw

--Main component, takes the phase increments and generates 16 bit waveform

--TODO: generate for processes, make saws work, extract oscillator component

library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use work.SynthesizerPackage.all;

entity Synthesizer is

port (
	-- system signals
	clk         : in  std_logic;
	reset_n       : in  std_logic;
  
	-- Frequency control
	--Bottom 16 bits are for first oscillator, next 16 are for second, next 16 are for third
	phase_increments   	: in  PHASE_INCS;
	
	-- Envelope control
	start_note_n		: in ARRAY_0TO7;
	end_note_n			: in ARRAY_0TO7;

	wave_shapes			: in std_logic_vector(7 downto 0);
	
	waveSum				: out std_logic_vector(15 downto 0)
  );
end entity;




architecture rtl of Synthesizer is


constant SIN : std_logic_vector(1 downto 0) := "01";
constant SQU : std_logic_vector(1 downto 0) := "10";
constant SAW : std_logic_vector(1 downto 0) := "11";


signal oscillator0_phase_inc : WAVE_ARRAY;
signal oscillator1_phase_inc : WAVE_ARRAY;
signal oscillator2_phase_inc : WAVE_ARRAY;

signal oscillator0_output : ADDRESS_REGS;
signal oscillator1_output : ADDRESS_REGS;
signal oscillator2_output : ADDRESS_REGS;


signal oscillator0_sines : WAVE_ARRAY;
signal oscillator0_squares : WAVE_ARRAY;
signal oscillator0_saws : WAVE_ARRAY;

signal oscillator1_sines : WAVE_ARRAY;
signal oscillator1_squares : WAVE_ARRAY;
signal oscillator1_saws : WAVE_ARRAY;

signal oscillator2_sines : WAVE_ARRAY;
signal oscillator2_squares : WAVE_ARRAY;
signal oscillator2_saws : WAVE_ARRAY;



signal oscillator0_wave : WAVE_ARRAY;
signal oscillator1_wave : WAVE_ARRAY;
signal oscillator2_wave : WAVE_ARRAY;


signal voices : WAVE_ARRAY;

component SinLut is
port (
	clk      : in  std_logic;
	--en       : in  std_logic;
	
	--Address input
	addrs0     : in ADDRESS_REGS;
	addrs1     : in ADDRESS_REGS;
	addrs2     : in ADDRESS_REGS;
	
	--Sine output
	waves0  : out WAVE_ARRAY;
	waves1  : out WAVE_ARRAY;
	waves2  : out WAVE_ARRAY
	);
end component;

component AddressIncrementor is
port (
  -- system signals
  clk         	: in  std_logic;
  reset_n       : in  std_logic;
  
  -- NCO frequency control
  phase_inc   	: in  std_logic_vector(15 downto 0);

  -- Output waveforms
  lut_address	: out std_logic_vector(11 downto 0)
  );
end component;





begin

	l1: for i in 0 to 7 generate
		voices(i) <= std_logic_vector(unsigned(oscillator0_wave(i)) + 
								unsigned(oscillator1_wave(i)) + 
								unsigned(oscillator2_wave(i)) );
	end generate;
	
	waveSum <= std_logic_vector(unsigned(voices(0)) +
								unsigned(voices(1)) +
								unsigned(voices(2)) +
								unsigned(voices(3)) +
								unsigned(voices(4)) +
								unsigned(voices(5)) +
								unsigned(voices(6)) +
								unsigned(voices(7)));				
				

	---------------------------------------------------------
	-- Get sin output for each oscillator from lookup table
	---------------------------------------------------------

	sin_lut: SinLut
		port map(
			clk => clk,
			addrs0 => oscillator0_output,
			addrs1 => oscillator1_output,
			addrs2 => oscillator2_output,
			waves0 => oscillator0_sines,
			waves1 => oscillator1_sines,
			waves2 => oscillator2_sines
		);

	---------------------------------------------
	-- Square output is msb of the accumulator --
	---------------------------------------------
	l2: for i in 0 to 7 generate
		oscillator0_squares(i) <= "0011111111111111" when oscillator0_output(i)(11) = '1' else "1100000000000000";
		oscillator1_squares(i) <= "0011111111111111" when oscillator1_output(i)(11) = '1' else "1100000000000000";
		oscillator2_squares(i) <= "0011111111111111" when oscillator2_output(i)(11) = '1' else "1100000000000000";
	end generate;
	
	
	-------------------------------------------------------
	-- Sawtooth output is top 16-bits of the accumulator --
	-------------------------------------------------------
	l3: for i in 0 to 7 generate
		oscillator0_saws(i) <= oscillator0_output(i) & "0000";
		oscillator1_saws(i) <= oscillator1_output(i) & "0000";
		oscillator2_saws(i) <= oscillator2_output(i) & "0000";
	end generate;
	
	
	


	l4: for i in 0 to 7 generate
		o0: AddressIncrementor
		port map
		(
		clk => clk,
		reset_n => reset_n,
		phase_inc => oscillator0_phase_inc(i),
		lut_address => oscillator0_output(i)
		);

		o1: AddressIncrementor
		port map
		(
		clk => clk,
		reset_n => reset_n,
		phase_inc => oscillator1_phase_inc(i),
		lut_address => oscillator1_output(i)
		);
  
		o2: AddressIncrementor
		port map
		(
		clk => clk,
		reset_n => reset_n,
		phase_inc => oscillator2_phase_inc(i),
		lut_address => oscillator2_output(i)
		);
	end generate;	
	
	
get_output: process(clk, reset_n)
begin
  if reset_n = '0' then
		for i in 0 to 7 loop
			oscillator0_wave(i) <= (others => '0');
			oscillator1_wave(i) <= (others => '0');
			oscillator2_wave(i) <= (others => '0');
		end loop;

  elsif clk'event and clk = '0' then
		for i in 0 to 7 loop
			case wave_shapes(1 downto 0) is
				when SIN =>		oscillator0_wave(i) <= oscillator0_sines(i);
				when SQU =>		oscillator0_wave(i) <= oscillator0_squares(i);
				when SAW =>		oscillator0_wave(i) <= oscillator0_saws(i);
				when others =>  oscillator0_wave(i) <= x"0000";
			end case;
			case wave_shapes(3 downto 2) is
				when SIN =>		oscillator1_wave(i) <= oscillator1_sines(i);
				when SQU =>		oscillator1_wave(i) <= oscillator1_squares(i);
				when SAW =>		oscillator1_wave(i) <= oscillator1_saws(i);
				when others =>  oscillator1_wave(i) <= x"0000";
			end case;
			case wave_shapes(5 downto 4) is
				when SIN =>		oscillator2_wave(i) <= oscillator2_sines(i);
				when SQU =>		oscillator2_wave(i) <= oscillator2_squares(i);
				when SAW =>		oscillator2_wave(i) <= oscillator2_saws(i);
				when others =>  oscillator2_wave(i) <= x"0000";
			end case;
		end loop;
  end if;
end process get_output;





	update_phase_increments0: process(start_note_n(0))
	begin
		if start_note_n(0) = '0' then
			oscillator0_phase_inc(0) <= phase_increments(0)(15 downto 0);
			oscillator1_phase_inc(0) <= phase_increments(0)(31 downto 16);
			oscillator2_phase_inc(0) <= phase_increments(0)(47 downto 32);
		end if;
	end process update_phase_increments0;
	
	update_phase_increments1: process(start_note_n(1))
	begin
		if start_note_n(1) = '0' then
			oscillator0_phase_inc(1) <= phase_increments(1)(15 downto 0);
			oscillator1_phase_inc(1) <= phase_increments(1)(31 downto 16);
			oscillator2_phase_inc(1) <= phase_increments(1)(47 downto 32);
		end if;
	end process update_phase_increments1;

	update_phase_increments2: process(start_note_n(2))
	begin
		if start_note_n(2) = '0' then
			oscillator0_phase_inc(2) <= phase_increments(2)(15 downto 0);
			oscillator1_phase_inc(2) <= phase_increments(2)(31 downto 16);
			oscillator2_phase_inc(2) <= phase_increments(2)(47 downto 32);
		end if;
	end process update_phase_increments2;
	
	update_phase_increments3: process(start_note_n(3))
	begin
		if start_note_n(3) = '0' then
			oscillator0_phase_inc(3) <= phase_increments(3)(15 downto 0);
			oscillator1_phase_inc(3) <= phase_increments(3)(31 downto 16);
			oscillator2_phase_inc(3) <= phase_increments(3)(47 downto 32);
		end if;
	end process update_phase_increments3;
	
	update_phase_increments4: process(start_note_n(4))
	begin
		if start_note_n(4) = '0' then
			oscillator0_phase_inc(4) <= phase_increments(4)(15 downto 0);
			oscillator1_phase_inc(4) <= phase_increments(4)(31 downto 16);
			oscillator2_phase_inc(4) <= phase_increments(4)(47 downto 32);
		end if;
	end process update_phase_increments4;

	update_phase_increments5: process(start_note_n(5))
	begin
		if start_note_n(5) = '0' then
			oscillator0_phase_inc(5) <= phase_increments(5)(15 downto 0);
			oscillator1_phase_inc(5) <= phase_increments(5)(31 downto 16);
			oscillator2_phase_inc(5) <= phase_increments(5)(47 downto 32);
		end if;
	end process update_phase_increments5;
	
	update_phase_increments6: process(start_note_n(6))
	begin
		if start_note_n(6) = '0' then
			oscillator0_phase_inc(6) <= phase_increments(6)(15 downto 0);
			oscillator1_phase_inc(6) <= phase_increments(6)(31 downto 16);
			oscillator2_phase_inc(6) <= phase_increments(6)(47 downto 32);
		end if;
	end process update_phase_increments6;
	
	update_phase_increments7: process(start_note_n(7))
	begin
		if start_note_n(7) = '0' then
			oscillator0_phase_inc(7) <= phase_increments(7)(15 downto 0);
			oscillator1_phase_inc(7) <= phase_increments(7)(31 downto 16);
			oscillator2_phase_inc(7) <= phase_increments(7)(47 downto 32);
		end if;
	end process update_phase_increments7;
end rtl;