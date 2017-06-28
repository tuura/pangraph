-- File generated automatically
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;
LIBRARY work;

ENTITY FANTASI IS
	PORT (
		CLK	: IN	std_logic;
		RST	: IN	std_logic;
		RST_SHIFT	: IN	std_logic;
		EN	: IN	std_logic;
		EN_NODES	: IN	std_logic_vector(86 downto 0);
		START	: IN	std_logic;
		DIN	: IN	std_logic;
		DONE	: OUT	std_logic;
		COMPLETE	: OUT	std_logic;
		RESULT	: OUT	std_logic_vector(14 downto 0));
END FANTASI;

ARCHITECTURE test OF FANTASI IS

	COMPONENT Generic_accumulator IS
		GENERIC (N : integer);
		PORT (
			CLK	: IN	std_logic;
			RST	: IN	std_logic;
			EN	: IN	std_logic;
			DIN	: IN	std_logic_vector(N-1 downto 0);
			DOUT	: OUT	std_logic_vector(N downto 0));
	END COMPONENT;

	COMPONENT Generic_sync_register IS
		GENERIC (N : integer);
		PORT (
			CLK	: IN	std_logic;
			RST	: IN	std_logic;
			EN	: IN	std_logic;
			DIN	: IN	std_logic_vector(N-1 downto 0);
			DOUT	: OUT	std_logic_vector(N-1 downto 0));
	END COMPONENT;

	COMPONENT Generic_counter IS
		GENERIC (N : integer);
		PORT (
			CLK	: IN	std_logic;
			RST	: IN	std_logic;
			EN	: IN	std_logic;
			DOUT	: OUT	std_logic_vector(N-1 downto 0));
	END COMPONENT;

	COMPONENT Generic_register IS
		GENERIC (N : integer);
		PORT (
			CLK	: IN	std_logic;
			RST	: IN	std_logic;
			EN	: IN	std_logic;
			DIN	: IN	std_logic_vector(N-1 downto 0);
			DOUT	: OUT	std_logic_vector(N-1 downto 0));
	END COMPONENT;

	COMPONENT Graph IS
		PORT (
			CLK	: IN	std_logic;
			RST	: IN	std_logic;
			EN	: IN	std_logic_vector(86 downto 0);
			DIN	: IN	std_logic_vector(86 downto 0);
			DOUT	: OUT	std_logic_vector(86 downto 0));
	END COMPONENT;

	COMPONENT Generic_shift_register_input IS
		GENERIC (N : integer);
		PORT (
			CLK	: IN	std_logic;
			RST	: IN	std_logic;
			EN	: IN	std_logic;
			START	: IN	std_logic;
			DIN	: IN	std_logic;
			DOUT	: OUT	std_logic_vector(N-1 downto 0));
	END COMPONENT;

	COMPONENT ffd IS
		PORT (
			CLK	: IN	std_logic;
			RST	: IN	std_logic;
			EN	: IN	std_logic;
			D	: IN	std_logic;
			Q	: OUT	std_logic);
	END COMPONENT;

	COMPONENT Delayer IS
		GENERIC (N : integer);
		PORT (
			CLK	: IN	std_logic;
			RST	: IN	std_logic;
			EN	: IN	std_logic;
			DIN	: IN	std_logic;
			DOUT	: OUT	std_logic);
	END COMPONENT;

	COMPONENT Generic_zero_comparator IS
		GENERIC (N : integer);
		PORT (
			OP	: IN	std_logic_vector(N-1 downto 0);
			EN	: IN	std_logic;
			EQ	: OUT	std_logic);
	END COMPONENT;

	SIGNAL in_network	: std_logic_vector(87 downto 0);
	SIGNAL sync_in		: std_logic_vector(86 downto 0);
	SIGNAL sync_out	: std_logic_vector(86 downto 0);
	SIGNAL count		: std_logic_vector(6 downto 0);
	SIGNAL count_sum	: std_logic_vector(6 downto 0);
	SIGNAL count_mul	: std_logic_vector(6 downto 0);
	SIGNAL count_mul2	: std_logic_vector(6 downto 0);
	SIGNAL sum		: std_logic_vector(6 downto 0);
	SIGNAL sum_mul		: std_logic_vector(6 downto 0);
	SIGNAL sum_mul2		: std_logic_vector(6 downto 0);
	SIGNAL mul		: std_logic_vector(13 downto 0);
	SIGNAL start_del		: std_logic;
	SIGNAL start_counting	: std_logic;
	SIGNAL enable_reg_del	: std_logic_vector(86 downto 0);
	SIGNAL done1, done2, done3, done_res		: std_logic;
	SIGNAL res, res2		: std_logic_vector(14 downto 0);
	SIGNAL comparator_en		: std_logic;

