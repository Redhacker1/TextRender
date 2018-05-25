#version 330 core

struct SamplerDummy { int _dummyValue; };
struct SamplerComparisonDummy { int _dummyValue; };

struct TextRender_Resources_Text_VertexInput
{
    vec2 Position;
    vec2 TexCoords;
    vec4 Color;
};

struct TextRender_Resources_Text_FragmentInput
{
    vec4 SystemPosition;
    vec2 TexCoords;
    vec4 Color;
};

uniform sampler2D SurfaceTexture;

const SamplerDummy SurfaceSampler = SamplerDummy(0);


vec4 FS( TextRender_Resources_Text_FragmentInput input_)
{
    return texture(SurfaceTexture, input_.TexCoords);
}


in vec2 fsin_0;
in vec4 fsin_1;
out vec4 _outputColor_;

void main()
{
    TextRender_Resources_Text_FragmentInput input_;
    input_.SystemPosition = gl_FragCoord;
    input_.TexCoords = fsin_0;
    input_.Color = fsin_1;
    vec4 output_ = FS(input_);
    _outputColor_ = output_;
}
