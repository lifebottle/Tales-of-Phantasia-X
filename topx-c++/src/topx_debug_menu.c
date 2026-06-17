// #####################################################
//  TYPES / DEFINES
// #####################################################

// Yes, we are lying, it's to appease armips
#ifdef _MSC_VER
#define IN_BSS
#else
#define IN_BSS __attribute__((section(".data")))
#endif

#define NULL ((void*)(0))

typedef signed char    s8;
typedef signed short   s16;
typedef signed int     s32;
typedef signed long    s64;

typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;
typedef unsigned long  u64;

typedef float  f32;
typedef double f64;

#define BTN_SELECT (0x0001)
#define BTN_START (0x0008)
#define BTN_UP (0x0010)
#define BTN_RIGHT (0x0020)
#define BTN_DOWN (0x0040)
#define BTN_LEFT (0x0080)
#define BTN_SHLDR_L (0x0100)
#define BTN_SHLDR_R (0x0200)
#define BTN_TRIANGLE (0x1000)
#define BTN_CIRCLE (0x2000)
#define BTN_CROSS (0x4000)
#define BTN_SQUARE (0x8000)

#define GAME_MODE_OPENING (3)
#define GAME_MODE_NEW_GAME (6)
#define GAME_MODE_LOAD (7)
#define GAME_MODE_CUSTOM (8)
#define GAME_MODE_SNDMODE (9)
#define GAME_MODE_DEBUG (10)
#define GAME_MODE_NMAP (12)
#define GAME_MODE_FIELD (13)
#define GAME_MODE_BATTLE (14)
#define GAME_MODE_ARCHE (15)
#define GAME_MODE_NDX (16)

#define DECIDE_NONE (0)
#define DECIDE_YES (1)
#define DECIDE_NO (2)

#define SCDEB_NONE (0)
#define SCDEB_BATTLE (1)
#define SCDEB_MAP (2)
#define SCDEB_FLAG (3)
#define SCDEB_MOVIE (4)
#define SCDEB_MINI_GAME (5)
#define SCDEB_ENCOUNTER (6)
#define SCDEB_TALK (7)

#define CURSOR_SCROLLER (1 << 0)
#define CURSOR_FLAG_08 (1 << 3)
#define CURSOR_FLAG_10 (1 << 4)
#define CURSOR_FLAG_20 (1 << 5)
#define CURSOR_FLAG_40 (1 << 6)
typedef struct _RECT {
    /* 0x00 */ s16 x;
    /* 0x02 */ s16 y;
    /* 0x04 */ s16 w;
    /* 0x06 */ s16 h;
} RECT;

typedef struct _CUSTOM {
    /* 0x00 */ u8 vibration;
    /* 0x01 */ u8 msg_speed;
    /* 0x02 */ u8 battle_rank;
    /* 0x03 */ u8 unk3;
    /* 0x04 */ u8 unk4;
    /* 0x05 */ u8 unk5[0x3B - 0x5]; // Got lazy...
    /* 0x3B */ u8 unk3B;
} CUSTOM;

typedef struct _SCE {
    /* 0x000 */ u8 unk0[0x30];
    /* 0x030 */ s32 encount_stage;
    /* 0x034 */ s32 encount_group;
    /* 0x038 */ s32 encount_rate;
    /* 0x03C */ u8 unk3C[0x3A0 - 0x3C];
    /* 0x3A0 */ u8 debug;
    /* 0x3A1 */ u8 demo;
    /* 0x3A2 */ u8 inter;
    /* 0x3A3 */ u8 stop;
    /* 0x3A4 */ u8 unk3A4[0x508 - 0x3A4];
    /* 0x508 */ s32 inter_many;
    /* 0x50C */ u8 unk50C[0x594 - 0x50C];
    /* 0x594 */ u16 sce_loop;
} SCE;

typedef struct _PARTY {
    /* 0x000 */ u8 unk0[0xB70];
    /* 0xB70 */ u8 unkB70[12];
    /* 0xB7C */ u8 unkB7C[19];
    /* 0xB8F */ u8 unkB8F[0xBDC - 0xB8F];
    /* 0xBDC */ s32 curr_map; 
    /* 0xBE0 */ u32 unkBE0; 
    /* 0xBE4 */ u16 btl_stage;
    /* 0xBE6 */ u16 btl_group;
    /* 0xBE8 */ u8 unkBE8[0xC20-0xBE8];
    /* 0xC20 */ u8 unkC20[0x100];
} PARTY;

typedef s32 (*SCDEB_EXEC_FUNC)();
typedef void (*SCDEB_DSP_FUNC)();

#define CURSOR_USE_GRID (1)

typedef struct _CURSOR_NODE {
    /* 0x00 */ s16 x;
    /* 0x02 */ s16 y;
    /* 0x04 */ u8 up;
    /* 0x05 */ u8 right;
    /* 0x06 */ u8 down;
    /* 0x07 */ u8 left;
} CURSOR_NODE;


#define CURSOR_GRID_LOOP_HORIZONTAL (1 << 0)
#define CURSOR_GRID_LOOP_ROW (1 << 1)
#define CURSOR_GRID_LOOP_VERTICAL (1 << 2)

typedef struct _CURSOR_GRID {
    /* 0x00 */ u8 start_x;
    /* 0x01 */ u8 start_y;
    /* 0x02 */ u8 visible_cols;
    /* 0x03 */ u8 visible_rows;
    /* 0x04 */ u8 col_width;
    /* 0x05 */ u8 row_height;
    /* 0x06 */ u16 item_count;
    /* 0x08 */ u8 speed_x;
    /* 0x09 */ u8 speed_y;
    /* 0x0A */ u8 flags;
    /* 0x0B */ /* padding */
    /* 0x0C */ u16 scroll_dx;
    /* 0x0E */ u16 scroll_dy;
} CURSOR_GRID;

typedef union _CURSOR_DATA {
    CURSOR_NODE abs;
    CURSOR_GRID grid;
} CURSOR_DATA;

typedef struct _CURSOR {
    /* 0x00 */ void* data;
    /* 0x04 */ s16 index_now; // 1-based
    /* 0x06 */ s16 visible_items;
    /* 0x08 */ s16 scroll_top;
    /* 0x0A */ s16 x;
    /* 0x0C */ s16 y;
    /* 0x0E */ u8 status;
    /* 0x0F */ u8 changed;
    /* 0x10 */ s16 old_x;
    /* 0x12 */ s16 old_y;
} CURSOR;

// #####################################################
//  EXTERNS
// #####################################################

