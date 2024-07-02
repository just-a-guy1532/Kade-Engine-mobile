import flixel.system.FlxAssets.FlxShader;

class ChromaticAberration extends FlxShader
{
vec4 ChromaticAberration(sampler2D tex,vec4 clr, vec2 uv){

    float dis = distance(uv,vec2(0.5));
    
    clr.r += texture(tex,uv + (dis*0.005)).r;
    clr.g += (tex,uv).g;
    clr.b += texture(tex,uv - (dis*0.005)).b;
    return clr;
    
    
}

void mainImage( out vec4 fragColor, in vec2 fragCoord ){
    vec2 uv = fragCoord.xy / iResolution.xy;
	
    
    fragColor = ChromaticAberration(iChannel0,fragColor, uv);
    

}
public function new()
	{
		super();

	}
}
