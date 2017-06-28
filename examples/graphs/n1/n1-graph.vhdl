-- Nodes: 15 - Edges: 21
-- File generated automatically
LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY work;

ENTITY Graph IS
	PORT (
		CLK	: IN	std_logic;
		RST	: IN	std_logic;
		EN	: IN	std_logic_vector(14 downto 0);
		DIN	: IN	std_logic_vector(14 downto 0);
		DOUT	: OUT	std_logic_vector(14 downto 0));
END Graph;

ARCHITECTURE Graph_circuit OF Graph IS

	COMPONENT ffd IS
		PORT (
			CLK	: IN	std_logic;
			RST	: IN	std_logic;
			EN	: IN	std_logic;
			D	: IN	std_logic;
			Q	: OUT	std_logic
		);
	END COMPONENT;

	SIGNAL data_in  : STD_LOGIC_VECTOR(14 downto 0);
	SIGNAL data_out : STD_LOGIC_VECTOR(14 downto 0);

BEGIN

	-- Registers
	REG_v00 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(0),
		D	=>	data_in(0),
		Q	=>	data_out(0));
	REG_v01 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(1),
		D	=>	data_in(1),
		Q	=>	data_out(1));
	REG_v02 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(2),
		D	=>	data_in(2),
		Q	=>	data_out(2));
	REG_v03 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(3),
		D	=>	data_in(3),
		Q	=>	data_out(3));
	REG_v04 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(4),
		D	=>	data_in(4),
		Q	=>	data_out(4));
	REG_v05 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(5),
		D	=>	data_in(5),
		Q	=>	data_out(5));
	REG_v06 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(6),
		D	=>	data_in(6),
		Q	=>	data_out(6));
	REG_v07 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(7),
		D	=>	data_in(7),
		Q	=>	data_out(7));
	REG_v08 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(8),
		D	=>	data_in(8),
		Q	=>	data_out(8));
	REG_v09 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(9),
		D	=>	data_in(9),
		Q	=>	data_out(9));
	REG_v10 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(10),
		D	=>	data_in(10),
		Q	=>	data_out(10));
	REG_v11 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(11),
		D	=>	data_in(11),
		Q	=>	data_out(11));
	REG_v12 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(12),
		D	=>	data_in(12),
		Q	=>	data_out(12));
	REG_v13 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(13),
		D	=>	data_in(13),
		Q	=>	data_out(13));
	REG_v14 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(14),
		D	=>	data_in(14),
		Q	=>	data_out(14));

	-- Wire connections: inputs
	data_in(0) <=	DIN(0)
			OR data_out(1)
			OR data_out(2)
			OR data_out(3);
	data_in(1) <=	DIN(1)
			OR data_out(0)
			OR data_out(4)
			OR data_out(5);
	data_in(2) <=	DIN(2)
			OR data_out(0)
			OR data_out(5)
			OR data_out(6);
	data_in(3) <=	DIN(3)
			OR data_out(0)
			OR data_out(6)
			OR data_out(7);
	data_in(4) <=	DIN(4)
			OR data_out(1)
			OR data_out(8);
	data_in(5) <=	DIN(5)
			OR data_out(1)
			OR data_out(2)
			OR data_out(8)
			OR data_out(9);
	data_in(6) <=	DIN(6)
			OR data_out(2)
			OR data_out(3)
			OR data_out(9)
			OR data_out(10);
	data_in(7) <=	DIN(7)
			OR data_out(3)
			OR data_out(10);
	data_in(8) <=	DIN(8)
			OR data_out(4)
			OR data_out(5)
			OR data_out(11);
	data_in(9) <=	DIN(9)
			OR data_out(5)
			OR data_out(6)
			OR data_out(12);
	data_in(10) <=	DIN(10)
			OR data_out(6)
			OR data_out(7)
			OR data_out(13);
	data_in(11) <=	DIN(11)
			OR data_out(8)
			OR data_out(12);
	data_in(12) <=	DIN(12)
			OR data_out(9)
			OR data_out(11)
			OR data_out(14)
			OR data_out(13);
	data_in(13) <=	DIN(13)
			OR data_out(10)
			OR data_out(12);
	data_in(14) <=	DIN(14)
			OR data_out(12);

	-- Wire connections: outputs
	DOUT(14) <= data_out(14);
	DOUT(13) <= data_out(13);
	DOUT(12) <= data_out(12);
	DOUT(11) <= data_out(11);
	DOUT(10) <= data_out(10);
	DOUT(9) <= data_out(9);
	DOUT(8) <= data_out(8);
	DOUT(7) <= data_out(7);
	DOUT(6) <= data_out(6);
	DOUT(5) <= data_out(5);
	DOUT(4) <= data_out(4);
	DOUT(3) <= data_out(3);
	DOUT(2) <= data_out(2);
	DOUT(1) <= data_out(1);
	DOUT(0) <= data_out(0);

END Graph_circuit;