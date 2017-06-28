-- Nodes: 87 - Edges: 404
-- File generated automatically
LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY work;

ENTITY Graph IS
	PORT (
		CLK	: IN	std_logic;
		RST	: IN	std_logic;
		EN	: IN	std_logic_vector(86 downto 0);
		DIN	: IN	std_logic_vector(86 downto 0);
		DOUT	: OUT	std_logic_vector(86 downto 0));
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

	SIGNAL data_in  : STD_LOGIC_VECTOR(86 downto 0);
	SIGNAL data_out : STD_LOGIC_VECTOR(86 downto 0);

BEGIN

	-- Registers
	REG_000001 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(0),
		D	=>	data_in(0),
		Q	=>	data_out(0));
	REG_000002 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(1),
		D	=>	data_in(1),
		Q	=>	data_out(1));
	REG_000003 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(2),
		D	=>	data_in(2),
		Q	=>	data_out(2));
	REG_000004 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(3),
		D	=>	data_in(3),
		Q	=>	data_out(3));
	REG_000005 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(4),
		D	=>	data_in(4),
		Q	=>	data_out(4));
	REG_000006 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(5),
		D	=>	data_in(5),
		Q	=>	data_out(5));
	REG_000007 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(6),
		D	=>	data_in(6),
		Q	=>	data_out(6));
	REG_000008 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(7),
		D	=>	data_in(7),
		Q	=>	data_out(7));
	REG_000009 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(8),
		D	=>	data_in(8),
		Q	=>	data_out(8));
	REG_000010 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(9),
		D	=>	data_in(9),
		Q	=>	data_out(9));
	REG_000011 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(10),
		D	=>	data_in(10),
		Q	=>	data_out(10));
	REG_000012 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(11),
		D	=>	data_in(11),
		Q	=>	data_out(11));
	REG_000013 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(12),
		D	=>	data_in(12),
		Q	=>	data_out(12));
	REG_000014 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(13),
		D	=>	data_in(13),
		Q	=>	data_out(13));
	REG_000015 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(14),
		D	=>	data_in(14),
		Q	=>	data_out(14));
	REG_000016 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(15),
		D	=>	data_in(15),
		Q	=>	data_out(15));
	REG_000017 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(16),
		D	=>	data_in(16),
		Q	=>	data_out(16));
	REG_000018 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(17),
		D	=>	data_in(17),
		Q	=>	data_out(17));
	REG_000019 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(18),
		D	=>	data_in(18),
		Q	=>	data_out(18));
	REG_000020 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(19),
		D	=>	data_in(19),
		Q	=>	data_out(19));
	REG_000021 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(20),
		D	=>	data_in(20),
		Q	=>	data_out(20));
	REG_000022 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(21),
		D	=>	data_in(21),
		Q	=>	data_out(21));
	REG_000023 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(22),
		D	=>	data_in(22),
		Q	=>	data_out(22));
	REG_000024 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(23),
		D	=>	data_in(23),
		Q	=>	data_out(23));
	REG_000025 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(24),
		D	=>	data_in(24),
		Q	=>	data_out(24));
	REG_000026 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(25),
		D	=>	data_in(25),
		Q	=>	data_out(25));
	REG_000027 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(26),
		D	=>	data_in(26),
		Q	=>	data_out(26));
	REG_000028 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(27),
		D	=>	data_in(27),
		Q	=>	data_out(27));
	REG_000029 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(28),
		D	=>	data_in(28),
		Q	=>	data_out(28));
	REG_000030 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(29),
		D	=>	data_in(29),
		Q	=>	data_out(29));
	REG_000031 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(30),
		D	=>	data_in(30),
		Q	=>	data_out(30));
	REG_000032 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(31),
		D	=>	data_in(31),
		Q	=>	data_out(31));
	REG_000033 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(32),
		D	=>	data_in(32),
		Q	=>	data_out(32));
	REG_000034 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(33),
		D	=>	data_in(33),
		Q	=>	data_out(33));
	REG_000035 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(34),
		D	=>	data_in(34),
		Q	=>	data_out(34));
	REG_000036 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(35),
		D	=>	data_in(35),
		Q	=>	data_out(35));
	REG_000037 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(36),
		D	=>	data_in(36),
		Q	=>	data_out(36));
	REG_000038 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(37),
		D	=>	data_in(37),
		Q	=>	data_out(37));
	REG_000039 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(38),
		D	=>	data_in(38),
		Q	=>	data_out(38));
	REG_000040 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(39),
		D	=>	data_in(39),
		Q	=>	data_out(39));
	REG_000041 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(40),
		D	=>	data_in(40),
		Q	=>	data_out(40));
	REG_000042 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(41),
		D	=>	data_in(41),
		Q	=>	data_out(41));
	REG_000043 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(42),
		D	=>	data_in(42),
		Q	=>	data_out(42));
	REG_000044 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(43),
		D	=>	data_in(43),
		Q	=>	data_out(43));
	REG_000045 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(44),
		D	=>	data_in(44),
		Q	=>	data_out(44));
	REG_000046 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(45),
		D	=>	data_in(45),
		Q	=>	data_out(45));
	REG_000047 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(46),
		D	=>	data_in(46),
		Q	=>	data_out(46));
	REG_000048 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(47),
		D	=>	data_in(47),
		Q	=>	data_out(47));
	REG_000049 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(48),
		D	=>	data_in(48),
		Q	=>	data_out(48));
	REG_000050 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(49),
		D	=>	data_in(49),
		Q	=>	data_out(49));
	REG_000051 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(50),
		D	=>	data_in(50),
		Q	=>	data_out(50));
	REG_000052 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(51),
		D	=>	data_in(51),
		Q	=>	data_out(51));
	REG_000053 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(52),
		D	=>	data_in(52),
		Q	=>	data_out(52));
	REG_000054 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(53),
		D	=>	data_in(53),
		Q	=>	data_out(53));
	REG_000055 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(54),
		D	=>	data_in(54),
		Q	=>	data_out(54));
	REG_000056 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(55),
		D	=>	data_in(55),
		Q	=>	data_out(55));
	REG_000057 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(56),
		D	=>	data_in(56),
		Q	=>	data_out(56));
	REG_000058 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(57),
		D	=>	data_in(57),
		Q	=>	data_out(57));
	REG_000059 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(58),
		D	=>	data_in(58),
		Q	=>	data_out(58));
	REG_000060 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(59),
		D	=>	data_in(59),
		Q	=>	data_out(59));
	REG_000061 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(60),
		D	=>	data_in(60),
		Q	=>	data_out(60));
	REG_000062 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(61),
		D	=>	data_in(61),
		Q	=>	data_out(61));
	REG_000063 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(62),
		D	=>	data_in(62),
		Q	=>	data_out(62));
	REG_000064 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(63),
		D	=>	data_in(63),
		Q	=>	data_out(63));
	REG_000065 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(64),
		D	=>	data_in(64),
		Q	=>	data_out(64));
	REG_000066 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(65),
		D	=>	data_in(65),
		Q	=>	data_out(65));
	REG_000067 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(66),
		D	=>	data_in(66),
		Q	=>	data_out(66));
	REG_000068 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(67),
		D	=>	data_in(67),
		Q	=>	data_out(67));
	REG_000069 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(68),
		D	=>	data_in(68),
		Q	=>	data_out(68));
	REG_000070 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(69),
		D	=>	data_in(69),
		Q	=>	data_out(69));
	REG_000071 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(70),
		D	=>	data_in(70),
		Q	=>	data_out(70));
	REG_000072 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(71),
		D	=>	data_in(71),
		Q	=>	data_out(71));
	REG_000073 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(72),
		D	=>	data_in(72),
		Q	=>	data_out(72));
	REG_000074 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(73),
		D	=>	data_in(73),
		Q	=>	data_out(73));
	REG_000075 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(74),
		D	=>	data_in(74),
		Q	=>	data_out(74));
	REG_000076 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(75),
		D	=>	data_in(75),
		Q	=>	data_out(75));
	REG_000077 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(76),
		D	=>	data_in(76),
		Q	=>	data_out(76));
	REG_000078 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(77),
		D	=>	data_in(77),
		Q	=>	data_out(77));
	REG_000079 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(78),
		D	=>	data_in(78),
		Q	=>	data_out(78));
	REG_000080 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(79),
		D	=>	data_in(79),
		Q	=>	data_out(79));
	REG_000081 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(80),
		D	=>	data_in(80),
		Q	=>	data_out(80));
	REG_000082 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(81),
		D	=>	data_in(81),
		Q	=>	data_out(81));
	REG_000083 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(82),
		D	=>	data_in(82),
		Q	=>	data_out(82));
	REG_000084 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(83),
		D	=>	data_in(83),
		Q	=>	data_out(83));
	REG_000085 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(84),
		D	=>	data_in(84),
		Q	=>	data_out(84));
	REG_000086 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(85),
		D	=>	data_in(85),
		Q	=>	data_out(85));
	REG_000087 : ffd PORT MAP (
		CLK	=>	CLK,
		RST	=>	RST,
		EN	=>	EN(86),
		D	=>	data_in(86),
		Q	=>	data_out(86));

	-- Wire connections: inputs
	data_in(0) <=	DIN(0)
			OR data_out(50);
	data_in(1) <=	DIN(1)
			OR data_out(50);
	data_in(2) <=	DIN(2)
			OR data_out(48)
			OR data_out(73);
	data_in(3) <=	DIN(3)
			OR data_out(73)
			OR data_out(26);
	data_in(4) <=	DIN(4)
			OR data_out(31)
			OR data_out(62)
			OR data_out(45);
	data_in(5) <=	DIN(5)
			OR data_out(28)
			OR data_out(83);
	data_in(6) <=	DIN(6)
			OR data_out(50)
			OR data_out(12)
			OR data_out(15)
			OR data_out(56);
	data_in(7) <=	DIN(7)
			OR data_out(83);
	data_in(8) <=	DIN(8)
			OR data_out(56)
			OR data_out(73);
	data_in(9) <=	DIN(9)
			OR data_out(50);
	data_in(10) <=	DIN(10)
			OR data_out(32)
			OR data_out(80)
			OR data_out(37)
			OR data_out(12)
			OR data_out(50)
			OR data_out(15);
	data_in(11) <=	DIN(11)
			OR data_out(59)
			OR data_out(80)
			OR data_out(50);
	data_in(12) <=	DIN(12)
			OR data_out(24)
			OR data_out(20)
			OR data_out(6)
			OR data_out(75)
			OR data_out(27)
			OR data_out(76)
			OR data_out(10)
			OR data_out(73)
			OR data_out(15)
			OR data_out(56)
			OR data_out(80)
			OR data_out(67)
			OR data_out(71);
	data_in(13) <=	DIN(13)
			OR data_out(50)
			OR data_out(30);
	data_in(14) <=	DIN(14)
			OR data_out(66)
			OR data_out(83);
	data_in(15) <=	DIN(15)
			OR data_out(75)
			OR data_out(79)
			OR data_out(24)
			OR data_out(56)
			OR data_out(20)
			OR data_out(38)
			OR data_out(48)
			OR data_out(27)
			OR data_out(73)
			OR data_out(6)
			OR data_out(12)
			OR data_out(10)
			OR data_out(67)
			OR data_out(76)
			OR data_out(78);
	data_in(16) <=	DIN(16)
			OR data_out(60)
			OR data_out(40)
			OR data_out(83)
			OR data_out(70)
			OR data_out(67);
	data_in(17) <=	DIN(17)
			OR data_out(42)
			OR data_out(73)
			OR data_out(40)
			OR data_out(19);
	data_in(18) <=	DIN(18)
			OR data_out(78)
			OR data_out(57)
			OR data_out(59)
			OR data_out(80)
			OR data_out(45)
			OR data_out(29);
	data_in(19) <=	DIN(19)
			OR data_out(24)
			OR data_out(75)
			OR data_out(73)
			OR data_out(38)
			OR data_out(17)
			OR data_out(42);
	data_in(20) <=	DIN(20)
			OR data_out(12)
			OR data_out(15)
			OR data_out(73)
			OR data_out(24)
			OR data_out(48);
	data_in(21) <=	DIN(21)
			OR data_out(73);
	data_in(22) <=	DIN(22)
			OR data_out(58)
			OR data_out(36)
			OR data_out(67)
			OR data_out(56)
			OR data_out(73)
			OR data_out(85)
			OR data_out(80)
			OR data_out(59)
			OR data_out(31)
			OR data_out(76)
			OR data_out(60)
			OR data_out(78)
			OR data_out(84)
			OR data_out(52);
	data_in(23) <=	DIN(23)
			OR data_out(73);
	data_in(24) <=	DIN(24)
			OR data_out(12)
			OR data_out(19)
			OR data_out(64)
			OR data_out(72)
			OR data_out(38)
			OR data_out(26)
			OR data_out(75)
			OR data_out(47)
			OR data_out(76)
			OR data_out(15)
			OR data_out(39)
			OR data_out(32)
			OR data_out(46)
			OR data_out(71)
			OR data_out(54)
			OR data_out(77)
			OR data_out(52)
			OR data_out(36)
			OR data_out(73)
			OR data_out(86)
			OR data_out(20)
			OR data_out(81);
	data_in(25) <=	DIN(25)
			OR data_out(86)
			OR data_out(85)
			OR data_out(56)
			OR data_out(72)
			OR data_out(64)
			OR data_out(36)
			OR data_out(83)
			OR data_out(38);
	data_in(26) <=	DIN(26)
			OR data_out(24)
			OR data_out(69)
			OR data_out(73)
			OR data_out(3)
			OR data_out(64)
			OR data_out(72)
			OR data_out(70)
			OR data_out(79)
			OR data_out(76)
			OR data_out(46);
	data_in(27) <=	DIN(27)
			OR data_out(73)
			OR data_out(12)
			OR data_out(15)
			OR data_out(35)
			OR data_out(65);
	data_in(28) <=	DIN(28)
			OR data_out(66)
			OR data_out(65)
			OR data_out(5)
			OR data_out(45)
			OR data_out(83)
			OR data_out(50)
			OR data_out(62)
			OR data_out(78);
	data_in(29) <=	DIN(29)
			OR data_out(73)
			OR data_out(72)
			OR data_out(79)
			OR data_out(31)
			OR data_out(63)
			OR data_out(18)
			OR data_out(80);
	data_in(30) <=	DIN(30)
			OR data_out(13)
			OR data_out(62);
	data_in(31) <=	DIN(31)
			OR data_out(80)
			OR data_out(4)
			OR data_out(73)
			OR data_out(34)
			OR data_out(79)
			OR data_out(22)
			OR data_out(29)
			OR data_out(70)
			OR data_out(72)
			OR data_out(32);
	data_in(32) <=	DIN(32)
			OR data_out(10)
			OR data_out(53)
			OR data_out(24)
			OR data_out(73)
			OR data_out(77)
			OR data_out(79)
			OR data_out(40)
			OR data_out(36)
			OR data_out(56)
			OR data_out(31);
	data_in(33) <=	DIN(33)
			OR data_out(70)
			OR data_out(50)
			OR data_out(63)
			OR data_out(67)
			OR data_out(38)
			OR data_out(39)
			OR data_out(80)
			OR data_out(72);
	data_in(34) <=	DIN(34)
			OR data_out(73)
			OR data_out(72)
			OR data_out(31)
			OR data_out(63)
			OR data_out(35)
			OR data_out(64);
	data_in(35) <=	DIN(35)
			OR data_out(73)
			OR data_out(68)
			OR data_out(27)
			OR data_out(34)
			OR data_out(36);
	data_in(36) <=	DIN(36)
			OR data_out(22)
			OR data_out(67)
			OR data_out(45)
			OR data_out(80)
			OR data_out(24)
			OR data_out(32)
			OR data_out(81)
			OR data_out(71)
			OR data_out(38)
			OR data_out(85)
			OR data_out(86)
			OR data_out(25)
			OR data_out(35);
	data_in(37) <=	DIN(37)
			OR data_out(80)
			OR data_out(10)
			OR data_out(50)
			OR data_out(67);
	data_in(38) <=	DIN(38)
			OR data_out(64)
			OR data_out(24)
			OR data_out(15)
			OR data_out(79)
			OR data_out(85)
			OR data_out(86)
			OR data_out(33)
			OR data_out(60)
			OR data_out(59)
			OR data_out(72)
			OR data_out(57)
			OR data_out(36)
			OR data_out(40)
			OR data_out(19)
			OR data_out(25)
			OR data_out(62)
			OR data_out(39);
	data_in(39) <=	DIN(39)
			OR data_out(73)
			OR data_out(75)
			OR data_out(24)
			OR data_out(56)
			OR data_out(85)
			OR data_out(77)
			OR data_out(80)
			OR data_out(33)
			OR data_out(78)
			OR data_out(55)
			OR data_out(58)
			OR data_out(38);
	data_in(40) <=	DIN(40)
			OR data_out(16)
			OR data_out(50)
			OR data_out(63)
			OR data_out(80)
			OR data_out(78)
			OR data_out(17)
			OR data_out(32)
			OR data_out(38)
			OR data_out(57)
			OR data_out(60)
			OR data_out(41);
	data_in(41) <=	DIN(41)
			OR data_out(83)
			OR data_out(79)
			OR data_out(60)
			OR data_out(57)
			OR data_out(40);
	data_in(42) <=	DIN(42)
			OR data_out(17)
			OR data_out(63)
			OR data_out(19)
			OR data_out(73);
	data_in(43) <=	DIN(43)
			OR data_out(62);
	data_in(44) <=	DIN(44)
			OR data_out(64)
			OR data_out(82)
			OR data_out(45);
	data_in(45) <=	DIN(45)
			OR data_out(36)
			OR data_out(28)
			OR data_out(4)
			OR data_out(18)
			OR data_out(44);
	data_in(46) <=	DIN(46)
			OR data_out(47)
			OR data_out(24)
			OR data_out(69)
			OR data_out(79)
			OR data_out(56)
			OR data_out(26)
			OR data_out(62)
			OR data_out(70);
	data_in(47) <=	DIN(47)
			OR data_out(46)
			OR data_out(70)
			OR data_out(83)
			OR data_out(56)
			OR data_out(24)
			OR data_out(77)
			OR data_out(69)
			OR data_out(71)
			OR data_out(72)
			OR data_out(63);
	data_in(48) <=	DIN(48)
			OR data_out(2)
			OR data_out(15)
			OR data_out(20)
			OR data_out(73);
	data_in(49) <=	DIN(49)
			OR data_out(50);
	data_in(50) <=	DIN(50)
			OR data_out(6)
			OR data_out(66)
			OR data_out(33)
			OR data_out(40)
			OR data_out(0)
			OR data_out(1)
			OR data_out(79)
			OR data_out(13)
			OR data_out(10)
			OR data_out(9)
			OR data_out(28)
			OR data_out(11)
			OR data_out(37)
			OR data_out(52)
			OR data_out(49);
	data_in(51) <=	DIN(51)
			OR data_out(70)
			OR data_out(67)
			OR data_out(83)
			OR data_out(77)
			OR data_out(64)
			OR data_out(63);
	data_in(52) <=	DIN(52)
			OR data_out(57)
			OR data_out(78)
			OR data_out(24)
			OR data_out(85)
			OR data_out(62)
			OR data_out(50)
			OR data_out(22)
			OR data_out(81)
			OR data_out(63)
			OR data_out(70);
	data_in(53) <=	DIN(53)
			OR data_out(76)
			OR data_out(32)
			OR data_out(80)
			OR data_out(79)
			OR data_out(85)
			OR data_out(73)
			OR data_out(81)
			OR data_out(70);
	data_in(54) <=	DIN(54)
			OR data_out(83)
			OR data_out(75)
			OR data_out(24)
			OR data_out(68)
			OR data_out(86)
			OR data_out(72)
			OR data_out(71);
	data_in(55) <=	DIN(55)
			OR data_out(72)
			OR data_out(39)
			OR data_out(58)
			OR data_out(56)
			OR data_out(73)
			OR data_out(68);
	data_in(56) <=	DIN(56)
			OR data_out(78)
			OR data_out(22)
			OR data_out(62)
			OR data_out(47)
			OR data_out(8)
			OR data_out(15)
			OR data_out(39)
			OR data_out(79)
			OR data_out(63)
			OR data_out(25)
			OR data_out(86)
			OR data_out(71)
			OR data_out(6)
			OR data_out(12)
			OR data_out(59)
			OR data_out(32)
			OR data_out(72)
			OR data_out(64)
			OR data_out(60)
			OR data_out(46)
			OR data_out(55)
			OR data_out(80)
			OR data_out(67);
	data_in(57) <=	DIN(57)
			OR data_out(63)
			OR data_out(81)
			OR data_out(52)
			OR data_out(18)
			OR data_out(67)
			OR data_out(38)
			OR data_out(59)
			OR data_out(78)
			OR data_out(40)
			OR data_out(80)
			OR data_out(41)
			OR data_out(83)
			OR data_out(60);
	data_in(58) <=	DIN(58)
			OR data_out(62)
			OR data_out(22)
			OR data_out(55)
			OR data_out(39)
			OR data_out(78)
			OR data_out(59);
	data_in(59) <=	DIN(59)
			OR data_out(60)
			OR data_out(83)
			OR data_out(11)
			OR data_out(72)
			OR data_out(78)
			OR data_out(80)
			OR data_out(18)
			OR data_out(22)
			OR data_out(38)
			OR data_out(56)
			OR data_out(67)
			OR data_out(57)
			OR data_out(85)
			OR data_out(77)
			OR data_out(58);
	data_in(60) <=	DIN(60)
			OR data_out(59)
			OR data_out(68)
			OR data_out(81)
			OR data_out(16)
			OR data_out(79)
			OR data_out(80)
			OR data_out(78)
			OR data_out(38)
			OR data_out(22)
			OR data_out(64)
			OR data_out(63)
			OR data_out(56)
			OR data_out(40)
			OR data_out(41)
			OR data_out(83)
			OR data_out(57)
			OR data_out(61);
	data_in(61) <=	DIN(61)
			OR data_out(62)
			OR data_out(60);
	data_in(62) <=	DIN(62)
			OR data_out(58)
			OR data_out(78)
			OR data_out(4)
			OR data_out(56)
			OR data_out(65)
			OR data_out(66)
			OR data_out(52)
			OR data_out(80)
			OR data_out(28)
			OR data_out(30)
			OR data_out(46)
			OR data_out(61)
			OR data_out(38)
			OR data_out(43)
			OR data_out(69);
	data_in(63) <=	DIN(63)
			OR data_out(57)
			OR data_out(73)
			OR data_out(33)
			OR data_out(40)
			OR data_out(56)
			OR data_out(42)
			OR data_out(70)
			OR data_out(82)
			OR data_out(68)
			OR data_out(34)
			OR data_out(29)
			OR data_out(60)
			OR data_out(64)
			OR data_out(72)
			OR data_out(77)
			OR data_out(52)
			OR data_out(47)
			OR data_out(51)
			OR data_out(81)
			OR data_out(67);
	data_in(64) <=	DIN(64)
			OR data_out(38)
			OR data_out(24)
			OR data_out(67)
			OR data_out(44)
			OR data_out(73)
			OR data_out(26)
			OR data_out(60)
			OR data_out(71)
			OR data_out(63)
			OR data_out(56)
			OR data_out(25)
			OR data_out(72)
			OR data_out(51)
			OR data_out(34)
			OR data_out(76)
			OR data_out(79)
			OR data_out(82);
	data_in(65) <=	DIN(65)
			OR data_out(28)
			OR data_out(62)
			OR data_out(83)
			OR data_out(27)
			OR data_out(79)
			OR data_out(66);
	data_in(66) <=	DIN(66)
			OR data_out(79)
			OR data_out(85)
			OR data_out(78)
			OR data_out(50)
			OR data_out(28)
			OR data_out(14)
			OR data_out(83)
			OR data_out(62)
			OR data_out(65);
	data_in(67) <=	DIN(67)
			OR data_out(22)
			OR data_out(78)
			OR data_out(64)
			OR data_out(36)
			OR data_out(33)
			OR data_out(51)
			OR data_out(72)
			OR data_out(12)
			OR data_out(59)
			OR data_out(57)
			OR data_out(15)
			OR data_out(86)
			OR data_out(16)
			OR data_out(85)
			OR data_out(37)
			OR data_out(80)
			OR data_out(56)
			OR data_out(63)
			OR data_out(73);
	data_in(68) <=	DIN(68)
			OR data_out(60)
			OR data_out(73)
			OR data_out(77)
			OR data_out(54)
			OR data_out(35)
			OR data_out(74)
			OR data_out(63)
			OR data_out(76)
			OR data_out(55)
			OR data_out(82);
	data_in(69) <=	DIN(69)
			OR data_out(26)
			OR data_out(46)
			OR data_out(77)
			OR data_out(47)
			OR data_out(62)
			OR data_out(70);
	data_in(70) <=	DIN(70)
			OR data_out(72)
			OR data_out(51)
			OR data_out(47)
			OR data_out(33)
			OR data_out(78)
			OR data_out(73)
			OR data_out(77)
			OR data_out(63)
			OR data_out(26)
			OR data_out(16)
			OR data_out(84)
			OR data_out(31)
			OR data_out(81)
			OR data_out(46)
			OR data_out(52)
			OR data_out(53)
			OR data_out(80)
			OR data_out(69);
	data_in(71) <=	DIN(71)
			OR data_out(86)
			OR data_out(85)
			OR data_out(24)
			OR data_out(79)
			OR data_out(56)
			OR data_out(76)
			OR data_out(12)
			OR data_out(36)
			OR data_out(47)
			OR data_out(64)
			OR data_out(77)
			OR data_out(54)
			OR data_out(73);
	data_in(72) <=	DIN(72)
			OR data_out(70)
			OR data_out(81)
			OR data_out(29)
			OR data_out(24)
			OR data_out(59)
			OR data_out(34)
			OR data_out(25)
			OR data_out(55)
			OR data_out(26)
			OR data_out(67)
			OR data_out(38)
			OR data_out(77)
			OR data_out(56)
			OR data_out(85)
			OR data_out(54)
			OR data_out(64)
			OR data_out(63)
			OR data_out(31)
			OR data_out(47)
			OR data_out(33)
			OR data_out(73);
	data_in(73) <=	DIN(73)
			OR data_out(3)
			OR data_out(27)
			OR data_out(29)
			OR data_out(39)
			OR data_out(63)
			OR data_out(34)
			OR data_out(22)
			OR data_out(68)
			OR data_out(64)
			OR data_out(70)
			OR data_out(31)
			OR data_out(32)
			OR data_out(26)
			OR data_out(85)
			OR data_out(19)
			OR data_out(75)
			OR data_out(35)
			OR data_out(2)
			OR data_out(17)
			OR data_out(15)
			OR data_out(12)
			OR data_out(8)
			OR data_out(24)
			OR data_out(53)
			OR data_out(74)
			OR data_out(20)
			OR data_out(21)
			OR data_out(23)
			OR data_out(86)
			OR data_out(77)
			OR data_out(76)
			OR data_out(55)
			OR data_out(42)
			OR data_out(81)
			OR data_out(48)
			OR data_out(82)
			OR data_out(67)
			OR data_out(71)
			OR data_out(72);
	data_in(74) <=	DIN(74)
			OR data_out(79)
			OR data_out(85)
			OR data_out(68)
			OR data_out(73)
			OR data_out(75);
	data_in(75) <=	DIN(75)
			OR data_out(39)
			OR data_out(19)
			OR data_out(15)
			OR data_out(12)
			OR data_out(24)
			OR data_out(85)
			OR data_out(73)
			OR data_out(54)
			OR data_out(86)
			OR data_out(74);
	data_in(76) <=	DIN(76)
			OR data_out(53)
			OR data_out(24)
			OR data_out(12)
			OR data_out(71)
			OR data_out(22)
			OR data_out(15)
			OR data_out(81)
			OR data_out(68)
			OR data_out(26)
			OR data_out(73)
			OR data_out(64)
			OR data_out(77);
	data_in(77) <=	DIN(77)
			OR data_out(84)
			OR data_out(85)
			OR data_out(47)
			OR data_out(70)
			OR data_out(24)
			OR data_out(68)
			OR data_out(32)
			OR data_out(39)
			OR data_out(69)
			OR data_out(72)
			OR data_out(71)
			OR data_out(51)
			OR data_out(63)
			OR data_out(73)
			OR data_out(59)
			OR data_out(76)
			OR data_out(80);
	data_in(78) <=	DIN(78)
			OR data_out(82)
			OR data_out(66)
			OR data_out(56)
			OR data_out(62)
			OR data_out(67)
			OR data_out(83)
			OR data_out(70)
			OR data_out(52)
			OR data_out(59)
			OR data_out(18)
			OR data_out(60)
			OR data_out(81)
			OR data_out(40)
			OR data_out(39)
			OR data_out(22)
			OR data_out(15)
			OR data_out(80)
			OR data_out(57)
			OR data_out(85)
			OR data_out(28)
			OR data_out(58)
			OR data_out(79);
	data_in(79) <=	DIN(79)
			OR data_out(66)
			OR data_out(74)
			OR data_out(29)
			OR data_out(15)
			OR data_out(50)
			OR data_out(60)
			OR data_out(38)
			OR data_out(56)
			OR data_out(71)
			OR data_out(53)
			OR data_out(31)
			OR data_out(32)
			OR data_out(86)
			OR data_out(46)
			OR data_out(26)
			OR data_out(41)
			OR data_out(65)
			OR data_out(64)
			OR data_out(78);
	data_in(80) <=	DIN(80)
			OR data_out(31)
			OR data_out(85)
			OR data_out(11)
			OR data_out(10)
			OR data_out(53)
			OR data_out(37)
			OR data_out(59)
			OR data_out(60)
			OR data_out(40)
			OR data_out(36)
			OR data_out(39)
			OR data_out(18)
			OR data_out(22)
			OR data_out(12)
			OR data_out(62)
			OR data_out(78)
			OR data_out(33)
			OR data_out(57)
			OR data_out(29)
			OR data_out(56)
			OR data_out(84)
			OR data_out(67)
			OR data_out(70)
			OR data_out(77)
			OR data_out(81);
	data_in(81) <=	DIN(81)
			OR data_out(72)
			OR data_out(57)
			OR data_out(60)
			OR data_out(85)
			OR data_out(78)
			OR data_out(36)
			OR data_out(76)
			OR data_out(53)
			OR data_out(24)
			OR data_out(52)
			OR data_out(70)
			OR data_out(73)
			OR data_out(63)
			OR data_out(80);
	data_in(82) <=	DIN(82)
			OR data_out(78)
			OR data_out(63)
			OR data_out(44)
			OR data_out(73)
			OR data_out(64)
			OR data_out(68)
			OR data_out(85);
	data_in(83) <=	DIN(83)
			OR data_out(47)
			OR data_out(59)
			OR data_out(78)
			OR data_out(54)
			OR data_out(16)
			OR data_out(41)
			OR data_out(66)
			OR data_out(65)
			OR data_out(28)
			OR data_out(5)
			OR data_out(7)
			OR data_out(51)
			OR data_out(14)
			OR data_out(25)
			OR data_out(57)
			OR data_out(60)
			OR data_out(84);
	data_in(84) <=	DIN(84)
			OR data_out(77)
			OR data_out(22)
			OR data_out(70)
			OR data_out(80)
			OR data_out(83);
	data_in(85) <=	DIN(85)
			OR data_out(66)
			OR data_out(80)
			OR data_out(71)
			OR data_out(81)
			OR data_out(22)
			OR data_out(77)
			OR data_out(25)
			OR data_out(75)
			OR data_out(38)
			OR data_out(73)
			OR data_out(39)
			OR data_out(74)
			OR data_out(52)
			OR data_out(53)
			OR data_out(36)
			OR data_out(72)
			OR data_out(78)
			OR data_out(59)
			OR data_out(67)
			OR data_out(82)
			OR data_out(86);
	data_in(86) <=	DIN(86)
			OR data_out(71)
			OR data_out(25)
			OR data_out(56)
			OR data_out(38)
			OR data_out(54)
			OR data_out(79)
			OR data_out(67)
			OR data_out(75)
			OR data_out(24)
			OR data_out(36)
			OR data_out(73)
			OR data_out(85);

	-- Wire connections: outputs
	DOUT(86) <= data_out(86);
	DOUT(85) <= data_out(85);
	DOUT(84) <= data_out(84);
	DOUT(83) <= data_out(83);
	DOUT(82) <= data_out(82);
	DOUT(81) <= data_out(81);
	DOUT(80) <= data_out(80);
	DOUT(79) <= data_out(79);
	DOUT(78) <= data_out(78);
	DOUT(77) <= data_out(77);
	DOUT(76) <= data_out(76);
	DOUT(75) <= data_out(75);
	DOUT(74) <= data_out(74);
	DOUT(73) <= data_out(73);
	DOUT(72) <= data_out(72);
	DOUT(71) <= data_out(71);
	DOUT(70) <= data_out(70);
	DOUT(69) <= data_out(69);
	DOUT(68) <= data_out(68);
	DOUT(67) <= data_out(67);
	DOUT(66) <= data_out(66);
	DOUT(65) <= data_out(65);
	DOUT(64) <= data_out(64);
	DOUT(63) <= data_out(63);
	DOUT(62) <= data_out(62);
	DOUT(61) <= data_out(61);
	DOUT(60) <= data_out(60);
	DOUT(59) <= data_out(59);
	DOUT(58) <= data_out(58);
	DOUT(57) <= data_out(57);
	DOUT(56) <= data_out(56);
	DOUT(55) <= data_out(55);
	DOUT(54) <= data_out(54);
	DOUT(53) <= data_out(53);
	DOUT(52) <= data_out(52);
	DOUT(51) <= data_out(51);
	DOUT(50) <= data_out(50);
	DOUT(49) <= data_out(49);
	DOUT(48) <= data_out(48);
	DOUT(47) <= data_out(47);
	DOUT(46) <= data_out(46);
	DOUT(45) <= data_out(45);
	DOUT(44) <= data_out(44);
	DOUT(43) <= data_out(43);
	DOUT(42) <= data_out(42);
	DOUT(41) <= data_out(41);
	DOUT(40) <= data_out(40);
	DOUT(39) <= data_out(39);
	DOUT(38) <= data_out(38);
	DOUT(37) <= data_out(37);
	DOUT(36) <= data_out(36);
	DOUT(35) <= data_out(35);
	DOUT(34) <= data_out(34);
	DOUT(33) <= data_out(33);
	DOUT(32) <= data_out(32);
	DOUT(31) <= data_out(31);
	DOUT(30) <= data_out(30);
	DOUT(29) <= data_out(29);
	DOUT(28) <= data_out(28);
	DOUT(27) <= data_out(27);
	DOUT(26) <= data_out(26);
	DOUT(25) <= data_out(25);
	DOUT(24) <= data_out(24);
	DOUT(23) <= data_out(23);
	DOUT(22) <= data_out(22);
	DOUT(21) <= data_out(21);
	DOUT(20) <= data_out(20);
	DOUT(19) <= data_out(19);
	DOUT(18) <= data_out(18);
	DOUT(17) <= data_out(17);
	DOUT(16) <= data_out(16);
	DOUT(15) <= data_out(15);
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