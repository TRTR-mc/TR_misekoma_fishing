#version 150

uniform sampler2D DiffuseSampler;
uniform sampler2D InputSampler;
uniform float Time;

in vec2 texCoord;
//in vec2 oneTexel;

out vec4 fragColor;

void main(){
    fragColor = texture2D(DiffuseSampler, texCoord);
    // particle判定
    vec4 InputTexel = texture2D(InputSampler, vec2(0.5, 0.5));
    float maxColor = max(max(InputTexel.r, InputTexel.g),InputTexel.b);
    float minColor = min(min(InputTexel.r, InputTexel.g),InputTexel.b);
    if (maxColor * 0.1 > minColor) {
        // 黄
        if (InputTexel.rgb == vec3(maxColor, maxColor, minColor)) fragColor = vec4(1.0, 1.0, 0.0, 1.0);
        // 緑
        if (InputTexel.rgb == vec3(minColor, maxColor, minColor)) fragColor = vec4(0.0, 1.0, 0.0, 1.0);
        // 青
        if (InputTexel.rgb == vec3(minColor, minColor, maxColor)) fragColor = vec4(0.0, 0.0, 1.0, 1.0);
    }
}