extern s32 get_pad_data(s16); // function at 0x88CC34C
extern s32 get_game_mode(); // function at 0x88AF154
extern void enable_csr_data(); // function at 0x88E40E8
extern void snd_si_se(s32); // function at 0x88E5994
extern void request_battle(s16, s16, s32); // function at 0x88D4030
extern void request_change_map(s32, s32, s32, s32, s16, s32); // function at 0x88D3DEC
extern void system_fade(s32, s32); // function at 0x88E5C74
extern void del_sce_loop(); // function at 0x88D27A8
extern void add_sce_loop(s16, s32, s32, s32, s32); // function at 0x88D26F8
extern void disable_sys_pad(); // function at 0x88D54FC
extern void enable_sys_pad(); // function at 0x88D5508
extern void request_play_movie(s32); // function at 0x88D473C
extern void request_mini_game(s32); // function at 0x88D4120
extern void request_talk(s16); // function at 0x88E8244
extern void init_encount_count(void); // function at 0x88D13C8
extern s32 get_pad_decide(void); // function at 0x88D13C8
extern s32 get_pad_rep(s16); // function at 0x88CC384
extern s32 set_pad_number(s32, s32, s32, s32, s32); // function at 0x88C8768
extern void set_csr_data_base(CURSOR*, s16, s16); // function at 0x88E4114
extern void start_csr_data(CURSOR*, s32); // function at 0x88E3EBC
extern s32 exec_csr_data(); // function at 0x88E3410
extern s16 get_csr_data_no(); // function at 0x88E4228
extern void add_csr_data_prim(void*, CURSOR*); // function at 0x88E44D4
extern void set_str_cursor(s16, s16, s16); // function at 0x088E0434
extern void move_str_cursor(s16, s16); // function at 0x88E0410
extern void add_str_prim(void*, void*, s32, char, char, s32); // function at 0x88E07B4
extern void add_dec_prim(void*, s32, s32, char, char, s32); // function at 0x88E0618
extern u16 get_pad_dat_csr(); // function at 0x88E4084
extern u16 get_pad_new_csr(); // function at 0x88E3FD4
extern s32 get_pad_new(s16); // function at 0x88CC368
extern s32 pad_read(s8); // function at 0x8CC1AC
extern void add_window_prim(void*, RECT*, s32, s32, s32, s32); // function at 0x88A8848
extern void init_msg_ot(void*); // function at 0x88E32F0
extern s32 debug_menu(void*, s32); // function at 0x8941944
extern void init_party_main(void*); // function at 0x88EB95C
extern void get_class(s32); // function at 0x88CF508
extern SCE sce; // global at 0x9089D04
extern PARTY party_data; // global at 0x9088ED0
extern void *intp; // global at 0x9033010
extern void *system_ot; // global at 0x9087DC0
extern void *original_system_ot; // global at 0x9087DC4
extern s32 sce_loop_skip; // global at 0x9033020
extern s16 csr_r; // global at 0x9087B40
extern s16 csr_x; // global at 0x9087B44
extern s16 csr_y; // global at 0x9087B46
extern char csr_l; // global at 0x9087B49
extern char sys_pad_flag; // global at 0x8C28FD0
extern s32 sce_off; // global at 0x9033018
extern s32 last_movie; // global at 0x8E2C7C8
extern s16 last_talk; // global at 0x8C5D81C
extern CUSTOM custom; // global at 0x9089C8C
extern void* init_dat; // global at 0x8C5E43C
extern int init_type; // global at 0x8C5E48C
extern int MonNum; // global at 0x89BBAC8
extern char mon_dat[]; // global at 0x8C65F84
extern char mon[]; // global at 0x908AEC0

// Forward declarations
s32 call_scdeb_win();
s32 exec_scdeb_window();
void dsp_scdeb_window();
static void set_scdeb_rect(s16 x_fld, s16 y_fld, s16 x_def, s16 y_def, s16 w, s16 h);
void init_scdeb_window();
s32 check_scdeb_window();
s32 exec_scdeb_battle();
void dsp_scdeb_battle();
s32 get_scdeb_gp();
s32 get_scdeb_st();
s32 exec_scdeb_map();
void dsp_scdeb_map();
s32 get_scdeb_map();
s32 exec_scdeb_flag();
void dsp_scdeb_flag();
s32 get_scdeb_sce();
s32 get_scdeb_demo();
s32 get_scdeb_fade();
s32 get_scdeb_wait();
s32 get_scdeb_inter();
s32 get_scdeb_menu();
s32 exec_scdeb_movie();
void dsp_scdeb_movie();
s32 get_scdeb_movie();
s32 exec_scdeb_mg();
void dsp_scdeb_mg();
s32 get_scdeb_mg();
s32 exec_scdeb_encnt();
void dsp_scdeb_encnt();
s32 get_scdeb_encnt();
s32 exec_scdeb_talk();
void dsp_scdeb_talk();
s32 get_scdeb_talk();
void init_dbg_mn_ot(void* n_ot);


// #####################################################
//  Replacements
// #####################################################

extern void disable_mcard();
extern void set_game_mode(s32);
extern void title_fade(s32, s32);
extern void snd_stop_seq();

typedef struct _TITLE_ITEM {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    s16 unk6;
} TITLE_ITEM;

extern s16 title_step;
extern s32 title_time;
extern s32 sel_title;
extern s32 title_fade_mode;
extern s16 logo_move_cnt;
extern s16 back_shade;
extern TITLE_ITEM title_menu_dat[5];

void sel_title_main(void) {
    s32 pad;
    s32 max_index;

    if (title_step == 98) {
        title_time--;
        if (title_time == 0) {
            title_step = 99;
            title_time = 900;
            logo_move_cnt = 0;
        }
    }
    else if ((title_step == 96) && (title_fade_mode == 0x0)) {
        if (title_time != 0) {
            title_time--;
        }
        if (title_time == 0) {
            disable_mcard();
            set_game_mode(GAME_MODE_OPENING);
            title_fade(1, 4);
        }
    }

    if (sce.debug != 0) {
        max_index = 4;
    } else {
        max_index = 3;
    }

    for (; (title_menu_dat[sel_title].unk6 == 0 || (sel_title > max_index)); sel_title--);

    if (title_fade_mode == 0 && back_shade == 128 && title_step == 98) {
        s32 t_sel;

        pad = get_pad_rep(0);

        if (pad & BTN_UP) {
            if (--sel_title < 0) {
                sel_title = max_index;
            }

            for (t_sel = sel_title; t_sel >= 0; t_sel--) {
                if (title_menu_dat[t_sel].unk6) {
                    snd_si_se(0);
                    sel_title = t_sel;
                    title_time = 900;
                    break;
                }
            }
        }

        if (pad & BTN_DOWN) {
            if (++sel_title >= max_index+1) {
                sel_title = 0;
            }

            for (t_sel = sel_title; t_sel <= max_index+1; t_sel++) {
                if (title_menu_dat[t_sel].unk6) {
                    snd_si_se(0);
                    sel_title = t_sel;
                    title_time = 900;
                    break;
                }
            }
        }

        pad = get_pad_new(0);
        if (pad & BTN_CIRCLE || pad & BTN_START) {
            disable_mcard();
            snd_si_se(1);
            switch (sel_title) {
                case 0:
                    set_game_mode(GAME_MODE_NEW_GAME);
                break;
                case 1:
                    set_game_mode(GAME_MODE_LOAD);
                break;
                case 2:
                    set_game_mode(GAME_MODE_CUSTOM);
                break;
                case 3:
                    set_game_mode(GAME_MODE_SNDMODE);
                break;
                case 4:
                    set_game_mode(GAME_MODE_DEBUG);
                break;
            }
            title_fade(1, 16);
            snd_stop_seq();
        }
    }
    return;
}

typedef struct SceCtrlData {
    u32 TimeStamp;
    u32 Buttons;
    u8  Lx;
    u8  Ly;
    u8  Rsrv[6];
} SceCtrlData;

