#version 420 core


in vec2 texcoords;
in vec3 VColor;

out vec4 outColor;

//uniform samplerCube samp;
uniform sampler2D samp;

void
main()
{
  //  outColor = textureCube(samp, vec3(texcoords, 0));
  outColor = texture(samp, texcoords);
  //    outColor = vec4(0.0, 0.0, 1.0, 1.0);
  //  outColor = vec4(VColor, 1);
}
