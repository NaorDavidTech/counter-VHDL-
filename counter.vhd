library ieee;
use ieee.std_logic_1164.all;
entity counter is 
generic (n: integer range 1 to 16 := 4);
port(
		rst, ud, clk : std_logic;
		q : out std_logic_vector (n-1 downto 0));
end;
architecture moore of counter is
type sm is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9); --1 
signal ps: sm; --2

begin
	process (clk, rst)
	begin
	if rst = '1' then ps <= s0;
	elsif clk' event and clk = '1' then 

		case ps is
		when s0 => q <= "0000";
		if ud = '1' then ps <= s1; else ps <= s9; end if;
		when s1 => q <= "0001";
		if ud = '1' then ps <= s2; else ps <= s0; end if;
		when s2 => q <= "0010";
		if ud = '1' then ps <= s3; else ps <= s1; end if;
		when s3 => q <= "0011";
		if ud = '1' then ps <= s4; else ps <= s2; end if;
		when s4 => q <= "0100";
		if ud = '1' then ps <= s5; else ps <= s3; end if;
		when s5 => q <= "0101";
		if ud = '1' then ps <= s6; else ps <= s4; end if;
		when s6 => q <= "0110";
		if ud = '1' then ps <= s7; else ps <= s5; end if;
		when s7 => q <= "0111";
		if ud = '1' then ps <= s8; else ps <= s6; end if;
		when s8 => q <= "0100";
		if ud = '1' then ps <= s9; else ps <= s7; end if;
		when s9 => q <= "0101";
		if ud = '1' then ps <= s0; else ps <= s8; end if;

		end case;
	end if;
	end process;
end ;