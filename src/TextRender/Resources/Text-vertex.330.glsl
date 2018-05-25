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

layout(std140) uniform Projection
{
    mat4 field_Projection;
};

layout(std140) uniform Position
{
    vec4 field_Position;
};


TextRender_Resources_Text_FragmentInput VS( TextRender_Resources_Text_VertexInput input_)
{
    TextRender_Resources_Text_FragmentInput output_;
    vec4 worldPosition = field_Projection * vec4(input_.Position, 0, 1) + field_Position;
    output_.SystemPosition = worldPosition;
    output_.Color = input_.Color;
    output_.TexCoords = input_.TexCoords;
    return output_;
}


in vec2 Position;
in vec2 TexCoords;
in vec4 Color;
out vec2 fsin_0;
out vec4 fsin_1;

void main()
{
    TextRender_Resources_Text_VertexInput input_;
    input_.Position = Position;
    input_.TexCoords = TexCoords;
    input_.Color = Color;
    TextRender_Resources_Text_FragmentInput output_ = VS(input_);
    fsin_0 = output_.TexCoords;
    fsin_1 = output_.Color;
    gl_Position = output_.SystemPosition;
        gl_Position.z = gl_Position.z * 2.0 - gl_Position.w;
}
