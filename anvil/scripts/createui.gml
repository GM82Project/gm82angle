i=instance_create(8,8,Button)
i.w=240
i.action="load"
i.text="Load shader source"

i=instance_create(248,8,Button)
i.w=240
i.action="reload"
i.text="Reload from disk"

i=instance_create(8,72,Button)
i.w=240
i.action="edit"
i.text="Open in editor"

i=instance_create(248,72,Button)
i.w=240
i.action="open input"
i.text="Show in folder"


i=instance_create(8,40,TextField)
i.w=480
i.type=4
i.action="path"
i.maxlen=46

i=instance_create(496,8,Button)
i.w=96
i.action="shadertype"
i.text="VS 2.0"
i.shadertype="vs2"
i.alt="Vertex Shader version 2.a"

i=instance_create(592,8,Button)
i.w=96
i.action="shadertype"
i.text="PS 2.0"
i.shadertype="ps2"
i.alt="Pixel Shader version 2.b"

i=instance_create(496,40,Button)
i.w=96
i.action="shadertype"
i.text="VS 3.0"
i.shadertype="vs3"
i.alt="Vertex Shader version 3.0"

i=instance_create(592,40,Button)
i.w=96
i.action="shadertype"
i.text="PS 3.0"
i.shadertype="ps3"
i.alt="Pixel Shader version 3.0"

i=instance_create(496,72,Button)
i.w=80
i.action="shadertype"
i.text="Studio"
i.shadertype="studio"
i.alt="Studio GLSL shader"

i=instance_create(576,72,Button)
i.w=112
i.action="shadertype"
i.text="Shadertoy"
i.shadertype="shadertoy"
i.alt="Shadertoy GLSL shader"


i=instance_create(0,112,TextArea)
i.w=WIDTH-32
i.h=208
i.action="source"

area=i

i=instance_create(WIDTH-32,112,Button)
i.action="source up"
i.sprite=0

i=instance_create(WIDTH-32,112+32,Scrollbar)
i.scroll=area
i.size=112

SCROLL_IN=i

i=instance_create(WIDTH-32,320-32,Button)
i.action="source down"
i.sprite=1


i=instance_create(8,328,Button)
i.w=224
i.action="compile"
i.text="Compile"
i.alt="Compile the shader and save the binary next to the source file (or in the save-as location if set)"

i=instance_create(232,328,Button)
i.w=224
i.action="copy intermediate"
i.text="Copy transpiled HLSL"
i.alt="Copies the intermediate HLSL shader#created by Angle while transpiling GLSL#(when compiling Studio or Shadertoy shaders)"

i=instance_create(464,328,Button)
i.w=224
i.action="saveas"
i.text="Save as..."
i.alt="Change the save location for the compiled shader"


i=instance_create(0,400,TextArea)
i.w=WIDTH-32
i.h=208
i.action="output"

area=i

i=instance_create(WIDTH-32,400,Button)
i.action="output up"
i.sprite=0

i=instance_create(WIDTH-32,400+32,Scrollbar)
i.scroll=area
i.size=112

SCROLL_OUT=i

i=instance_create(WIDTH-32,608-32,Button)
i.action="output down"
i.sprite=1


i=instance_create(8,616,Button)
i.w=224
i.action="copy uniform"
i.text="Copy uniform code"
i.alt="Copies GML code to set up every#uniform used by this shader"

i=instance_create(232,616,Button)
i.w=224
i.action="copy base64"
i.text="Copy packed shader"
i.alt="Copies a compact shader declaration#for embedding in GML source code"

i=instance_create(464,616,Button)
i.w=224
i.action="open output"
i.text="Show in folder"



//initialize all buttons
with (Button) event_user(0)
with (Scrollbar) event_user(0)
with (TextArea) event_user(0)
