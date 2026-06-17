#pragma once
// SUIKODEN 1
#include "Types.h"
//#include "TextHandler.h"

extern "C"
{
	void add_knj_prim(u32 chr);
	void msg_next_line();
	void set_str_cursor(int x, int y, int w);
	void add_str_prim(void* unk, u8* txt, int unk2, int unk3, int unk4, int unk5);
	void add_dec_prim(void* unk, int number, int numDigits, int unk3, int unk4, int unk5);
	u32 get_char_width(u32 chr);
	u32 menu_get_char_width(u32 chr);
	const char* btl_str2(u32 num);
	u8* get_party_name(int index);
	u8* get_item_name(int index);
	u8* get_sys_msg_ptr(int index, u8 unk1[6], short* unk2);
    void cnv_ascii2ank(u8* txt);
    unsigned short get_available_skit();
    bool get_talk_flag(u16 talk_no);
}

//extern bool debugMode;
