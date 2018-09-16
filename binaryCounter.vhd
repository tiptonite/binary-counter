library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity binaryCounter is
	port(
			clk	:in	std_logic;
			led_out	:out	unsigned (9 downto 0);
			areset :in	std_logic
	
	
	);
	end binaryCounter;
	
	
architecture RTL of binaryCounter is
	signal count :integer:=1;
	signal divClk	:std_logic:='0';
	signal binary :unsigned( 9 downto 0);
	

	begin
	
	clockDivide : process(clk)
		begin
		
		if rising_edge(clk) then
			count <= count+1;
			
			if(count=25000000) then
			
				divClk<=NOT divClk;
				count<=1;
			end if;
			
		end if;
		
		
		end process clockDivide;
		
		
		
		
		
	binaryCount : process(divClk,binary,areset)
		begin
		
		if(areset='0')then
			binary <= (others => '0');
		
		
		
		
		
		elsif rising_edge(divClk) then
			binary<=binary+1;
			
			if(binary="1111111111") then
				binary<=(others => '0');
			end if;
		end if;
		
		
		end process binaryCount;
			
	
	
	
	
	led_out<=binary;
	
	
	
	
	end architecture RTL;