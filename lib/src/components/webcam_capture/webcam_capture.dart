import 'dart:convert';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:image/image.dart';

import '../../blocs/id_bloc.dart';

@Component(
  selector: "id-webcam",
  templateUrl: "webcam_capture.html",
  styleUrls: ["webcam_capture.css"],
)
class WebcamCapture implements OnInit, OnDestroy {
  @Input()
  IdBloc idBloc;

  @ViewChild("streamOutputEl")
  VideoElement streamOutput;
  @ViewChild("canvasEl")
  CanvasElement canvas;

  MediaStream webcamStream;

  @override
  void ngOnInit() async {
    try {
      webcamStream = await window.navigator.getUserMedia(video: true);
      streamOutput.srcObject = webcamStream;
    } finally {}
  }

  void takePicture() async {
    if (webcamStream == null) return;
    await window.animationFrame;
    canvas.context2D.drawImage(streamOutput, 0, 0);
    // doesn't need to be a jpeg now since we need to transform it anyway
    var data = canvas.toDataUrl().substring(22); // data:image/png;base64,
    var landscape = PngDecoder().decodeImage(base64Decode(data));
    var portrait = copyRotate(landscape, -90);
    idBloc.dispatch(UploadImageEvent(JpegEncoder().encodeImage(portrait)));
  }

  @override
  void ngOnDestroy() {
    if (webcamStream == null) return;
    for (var track in webcamStream.getTracks()) {
      track.stop();
    }
    streamOutput.srcObject = null;
  }
}
