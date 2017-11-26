#version 430 core

//in vec2 texcoord;
in vec3 vPosition;
in vec3 vColor;

//out vec2 Texcoord;
out vec3 VColor;

uniform vec3 rotAngles;


mat4 rotationMatrix(vec3 axis, float angle)
{
  axis = normalize(axis);
  float s = sin(angle);
  float c = cos(angle);
  float oc = 1.0 - c;


  return mat4
    (oc*axis.x*axis.x+c,oc*axis.x*axis.y-axis.z*s,oc*axis.z*axis.x+axis.y*s,0.0,
     oc*axis.x*axis.y+axis.z*s,oc*axis.y*axis.y+c,oc*axis.y*axis.z-axis.x*s,0.0,
     oc*axis.z*axis.x-axis.y*s,oc*axis.y*axis.z+axis.x*s,oc*axis.z*axis.z+c,0.0,
     0.0,0.0,0.0,1.0);
}


void
main()
{
  mat4 trans =
    rotationMatrix(vec3(1,0,0), rotAngles.x) *
    rotationMatrix(vec3(0,1,0), rotAngles.y) *
    rotationMatrix(vec3(0,0,1), rotAngles.z);

  //  Texcoord = texcoord;
  //  Texcoord = vPosition.xy;

  vec4 pos = trans * vec4(vPosition.xyz, 1);
  //  vec4 pos = vec4(vPosition.xy, 0, 1);
  VColor = vColor;
  gl_Position = pos;
}