extern void sceGuEnable(s32);
extern void sceGuBlendFunc(s32, s32, s32, s32, s32);
extern void sceGuDisable(s32);
extern void sceGuColor(u32);
extern void sceGuCopyImage(s32, s32, s32, s32, s32, s32, void*, s32, s32, s32, void*);
extern void sceGuColor(u32);
extern void sceGuSpriteMode(s32, s32, s32, s32);
extern void sceGuDrawSprite(s32, s32, s32, s32, s32, s32, s32);
extern void sceGuTexFlush();
extern void g_dlFinish();
extern void g_swapBuffers();
extern void g_dlSwap();
extern void g_dlStart();
extern void g_waitVblank();
extern void *get_fps_ptr(void*, s32, s32*);
extern void *malloc_heap(s32, s32);
extern void free_heap(void*);
extern s32 set_cdread_adr_block(s32, void*, s32, s32);
extern void* g_getRenderTargetAddr(s32);
extern void sceKernelDcacheWritebackAll();
extern s32 sceDisplayGetVcount();
extern void sceCtrlPeekBufferPositive(SceCtrlData*, s32);
extern void sceKernelExitThread(s32);
extern void sc_decode(void*, void*);
extern void *memset(void*, s32, u32);

// Function Name
#define SCEGU_DEPTH_TEST (1)
#define SCEGU_BLEND (4)
#define SCEGU_TEXTURE (9)
#define SCEGU_FOG (7)
#define SCEGU_LIGHTING (10)
#define SCEGU_COLOR_TEST (17)

// Blend Operation
#define SCEGU_ADD (0) /* ( Cs @ A ) + ( Cd @ B ) */

// Blend Function
#define SCEGU_SRC_ALPHA (2)
#define SCEGU_ONE_MINUS_SRC_ALPHA (3)

// Texture Pixel Format
#define SCEGU_PF8888 (3)

extern u8 VRAM_ADDR[]; // 0x4110000
#define ARRAY_COUNT(_arr) (sizeof((_arr)) / sizeof((_arr)[0]))

static u32 logo_counter;

void fade(int mode) {
    s32 i;
    s32 alpha;
    void *tgt;
    
    sceGuEnable(SCEGU_BLEND);
    sceGuBlendFunc(SCEGU_ADD, SCEGU_SRC_ALPHA, SCEGU_ONE_MINUS_SRC_ALPHA, 0, 0);
    sceGuDisable(SCEGU_TEXTURE);
    sceGuDisable(SCEGU_DEPTH_TEST);
    sceGuDisable(SCEGU_COLOR_TEST);
    sceGuDisable(SCEGU_LIGHTING);
    sceGuDisable(SCEGU_FOG);
    
    for (i = 0, alpha = 0; i < 60; i++) {
        if (mode == 0) {
            alpha = (i * 0xFF) / 59;
        } else {
            alpha = 0xFF - ((i * 0xFF) / 59);
        }
        sceGuColor(alpha << 0x18 | 0xFFFFFF);
        tgt = g_getRenderTargetAddr(1);
        sceGuCopyImage(SCEGU_PF8888, 0, 0, 480, 272, 0x200, VRAM_ADDR, 0, 0, 0x200, tgt);
        sceGuSpriteMode(0, 0, 480, 272);
        sceGuDrawSprite(0, 0, 0, 0, 0, 0, 0);
        g_dlFinish();
        g_waitVblank();
        g_swapBuffers();
        g_dlSwap();
        g_dlStart();
    }
    return;
}

#define LOGOS_FILE (37)
char logos_path[] = "game/logos.acf";

// replaces 0x88B002C
s32 startup_logos_thread() {
    SceCtrlData pad;
    void* logos;
    s32 logos_count;
    s32 i;
    
    logo_counter = 0;
    memset(VRAM_ADDR, 0, 0x88000);
    logos = malloc_heap(0x18000,0x0);
    set_cdread_adr_block(LOGOS_FILE, logos, 0, 0);
    logos_count = ((u8*)logos)[0];

    for (i = 0; i < logos_count; i++) {
        void* curr_logo = get_fps_ptr(logos, i, NULL); 
        fade(0);
        sc_decode(VRAM_ADDR, curr_logo);
        sceKernelDcacheWritebackAll();
        fade(1);

        // wait 2 seconds
        logo_counter = sceDisplayGetVcount();
        while ((sceDisplayGetVcount() - logo_counter) < 60) {
            sceCtrlPeekBufferPositive(&pad, 1);
            if (pad.Buttons & BTN_START) {
                break;
            }
            g_waitVblank();
        }
    }
    
    fade(0);
    free_heap(logos);
    return 0;
}

typedef struct _BTL_DR {
    u8 unk0[0x4A0 - 0x0];
    u8 unk4A0[0x8D0 - 0x4A0];
    u8 unk8D0;
} BTL_DR;

typedef struct _BTL_WORK {
    u8 unk0[0x28 - 0x0];
    BTL_DR* unk28;
    u8 unk2C[0x31380 - 0x2C];
    s32 unk31380;
} BTL_WORK;

extern void snd_set_voice(s32, s32, s32, s32);
extern void double_buffer_change(BTL_WORK*);
extern void pchr_disp(BTL_WORK*);
extern void snd_vsync_callback();
extern void PutDispEnv(void*);
extern void g_sync();
extern void load_knj_vram();
extern void trans_start(BTL_WORK*);
extern void g_setRenderTarget(s32);
extern int g_getRenderTargetFormat(s32);
extern void sceGuTexMode(s32, s32, s32, s32);
extern void sceGuTexImage(s32, s32, s32, s32, void*);
extern void func_0896006C(void*);
extern void *func_0895FBD8();
extern void func_0892BE00(s32, s32, s32, s32, s16, s16, s16, s32);
extern void sceGuDepthFunc(int);
extern void DrawOTagNoScale(void*, s32, s32);
extern void g_dlFinish();
extern void g_swapBuffers();
extern void g_dlSwap();
extern void g_dlStart();
extern s32 snd_get_voice_status();
extern void snd_set_seq(s32, s32, s32, s32);
extern void VSync(s32);

extern u16 btl_quote_num;
extern u16 btl_quote_timeout;
extern u16 btl_quote_ptrs[];
extern s32 psFbDisplayX;
extern s32 psFbDisplayY;
extern s32 psFbDisplayW;
extern void displayCentered(void *ot, const char* str, short pos_y);

// replaces the original at 0x888DBD4
void opening_start(BTL_WORK* btl) {

    snd_set_voice(0, 0x13, 0, 0x7f);
    do {
        double_buffer_change(btl);

        // The logic that displayCentered runs from stars here
        pchr_disp(btl);

        if (btl_quote_num != 0) {
            u16 p = btl_quote_ptrs[btl_quote_num];
            displayCentered(&btl->unk28->unk4A0, &((const char*)btl_quote_ptrs)[p], 8);
        }

        // setup
        PutDispEnv(btl->unk28);
        g_sync();
        load_knj_vram();
        trans_start(btl);

        // Render background, in all it's nothingness
        g_setRenderTarget(1);
        sceGuTexMode(g_getRenderTargetFormat(3), 0, 0, 0);
        sceGuTexImage(0, 0x200, 0x200, 0x200, g_getRenderTargetAddr(3));
        sceGuEnable(SCEGU_TEXTURE);
        sceGuTexFlush();
        func_0892BE00(0, 0, 0x1e0, 0x110, psFbDisplayX, psFbDisplayY, psFbDisplayW, 0xb9);

        // No depth
        sceGuDepthFunc(1);
        DrawOTagNoScale(&btl->unk28->unk8D0, 0, 0);
        g_dlFinish();

        // inform the render manager class
        func_0896006C(func_0895FBD8());
        g_swapBuffers();
        g_dlSwap();
        // No need to stall
        g_dlStart();

        // from original
        snd_vsync_callback();
    } while (snd_get_voice_status() != 0);

    // make the line disappear
    btl_quote_num = 0;
    btl_quote_timeout = 0;

    // start the kickass bgm
    snd_set_seq(1, 0, 1, 0);
    VSync(270);
    return;
}

