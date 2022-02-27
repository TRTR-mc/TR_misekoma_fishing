#version 150

uniform sampler2D DiffuseSampler;
uniform sampler2D InputSampler;
uniform float Time;
uniform vec3 Condition;

in vec2 texCoord;
//in vec2 oneTexel;

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
        // 赤黒
        vec3 ColorScale = vec3(0.298912, 0.586611, 0.114478);
        vec4 color = texture2D(DiffuseSampler, texCoord);
        float v = color.r * ColorScale.x + color.g * ColorScale.y + color.b * ColorScale.z;
            if (v >= 0.25) {gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);}
            else {gl_FragColor = vec4(0.0, 0.0, 0.0, 0.0);}
        // noise(縦線)
        // 線のx座標
        float X = texCoord.x * 500.0;
        X = floor(X);
        vec2 st = vec2 (X, Time);
        float rnd = random( st);
        if (rnd >= 0.99) {
            // y
            float Y = texCoord.y * 250.0;
            Y = floor(Y);
            st = vec2 (X, Y);
            rnd = random( st);
            st = vec2 (Time ,rnd);
            rnd = random( st);
            if (rnd < 0.5) {gl_FragColor = vec4(0.0, 0.0, 0.0, 0.0);}
        }
    } 
    else {gl_FragColor = InTexel;}
}