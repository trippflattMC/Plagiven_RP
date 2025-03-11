#version 150

#moj_import <minecraft:fog.glsl>
#define emissive_a 0.996078431372549

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec2 texCoord0;
in vec4 vertexColor;

out vec4 fragColor;

void main() {
    vec4 baseColor = texture(Sampler0, texCoord0);
    if (baseColor.a < 0.1) {
        discard;
    } else if (baseColor.a == emissive_a) {
        fragColor = baseColor;
    } else {
        fragColor = linear_fog(baseColor * vertexColor * ColorModulator, vertexDistance, FogStart, FogEnd, FogColor);
    }
}