// replaces the original at 0x88E5A80
// Supposedly pauses the game on SQUARE+START, just want to test it, remove if uninteresting
void debug_pause(void) {
    static s32 next_frame;
    
    if (((get_pad_data(0) & BTN_SQUARE) && (get_pad_new(0) & BTN_START)) || (next_frame != 0x0)) {
        next_frame = 0x0;
        do {
            pad_read(0x1);
            if ((get_pad_new(0) & BTN_START) && (get_pad_data(0) & BTN_SQUARE)) {
                next_frame = 1;
                break;
            }
        } while ((get_pad_data(0) & BTN_SQUARE) && (get_pad_new(0) & BTN_START));
        pad_read(1);
    }
    return;
}


// These 2 caught my eye, but not sure what they do exactly, remove if uninteresting
// injected at 0x088EFF44
void __mon_init() {
    s32 i;
    if (sce.debug == 1) {
        for (i = 0; i < 0xff; i++) {
            party_data.unkC20[i] = 0xff;
        }
        party_data.unkC20[MonNum] = 0xff;
    }
}

// injected at 0x088F061C
void __mon_vsync_loop() {
    if (sce.debug == 1) {
        set_str_cursor(0x98, 0x14, 0x0);
        add_dec_prim(mon + ((int*)(mon + 12))[0] + 0x80, party_data.unkC20[*(s16 *)(mon_dat + MonNum * 0x34)], 3, 0, 0, 0);

        // restore original cursor position before patching
        set_str_cursor(0xe0, 0x14, 0);
    }
}

// Debug party stats, might be too much
// u8 debug_party_dat[640] = {
//     0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x04, 0x00, 0xE8, 0x03, 0x64, 0x00, 0x28, 0x00, 
//     0x05, 0x00, 0x0A, 0x00, 0x32, 0x00, 0xA1, 0x00, 0xFC, 0x00, 0x13, 0x01, 0x1E, 0x01, 0x32, 0x01, 
//     0x62, 0x01, 0x6B, 0x01, 0x00, 0xA0, 0x01, 0x01, 0x02, 0x03, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x05, 0x03, 0x00, 
    
//     0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x04, 0x00, 0xE8, 0x03, 0x64, 0x00, 0x28, 0x00, 
//     0x05, 0x00, 0x0A, 0x00, 0x32, 0x00, 0xDC, 0x00, 0x08, 0x01, 0x00, 0x00, 0x26, 0x01, 0x3A, 0x01, 
//     0x00, 0x00, 0x00, 0x00, 0x02, 0x50, 0x00, 0x5B, 0x5C, 0x5D, 0x5E, 0x5F, 0x60, 0x61, 0x62, 0x63, 
//     0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6A, 0x6B, 0x6C, 0x6D, 0x6E, 0x6F, 0x00, 0x00, 0x00, 0x00, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    
//     0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x04, 0x00, 0xE8, 0x03, 0x64, 0x00, 0x28, 0x00, 
//     0x05, 0x00, 0x0A, 0x00, 0x32, 0x00, 0xEF, 0x00, 0x08, 0x01, 0x00, 0x00, 0x2D, 0x01, 0x3A, 0x01, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x37, 0x38, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    
//     0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x04, 0x00, 0xE8, 0x03, 0x64, 0x00, 0x28, 0x00, 
//     0x05, 0x00, 0x0A, 0x00, 0x32, 0x00, 0xE6, 0x00, 0x08, 0x01, 0x00, 0x00, 0x26, 0x01, 0x00, 0x00, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x4F, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    
//     0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x04, 0x00, 0xE8, 0x03, 0x64, 0x00, 0x28, 0x00, 
//     0x05, 0x00, 0x0A, 0x00, 0x32, 0x00, 0xCF, 0x00, 0xFC, 0x00, 0x00, 0x00, 0x26, 0x01, 0x32, 0x01, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x25, 0x26, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    
//     0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x04, 0x00, 0xE8, 0x03, 0x64, 0x00, 0x28, 0x00, 
//     0x05, 0x00, 0x0A, 0x00, 0x32, 0x00, 0xF6, 0x00, 0x0F, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2E, 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    
//     0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x90, 0x00, 0x0A, 0x00, 0x0A, 0x00, 
//     0x02, 0x00, 0x10, 0x00, 0x32, 0x00, 0xBE, 0x00, 0x0D, 0x01, 0x00, 0x00, 0x2B, 0x01, 0x3E, 0x01, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 

//     0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x04, 0x00, 0xE8, 0x03, 0x64, 0x00, 0x28, 0x00, 
//     0x05, 0x00, 0x0A, 0x00, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
//     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
// };

// u8 debug_item_dat[86] = {
//     0x40, 0x00, 0x01, 0x00, 0x77, 0x00, 0x05, 0x00, 0x78, 0x00, 0x05, 0x00, 0x87, 0x00, 0x05, 0x00, 
//     0x88, 0x00, 0x05, 0x00, 0x8B, 0x00, 0x05, 0x00, 0x8C, 0x00, 0x05, 0x00, 0x8D, 0x00, 0x0F, 0x00, 
//     0x90, 0x00, 0x01, 0x00, 0x91, 0x00, 0x01, 0x00, 0x94, 0x00, 0x01, 0x00, 0x98, 0x00, 0x01, 0x00, 
//     0x99, 0x00, 0x01, 0x00, 0x9A, 0x00, 0x01, 0x00, 0x9E, 0x00, 0x01, 0x00, 0x9F, 0x00, 0x01, 0x00, 
//     0x6B, 0x01, 0x05, 0x00, 0x7C, 0x01, 0x06, 0x00, 0x7E, 0x01, 0x01, 0x00, 0x7F, 0x01, 0x01, 0x00, 
//     0x81, 0x01, 0x01, 0x00, 0x00, 0x00, 
// };

// int debug_dat[5] = {
//     &debug_party_dat,
//     &debug_item_dat,
//     0x186a0,
//     5,
//     0
// };

// replaces the original at 0x88EB8F8
void init_party() {
    s32 i;
    s32 j;

    switch (init_type) {
        case 0:
        case 2:
            init_party_main(&init_dat);
            sce.debug = 0x0;
        break;
        case 1:
            // init_party_main(&debug_dat);
            init_party_main(&init_dat);
            party_data.curr_map = 5; // Go to debug map
            custom.unk4 |= 4; // Combo counter ON
            sce.debug = 0;
            get_class(9);
            j = 1;
            for (i = 1; i < 6; i++) {
                party_data.unkC20[i] = j;
                j = (j << 1) | 1;
            }
            for (i = 0; i < 12; i++) {
                party_data.unkB70[i] = 0xff;
            }
            for (i = 0; i < 19; i++) {
                party_data.unkB7C[i] = 0xff;
            }
        break;
    }
}

