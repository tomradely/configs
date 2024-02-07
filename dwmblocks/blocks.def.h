//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "qdbus org.fctix.Fcitx5 /controller org.fcitx.Fcitx.Controller1.CurrentInputMethod | awk '{print $2} { if ($2==\"\") print $1} { if ($2==\"ru\") print \"ру\"} { if ($1==\"pinyin\" print \"拼\"}' FS=-",				0,			11},	
//	{"󰖩",
//	{"󰛴",
	{"Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},
	{"󰃭", "lunarcal --view=d | grep 癸卯 | awk '{print$2$3}'",		5,		0},
//	{"󱑇",
	{"", "date '+%b %d (%a) %I:%M%p'",					5,		0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " ][ ";
static unsigned int delimLen = 5;
