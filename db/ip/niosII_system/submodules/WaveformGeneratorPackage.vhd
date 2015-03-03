library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package WaveformGeneratorPackage is
    type PHASE_INCS is array(0 to 7) of std_logic_vector (63 downto 0);
    type ARRAY_0TO7 is array(0 to 7) of std_logic;	
    type ADDRESS_REGS is array(0 to 7) of std_logic_vector (11 downto 0);	
    type WAVE_ARRAY is array(0 to 7) of std_logic_vector (15 downto 0);		
	type WAVE_ARRAY_LARGE is array (0 to 23) of std_logic_vector(15 downto 0);
end package WaveformGeneratorPackage;