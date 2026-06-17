#pragma once

#define EXPORT extern "C"

#ifdef _MSC_VER
#define NOINLINE
#else
#define NOINLINE  __attribute__ ((noinline))
#endif

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef char s8;
typedef short s16;
typedef int s32;

#define HALFWORD(x) (*(u16*)(x))
#define SIGNEDHALFWORD(x) (*(s16*)(x))
#define WORD(x) (*(u32*)(x))

#define TRUE 1
#define FALSE 0

#define BUTTON_ACCEPT 0x24
#define BUTTON_CANCEL 0x48
#define BUTTON_ACCEPT_OR_CANCEL 0x6C
#define BUTTON_UP 0x1000
#define BUTTON_RIGHT 0x2000
#define BUTTON_DOWN 0x4000
#define BUTTON_UP_DOWN 0x5000
#define BUTTON_LEFT 0x8000
#define BUTTON_LEFT_RIGHT 0xA000
#define BUTTON_DPAD 0xF000
#define BUTTON_MOVE 0xF000
#define BUTTON_CLOSE 0x190
#define BUTTON_OPEN_MENU 0x90

#define NULL 0

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
    /* 0xC20 */ u8 monsters_seen[0x100];
} PARTY;

typedef struct _MonsterData {
    unsigned short monsterID;
    char unknown_data[50];
} MonsterData;
