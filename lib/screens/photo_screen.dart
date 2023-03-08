import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoCameraScreen extends StatefulWidget {
  const PhotoCameraScreen({Key? key}) : super(key: key);

  @override
  State<PhotoCameraScreen> createState() => _PhotoCameraScreenState();
}

class _PhotoCameraScreenState extends State<PhotoCameraScreen> {
  static List imageList = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
  ];
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        imageList.add(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photos"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.photo_library),
            onPressed: () => _pickImage(ImageSource.gallery),
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () => _pickImage(ImageSource.camera),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: imageList
            .map((e) => e.toString().contains("assets/images/")
                ? Image.asset(
                    e,
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    File(e),
                    fit: BoxFit.cover,
                  ))
            .toList(),
      ),
    );
  }
}
