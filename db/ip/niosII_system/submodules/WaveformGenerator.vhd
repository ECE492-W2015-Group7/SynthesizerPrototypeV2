-- Original Author	: Bharathwaj Muthuswamy
-- Additional Author : Peter Crinklaw
-- Based on version by	: Eric Lunty, Kyle Brooks, Peter Roland
-- http://www.ece.ualberta.ca/~elliott/ece492/appnotes/2012w/Audio_Codec_G2/waveform_gen.vhd

library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.WaveformGeneratorPackage.all;

entity WaveformGenerator is

port (

	-- system signals
	csi_clk50		: in  std_logic;
	csi_clk12		: in  std_logic;
	reset_n		: in  std_logic;
  
  
	-- Frequency control
	avs_writedata_phase_increments_voice0   : in  std_logic_vector(63 downto 0);
	avs_write_n_phase_increments_voice0   	: in  std_logic;
	
	avs_writedata_phase_increments_voice1   : in  std_logic_vector(63 downto 0);
	avs_write_n_phase_increments_voice1 	: in  std_logic;
	
	avs_writedata_phase_increments_voice2   : in  std_logic_vector(63 downto 0);
	avs_write_n_phase_increments_voice2 	: in  std_logic;
	
	avs_writedata_phase_increments_voice3   : in  std_logic_vector(63 downto 0);
	avs_write_n_phase_increments_voice3 	: in  std_logic;
	
	avs_writedata_phase_increments_voice4   : in  std_logic_vector(63 downto 0);
	avs_write_n_phase_increments_voice4 	: in  std_logic;
	
	avs_writedata_phase_increments_voice5   : in  std_logic_vector(63 downto 0);
	avs_write_n_phase_increments_voice5 	: in  std_logic;
	
	avs_writedata_phase_increments_voice6   : in  std_logic_vector(63 downto 0);
	avs_write_n_phase_increments_voice6 	: in  std_logic;
	
	avs_writedata_phase_increments_voice7   : in  std_logic_vector(63 downto 0);
	avs_write_n_phase_increments_voice7 	: in  std_logic;
	
	
	--note end signals
	--writedata is not read, only included to satisfy avalon mm interface
	avs_writedata_note_end_voice0   : in  std_logic_vector(7 downto 0);
	avs_write_n_note_end_voice0   	: in  std_logic;
	
	avs_writedata_note_end_voice1   : in  std_logic_vector(7 downto 0);
	avs_write_n_note_end_voice1   	: in  std_logic;
	
	avs_writedata_note_end_voice2   : in  std_logic_vector(7 downto 0);
	avs_write_n_note_end_voice2   	: in  std_logic;

	avs_writedata_note_end_voice3   : in  std_logic_vector(7 downto 0);
	avs_write_n_note_end_voice3   	: in  std_logic;
	
	avs_writedata_note_end_voice4   : in  std_logic_vector(7 downto 0);
	avs_write_n_note_end_voice4   	: in  std_logic;
	
	avs_writedata_note_end_voice5   : in  std_logic_vector(7 downto 0);
	avs_write_n_note_end_voice5   	: in  std_logic;

	avs_writedata_note_end_voice6   : in  std_logic_vector(7 downto 0);
	avs_write_n_note_end_voice6   	: in  std_logic;
	
	avs_writedata_note_end_voice7   : in  std_logic_vector(7 downto 0);
	avs_write_n_note_end_voice7   	: in  std_logic;

	
	--wave shape selector, uniform across all voices
	avs_writedata_wave_shapes 		: in std_logic_vector(7 downto 0);
	avs_write_n_wave_shapes 		: in std_logic;		
	
	aso_data_waveform_left		: out std_logic_vector(15 downto 0);
	aso_valid_waveform_left		: out std_logic;
	aso_ready_waveform_left		: in std_logic;
	
	aso_data_waveform_right		: out std_logic_vector(15 downto 0);
	aso_valid_waveform_right	: out std_logic;
	aso_ready_waveform_right	: in std_logic
  );
end entity;


architecture rtl of WaveformGenerator is


component VoiceGenerator is
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
end component;



signal phase_increments   	: PHASE_INCS;

-- Envelope control
signal start_note_n			: ARRAY_0TO7;
signal end_note_n			: ARRAY_0TO7;

signal wave_shapes_s		: std_logic_vector(7 downto 0);

signal waveSum				: std_logic_vector(15 downto 0);

begin
	
aso_valid_waveform_left <= '1';
aso_valid_waveform_right <= '1';

aso_data_waveform_left <= waveSum;
aso_data_waveform_right <= waveSum;



phase_increments(0) <= avs_writedata_phase_increments_voice0;
phase_increments(1) <= avs_writedata_phase_increments_voice1;
phase_increments(2) <= avs_writedata_phase_increments_voice2;
phase_increments(3) <= avs_writedata_phase_increments_voice3;
phase_increments(4) <= avs_writedata_phase_increments_voice4;
phase_increments(5) <= avs_writedata_phase_increments_voice5;
phase_increments(6) <= avs_writedata_phase_increments_voice6;
phase_increments(7) <= avs_writedata_phase_increments_voice7;

start_note_n(0) <= avs_write_n_phase_increments_voice0;
start_note_n(1) <= avs_write_n_phase_increments_voice1;
start_note_n(2) <= avs_write_n_phase_increments_voice2;
start_note_n(3) <= avs_write_n_phase_increments_voice3;
start_note_n(4) <= avs_write_n_phase_increments_voice4;
start_note_n(5) <= avs_write_n_phase_increments_voice5;
start_note_n(6) <= avs_write_n_phase_increments_voice6;
start_note_n(7) <= avs_write_n_phase_increments_voice7;

end_note_n(0) <= avs_write_n_note_end_voice0;
end_note_n(1) <= avs_write_n_note_end_voice1;
end_note_n(2) <= avs_write_n_note_end_voice2;
end_note_n(3) <= avs_write_n_note_end_voice3;
end_note_n(4) <= avs_write_n_note_end_voice4;
end_note_n(5) <= avs_write_n_note_end_voice5;
end_note_n(6) <= avs_write_n_note_end_voice6;
end_note_n(7) <= avs_write_n_note_end_voice7;


v: VoiceGenerator
	port map(
		clk => csi_clk12,
		reset_n => reset_n,
		phase_increments => phase_increments,
		start_note_n => start_note_n,
		end_note_n => end_note_n,
		wave_shapes => wave_shapes_s,
		waveSum => waveSum
	);
	
	
	
	
getWaveShapes: process(avs_write_n_wave_shapes, reset_n) is
begin
	if reset_n = '0' then
		wave_shapes_s <= x"00";
	elsif falling_edge(avs_write_n_wave_shapes) then
		wave_shapes_s <= avs_writedata_wave_shapes;
	end if;
end process;

end rtl;