# Tales-of-Phantasia-X
Tales of Phantasia X English Translation

<img width="480" height="272" alt="image" src="https://github.com/user-attachments/assets/ab140158-20b1-45fc-8f32-b877cb3aafec" />

- **Project Managers**
  - mziab
  - Pegi

- **Project Coordinator**
  - Dragonbleapiece

- **Lead Programmer**
  - mziab

- **Programmers**
  - Ethanol
  - Julian

- **Main Translator**
  - Goodguy3

- **Translators**
  - Mine
  - SymphoniaLauren
  - Pegi
  - mziab

- **Lead Editors**
  - mziab
  - Dragonbleapiece

- **Editors**
  - Kevan
  - gatordski
  - yoh
  - Khayyaam
  - FlamePurge

- **Graphic Artists**
  - Amarant
  - FlamePurge
  - WilliamTBOG

- **Lead Localization QA**
  - Dragonbleapiece

- **Lead Functional QA**
  - DobleC

- **QA Testers**
  - flynnforthewin
  - Nanika
  - getterdrill
  - Torasouls
  - Flamepurge
  - dotaxis
  - ryuza
  - Trixarian
  - Negi
  - bobwhite
  - edgarfigaro
  - gatordski
  - Explorer

- **Original PSX Script and Translated Assets**
  - Phantasian Productions


## Discord
Join us at https://discord.gg/2KtGVNxPvD  

## Hacker Note 1
`top.prx` seems to contain a list of files the game loads. These are mostly `.d` and `.acf` files, so I would look at what format they're in. At a first glance, they're very simple archive formats that start with the number of contained files and then offset/size pairs (or so) for each file. Each individual file seems to be compressed using the same compression as in ToDDC/ToD2, since the header looks the same (1 byte compression type + 4 bytes compressed size + 4 bytes uncompressed size).
> Compto

It probably makes sense to look for the font texture and look how the game gets from characters codes to glyph textures, but that might require a debugger.
> The archive sound like Pak1 too

## Other Notes
1. `sv.pak` can be extracted with `pakcomposer`, appears to be audio files
2. The 3 files in the f `field` folder can be extracted with `pakcomposer` and `comptoe`.