// injected at 0x894DC94
// Tries to stop 3d field from using inputs, a bit jank, as the input does go through in the 1st frame
// unless you are in the bussiness of doing frame perfect inputs
s32 check_dbg(void* p_ot, s32 pad) {
    if (sce.debug == 2) {
        return debug_menu(p_ot, pad);
    } else if (sce.debug == 1 && check_scdeb_window() != SCDEB_NONE) {
        return 1;
    } else {
        return 0;
    }
}

// injected at 0x88B3578
void __menu_top_main() {
    if (((get_pad_dat_csr() & BTN_SQUARE) != 0x0) && ((get_pad_new_csr() & BTN_SELECT) != 0x0)) {
        snd_si_se(4);
        sce.debug = (sce.debug + 0x1) % 3;
    }
}

// Got GC'd
void set_str_return(s16 r) {
    if (r == 0) {
        r = csr_l;
    }
    csr_x = csr_r;
    csr_y = r + csr_y;
}

// Replaces the original at 0x88D5518
s32 check_sce_window() {
    return check_scdeb_window();
}

// Replaces the original init_sys_ot at 0x88E5A88
void __init_sys_ot(void* sys_ot, void* og_ot) {
    system_ot = sys_ot;
    original_system_ot = og_ot;
    init_msg_ot(sys_ot);
    init_dbg_mn_ot(sys_ot);
}


u16 dbgstr_ptr[32] = {
      0x0001,
      0x0008,
      0x000F,
      0x0016,
      0x001D,
      0x0020,
      0x0024,
      0x002B,
      0x002E,
      0x0032,
      0x0039,
      0x003E,
      0x0041,
      0x0048,
      0x004D,
      0x0053,
      0x005A,
      0x005F,
      0x0064,
      0x006B,
      0x0073,
      0x007A,
      0x0081,
      0x008B,
      0x0094,
      0x0099,
      0x00A1,
      0x00A7,
      0x00AC,
      0x00B3,
      0x00B7,
      0x00BD,
};

u8 dbgstr_dat[196] = {
    // {END}
    0x00,

    // ＳＴＡＧＥ　{END}
    0x44, 0x45, 0x32, 0x38, 0x36, 0x10, 0x00,

    // ＧＲＯＵＰ　{END}
    0x38, 0x43, 0x40, 0x46, 0x41, 0x10, 0x00,

    // ＭＡＰＮＯ　{END}
    0x3E, 0x32, 0x41, 0x3F, 0x40, 0x10, 0x00,

    // ＳＣＥＮ　　{END}
    0x44, 0x34, 0x36, 0x3F, 0x10, 0x10, 0x00,

    // ＯＮ{END}
    0x40, 0x3F, 0x00,

    // ＯＦＦ{END}
    0x40, 0x37, 0x37, 0x00,

    // ＤＥＭＯ　　{END}
    0x35, 0x36, 0x3E, 0x40, 0x10, 0x10, 0x00,

    // ＯＮ{END}
    0x40, 0x3F, 0x00,

    // ＯＦＦ{END}
    0x40, 0x37, 0x37, 0x00,

    // ＦＡＤＥ　　{END}
    0x37, 0x32, 0x35, 0x36, 0x10, 0x10, 0x00,

    // ＨＯＬＤ{END}
    0x39, 0x40, 0x3D, 0x35, 0x00,

    // ＩＮ{END}
    0x3A, 0x3F, 0x00,

    // ＷＡＩＴ　　{END}
    0x48, 0x32, 0x3A, 0x45, 0x10, 0x10, 0x00,

    // ＨＯＬＤ{END}
    0x39, 0x40, 0x3D, 0x35, 0x00,

    // ＣＬＥＡＲ{END}
    0x34, 0x3D, 0x36, 0x32, 0x43, 0x00,

    // ＩＮＴＥＲ　{END}
    0x3A, 0x3F, 0x45, 0x36, 0x43, 0x10, 0x00,

    // ＨＯＬＤ{END}
    0x39, 0x40, 0x3D, 0x35, 0x00,

    // ＥＸＩＴ{END}
    0x36, 0x49, 0x3A, 0x45, 0x00,

    // ＭＥＮＵ　　{END}
    0x3E, 0x36, 0x3F, 0x46, 0x10, 0x10, 0x00,

    // ＤＩＳＡＢＬＥ{END}
    0x35, 0x3A, 0x44, 0x32, 0x33, 0x3D, 0x36, 0x00,

    // ＥＮＡＢＬＥ{END}
    0x36, 0x3F, 0x32, 0x33, 0x3D, 0x36, 0x00,

    // ＭＯＶＩＥ　{END}
    0x3E, 0x40, 0x47, 0x3A, 0x36, 0x10, 0x00,

    // ＭＩＮＩＧＡＭＥ　{END}
    0x3E, 0x3A, 0x3F, 0x3A, 0x38, 0x32, 0x3E, 0x36, 0x10, 0x00,

    // ＥＮＣＯＵＮＴ　{END}
    0x36, 0x3F, 0x34, 0x40, 0x46, 0x3F, 0x45, 0x10, 0x00,

    // ＮＯＮＥ{END}
    0x3F, 0x40, 0x3F, 0x36, 0x00,

    // Ｍ・ＳＭＡＬＬ{END}
    0x3E, 0x50, 0x44, 0x3E, 0x32, 0x3D, 0x3D, 0x00,

    // ＳＭＡＬＬ{END}
    0x44, 0x3E, 0x32, 0x3D, 0x3D, 0x00,

    // ＨＡＬＦ{END}
    0x39, 0x32, 0x3D, 0x37, 0x00,

    // ＮＯＲＭＡＬ{END}
    0x3F, 0x40, 0x43, 0x3E, 0x32, 0x3D, 0x00,

    // ＢＩＧ{END}
    0x33, 0x3A, 0x38, 0x00,

    // Ｍ・ＢＩＧ{END}
    0x3E, 0x50, 0x33, 0x3A, 0x38, 0x00,
    
    // ＴＡＬＫ　　{END}
    0x45, 0x32, 0x3D, 0x3C, 0x10, 0x10, 0x00,
};


// #####################################################
//  WINDOW CODE
// #####################################################

/* BSS */
IN_BSS static s32 scdeb_type;
IN_BSS static s32 scdeb_step;
IN_BSS static RECT scdeb_rect;
IN_BSS static void* ot;

static SCDEB_EXEC_FUNC scdeb_sub[8] = {
    NULL, // first entry is null
    exec_scdeb_battle,
    exec_scdeb_map,
    exec_scdeb_flag,
    exec_scdeb_movie,
    exec_scdeb_mg,
    exec_scdeb_encnt,
    exec_scdeb_talk,
};

static SCDEB_DSP_FUNC dsp_scdeb[8] = {
    NULL, // first entry is null
    dsp_scdeb_battle,
    dsp_scdeb_map,
    dsp_scdeb_flag,
    dsp_scdeb_movie,
    dsp_scdeb_mg,
    dsp_scdeb_encnt,
    dsp_scdeb_talk,
};

