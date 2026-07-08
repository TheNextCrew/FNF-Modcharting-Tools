package modcharting;

import flixel.graphics.tile.FlxDrawTrianglesItem.DrawData;
import openfl.geom.Vector3D;
#if LEATHER
import game.Note;
#elseif (PSYCH && PSYCHVERSION >= "0.7")
import funkin.play.notes.Note;
#else
import Note;
#end
import flixel.FlxStrip;

class SustainStrip extends FlxStrip implements IFlxDestroyable
{
    private static final noteUV:Array<Float> = [
        0,0, //top left
        1,0, //top right
        0,0.5, //half left
        1,0.5, //half right    
        0,1, //bottom left
        1,1, //bottom right 
    ];
    private static final noteIndices:Array<Int> = [
        0,1,2,1,3,2, 2,3,4,3,4,5
        //makes 4 triangles
    ];

    private var daNote:Note;

    override public function new(daNote:Note)
    {
        this.daNote = daNote;
        daNote.alpha = 1;
        super(0,0);
        loadGraphic(daNote.updateFramePixels());
        shader = daNote.shader;
        for (uv in noteUV)
        {
            uvtData.push(uv);
            vertices.push(0);
        }
        for (ind in noteIndices)
            indices.push(ind);
    }

    // TODO: check this for cases when zoom is less than initial zoom...
	public function drawData(cameraStuff:Array<FlxCamera>):Void
    {
        if (alpha <= 0 || !visible || graphic == null || vertices == null)
            return;

        for (camera in cameraStuff)
        {
            if (!camera.visible || !camera.exists/*  || !isOnScreen(camera) */)
                continue;

            getScreenPosition(_point, camera).subtractPoint(offset);
            #if !flash
            camera.drawTriangles(graphic, vertices, indices, uvtData, colors, _point, blend, repeat, antialiasing, colorTransform, shader);
            #else
            camera.drawTriangles(graphic, vertices, indices, uvtData, colors, _point, blend, repeat, antialiasing);
            #end
        }
    }

    private static var rVerts:Array<Float> = [];
    //private static var rYOffset:Float = -1;
    inline public function constructVertices(noteData:NotePositionData, thisNotePos:Vector3D, nextHalfNotePos:NotePositionData, nextNotePos:NotePositionData, flipGraphic:Bool, reverseClip:Bool)
    {
        //var yOffset = -1; //fix small gaps
        /*  rYOffset = -1; //fix small gaps
        if (reverseClip)
            rYOffset *= -1; */

        //var verts:Array<Float> = [];
        rVerts = [];
        if (flipGraphic)
        {
            rVerts.push(nextNotePos.x);
            rVerts.push(nextNotePos.y); //slight offset to fix small gaps
            rVerts.push(nextNotePos.x+(daNote.frameWidth*(1/-nextNotePos.z)*noteData.scaleX));
            rVerts.push(nextNotePos.y);

            rVerts.push(nextHalfNotePos.x);
            rVerts.push(nextHalfNotePos.y);
            rVerts.push(nextHalfNotePos.x+(daNote.frameWidth*(1/-nextHalfNotePos.z)*noteData.scaleX));
            rVerts.push(nextHalfNotePos.y);

            rVerts.push(thisNotePos.x);
            rVerts.push(thisNotePos.y);
            rVerts.push(thisNotePos.x+(daNote.frameWidth*(1/-thisNotePos.z)*nextNotePos.scaleX));
            rVerts.push(thisNotePos.y);
        }
        else 
        {
            rVerts.push(thisNotePos.x);
            rVerts.push(thisNotePos.y); //fliped this with the down ones (last) to test if it bugs of it fixes itself
            rVerts.push(thisNotePos.x+(daNote.frameWidth*(1/-thisNotePos.z)*noteData.scaleX));
            rVerts.push(thisNotePos.y);

            rVerts.push(nextHalfNotePos.x);
            rVerts.push(nextHalfNotePos.y);
            rVerts.push(nextHalfNotePos.x+(daNote.frameWidth*(1/-nextHalfNotePos.z)*noteData.scaleX));
            rVerts.push(nextHalfNotePos.y);

            rVerts.push(nextNotePos.x);
            rVerts.push(nextNotePos.y); //slight offset to fix small gaps
            rVerts.push(nextNotePos.x+(daNote.frameWidth*(1/-nextNotePos.z)*nextNotePos.scaleX));
            rVerts.push(nextNotePos.y);
        }
        vertices = new DrawData(12, true, rVerts);
    }
}