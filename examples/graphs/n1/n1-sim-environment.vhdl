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
		EN_NODES	: IN	std_logic_vector(14 downto 0);
		START	: IN	std_logic;
		DIN	: IN	std_logic;
		DONE	: OUT	std_logic;
		COMPLETE	: OUT	std_logic;
		RESULT	: OUT	std_logic_vector(8 downto 0));
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
			EN	: IN	std_logic_vector(14 downto 0);
			DIN	: IN	std_logic_vector(14 downto 0);
			DOUT	: OUT	std_logic_vector(14 downto 0));
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

	SIGNAL in_network	: std_logic_vector(15 downto 0);
	SIGNAL sync_in		: std_logic_vector(14 downto 0);
	SIGNAL sync_out	: std_logic_vector(14 downto 0);
	SIGNAL count		: std_logic_vector(3 downto 0);
	SIGNAL count_sum	: std_logic_vector(3 downto 0);
	SIGNAL count_mul	: std_logic_vector(3 downto 0);
	SIGNAL count_mul2	: std_logic_vector(3 downto 0);
	SIGNAL sum		: std_logic_vector(3 downto 0);
	SIGNAL sum_mul		: std_logic_vector(3 downto 0);
	SIGNAL sum_mul2		: std_logic_vector(3 downto 0);
	SIGNAL mul		: std_logic_vector(7 downto 0);
	SIGNAL start_del		: std_logic;
	SIGNAL start_counting	: std_logic;
	SIGNAL enable_reg_del	: std_logic_vector(14 downto 0);
	SIGNAL done1, done2, done3, done_res		: std_logic;
	SIGNAL res, res2		: std_logic_vector(8 downto 0);
	SIGNAL comparator_en		: std_logic;

BEGIN

	DELAYER_ENABLE : for i in 0 to 14 generate
		enable_reg_del(i) <= EN_NODES(i) AND start_del;
	end generate;

	NETWORK : Graph
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> enable_reg_del,
			DIN	=> in_network(14 downto 0),
			DOUT	=> sync_in);

	SYNCHRONISER : Generic_sync_register
		GENERIC MAP(15)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> EN,
			DIN	=> sync_in,
			DOUT	=> sync_out);

	COUNTER : Generic_counter
		GENERIC MAP(4)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> start_counting,
			DOUT	=> count);

	REG_COUNTER : Generic_register
		GENERIC MAP(4)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> EN,
			DIN	=> count,
			DOUT	=> count_sum);

	ACCUMULATOR : Generic_accumulator
		GENERIC MAP(8)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> start_del,
			DIN	=> mul,
			DOUT	=> res);

	REG_COUNTER_MUL : Generic_register
		GENERIC MAP(4)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> EN,
			DIN	=> count_sum,
			DOUT	=> count_mul);

	REG_COUNTER_MUL2 : Generic_register
		GENERIC MAP(4)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> EN,
			DIN	=> count_mul,
			DOUT	=> count_mul2);

	REG_SUM_MUL : Generic_register
		GENERIC MAP(4)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> EN,
			DIN	=> sum,
			DOUT	=> sum_mul);

	REG_SUM_MUL2 : Generic_register
		GENERIC MAP(4)
		PORT MAP(
			CLK	=> CLK,
			RST	=> RST,
			EN	=> EN,
			DIN	=> sum_mul,
			DOUT	=> sum_mul2);

	SHIFT_REG : Generic_shift_register_input
		GENERIC MAP(16)
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
		GENERIC MAP(4)
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
	COMPLETE <= in_network(15);

	sum <= 		("000" & sync_out(14))	+
		("000" & sync_out(13))	+
		("000" & sync_out(12))	+
		("000" & sync_out(11))	+
		("000" & sync_out(10))	+
		("000" & sync_out(9))	+
		("000" & sync_out(8))	+
		("000" & sync_out(7))	+
		("000" & sync_out(6))	+
		("000" & sync_out(5))	+
		("000" & sync_out(4))	+
		("000" & sync_out(3))	+
		("000" & sync_out(2))	+
		("000" & sync_out(1))	+
		("000" & sync_out(0));

	mul <= sum_mul2 * count_mul2;


END test;