// Replaces the original at 0x88D5264
s32 call_scdeb_win() {
    s32 game_mode;
    s32 ret = 0;
    s32 mode = 0;

    if (sce.debug != 0) {
        mode = exec_scdeb_window();
    }

    switch(mode) {
        case SCDEB_BATTLE:
            game_mode = get_game_mode();
            if (game_mode == GAME_MODE_NMAP || game_mode == GAME_MODE_FIELD) {
                request_battle(get_scdeb_gp(), get_scdeb_st(), 0x0);
            }
        break;
        case SCDEB_MAP:
            game_mode = get_game_mode();
            if (game_mode == GAME_MODE_NMAP || game_mode == GAME_MODE_FIELD) {
                if (get_scdeb_map() < 0x4) {
                    request_change_map(get_scdeb_map(), 0x0, 0x27b0, 0x5408, 0x0, 0x0);
                } else {
                    request_change_map(get_scdeb_map(), 0x0, 0xa8, 0x70, 0x2, 0x0);
                }
                ret = 1;
            }
        break;
        case SCDEB_FLAG:
            sce_off = get_scdeb_sce();

            if (get_scdeb_demo() == 0x0) {
                sce.demo &= ~1;
                sce.stop &= ~1;
            } else {
                sce.demo |= 1;
                sce.stop |= 1;
            }
            
            if (get_scdeb_fade() != 0x0) {
                system_fade(0x0, 0x0);
            }

            if ((get_scdeb_wait() != 0x0) && (sce.sce_loop != 0x1) && (sce.sce_loop != 0x0) && (sce.sce_loop != 0x2)) {
                sce_loop_skip = 0x1;
            }
            
            if ((get_scdeb_inter() != 0x0) && ((char*)&sce.unk50C < (char*)intp)) {
                while (sce.sce_loop != 0x0) {
                    del_sce_loop();
                }
                add_sce_loop(0x1, 0x0, 0x0, 0x0, 0x0);
            }
            
            if (get_scdeb_menu() == 0x0) {
                disable_sys_pad();
            }
            else {
                enable_sys_pad();
            }
            break;
        case SCDEB_MOVIE:
            request_play_movie(get_scdeb_movie());
            break;
        case SCDEB_MINI_GAME:
            request_mini_game(get_scdeb_mg());
            break;
        case SCDEB_ENCOUNTER:
            if (get_scdeb_encnt() != sce.encount_rate) {
                game_mode = get_game_mode();
                if (game_mode == GAME_MODE_FIELD) {
                    sce.encount_rate = 0x0;
                }
                else if (game_mode == GAME_MODE_NMAP) {
                    sce.encount_rate = get_scdeb_encnt();
                    init_encount_count();
                }
                if (sce.encount_stage == 0x0) {
                    sce.encount_stage = party_data.btl_stage;
                }
            }
            break;
        case SCDEB_TALK:
            request_talk(get_scdeb_talk());
            break;
    }

    return ret;
}

s32 exec_scdeb_window() {
    s32 ret = 0;

    if (scdeb_type == 0) {
        u16 pad = get_pad_data(0);
        if ((pad & (BTN_SQUARE | BTN_SHLDR_R)) == (BTN_SQUARE | BTN_SHLDR_R)) {
            scdeb_type = SCDEB_FLAG;
            set_scdeb_rect(0xb4, 0x6c, 0xb4, 0x6c, 0x78, 0x38);
        } else if ((pad & (BTN_SQUARE | BTN_SHLDR_L)) == (BTN_SQUARE | BTN_SHLDR_L)) {
            s32 mode = get_game_mode();
            if (mode == GAME_MODE_FIELD) {
                scdeb_type = SCDEB_TALK;
                set_scdeb_rect(0xc4, 0x7c, 0xc4, 0x7c, 0x58, 0x18);
            } else if (mode == GAME_MODE_NMAP) {
                scdeb_type = SCDEB_MOVIE;
                set_scdeb_rect(0xc4, 0x7c, 0xc4, 0x7c, 0x58, 0x18);
            }
        } else if ((pad & (BTN_CROSS | BTN_SHLDR_R)) == (BTN_CROSS | BTN_SHLDR_R)) {
            scdeb_type = SCDEB_MINI_GAME;
            set_scdeb_rect(0xc0, 0x7c, 0xc0, 0x7c, 0x60, 0x18);
        } else if ((pad & (BTN_CROSS | BTN_SHLDR_L)) == (BTN_CROSS | BTN_SHLDR_L)) {
            scdeb_type = SCDEB_ENCOUNTER;
            set_scdeb_rect(0xac, 0x7c, 0xac, 0x7c, 0x88, 0x18);
        } else if ((pad & BTN_SHLDR_L) == BTN_SHLDR_L) {
            scdeb_type = SCDEB_BATTLE;
            set_scdeb_rect(0xc4, 0x7c, 0xc4, 0x7c, 0x58, 0x18);
        } else if ((pad & BTN_SHLDR_R) == BTN_SHLDR_R) {
            scdeb_type = SCDEB_MAP;
            set_scdeb_rect(0xc4, 0x7c, 0xc4, 0x7c, 0x58, 0x18);
        }

        if (scdeb_type != 0) {
            enable_csr_data();
            snd_si_se(4);

            sce.demo |= 0x10;
            sce.stop |= 0x10;
            sce.inter |= 0x10;
        }

        scdeb_step = 0;
    } else {
        s32 sub_ret = (*scdeb_sub[scdeb_type])();
        if (sub_ret == 0) {
            dsp_scdeb_window();
        } else {
            ret = scdeb_type;
            scdeb_type = 0;
        }

        if (scdeb_type != 0) {
            sce.demo &= ~0x10;
            sce.stop &= ~0x10;
            sce.inter &= ~0x10;
        }
    }

    return ret;
}

void dsp_scdeb_window() {
    if (scdeb_type != 0) {
        (*dsp_scdeb[scdeb_type])();
    }
}

static void set_scdeb_rect(s16 x_fld, s16 y_fld, s16 x_def, s16 y_def, s16 w, s16 h) {
    s32 mode = get_game_mode();
    if (mode == GAME_MODE_FIELD) {
        scdeb_rect.x = x_fld;
        scdeb_rect.y = y_fld;
    } else {
        scdeb_rect.x = x_def;
        scdeb_rect.y = y_def;
    }
    scdeb_rect.w = w;
    scdeb_rect.h = h;
}

// Injected call inside setup_exec_sce at 0x88D4C90
void init_scdeb_window() {
    scdeb_type = SCDEB_NONE;
    scdeb_step = 0;
}

// replaces the original at 88AB9FC
s32 check_scdeb_window() {
    return scdeb_type;
}


// #####################################################
//  BATTLE WINDOW CODE
// #####################################################

IN_BSS static s32 b_stage;
IN_BSS static s32 b_group;

static CURSOR_GRID scdeb_battle_pos = {
    .start_x = 8, 
    .start_y = 12,
    .visible_cols = 1,
    .visible_rows = 2,
    .item_count = 2, 
    .row_height = 8,
    .flags = CURSOR_GRID_LOOP_VERTICAL
};

static CURSOR scdeb_battle_csr = {
    .data = &scdeb_battle_pos,
    .index_now = 1,
    .visible_items = 2,
    .status = CURSOR_USE_GRID,
};