BEGIN

	DELAYER_ENABLE : for i in 0 to 86 generate
		enable_reg_del(i) <= EN_NODES(i) AND start_del;
	end generate;

	NETWORK : Graph
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> enable_reg_del,
			DIN	=> in_network(86 downto 0),
			DOUT	=> sync_in);

	SYNCHRONISER : Generic_sync_register
		GENERIC MAP(87)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> EN,
			DIN	=> sync_in,
			DOUT	=> sync_out);

	COUNTER : Generic_counter
		GENERIC MAP(7)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> start_counting,
			DOUT	=> count);

	REG_COUNTER : Generic_register
		GENERIC MAP(7)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> EN,
			DIN	=> count,
			DOUT	=> count_sum);

	ACCUMULATOR : Generic_accumulator
		GENERIC MAP(14)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> start_del,
			DIN	=> mul,
			DOUT	=> res);

	REG_COUNTER_MUL : Generic_register
		GENERIC MAP(7)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> EN,
			DIN	=> count_sum,
			DOUT	=> count_mul);

	REG_COUNTER_MUL2 : Generic_register
		GENERIC MAP(7)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> EN,
			DIN	=> count_mul,
			DOUT	=> count_mul2);

	REG_SUM_MUL : Generic_register
		GENERIC MAP(7)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> EN,
			DIN	=> sum,
			DOUT	=> sum_mul);

	REG_SUM_MUL2 : Generic_register
		GENERIC MAP(7)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> EN,
			DIN	=> sum_mul,
			DOUT	=> sum_mul2);

	SHIFT_REG : Generic_shift_register_input
		GENERIC MAP(88)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST_SHIFT,
			EN	=> EN,
			START	=> START,
			DIN	=> DIN,
			DOUT	=> in_network);

	START_DELAYER : Delayer
		GENERIC MAP (2)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> EN,
			DIN	=> START,
			DOUT	=> start_del);

	COUNTER_DELAYER : Delayer
		GENERIC MAP (1)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> EN,
			DIN	=> start_del,
			DOUT	=> start_counting);

	RESULT_COMPARATOR : Generic_zero_comparator
		GENERIC MAP(7)
		PORT MAP(
			OP	=> sum_mul,
			EN	=> comparator_en,
			EQ	=> done1);

	COMPARATOR_DELAYER : Delayer
		GENERIC MAP (3)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> EN,
			DIN	=> start_del,
			DOUT	=> comparator_en);

	COMPARATOR_DELAYER_RESULT : Delayer
		GENERIC MAP (3)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> EN,
			DIN	=> done1,
			DOUT	=> done_res);

	DONE_LATCH : ffd
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> EN,
			D	=> done3,
			Q	=> done2);

	done3 <= done_res OR done2;
	DONE <= done2;

	RESULT <= res;
	COMPLETE <= in_network(87);

	sum <= 		("000000" & sync_out(86))	+
		("000000" & sync_out(85))	+
		("000000" & sync_out(84))	+
		("000000" & sync_out(83))	+
		("000000" & sync_out(82))	+
		("000000" & sync_out(81))	+
		("000000" & sync_out(80))	+
		("000000" & sync_out(79))	+
		("000000" & sync_out(78))	+
		("000000" & sync_out(77))	+
		("000000" & sync_out(76))	+
		("000000" & sync_out(75))	+
		("000000" & sync_out(74))	+
		("000000" & sync_out(73))	+
		("000000" & sync_out(72))	+
		("000000" & sync_out(71))	+
		("000000" & sync_out(70))	+
		("000000" & sync_out(69))	+
		("000000" & sync_out(68))	+
		("000000" & sync_out(67))	+
		("000000" & sync_out(66))	+
		("000000" & sync_out(65))	+
		("000000" & sync_out(64))	+
		("000000" & sync_out(63))	+
		("000000" & sync_out(62))	+
		("000000" & sync_out(61))	+
		("000000" & sync_out(60))	+
		("000000" & sync_out(59))	+
		("000000" & sync_out(58))	+
		("000000" & sync_out(57))	+
		("000000" & sync_out(56))	+
		("000000" & sync_out(55))	+
		("000000" & sync_out(54))	+
		("000000" & sync_out(53))	+
		("000000" & sync_out(52))	+
		("000000" & sync_out(51))	+
		("000000" & sync_out(50))	+
		("000000" & sync_out(49))	+
		("000000" & sync_out(48))	+
		("000000" & sync_out(47))	+
		("000000" & sync_out(46))	+
		("000000" & sync_out(45))	+
		("000000" & sync_out(44))	+
		("000000" & sync_out(43))	+
		("000000" & sync_out(42))	+
		("000000" & sync_out(41))	+
		("000000" & sync_out(40))	+
		("000000" & sync_out(39))	+
		("000000" & sync_out(38))	+
		("000000" & sync_out(37))	+
		("000000" & sync_out(36))	+
		("000000" & sync_out(35))	+
		("000000" & sync_out(34))	+
		("000000" & sync_out(33))	+
		("000000" & sync_out(32))	+
		("000000" & sync_out(31))	+
		("000000" & sync_out(30))	+
		("000000" & sync_out(29))	+
		("000000" & sync_out(28))	+
		("000000" & sync_out(27))	+
		("000000" & sync_out(26))	+
		("000000" & sync_out(25))	+
		("000000" & sync_out(24))	+
		("000000" & sync_out(23))	+
		("000000" & sync_out(22))	+
		("000000" & sync_out(21))	+
		("000000" & sync_out(20))	+
		("000000" & sync_out(19))	+
		("000000" & sync_out(18))	+
		("000000" & sync_out(17))	+
		("000000" & sync_out(16))	+
		("000000" & sync_out(15))	+
		("000000" & sync_out(14))	+
		("000000" & sync_out(13))	+
		("000000" & sync_out(12))	+
		("000000" & sync_out(11))	+
		("000000" & sync_out(10))	+
		("000000" & sync_out(9))	+
		("000000" & sync_out(8))	+
		("000000" & sync_out(7))	+
		("000000" & sync_out(6))	+
		("000000" & sync_out(5))	+
		("000000" & sync_out(4))	+
		("000000" & sync_out(3))	+
		("000000" & sync_out(2))	+
		("000000" & sync_out(1))	+
		("000000" & sync_out(0));

	mul <= sum_mul2 * count_mul2;


END test;