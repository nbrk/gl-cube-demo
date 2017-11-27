#version 420 core

in vec3 vPosition;
in vec3 vColor;

out vec3 VColor;
out vec2 texcoords;

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


  vec4 pos = trans * vec4(vPosition.xyz, 1);
  gl_Position = pos;
  texcoords = normalize(pos.xy);
  VColor = vColor;
}


