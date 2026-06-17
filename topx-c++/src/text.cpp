#include "Externs.h"
#include "Types.h"
#include "text.h"
#include <string>

extern u16 text_y_pos;
extern u16 text_x_pos;
extern u8 text_color;
extern u8* msg_ptr;
extern u16 start_x_pos;
extern u16 box_width;
extern u8 x_char_index;
extern u16 current_char;
extern u8 msg_size;
extern const char* msg_skit_prompt;
extern u8 skits_played[33];
extern u32 game_mode;
extern u16 last_talk;
extern u16 talk_no;
extern u8 skit_status1;
extern u8 skit_status2;

extern PARTY party_data; // global at 0x9088ED0
extern u8 monsterbook_sort_lut[];
extern u32 mon_book_entries[256];
extern u32 MonNum; // global at 0x89BBAC8
extern u32 mon_book_cur;
extern MonsterData mon_dat[]; // global at 0x8C65F84

extern "C"
{
	u32 cur_line_width;
	u32 my_box_width;

	static inline u16 read_u16(const u8* p)
	{
		return (u16)(p[0] | (p[1] << 8));
	}

	static inline bool isOneByteEncoding(const u8* p)
	{
		return read_u16(p) >= 0x100;
	}

	void newWriteStrAndNum(void* unk, int x, int y, int spacer, u8* str, int num, int numDigits)
	{
		set_str_cursor(x, y, 0);
		add_str_prim(unk, str, 0, 1, 0, 0);
		set_str_cursor(x + spacer, y, 0);
		add_dec_prim(unk, num, numDigits, 0, 0, 0);
	}

	int getStringSize(u8* str)
	{
		int cnt = 0;
		bool oneByte = isOneByteEncoding(str);
		while (1)
		{
			if (oneByte)
			{
				u8 chr = str[0];
				if (chr == 0)
					break;
				cnt++;
				str++;
			}
			else
			{
				u16 chr = read_u16(str);
				if (chr == 0)
					break;
				cnt++;
				str += 2;
			}
		}
		return cnt;
	}
	int getStringWidth(u8* str)
	{
		u32 len = 0;

		bool oneByte = isOneByteEncoding(str);

		if (!oneByte)
		{
			while (true)
			{
				u16 chr = read_u16(str);
				str+=2;
				if (chr == 0)
				{
					// end condition
					return len;
				}
                else if (chr == 7)
                {
                    len += get_word_length(get_party_name(read_u16(str)));
                    str += 2;
                } else {
                    len += get_char_width(chr - 0x10);
                }
			}
		}
		else
		{
			while (true)
			{
				u8 chr = str[0];
				str++;
				if (chr == 0)
				{
					// end condition
					return len;
				}
				else if (chr == 7)
				{
                    len += get_word_length(get_party_name(read_u16(str)));
					str += 2;
				} else {
                    len += get_char_width(chr - 0x10);
                }
			}
		}
	}
	
	int getStringWidthMenu(u8* str)
	{
		u32 len = 0;

        while (true)
        {
            u8 chr = str[0];
            str++;
            if (chr == 0)
            {
                // end condition
                return len;
            }
            len += menu_get_char_width(chr - 0x10);
        }
	}

	u32 get_word_length(u8* str)
	{
		u32 len = 0;
		bool oneByte = isOneByteEncoding(str);

		if (!oneByte)
		{
			while (true)
			{
				u16 chr = read_u16(str);
				str += 2;
				if (chr == ' ' - 0x10 || chr == 0 || chr == 3 || chr == 4 || chr == 13 || chr == 14 || chr == 15)
				{
					// end condition
					return len;
				}
				else if (chr == 6)
				{
					chr = read_u16(str);
					str += 2;
				}
				else if (chr == 7)
				{
					len += get_word_length(get_party_name(read_u16(str)));
					str += 2;
				}
				else if (chr == 8)
				{
					len += get_word_length(get_item_name(read_u16(str)));
					str += 2;
				}
				else if (chr == 9)
				{
					u8 unk[6] = { 0,0,0,0,0,0 };
					short unk2 = 0;
                    u8* substring = get_sys_msg_ptr(read_u16(str), unk, &unk2);

                    if (substring) {
                        len += get_word_length(substring);
                    }
                    else {
                        // button prompts
                        len += 14;
                    }
					str += 2;
				}
				else
				{
					len += get_char_width(chr - 0x10);
				}
			}
		}
		else
		{
			while (true)
			{
				u8 chr = str[0];
				str++;
				if (chr == ' ' - 0x10 || chr == 0 || chr == 3 || chr == 4 || chr == 13 || chr == 14 || chr == 15)
				{
					// end condition
					return len;
				}
				else if (chr == 6)
				{
					chr = read_u16(str);
					str += 2;
				}
				else if (chr == 7)
				{
					len += get_word_length(get_party_name(read_u16(str)));
					str += 2;
				}
				else if (chr == 8)
				{
					len += get_word_length(get_item_name(read_u16(str)));
					str += 2;
				}
				else if (chr == 9)
				{
					u8 unk[6] = { 0,0,0,0,0,0 };
					short unk2 = 0;
                    u8* substring = get_sys_msg_ptr(read_u16(str), unk, &unk2);

                    if (substring) {
                        len += get_word_length(substring);
                    }
                    else {
                        // button prompts
                        len += 14;
                    }

					str += 2;
				}
				else
				{
					len += get_char_width(chr - 0x10);
				}
			}
		}
	}

	u32 get_next_word_length()
	{
		u8* str = msg_ptr;
		return get_word_length(str);
	}

	void Process_Line_Break_Check(u16 chr)
	{
		if (x_char_index == 0)
		// reset current line width - only happens on start of text & actual linebreaks in text
		{
			cur_line_width = 5; // init to 5 (spacing on left/right)
			my_box_width = box_width - 9; // 4 extra space we never use + 5 on right
		}
		cur_line_width += get_char_width(chr-0x10); // add current character width to line width
		// if character is a space, check if need to linebreak (maybe look at -'s as well?)
		if (chr == ' ' - 0x10)
		{
			// get length of next word
			u32 next_word_len = get_next_word_length();
			// if line width + new word length is greater than box width - 5 (spacing)
			// width doesnt include extra shadow, so using >= instead of >
			if ((cur_line_width + next_word_len) >= ((u32)my_box_width))
			{
				s32 leftover_space = ((s32)my_box_width) - (s32)(cur_line_width) - 4;
				if (leftover_space < 0)
					leftover_space = 0;
				// uncomment this line to enable width adjustment --
				// my_box_width -= leftover_space;

				// process line break, reset current line width
				msg_next_line();
				cur_line_width = 5;
				// adjust the current character to the next character
				// the current character is drawn after this code runs, don't wanna draw the space
				// after the line break

				// adjust msg_ptr and current_char safely based on encoding
				bool oneByte = isOneByteEncoding(msg_ptr);

				if (oneByte)
				{
					current_char = msg_ptr[0];

                    if (current_char == 13 || current_char == 14)
                    {
                        msg_ptr += 5;
                    }
                    else if (current_char == 6 || current_char == 7 || current_char == 8 || current_char == 9)
                    {
                        msg_ptr += 3;
                    }
                    else
					{
						msg_ptr += 1;
						// need to add width of first character otherwise its skipped
						cur_line_width += get_char_width(current_char - 0x10);
					}
				}
				else
				{
					current_char = read_u16(msg_ptr);

                    if (current_char == 13 || current_char == 14)
                    {
                        msg_ptr += 6;
                    }
                    else if (current_char == 6 || current_char == 7 || current_char == 8 || current_char == 9)
                    {
                        msg_ptr += 4;
                    }
                    else
					{
						msg_ptr += 2;
						cur_line_width += get_char_width(current_char - 0x10);
					}
				}
			}
		}
	}

    void masteredMsg(char* dest, const char* arte_name) {
        // get pointer to "mastered" message
        const char* fmt = btl_str2(4);
        sprintf(dest, fmt, arte_name);
    }

    void discardMsg(void* ot, const char* item_name, const char* msg) {
        char dest[64];
        sprintf(dest, msg, item_name);
        add_str_prim(ot, (u8*)dest, 2, 0, 0, 0);
    }

    void displayCookingSub(void* ot, const char* str) {
        set_str_cursor(0x2c, 0xc0, 0);
        add_str_prim(ot, (u8*)str, 2, 0, 0, 0);
    }

    #define LINE_BUFFER_SIZE 1024

    static short skit_csr_y;

    void displayLineCentered(void *ot, const char *str) {
        u32 str_width = getStringWidth((u8*)str);
        short pos_x = (480 - str_width) / 2;

        set_str_cursor(pos_x, skit_csr_y, 0);
        add_str_prim(ot, (u8*)str, 2, 0, 0, 0);

        // advance to next line
        skit_csr_y += 16;
    }

    bool wasSkitPlayed(int n) {
        return (skits_played[n >> 3] & (1 << (n & 7))) != 0;
    }

    static u8 skit_prompt_timeout = 0;
    static u16 skit_available = 0;

    void displaySkitPrompt(void *ot) {
        // 0D = world map
        if (game_mode != 0xd) {
            return;
        }

        if (talk_no != 0) {
            return;
        }

        // skit button blocked unless zero
        if (skit_status1) {
            return;
        }

        // skits blocked unless this is zero
        if (skit_status2 & 4) {
            return;
        }

        #if 0
        char dest[64];
        char num[16];

        if (wasSkitPlayed(skit_num - 1)) {
            return;
        }

        sprintf(num, "%d", skit_num);
        cnv_ascii2ank((u8*)num);
        sprintf(dest, msg_skit_prompt, num);
        #endif

        if (--skit_prompt_timeout <= 0) {
            skit_available = get_available_skit();
            skit_prompt_timeout = 120;
        }

        if (!skit_available) {
            return;
        }

        if (get_talk_flag(talk_no)) {
            return;
        }

        if (skit_available == last_talk) {
            return;
        }

        set_str_cursor(16, 248, 0);
        add_str_prim(ot, (u8*)msg_skit_prompt, 2, 0, 0, 0);
    }

    void displayCentered(void *ot, const char* str, short pos_y) {
        if (str == NULL) {
            return;
        }

        skit_csr_y = pos_y;

        static char buffer[LINE_BUFFER_SIZE];

        const char *src_ptr = str;
        char *dest_ptr = buffer;

        while (dest_ptr < buffer + LINE_BUFFER_SIZE - 1) {
            if (*src_ptr == '\0') {
                break;
            }

            switch (*src_ptr) {
                case 0x5:
                case 0x6:
                case 0x7:
                case 0x8:
                case 0x9:
                    for (short i = 0; i < 2; i++) {
                        *dest_ptr++ = *src_ptr++;
                    }
                    break;
                case 0xA:
                case 0xB:
                case 0xC:
                case 0xD:
                case 0xE:
                    for (short i = 0; i < 4; i++) {
                        *dest_ptr++ = *src_ptr++;
                    }
                    break;
            }

            *dest_ptr++ = *src_ptr++;
        }

        *dest_ptr = '\0';

        char *current_start = buffer;
        char *current_pos = buffer;

        while (*current_pos != '\0') {
            switch (*current_pos) {
                // newline
                case 0x3:
                    *current_pos = '\0';

                    if (*current_start != '\0') {
                        displayLineCentered(ot, current_start);
                    }

                    current_start = current_pos + 1;
                    break;

                // skip other tags
                case 0x5:
                case 0x6:
                case 0x7:
                case 0x8:
                case 0x9:
                    current_pos += 2;
                    break;
                case 0xA:
                case 0xB:
                case 0xC:
                case 0xD:
                case 0xE:
                    current_pos += 4;
                    break;
            }

            current_pos++;
        }

        if (*current_start != '\0') {
            displayLineCentered(ot, current_start);
        }
    }

    #define SPACE   0x10
    #define NEWLINE 0x3
    #define NULLVAL 0

    void displayWrapped(void *ot, u16* input, u16 max_pixel_width) {
        u16 output[1024];

        int current_line_width = 0;
        int out_idx = 0;
        int in_idx = 0;

        int space_width = get_char_width(SPACE - 0x10);

        while (input[in_idx] != NULLVAL) {
            // Handle Whitespace & Hard Newlines
            while (input[in_idx] == SPACE || input[in_idx] == NEWLINE) {
                if (input[in_idx] == NEWLINE) {
                    output[out_idx++] = NEWLINE;
                    current_line_width = 0;
                }
                in_idx++;
            }

            if (input[in_idx] == NULLVAL) break;

            // Identify word boundaries (including tags as part of a word)
            int word_start = in_idx;
            int word_pixel_width = 0;

            while (input[in_idx] != SPACE && input[in_idx] != NEWLINE && input[in_idx] != NULLVAL) {
                // Name tag
                if (input[in_idx] == 7) {
                    u16 party_id = input[in_idx + 1];
                    word_pixel_width += get_word_length(get_party_name(party_id));
                    in_idx += 2;
                } else {
                    // Calculate width for standard characters
                    // We use the swap trick here for a "sub-word" if it's mixed with tags
                    u16 sub_start = in_idx;
                    while (input[in_idx] != SPACE && input[in_idx] != NEWLINE && 
                            input[in_idx] != NULLVAL && input[in_idx] != 7) {
                        in_idx++;
                    }

                    u16 saved = input[in_idx];
                    input[in_idx] = NULLVAL;
                    word_pixel_width += get_word_length((u8*)&input[sub_start]);
                    input[in_idx] = saved;
                }
            }

            // Wrap Logic
            if (current_line_width > 0 && (current_line_width + space_width + word_pixel_width > max_pixel_width)) {
                output[out_idx++] = NEWLINE;
                current_line_width = word_pixel_width;
            } else {
                if (current_line_width > 0) {
                    output[out_idx++] = SPACE;
                    current_line_width += space_width;
                }
                current_line_width += word_pixel_width;
            }

            // Copy word/tags to output buffer
            // Note: in_idx is already at the end of the word segment
            for (int i = word_start; i < in_idx; i++) {
                output[out_idx++] = input[i];
            }
        }

        output[out_idx] = NULLVAL;

        add_str_prim(ot, (u8*)output, 2, 0, 1, 0);
    }

    void displayWrappedMain(void *ot, u16 posx, u16 posy, u16* str) {
        set_str_cursor(posx, posy, 0);
        displayWrapped(ot, str, 256);
    }

    void displayWrappedBattle(void *ot, u16* str) {
        displayWrapped(ot, str, 208);
    }

    void displayWrappedMainTitles(void *ot, u16 posx, u16 posy, u16* str) {
        set_str_cursor(posx, posy, 0);
        displayWrapped(ot, str, 300);
    }

    void monsterbookFixNumbering() {
        int activeCount = 0;

        for (size_t i = 0; i < 256; i++) {
            unsigned short sorted_id = monsterbook_sort_lut[i];
            unsigned short id = mon_dat[sorted_id].monsterID;

            if (party_data.monsters_seen[id] != 0) {
                mon_book_entries[activeCount] = sorted_id;
                activeCount++;
            }
        }

        mon_book_cur = 0;
    }
};
