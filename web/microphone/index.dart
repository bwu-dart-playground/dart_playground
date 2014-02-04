import 'dart:html';
import 'dart:async';
import 'dart:web_audio';

void main() {
  window.navigator.getUserMedia(video: true, audio: true).then((MediaStream stream) {

    var context = new AudioContext();
    GainNode volume = context.createGain();
    MediaStreamAudioSourceNode audioInput = context.createMediaStreamSource(stream);
    audioInput.connectNode(volume);

    int bufferSize = 2048;
    ScriptProcessorNode recorder = context.createJavaScriptNode(bufferSize, 2, 2);

    recorder.onAudioProcess.listen((AudioProcessingEvent e) {
      print('recording');
      var left = e.inputBuffer.getChannelData(0);
      var right = e.inputBuffer.getChannelData(1);
      print(left);
      // process Data
    });

    volume.connectNode(recorder);
    recorder.connectNode(context.destination);


/**
 *  Doesn't work as HttpRequest doesn't support blob urls
 */
//    String url = Url.createObjectUrlFromStream(stream);
//    var xhr = new HttpRequest();
//    xhr.responseType = 'blob';
//    xhr.onLoad.listen((ProgressEvent e) {
//      print(xhr.response);
//      var recoveredBlog = xhr.response;
//      var reader = new FileReader();
//
//      reader.onLoad.listen((e) {
//        var blobAsDataUrl = reader.result;
//        reader.readAsDataUrl(blobAsDataUrl);
//      });
//    });
//    xhr.open('GET', url);
//    xhr.send();



//    var audio = document.querySelector('audio') as AudioElement;
//    audio.controls = true;
//    audio.src = url;
  });
}