s32 exec_scdeb_battle() {
    s32 no;
    s32 decide;
    s32 ret;
    
    ret = 0;
    if (scdeb_step == 0) {
        b_stage = party_data.btl_stage;
        b_group = party_data.btl_group;
        set_csr_data_base(&scdeb_battle_csr, scdeb_rect.x, scdeb_rect.y);
        start_csr_data(&scdeb_battle_csr, 0);
        scdeb_step++;
    }

    decide = get_pad_decide();
    if (decide == DECIDE_NO) {
        snd_si_se(0x2);
        scdeb_type = SCDEB_NONE;
    } else if (decide == DECIDE_YES) {
        snd_si_se(0x1);
        ret = 0x1;
    }

    no = get_csr_data_no();
    if (no == 0x2) {
        b_group = set_pad_number(b_group, 0x2, 0x2a5, 0x1, 0x0);
    } else if (no == 0x1) {
        b_stage = set_pad_number(b_stage, 0x2, 0x32, 0x1, 0x0);
    }
    exec_csr_data();
    
    return ret;
}

void dsp_scdeb_battle() {
    add_csr_data_prim(ot, &scdeb_battle_csr);
    set_str_cursor(scdeb_rect.x + 8, scdeb_rect.y + 4, 0);
    add_str_prim(ot, &dbgstr_dat[dbgstr_ptr[0x0]], 0x0, 0x1, 0x0, 0x0);
    move_str_cursor(0x10, 0);
    add_dec_prim(ot, b_stage, 0x3, 0x0, 0x0, 0x0);
    set_str_return(8);
    add_str_prim(ot, &dbgstr_dat[dbgstr_ptr[0x1]], 0x0, 0x1, 0x0, 0x0);
    move_str_cursor(0x10, 0);
    add_dec_prim(ot, b_group, 0x3, 0x0, 0x0, 0x0);
    add_window_prim(ot, &scdeb_rect, 0x0, 0x0, 0x0, 0);
}

s32 get_scdeb_gp() {
    return b_group;
}

s32 get_scdeb_st() {
    return b_stage;
}

// #####################################################
//  MAP WINDOW CODE
// #####################################################

IN_BSS static s32 c_map;

static CURSOR_NODE scdeb_map_pos[] = {
    { .x = 8, .y = 16 /* No neighbors */ }
};

static CURSOR scdeb_map_csr = {
    .data = &scdeb_map_pos,
    .index_now = 1, 
    .visible_items = 1,
};

s32 exec_scdeb_map() {
    s32 decide;
    s32 ret;
    
    ret = 0;
    if (scdeb_step == 0x0) {
        c_map = party_data.curr_map;
        set_csr_data_base(&scdeb_map_csr, scdeb_rect.x, scdeb_rect.y);
        start_csr_data(&scdeb_map_csr, 0x0);
        scdeb_step++;
    }

    decide = get_pad_decide();
    if (decide == DECIDE_NO) {
        snd_si_se(0x2);
        scdeb_type = 0x0;
    } else if (decide == DECIDE_YES) {
        ret = party_data.curr_map == c_map;
        if (ret) {
            snd_si_se(0x2);
            scdeb_type = 0x0;
        } else {
            snd_si_se(0x1);
        }
        ret = !ret;
    }

    c_map = set_pad_number(c_map, 0x1, 0x274, 0x1, 0x0);
    exec_csr_data();
    return ret;
}

void dsp_scdeb_map() {
    add_csr_data_prim(ot, &scdeb_map_csr);
    set_str_cursor(scdeb_rect.x + 8, scdeb_rect.y + 8, 0);
    add_str_prim(ot, &dbgstr_dat[dbgstr_ptr[0x2]], 0x0, 0x1, 0x0, 0x0);
    move_str_cursor(0x10, 0);
    add_dec_prim(ot, c_map, 0x3, 0x0, 0x0, 0x0);
    add_window_prim(ot, &scdeb_rect, 0x0, 0x0, 0x0, 0);
}

s32 get_scdeb_map() {
    return c_map;
}

// #####################################################
//  FLAG WINDOW CODE
// #####################################################

IN_BSS static s32 f_data[6];

static CURSOR_GRID scdeb_flag_pos = {
    .start_x = 8,
    .start_y = 12,
    .visible_cols = 1,
    .visible_rows = 6,
    .row_height = 8,
    .item_count = 6,
    .flags = CURSOR_GRID_LOOP_VERTICAL
};

static CURSOR scdeb_flag_csr = {
    .data = &scdeb_flag_pos,
    .index_now = 5,
    .status = CURSOR_USE_GRID
};

s32 exec_scdeb_flag() {
    s32 decide;
    s32 ret;
    
    ret = 0x0;
    if (scdeb_step == 0x0) {
        f_data[0x0] = sce_off; // get_sce_off();
        f_data[0x1] = (sce.demo & 0x1) == 0x0;
        f_data[0x4] = 0x0;
        f_data[0x3] = 0x0;
        f_data[0x2] = 0x0;
        f_data[0x5] = sys_pad_flag; // get_sys_pad_flag();
        set_csr_data_base(&scdeb_flag_csr, scdeb_rect.x, scdeb_rect.y);
        start_csr_data(&scdeb_flag_csr, 0x0);
        scdeb_step++;
    }
    
    decide = get_pad_decide();
    if (decide == DECIDE_NO) {
        snd_si_se(0x2);
        scdeb_type = 0x0;
    } else if (decide == DECIDE_YES) {
        snd_si_se(0x1);
        ret = 0x1;
    }
    
    if ((get_pad_rep(0x0) & (BTN_LEFT | BTN_RIGHT)) != 0x0) {
        f_data[get_csr_data_no() - 1] ^= 1;
    }
    
    exec_csr_data();
    return ret;
}

void dsp_scdeb_flag() {
    s32 i;
    static u8 scdeb_flag_msg[6] = {
        3, 6, 9, 12, 15, 18
    };
    
    add_csr_data_prim(ot, &scdeb_flag_csr);
    set_str_cursor(scdeb_rect.x + 8, scdeb_rect.y + 4, 0);

    for (i = 0x0; i < 6; i += 0x1) {
        add_str_prim(ot, &dbgstr_dat[dbgstr_ptr[scdeb_flag_msg[i]]], 0x0, 0x1, 0x0, 0x0);
        add_str_prim(ot, &dbgstr_dat[dbgstr_ptr[f_data[i] + scdeb_flag_msg[i] + 1]], 0x0, 0x0, 0x0, 0x0);
        set_str_return(0x8);
    }

    add_window_prim(ot, &scdeb_rect, 0x0, 0x0, 0x0, 0);
}

s32 get_scdeb_sce() {
    return f_data[0];
}

s32 get_scdeb_demo() {
    return f_data[1] ^ 1;
}

s32 get_scdeb_fade() {
    return f_data[2];
}

s32 get_scdeb_wait() {
    return f_data[3];
}

s32 get_scdeb_inter() {
    return f_data[4];
}

s32 get_scdeb_menu() {
    return f_data[5];
}

// #####################################################
//  MOVIE WINDOW CODE
// #####################################################

IN_BSS static s32 movie_no;

static CURSOR_NODE scdeb_movie_pos[] = {
    { .x = 8, .y = 16 /* No neighbors */ }
};

static CURSOR scdeb_movie_csr = {
    .data = &scdeb_movie_pos,
    .index_now = 1,
    .visible_items = 1,
};

