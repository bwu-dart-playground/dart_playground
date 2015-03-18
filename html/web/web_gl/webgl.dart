import 'dart:html';
import 'dart:web_gl' as WebGL;
import 'dart:typed_data';
import 'dart:math';
import 'package:vector_math/vector_math.dart';

WebGL.RenderingContext gl;
CanvasElement canvas;
Quad quad;

void main() {
  canvas = querySelector("#game_canvas");
  gl = canvas.getContext("experimental_webgl");
  if (gl == null) {
    gl = canvas.getContext("webgl");
  }
  if (gl == null) {
    canvas.remove();
    querySelector("#error_log").text = "No WebGL";
    return;
  }

  quad = new Quad(new Shader("""
precision highp float;

attribute vec3 a_pos;

uniform mat4 u_transform;
uniform mat4 u_view;

void main() {
  gl_Position = u_view * u_transform * vec4(a_pos, 1.0);
}
""", """
precision highp float;

uniform vec4 u_color;

void main() {
  gl_FragColor = u_color;
}
"""
));

  gl.enable(WebGL.DEPTH_TEST);
  gl.clearColor(0.0, 0.0, 0.0, 1.0);
  render();
}

void render() {

  gl.viewport(0, 0, canvas.width, canvas.height);
  gl.clear(WebGL.COLOR_BUFFER_BIT | WebGL.DEPTH_BUFFER_BIT);

  Matrix4 view = makePerspectiveMatrix(70.0*PI/180.0, canvas.width / canvas.height,         0.1, 100.0);


 quad.setView(view);

  quad.render(new Vector3(150.0, 150.0, 30.0), 100, 100, new Vector4(1.0, 0.0, 0.0, 1.0));
  //quad.render(new Vector3(450.0, 150.0, 0.0), 100, 100, new Vector4(0.0, 1.0, 1.0, 1.0));
}

class Quad {

  Shader shader;
  int posLocation;
  WebGL.UniformLocation transformLocation, colorLocation, viewLocation;

  Quad(this.shader) {
    posLocation = gl.getAttribLocation(shader.program, "a_pos");
    transformLocation = gl.getUniformLocation(shader.program, "u_transform");
    colorLocation = gl.getUniformLocation(shader.program, "u_color");
    viewLocation = gl.getUniformLocation(shader.program, "u_view");

    Float32List vertexArray = new Float32List(4 * 3);
    vertexArray.setAll(0 * 3, [0.0, 0.0, 0.0]);
    vertexArray.setAll(1 * 3, [1.0, 0.0, 0.0]);
    vertexArray.setAll(2 * 3, [1.0, 1.0, 0.0]);
    vertexArray.setAll(3 * 3, [0.0, 1.0, 0.0]);

    Int16List indexArray = new Int16List(6);
    indexArray.setAll(0, [0, 1, 2, 0, 2, 3]);

    gl.useProgram(shader.program);
    gl.enableVertexAttribArray(posLocation);
    WebGL.Buffer vertexBuffer = gl.createBuffer();
    gl.bindBuffer(WebGL.ARRAY_BUFFER, vertexBuffer);
    gl.bufferDataTyped(WebGL.ARRAY_BUFFER, vertexArray, WebGL.STATIC_DRAW);
    gl.vertexAttribPointer(posLocation, 3, WebGL.FLOAT, false, 0, 0);

    WebGL.Buffer indexBuffer = gl.createBuffer();
    gl.bindBuffer(WebGL.ELEMENT_ARRAY_BUFFER, indexBuffer);
    gl.bufferDataTyped(WebGL.ELEMENT_ARRAY_BUFFER, indexArray, WebGL.STATIC_DRAW);
    gl.bindBuffer(WebGL.ELEMENT_ARRAY_BUFFER, indexBuffer);
  }

  void setView(Matrix4 view) {
    gl.uniformMatrix4fv(viewLocation, false, view.storage);
  }

  Matrix4 matrix = new Matrix4.identity();

  void render(Vector3 pos, int w, int h, Vector4 color) {

    matrix.setIdentity();
    matrix.translate(pos.x - w / 2.0, pos.y - h / 2.0, pos.z);
    matrix.scale(w * 1.0, h * 1.0, 0.0);
    gl.uniformMatrix4fv(transformLocation, false, matrix.storage);

    gl.uniform4fv(colorLocation, color.storage);
    gl.drawElements(WebGL.TRIANGLES, 6, WebGL.UNSIGNED_SHORT, 0);
  }
}

class Shader {

  String vsSource, fsSource;
  WebGL.Shader vertexShader, fragmentShader;
  WebGL.Program program;

  Shader(this.vsSource, this.fsSource) {
    compile();
  }

  void compile() {
    vertexShader = gl.createShader(WebGL.VERTEX_SHADER);
    gl.shaderSource(vertexShader, vsSource);
    gl.compileShader(vertexShader);
    if (!gl.getShaderParameter(vertexShader, WebGL.COMPILE_STATUS)) {
      throw gl.getShaderInfoLog(vertexShader);
    }

    fragmentShader = gl.createShader(WebGL.FRAGMENT_SHADER);
    gl.shaderSource(fragmentShader, fsSource);
    gl.compileShader(fragmentShader);
    if (!gl.getShaderParameter(fragmentShader, WebGL.COMPILE_STATUS)) {
      throw gl.getShaderInfoLog(fragmentShader);
    }

    program = gl.createProgram();
    gl.attachShader(program, vertexShader);
    gl.attachShader(program, fragmentShader);
    gl.linkProgram(program);
    if (!gl.getProgramParameter(program, WebGL.LINK_STATUS)) {
      throw gl.getProgramInfoLog(program);
    }
  }
}