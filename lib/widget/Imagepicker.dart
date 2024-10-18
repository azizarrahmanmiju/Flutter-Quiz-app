import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  const PickImage({super.key, required this.onpickimage});

  final void Function(File image) onpickimage;

  @override
  State<StatefulWidget> createState() {
    return _PickImage();
  }
}

class _PickImage extends State<PickImage> {
  File? selectedimage;
  void loadimage() async {
    final ImagePicker imagePicker = ImagePicker();
    final PickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery, maxWidth: 120);

    if (PickedImage == null) {
      return;
    }
    setState(() {
      selectedimage = File(PickedImage.path);
    });
    widget.onpickimage(selectedimage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: IconButton(
        icon: const Icon(Icons.image),
        onPressed: () {
          loadimage();
        },
      ),
    );

    if (selectedimage != null) {
      content = InkWell(
        onTap: () {
          loadimage();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.file(
            selectedimage!,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color.fromARGB(255, 244, 245, 250),
          border: Border.all(
            width: 2,
            color: const Color.fromARGB(255, 0, 4, 255),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: content,
        ));
  }
}
