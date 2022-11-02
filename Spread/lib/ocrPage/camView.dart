import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:card_settings/card_settings.dart';

class CamView extends StatefulWidget {
  @override
  _CamViewState createState() => _CamViewState();
}

class _CamViewState extends State<CamView> {
  XFile? _rawPhoto;
  CroppedFile? _croppedPhoto;
  RecognizedText? _recogText;
  final TextRecognizer _textRecognizer = TextRecognizer();
  List<String> blockLines = [];
///////////////////////////////////////////////////////////////////////////////////////////////
  final TextEditingController _itemNameCont = TextEditingController();
  final TextEditingController _descCont = TextEditingController();
  final TextEditingController _restNameCont = TextEditingController();
  final TextEditingController _tagsCont = TextEditingController();

  List<String> itemTypes = <String>[
    "Cocktail",
    "Non-Alchoholic Beverage",
    "American",
    "Mexican",
    "Italian",
    "Chinese",
    "Japanese",
    "Indian",
    "Vietamese",
    'Medaterianan'
  ];

  void initControllerVal(List blockLines) {
    debugPrint("Entering initCont!");
    debugPrint(blockLines[0]);
    int index = 1;
    int numLines = blockLines.length - 1;
    _itemNameCont.text = blockLines[0];
    while (index < numLines) {
      _descCont.text = _descCont.text + blockLines[index];
      index += 1;
    }
  }

  void save() {}

  Widget itemForm(List blockLines) {
    final formKey = GlobalKey<FormState>();
    initControllerVal(blockLines);
    return Column(
      children: [
        Form(
            key: formKey,
            child: CardSettings(
              children: <CardSettingsSection>[
                CardSettingsSection(
                  children: [
                    CardSettingsText(
                      label: "Resturant Name: ",
                      hintText: "Enter Resturant Name",
                    ),
                    CardSettingsText(
                      label: "Item Name: ",
                      controller: _itemNameCont,
                    ),
                    CardSettingsListPicker(
                      items: itemTypes,
                      initialItem: itemTypes[0],
                      label: 'Item Type',
                    ),
                    CardSettingsParagraph(
                      maxLength: 1000,
                      label: "Description: ",
                      controller: _descCont,
                    ),
                    CardSettingsNumberPicker(
                      label: 'Rating',
                      min: 1,
                      max: 5,
                      initialValue: 5,
                    ),
                    CardSettingsParagraph(
                      label: "Hashtags",
                      hintText: "Add your hashtags!",
                    ),
                    CardSettingsButton(
                        label: 'Save',
                        onPressed: (() => {debugPrint('SAVED!')}))
                  ],
                ),
              ],
            ))
      ],
    );
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  void takePic() async {
    final ImagePicker picker = ImagePicker();
    _rawPhoto = await picker.pickImage(
      source: ImageSource.camera,
    );
    _cropImage(_rawPhoto!.path);
    //Navigator.pop(context);
  }

  _cropImage(rawPic) async {
    _croppedPhoto = await ImageCropper().cropImage(
      sourcePath: rawPic,
      uiSettings: [
        AndroidUiSettings(
            cropGridRowCount: 14,
            cropGridColumnCount: 8,
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
  }

  void closeRecog() async {
    _textRecognizer.close();
    super.dispose();
  }

  processImg(InputImage croppedPic) async {
    _recogText = await _textRecognizer.processImage(croppedPic);
    blockLines = convertToLines(_recogText!);

    for (var element in blockLines) {
      debugPrint(element);
    }
    debugPrint(blockLines.length.toString());
    initControllerVal(blockLines);
    // ignore: use_build_context_synchronously
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => itemForm(blockLines)));
    // displayPopUp(lines);
  }

  List<String> convertToLines(RecognizedText recognizedText) {
    List<String> lines = [];
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine tLine in block.lines) {
        lines.add(tLine.text);
      }
    }
    return lines;
  }

  processText() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      shrinkWrap: true,
      children: [
        //const Text("Select Scan to take a picture of your menu item"),
        //const Text("Then Crop the photo to only include your chosen item"),
        ElevatedButton(onPressed: takePic, child: const Text("Scan")),
      ],
    ));
  }
}
