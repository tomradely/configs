/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 7;        /* border pixel of windows */
static const int startwithgaps[]    = { 1 };	/* 1 means gaps are used by default, this can be customized for each tag */
static const unsigned int gappx[]   = { 20 };   /* default gap between windows in pixels, this can be customized for each tag */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int vertpad            = 10;       /* vertical padding of bar */
static const int sidepad            = 20;       /* horizontal padding of bar */
#define ICONSIZE 32 /* icon size */
#define ICONSPACING 10 /* space between icon and title */
static const char *fonts[]          = { "MesloLGS NF:size=14", "Microsoft YaHei:size=12" };
static const char dmenufont[]       = "MesloLGS NF:size=12";
static const char *brighter[]	    = {"/home/tom/.config/dunst/backlight.sh", "up", NULL };
static const char *dimmer[]	    = {"/home/tom/.config/dunst/backlight.sh", "down", NULL };
static const char *up_vol[]	    = {"/home/tom/.config/dunst/volume.sh", "up", NULL};
static const char *down_vol[]	    = {"/home/tom/.config/dunst/volume.sh", "down", NULL};
static const char *mute_vol[]	    = {"/home/tom/.config/dunst/volume.sh", "mute", NULL};
static const char *next[]	    = {"playerctl", "next", NULL};
static const char *prev[]	    = {"playerctl", "previous", NULL};
static const char *play[]	    = {"playerctl", "play-pause", NULL};
static unsigned int baralpha        = 0xd0;
static unsigned int borderalpha     = 0xd0;
static const char col_gray1[]       = "#3c3836";
static const char col_gray2[]       = "#77a76e";
static const char col_gray3[]       = "#ebdbb2";
static const char col_gray4[]       = "#3c3836";
static const char col_cyan[]        = "#cb8819";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_cyan },
	[SchemeSel]  = { col_gray3, col_gray1,  col_gray2  },
	[SchemeStatus]  = { col_gray3, col_gray1,  "#000000"  }, // Statusbar right {text,background,not used but cannot be empty}
	[SchemeTagsSel]  = { col_cyan, col_gray1,  "#000000"  }, // Tagbar left selected {text,background,not used but cannot be empty}
	[SchemeTagsNorm]  = { col_gray3, col_gray1,  "#000000"  }, // Tagbar left unselected {text,background,not used but cannot be empty}
	[SchemeInfoSel]  = { col_gray3, col_gray1,  "#000000"  }, // infobar middle  selected {text,background,not used but cannot be empty}
	[SchemeInfoNorm]  = { col_gray3, col_gray1,  "#000000"  }, // infobar middle  unselected {text,background,not used but cannot be empty}
};

/* tagging */
static const char *tags[] = { "甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬" };

static const unsigned int ulinepad	= 5;	/* horizontal padding between the underline and tag */
static const unsigned int ulinestroke	= 2;	/* thickness / height of the underline */
static const unsigned int ulinevoffset	= 0;	/* how far above the bottom of the bar the line should appear */
static const int ulineall 		= 0;	/* 1 to show underline on all tags, 0 for just the active ones */

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
#include "tatami.c"
static const float mfact     = 0.57; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "",      tile },    /* first entry is default */
	{ "",      NULL },    /* no layout function means floating behavior */
	{ "",      monocle },
	{ "畳",     tatami },
	{ "|M|",    centeredmaster },
	{ ">M>",    centeredfloatingmaster },
};

/* custom symbols for nr. of clients in monocle layout */
/* when clients >= LENGTH(monocles), uses the last element */
static const char *monocles[] = { "󰎤", "󰼐", "󰼑", "󰼒", "󰼓", "󰼔", "󰼕", "󰼖", "󰼗", "󰼘" };

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };
#include "shift-tools.c"
static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ 0,				XK_Print,  spawn,	   SHCMD("~/.dwm/screenshot.sh") },
	{ ShiftMask,			XK_Print,  spawn,	   SHCMD("~/.dwm/screeenshotsel.sh") },
	{ 0,		XF86XK_MonBrightnessDown,  spawn,	   {.v = dimmer } },
	{ 0,		XF86XK_MonBrightnessUp,    spawn,	   {.v = brighter } },
	{ 0,		XF86XK_AudioMute,	   spawn,	   {.v = mute_vol } },
	{ 0,		XF86XK_AudioLowerVolume,   spawn,	   {.v = down_vol } },
	{ 0,		XF86XK_AudioRaiseVolume,   spawn,	   {.v = up_vol } },
	{ 0,		XF86XK_AudioNext,   	   spawn,	   {.v = next } },
	{ 0,		XF86XK_AudioPrev,   	   spawn,	   {.v = prev } },
	{ 0,		XF86XK_AudioPlay,   	   spawn,	   {.v = play } },
	{ MODKEY,			XK_o,	shiftviewclients,  { .i = +1 } },
	{ MODKEY|ShiftMask,		XK_o,	 shiftview,	   { .i = +1 } },
	{ MODKEY|ShiftMask,		XK_i,	 shiftview,	   { .i = -1 } },
	{ Mod4Mask|ControlMask,	    XK_Right,	 shiftview,	   { .i = +1 } },
	{ Mod4Mask|ControlMask,     XK_Left,	 shiftview,	   { .i = -1 } },
	{ MODKEY,			XK_i,	shiftviewclients,  { .i = -1 } },
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_n,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_b,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY|ShiftMask,		XK_h,      shiftboth,      { .i = -1 } },
	{ MODKEY|ControlMask,		XK_h,      shiftswaptags,  { .i = -1 } },
	{ MODKEY|ControlMask,		XK_l,      shiftswaptags,  { .i = +1 } },
	{ MODKEY|ShiftMask,             XK_l,      shiftboth,      { .i = +1 } },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_y,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_z,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_x,      setlayout,      {.v = &layouts[5]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_minus,  setgaps,        {.i = -5 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = +5 } },
	{ MODKEY|ShiftMask,             XK_minus,  setgaps,        {.i = GAP_RESET } },
	{ MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = GAP_TOGGLE} },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quitprompt,     {0} },
	{ Mod4Mask,			XK_l,		spawn,	   SHCMD("slock")},
	{ Mod4Mask,			XK_space,	spawn,	   SHCMD("~/.dwm/imetoggle.sh") },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
