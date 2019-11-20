// Author @patriciogv - 2015
// http://patriciogonzalezvivo.com
// Source: https://thebookofshaders.com/07/

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float circle(in vec2 _st, in float _radius, 
             vec2 o) {
    vec2 toVec = vec2(0.5) - o;
    vec2 dist = _st-o;
    // vec2 dist = _st-(o + toVec * cos(u_time));
	return 1.-smoothstep(_radius-(_radius*0.01),
                         _radius+(_radius*0.01),
                         dot(dist,dist)*8.0);
}

mat2 rotate(float d) {
    return mat2(
    	cos(radians(d)), -sin(radians(d)),
    	sin(radians(d)), cos(radians(d)));
}


void main(){
	vec2 st = gl_FragCoord.xy/u_resolution.xy;
    vec2 base = vec2(0., 1.);

	vec3 color = vec3(0.0);
    float radius = 1.0;
    float r = circle(st, radius, vec2(0.25));
    float g = circle(st, radius, vec2(0.50, 0.75));
    float b = circle(st, radius, vec2(0.75, 0.25));

	gl_FragColor = vec4(r, g, b, 1.0 );
}
