#version 450
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
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

layout(set = 0, binding = 0) uniform Projection
{
    mat4 field_Projection;
};


TextRender_Resources_Text_FragmentInput VS( TextRender_Resources_Text_VertexInput input_)
{
    TextRender_Resources_Text_FragmentInput output_;
    vec4 worldPosition = field_Projection * vec4(input_.Position, 0, 1);
    output_.SystemPosition = worldPosition;
    output_.Color = input_.Color;
    output_.TexCoords = input_.TexCoords;
    return output_;
}


layout(location = 0) in vec2 Position;
layout(location = 1) in vec2 TexCoords;
layout(location = 2) in vec4 Color;
layout(location = 0) out vec2 fsin_0;
layout(location = 1) out vec4 fsin_1;

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
        gl_Position.y = -gl_Position.y; // Correct for Vulkan clip coordinates
}
