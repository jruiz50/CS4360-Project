import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class CamView extends StatefulWidget {
  @override
  _CamViewState createState() => _CamViewState();
}

class _CamViewState extends State<CamView> {
  XFile? _rawPhoto;
  CroppedFile? _croppedPhoto;
  RecognizedText? _recogText;
  final TextRecognizer _textRecognizer = TextRecognizer();

  void takePic() async {
    final ImagePicker picker = ImagePicker();
    _rawPhoto = await picker.pickImage(
      source: ImageSource.camera,
    );
    dynamic item = _cropImage(_rawPhoto!.path);
    //Navigator.pop(context);
  }

  _cropImage(rawPic) async {
    _croppedPhoto = await ImageCropper().cropImage(
      sourcePath: rawPic,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop Menu Item',
            toolbarColor: Colors.green,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(title: "Crop Menu Item"),
        WebUiSettings(
          context: context,
          presentStyle: CropperPresentStyle.dialog,
          boundary: const CroppieBoundary(
            width: 520,
            height: 520,
          ),
          viewPort:
              const CroppieViewPort(width: 480, height: 480, type: 'circle'),
          enableExif: true,
          enableZoom: true,
          showZoomer: true,
        ),
      ],
    );
    InputImage croppedInput = InputImage.fromFilePath(_croppedPhoto!.path);
    processImg(croppedInput);

    //return _croppedPhoto;
  }

  void closeRecog() async {
    _textRecognizer.close();
    super.dispose();
  }

  processImg(InputImage croppedPic) async {
    _recogText = await _textRecognizer.processImage(croppedPic);
    List<String> lines = convertToLines(_recogText!);
    displayPopUp(lines);
    debugPrint(_recogText!.text);
  }

  List<String> convertToLines(RecognizedText recognizedText) {
    List<String> lines = [];
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine tLine in block.lines) {
        lines.add(tLine.text);
      }
    }
    //String name;
    //String desc = "";
    //int numLines;
    //name = lines[0];
    //numLines = lines.length - 1;
    //for (int i = 1; i < numLines; i++) {
    // desc = desc + lines[i] + "\n";
    // }
    return lines;
  }

  Future<void> displayPopUp(List<String> lines) {
    //List<String> itemStrings;

    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: const Text('Item'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Name of Item:'),
                    initialValue: lines[0],
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration:
                        const InputDecoration(labelText: 'Description:'),
                    initialValue: lines[1],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        const Text("Select Scan to take a picture of your menu item"),
        const Text("Then Crop the photo to only include your chosen item"),
        ElevatedButton(onPressed: takePic, child: const Text("Scan")),
      ],
    ));
  }
}
