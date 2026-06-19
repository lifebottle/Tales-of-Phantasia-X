                                  Tales of Phantasia: Cross Edition
                                        English Translation
                                       v1.2 (June 20th, 2026)

====================================================================================================

- No ownership is claimed by Life Bottle Productions over Tales of Phantasia Cross Edition or
   the franchise from which it originates. Commercial use of this patch, including but not
   limited to reproduction, sale, etc. is strictly prohibited.

- This unofficial, fan-made patch is provided "as-is" on a voluntary (i.e. non-profit) basis.
   Life Bottle Productions are not liable for damage incurred to the end-user, their OS, or their
   hardware while using this patch.
   
- Apply this patch only to a Japanese Narikiri Dungeon X UMD image in ISO format with the
   following specifications:
     Hashes: MD5  - AA49C716783766AA5913E6A5CA8BB822
             SHA1 - A8BA8878C6D626806518B8A538D19094E1062CA9


   Table of Contents

To reach a given section, Ctrl+F the text fragments in brackets.


Preface ............. [RM01]
Patch Notes ......... [RM02]
Changelog ........... [RM03]
FAQ ................. [RM04]
Credits ............. [RM05]

====================================================================================================

   [RM01] Preface
   
  mziab

Honestly, if you told me a year ago that I'd be involved in this project, let alone be able to make
it to the finish line in less than a year, I'd have written that off as crazy talk... and yet here we
are. You see, it all started when I released my addendum for ToP PSX back in January 2025. This
caught the eye of DRAGONBLEAPIECE, who reached out me in March 2025, asking if I wanted to help out
with porting the ToP PSX translation by Phantasian Productions (with the approval of the original
team) to Tales of Phantasia X. Since I had figured out a lot of the inner workings and had written
tools when making the addendum, and the formats seemed pretty much identical, I naturally said yes.
Truth be told, while I'm certainly no stranger to romhacking, this was actually my very first PSP
project. Let's just say the speed at which this translation progressed blew my expectations out of
the water.

For some context, while I did some initial work in April, it's in August that I put everything aside
and focused entirely on ToPX. In mid-September we had a very playable alpha with most of the
dialogue and menus translated and looking pretty good. As expected, we were able to copy a lot of
the text and translated assets from the Phantasian Productions patch.

From this point forward, as I worked on resolving bugs discovered by Kevan and hacking on various
things (with the help of Ethanol and Julian who bailed me out on occasion), the translators
SymphoniaLauren, SeiichiroMine and Goodguy3 worked on translating the new text, which was then
iterated upon by DRAGONBLEAPIECE, Kevan, gatordski, the other editors and myself. Amarant prepared
some really beautiful graphics for the title screen and internal cover art. With that, we had
reached beta quality in December, but there was an elephant in the room - skit subtitles, which
would require some deeper research and new code. I expected this to slow us down by weeks, maybe
months... and yet with Ethanol's help I was able to put together a working prototype in less than a
week. With that foundation done, I proceeded to implement prologue subs, battle subs, cooking subs
and even added a skit prompt that the original game sorely lacked. This prompted other teammates to
request some quality-of-life improvements, to which I happily obliged, within reason, handing off
some of them to Ethanol. FlamePurge did another editing pass on a portion of the new text.
Meanwhile, Kevan and DobleC did their due diligence and discovered some very obscure bugs, some of
which were real head-scratchers, but somehow we emerged triumphant. I could bore you with a long and
detailed list of changes and challenges faced, but... long story short, we were able to accomplish
more than I could ever hope for and in time for the 1.0 release, to boot!

All in all, this project has been a blast, which I largely attribute to the passionate folks from
the Life Botle Productions community. This wouldn't have gone nearly as smooth without
DRAGONBLEAPIECE, Pegi, Ethanol, Julian, Kevan, DobleC and a host of other people who contributed to
this project in one way or another. I hope the result of our collective efforts speaks for itself
and that fans will now be able to enjoy what might just be the definitive version of Tales of
Phantasia!

====================================================================================================

   [RM02] Patch Notes

The main patch features the following quality-of-life improvements over the base game:

- Added a skit prompt on the world map
- Added a new Red Lantern location in the Airfread quest
- Restored Suzu's controls to what they were in ToP PSX
- Restored the original ending credits song
- Removed the Dark element from Suzu's Chizakura weapon
- Made the stealth section of Alvanista Castle less punishing
- Added a toggle for turning Battle Subs on/off
- Added a toggle for turning enhanced Holy Bottles on/off (enhanced bottles stop encounters fully
  for their duration, as in modern games)
- Monster Book is now alphabetically sorted and starts at the first entry
- Added all Dhaos forms to the Monster Book
- The Sorcerer's Ring doesn't need to be equipped to be able to shoot fire
- Curio's Mirror, Scout Orb and Combo Counter now carry over in New Game+ if you select the option
  to carry over items
