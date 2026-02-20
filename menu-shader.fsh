uniform vec2 center; 
uniform vec2 resolution;
uniform float time;
uniform vec2 mouse; 
uniform float pulse1;
uniform float pulse2;
uniform float pulse3; 




#define wavingFlag

void main(){
	vec2 uv = gl_FragCoord.xy / resolution.xy;

	const float waveSpeed = 3.0;
	const float waveScaleX = 10.0;
	const float waveScaleY = 10.0;

	float wave  = sin(time * waveSpeed + uv.x * waveScaleX + (uv.y * waveScaleY));
		  wave += cos(time * waveSpeed + uv.x * waveScaleX + (uv.y * waveScaleY));
	
	#ifndef wavingFlag
    	wave = 0.0;
    #endif
   
	uv = reflect(uv, vec2(wave * 0.075));

	vec4 backgroundColor = vec4(0.5, 0.5, 0.5, 1.0);
	vec4 flagColor		 = uv.y > 0.5 ? vec4(1.0, 0.0, 0.0, 1.0) + wave * 0.25 : vec4(1.0) + wave * 0.25;

	gl_FragColor = uv.x > 0.1 && uv.x < 0.9
			&&  uv.y > 0.1 && uv.y < 0.9 ? flagColor : backgroundColor;
}