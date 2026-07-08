
import flixel.addons.ui.FlxUIDropDownMenu;
import funkin.play.song.Song.SwagSection;
import funkin.play.states.PlayState;
import funkin.backend.CoolUtil;
import funkin.backend.Conductor;
import funkin.backend.ClientPrefs;
import funkin.backend.Paths;
import funkin.ui.transition.LoadingState;
import funkin.backend.Difficulty;
#if SCEModchartingTools
import substates.MusicBeatSubstate;
#else
import funkin.ui.MusicBeatSubstate;
#end
import funkin.play.notes.Note;
#if SCEModchartingTools
import objects.StrumArrow;
#else
import funkin.play.notes.StrumNote;
#end
import funkin.play.song.Song;

#if LUA_ALLOWED
import funkin.psychlua.FunkinLua;
import funkin.psychlua.HScript as FunkinHScript;
#end

#if sys
import sys.FileSystem;
import sys.io.File;
#end

import flixel.FlxSprite;