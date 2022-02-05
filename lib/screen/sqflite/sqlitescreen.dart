import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_workouts/screen/component/workoutswidget.dart';
import 'package:flutter_workouts/screen/sqflite/dbhelper.dart';
import 'package:flutter_workouts/util/base64util.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants.dart';
import 'model/photo.dart';

class SqfLiteScreen extends StatefulWidget {
  const SqfLiteScreen({Key? key}) : super(key: key);

  @override
  _SqfLiteScreenState createState() => _SqfLiteScreenState();
}

class _SqfLiteScreenState extends State<SqfLiteScreen> {
  Future<File>? imageFile;
  Image? image;
  List<Photo>? images;
  ImagePicker? imagePicker;
  DatabaseHandler? databaseHandler;
  @override
  void initState() {
    super.initState();
    images = [];
    imagePicker = new ImagePicker();
    databaseHandler = DatabaseHandler();
    refreshImages();
  }

  refreshImages() {
    images!.clear();
    databaseHandler!.allPhotos().then((value) {
      setState(() {
        images!.clear();
        images!.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WorkOutsWidget(
      isSeconPage: true,
      headTitle: "SqfLite",
      headSubtitle: "",
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: kDefaultSize * 5,
              child: ElevatedButton(
                onPressed: () {
                  _getFromGallery();
                },
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(4),
                    backgroundColor: MaterialStateProperty.all(kRedColor)),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text(AppLocalizations.of(context)!.adduse),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: kDefaultSize / 4),
          Container(
            decoration: boxShadowBoxDecor,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .65,
                  margin: EdgeInsets.symmetric(horizontal: kDefaultSize),
                  child: imgListGrid(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  imgListGrid() {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      children: images!.map((e) {
        return ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(kDefaultSize)),
            child: Base64Util.imageFromBase64STring(e.photo.toString()));
      }).toList(),
    );
  }

  _getFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (image != null) {
      File imageFile = File(image.path);
      String imgString = Base64Util.base64String(imageFile.readAsBytesSync());
      Photo photo = Photo(0, imgString);
      List<Photo> phList = <Photo>[];
      phList.add(photo);
      databaseHandler!.insert(phList);
      refreshImages();
    }
  }
}