s32 exec_scdeb_movie() {
    s32 decide;
    s32 ret;
    
    ret = 0x0;
    if (scdeb_step == 0x0) {
        movie_no = last_movie; // get_last_movie();
        set_csr_data_base(&scdeb_movie_csr, scdeb_rect.x, scdeb_rect.y);
        start_csr_data(&scdeb_movie_csr, 0x0);
        scdeb_step++;
    }

    decide = get_pad_decide();
    if (decide == DECIDE_NO) {
        snd_si_se(2);
        scdeb_type = DECIDE_NONE;
    } else if (decide == DECIDE_YES) {
        snd_si_se(1);
        ret = 1;
    }

    movie_no = set_pad_number(movie_no, 0x0, 0x4, 0x1, 0x0);
    exec_csr_data();
    return ret;
}

void dsp_scdeb_movie() {
    add_csr_data_prim(ot, &scdeb_movie_csr);
    set_str_cursor(scdeb_rect.x + 8, scdeb_rect.y + 8, 0);
    add_str_prim(ot, &dbgstr_dat[dbgstr_ptr[0x15]], 0x0, 0x1, 0x0, 0x0);
    move_str_cursor(0x10, 0);
    add_dec_prim(ot, movie_no, 0x3, 0x0, 0x0, 0x0);
    add_window_prim(ot, &scdeb_rect, 0x0, 0x0, 0x0, 0);
}

s32 get_scdeb_movie() {
    return movie_no;
}

// #####################################################
//  MINIGAME WINDOW CODE
// #####################################################

IN_BSS static s32 mg_no;

static CURSOR_NODE scdeb_mg_pos[] = {
    { .x = 8, .y = 16 /* No neighbors */ }
};

static CURSOR scdeb_mg_csr = {
    .data = &scdeb_mg_pos,
    .index_now = 1,
    .visible_items = 1,
};

s32 exec_scdeb_mg() {
    s32 decide;
    s32 ret;
    
    ret = 0x0;
    if (scdeb_step == 0x0) {
        set_csr_data_base(&scdeb_mg_csr, scdeb_rect.x, scdeb_rect.y);
        start_csr_data(&scdeb_mg_csr, 0x0);
        scdeb_step += 0x1;
    }

    decide = get_pad_decide();
    if (decide == DECIDE_NO) {
        snd_si_se(2);
        scdeb_type = DECIDE_NONE;
    } else if (decide == DECIDE_YES) {
        snd_si_se(1);
        ret = 1;
    }

    mg_no = set_pad_number(mg_no, 0x0, 0x0, 0x1, 0x0);
    exec_csr_data();
    return ret;
}

void dsp_scdeb_mg() {
    add_csr_data_prim(ot, &scdeb_mg_csr);
    set_str_cursor(scdeb_rect.x + 8, scdeb_rect.y + 8, 0);
    add_str_prim(ot, &dbgstr_dat[dbgstr_ptr[0x16]], 0x0, 0x1, 0x0, 0x0);
    move_str_cursor(0x18, 0);
    add_dec_prim(ot, mg_no, 1, 0x0, 0x0, 0x0);
    add_window_prim(ot, &scdeb_rect, 0x0, 0x0, 0x0, 0);
}

s32 get_scdeb_mg() {
    return mg_no;
}

// #####################################################
//  ENCOUNTER WINDOW CODE
// #####################################################

IN_BSS static s32 ec_rate;

static CURSOR_NODE scdeb_encnt_pos[] = {
    { .x = 8, .y = 16 /* No neighbors */ }
};

static CURSOR scdeb_encnt_csr = {
    .data = &scdeb_encnt_pos,
    .index_now = 1,
    .visible_items = 1,
};

// Check me?
static s32 rate_tbl[7] = {
    0x0, 0xA0, 0x80, 0x70,
    0x58, 0x38, 0x28
};

s32 exec_scdeb_encnt() {
    s32 decide;
    s32 ret;
    s32 i;
    
    ret = 0x0;
    if (scdeb_step == 0x0) {
        set_csr_data_base(&scdeb_encnt_csr, scdeb_rect.x, scdeb_rect.y);
        start_csr_data(&scdeb_encnt_csr, 0x0);
        ec_rate = 0x0;
        for (i = 0x0; i < 0x7; i++) {
            if (sce.encount_rate == rate_tbl[i]) {
                ec_rate = i;
                break;
            }
        }
        scdeb_step++;
    }

    decide = get_pad_decide();
    if (decide == DECIDE_NO) {
        snd_si_se(2);
        scdeb_type = DECIDE_NONE;
    } else if (decide == DECIDE_YES) {
        snd_si_se(1);
        ret = 1;
    }

    ec_rate = set_pad_number(ec_rate, 0x0, 0x6, 0x1, 0x0);
    exec_csr_data();
    return ret;
}

void dsp_scdeb_encnt() {
    add_csr_data_prim(ot, &scdeb_encnt_csr);
    set_str_cursor(scdeb_rect.x + 8, scdeb_rect.y + 8, 0);
    add_str_prim(ot, &dbgstr_dat[dbgstr_ptr[0x17]], 0x0, 0x1, 0x0, 0x0);
    add_str_prim(ot, &dbgstr_dat[dbgstr_ptr[ec_rate + 0x18]], 0x0, 0x0, 0x0, 0x0);
    add_window_prim(ot, &scdeb_rect, 0x0, 0x0, 0x0, 0);
}

s32 get_scdeb_encnt() {
    return rate_tbl[ec_rate];
}

// #####################################################
//  SKIT WINDOW CODE
// #####################################################

IN_BSS static s32 talk_no;

static CURSOR_NODE scdeb_talk_pos[4] = {
    { .x = 8, .y = 16 /* No neighbors */ }
};

static CURSOR scdeb_talk_csr = {
    .data = &scdeb_talk_pos,
    .index_now = 1, 
    .visible_items = 1,
};

s32 exec_scdeb_talk() {
    s32 decide;
    s32 ret;
    
    ret = 0x0;
    if (scdeb_step == 0x0) {
        talk_no = last_talk; // get_last_talk();
        set_csr_data_base(&scdeb_talk_csr, scdeb_rect.x, scdeb_rect.y);
        start_csr_data(&scdeb_talk_csr, 0x0);
        scdeb_step++;
    }
    decide = get_pad_decide();
    if (decide == DECIDE_NO) {
        snd_si_se(0x2);
        scdeb_type = SCDEB_NONE;
    }
    else if (decide == DECIDE_YES) {
        snd_si_se(0x1);
        ret = 0x1;
    }
    talk_no = set_pad_number(talk_no, 0x1, 0x102, 0x1, 0x0);
    exec_csr_data();
    return ret;
}

void dsp_scdeb_talk() {
    add_csr_data_prim(ot, &scdeb_talk_csr);
    set_str_cursor(scdeb_rect.x + 8, scdeb_rect.y + 8, 0);
    add_str_prim(ot, &dbgstr_dat[dbgstr_ptr[31]], 0x0, 0x1, 0x0, 0x0);
    move_str_cursor(0x10, 0);
    add_dec_prim(ot, talk_no, 3, 0x0, 0x0, 0x0);
    add_window_prim(ot, &scdeb_rect, 0x0, 0x0, 0x0, 0);
}

s32 get_scdeb_talk() {
    return talk_no;
}

void init_dbg_mn_ot(void* n_ot) {
    ot = n_ot;
}
