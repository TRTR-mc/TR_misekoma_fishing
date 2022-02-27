#version 150

uniform sampler2D DiffuseSampler;
uniform sampler2D InputSampler;
uniform float Time;
uniform vec3 Condition;

in vec2 texCoord;

out vec4 gl_FragColor;

// 乱数
float random (vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898,78.233)))* 43758.5453123);
}

void main(){
    // テクスチャをとる
    vec4 InTexel = texture(DiffuseSampler, texCoord);
    // condition判定
    vec4 ConditionTexel = texture2D(InputSampler, vec2(0.0, 0.0));
    if (ConditionTexel.rgb == Condition) {
        // noise
        vec2 st = texCoord * Time;
        float rnd = random( st);
        gl_FragColor = vec4(vec3(rnd), 1.0);
    } 
    else {gl_FragColor = InTexel;}
}