- Restored Rhea's Super Deformed sprite from ToP GBA
- Monster Book sprites now use the actual enemy graphics
- Ishrantu's Monster Book entry now correctly lists the elemental weakness as Earth
- Chester doesn't block you from visiting Euclid at the start of the game
- One censored skit about drinking is now restored
- Fixed coords for two hotspots which were misplaced in the original game (bookshelves in the back
  of the item shop in the Elven Settlement and Arche's crying animation during a cutscene)
- Fixed HP/TP restore on level-up not taking accessories into account

Since some of these affect the gameplay, we have provided a "vanilla" patch for those preferring to
forgo gameplay-related improvements and have the original experience.

The text is based on the Phantasian Productions localization and as such we have decided not to
disturb it if we didn't need to out of respect for their work. Obvious typos, punctuation and
grammatical mistakes have been corrected and some incidental lines have been trimmed to match the
voice-over better. The Quiche recipe name has been reverted to the original Chawanmushi and some
tutorial text has been tweaked. Apart from that, this patch keeps to the conventions established by
Phantasian Productions.

====================================================================================================

   [RM03] Changelog

v1.2 (June 20th, 2026)
- Fixed missing monster book on NG+ if you selected both the monster book and consumables carry-over
  at the same time
- Fixed coords for two hotspots which were misplaced in the original game (bookshelves in the back
  of the item shop in the Elven Settlement and Arche's crying animation during a cutscene)
- Fixed HP/TP restore on level-up not taking accessories into account
- Fixed cursor position in naming screen after pressing L/R
- Assorted translation, typo and text formatting fixes

v1.1 (February 28th, 2026)
- QoL improvement: added carry-over for Combo Counter as well
- QoL improvement: Chester doesn't block you from visiting Euclid before the hunt
- Restored skit 130 about drinking (available after the Alvanista boat scene)
- Fixed a last-minute v1.0 regression which caused wrong item drops after battle
- Fixed Rody missing one row of artes (missing Thunder Blade)
- Fixed alphabetical item sorting
- Imported the actual enemy graphics into the monster book
- Expanded and corrected the ending credits
- Fixed Ishrantu's weakness in the monster book (original game bug dating back to ToP PSX)
- Fixed rare bug which caused glitchy skit subs if you happened to soft-reset during a playing skit
- Restored the normal name order in Suzu's naming screen
- Improved the alignment of Gald and Encounters numbers in the main menu
- Renamed Hashed Rice to Hayashi Rice and made the name in menus and dialogue consistent
- Several text improvements, including fixes for context errors, missing text and inconsistent
  terminology

v1.0 (January 31st, 2026)
- Initial release

====================================================================================================

   [RM04] Frequently Asked Questions

Q: I applied the patch and the translated game is only 337MB. Is something wrong?
A: No, this is expected. The translation patch strips away the unused files from the untranslated
   Narikiri Dungeon X, reducing the overall filesize from 1.1GB to a third of that.

Q: Will this work with Tales of Phantasia: Full Voice Edition?
A: No, FVE is the earlier PSP version not supported by this patch. This translation targets the Tales
   of Phantasia X portion included with Narikiri Dungeon X.

Q: I'm getting graphical glitches on PPSSPP, help! What do I do?
A: Please upgrade your emulator. Earlier versions are known to have graphical issues with this game
   in particular. For more information, refer to the included "How to fix the graphics.txt" file.

Q: I want 60fps battles. How do I do that?
A: This involves using the cheat file(s) provided with the translation and enabling the 60fps cheat.
   For more information, refer to the included "HOW TO GET 60fps battles.txt" file.

Q: Why is the opening FMV choppy when playing on my Vita?
A: The game has performance problems in FMVs when using Adrenaline filters. Make sure that filters
   are turned off or else you will suffer from FMV stuttering.

====================================================================================================

   [RM05] Credits

Project Managers
- mziab
- Pegi

Project Coordinator
- Dragonbleapiece

Lead Programmer
- mziab

Programmers
- Ethanol
- Julian

Main Translator
- Goodguy3

Translators
- Mine
- SymphoniaLauren
- Pegi
- mziab

Lead Editors
- Dragonbleapiece
- mziab

Editors
- Kevan
- gatordski
- yoh
- Khayyaam
- FlamePurge

Graphic Artists
- Amarant
- FlamePurge
- WilliamTBOG

Pre-production Information Gathering
- Kevan

Lead Localization QA
- Dragonbleapiece

Lead Functional QA
- DobleC

QA Testers
- Kevan
- flynnforthewin
- Nanika
- getterdrill
- Torasouls
- FlamePurge
- dotaxis
- ryuza
- Trixarian
- Negi
- bobwhite
- edgarfigaro
- gatordski
- Explorer

Translation Feature Consultation
- FlamePurge

Original PSX Script and Translated Assets
- Phantasian Productions
