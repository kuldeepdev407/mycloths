import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:image_picker/image_picker.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  List<CameraDescription> cameras = [];
  TextEditingController nameController = TextEditingController();
  String? nameError;
  CameraController? controller;
  bool isReady = false;

  // final ImagePicker _picker = ImagePicker();
  int itemType = 0;
  final activeButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      return Colors.blue;
    }),
  );
  String imgPath = "";
  bool isTakingpiture = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    deleteImage();
    controller!.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (!controller!.value.isInitialized) {
      return;
    }

    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${DateTime.now()}.png';

    if (controller!.value.isTakingPicture) {
      return;
    }

    try {
      await controller!.takePicture().then((XFile file) {
        File fileImage = File(file.path);
        fileImage.copy(filePath);
      });
      setState(() {
        imgPath = filePath;
        isTakingpiture = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void deleteImage() async {
    if (imgPath != "") {
      File file = File(imgPath);
      file.delete();
      setState(() {
        imgPath = "";
      });
    }
  }

  void uploadImage() async {
    deleteImage();
    setState(() {
      isTakingpiture = true;
    });
    cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        isReady = true;
      });
    });
  }

  void setActiveItemType(int index) {
    setState(() {
      itemType = index;
    });
  }

  void saveItem() {
    String name = nameController.text.trim();
    if (name.isEmpty) {
      setState(() {
        nameError = "Name is required";
      });
      return;
    } else {
      setState(() {
        nameError = null;
      });

      const boxStore = Item(name = name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          title: const Text('Add Item'),
          leading: IconButton(
              onPressed: () {
                context.go("/");
              },
              icon: const Icon(Icons.chevron_left_rounded))),
      body: isTakingpiture
          ? Column(
              children: <Widget>[
                Expanded(
                  child: CameraPreview(controller!),
                ),
                Row(children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _takePicture,
                      child: const Icon(Icons.camera_alt),
                    ),
                  ),
                ])
              ],
            )
          : SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: nameController,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                            decoration: const InputDecoration(
                              hintText: 'Item name',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        nameError ?? '',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    Card(
                        child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: imgPath != ""
                          ? Image.file(File(imgPath))
                          : SvgPicture.asset("assets/img/default-cloth.svg",
                              semanticsLabel: "Default Img",
                              height: 50,
                              width: 50),
                    )),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: uploadImage,
                                child: Text("UploadImg")))
                      ],
                    ),
                    imgPath != ""
                        ? Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      style: Theme.of(context)
                                          .elevatedButtonTheme
                                          .style!
                                          .copyWith(
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          return Colors.redAccent;
                                        }),
                                        foregroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          return Colors.white;
                                        }),
                                      ),
                                      onPressed: deleteImage,
                                      child: Text("Delete")))
                            ],
                          )
                        : const SizedBox(),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => saveItem(),
                            style: Theme.of(context)
                                .elevatedButtonTheme
                                .style
                                ?.copyWith(backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                              return Colors.greenAccent;
                            })),
                            child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "Add Item",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(color: Colors.white),
                                )),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
