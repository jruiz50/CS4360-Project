import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:card_settings/card_settings.dart';
import 'package:spread/main.dart';

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
    'Mediterranean'
  ];

  /// Initalizes the text controller fields with captured text from image.
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

  /// Saves the [picPath] to the image taken for the item form submission.
  /// After allowing the user to take a picture.
  saveWithPic() async {
    String picPath;
    picPath = await takePic();
    debugPrint('SAVE_PIC');
    pushHome();
  }

  /// Saves the form data without a picture.
  void saveNoPic() {
    debugPrint('SAVE_NO_PIC');
  }

  /// Sends the user to the home screen
  void pushHome() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const MyHomePage(title: 'Crave')));
  }

  /// Pop-up dialog which gives the user the option to an image to their
  /// item form submission.
  Future<void> addPictureDialog() async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Would you like to add a picture?'),
            children: <Widget>[
              TextButton(
                  onPressed: () => saveWithPic(), child: const Text('Yes')),
              TextButton(
                  onPressed: () => [pushHome(), saveNoPic()],
                  child: const Text('No'))
            ],
          );
        });
  }

  /// Takes a list [blockLines], of processed text, which
  /// is used to pre-populate an item form for submission.
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
                        label: 'Save', onPressed: addPictureDialog)
                  ],
                ),
              ],
            ))
      ],
    );
  }

  /// Allows the user to take an image of text that can be cropped and then
  /// processed.
  void takePicText() async {
    final ImagePicker picker = ImagePicker();
    _rawPhoto = await picker.pickImage(
      source: ImageSource.camera,
    );
    cropImageText(_rawPhoto!.path);
    //Navigator.pop(context);
  }

  /// Returns the [path] of the cropped image.
  takePic() async {
    Future<String> path;
    final ImagePicker picker = ImagePicker();
    _rawPhoto = await picker.pickImage(
      source: ImageSource.camera,
    );
    path = cropImage(_rawPhoto!.path);
    return path;
  }

  /// Takes a [rawPic] as input and allows the user to crop the image.
  /// The [path] of the cropped image is returned.
  Future<String> cropImage(rawPic) async {
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
    return _croppedPhoto!.path;
  }

  /// Takes a [rawPic] as input and then the cropped image is
  /// sent to be processed.
  cropImageText(rawPic) async {
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

  /// Closes the textRecognizer instance.
  void closeRecog() async {
    _textRecognizer.close();
    super.dispose();
  }

  /// Takes [croppedPic] of type InputImage and
  /// opens itemForm()
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

  /// Takes RecognizedText [recognizedText] and returns a list of lines
  List<String> convertToLines(RecognizedText recognizedText) {
    List<String> lines = [];
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine tLine in block.lines) {
        lines.add(tLine.text);
      }
    }
    return lines;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      shrinkWrap: true,
      children: [
        //const Text("Select Scan to take a picture of your menu item"),
        //const Text("Then Crop the photo to only include your chosen item"),
        ElevatedButton(onPressed: takePicText, child: const Text("Scan")),
      ],
    ));
  }
}
