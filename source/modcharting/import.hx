package modcharting;

#if !macro
#if sys
import sys.*;
import sys.io.*;
#elseif js
import js.html.*;
#end

import funkin.play.states.PlayState;
#end

#if (!macro)
#if ACHIEVEMENTS_ALLOWED
import funkin.backend.Achievements;
#end

//P-Slice
import extensions.funkinvslice.funkin.custom.NativeFileSystem as NativeFileSystem;
/* import extensions.funkinvslice.funkin.*;
import extensions.funkinvslice.funkin.utils.*;
import extensions.funkinvslice.funkin.custom.*;
import extensions.funkinvslice.funkin.players.*; */
import funkin.states.FreeplayState as C_;

#if !js
import mobile.backend.StorageUtil;
#end

import funkin.backend.Paths;
import funkin.backend.Controls;
import funkin.backend.CoolUtil;
import funkin.ui.MusicBeatState;
import funkin.ui.MusicBeatSubstate;
import funkin.backend.CustomFadeTransition;
import funkin.backend.ClientPrefs;
import funkin.backend.Conductor;
import funkin.backend.BaseStage;
import funkin.backend.Difficulty;
import funkin.modding.Mods;
//import funkin.backend.Highscore;
import funkin.backend.Language;

import funkin.scripting.ScriptableState;
import funkin.scripting.ScriptableSubstate;

import funkin.ui.*; //Psych-UI

import funkin.objects.Alphabet;
//import funkin.objects.BGSprite;
//import funkin.graphics.FunkinSprite;
//import funkin.graphics.FlxFilteredSprite;

//import funkin.play.states.PlayState;
#if FUNK_A_LIVE_BUILD
import funkalive.menus.MainMenuState;
#else
import extensions.funkinvslice.vslice.ui.MainMenuState;
#end
//import extensions.funkinvslice.vslice.ui.StoryMenuState;
//import funkin.ui.transition.LoadingState;

#if flxanimate
import flxanimate.*;
#end

// Mod libs
//import flixel.ui.FlxBar;

import flixel.util.FlxDestroyUtil;
import flixel.util.FlxDestroyUtil.IFlxDestroyable;

//Flixel
#if (flixel >= "6.0.0")
import flixel.sound.FlxSound;
#else
import flixel.system.FlxSound;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.math.FlxMath;
//import flixel.math.FlxPoint;
import flixel.util.FlxColor;
//import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.group.FlxSpriteGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.addons.transition.FlxTransitionableState;
//import flixel.addons.display.FlxBackdrop;
//import flixel.addons.display.FlxGridOverlay;
import flixel.system.debug.watch.Tracker;
//import flixel.system.FlxAssets.FlxShader;
//import extensions.funkinvslice.funkin.custom.NativeFileSystem;
#end