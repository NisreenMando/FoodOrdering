import 'dart:io';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';
import 'package:image_picker/image_picker.dart';

class NewSingupView extends StatefulWidget {
  const NewSingupView({Key? key}) : super(key: key);

  @override
  State<NewSingupView> createState() => _NewSingupViewState();
}

class _NewSingupViewState extends State<NewSingupView> {
  final ImagePicker picker = ImagePicker();
  FileTypeModel? selectedFile;
  bool showOption = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Center(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                InkWell(
                  onTap: selectedFile == null
                      ? () {
                          setShowOption(true);
                        }
                      : null,
                  child: CircleAvatar(
                    radius: 50,
                    child: selectedFile == null || selectedFile!.path.isEmpty
                        ? const Icon(Icons.image)
                        : selectedFile!.type != FileType.FILE
                            ? Image.file(File(selectedFile!.path))
                            : const Icon(Icons.file_copy),
                  ),
                ),
                Visibility(
                  visible: selectedFile != null,
                  child: InkWell(
                    onTap: () {
                      setShowOption(true);
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.orange400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Visibility(
            visible: showOption,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  title: 'Camera',
                  onpressd: () {
                    pickFile(FileType.CAMERA)
                        .then((value) => selectedFile = value);
                  },
                ),
                CustomButton(
                  title: 'Gallery',
                  onpressd: () {
                    pickFile(FileType.GALLERY)
                        .then((value) => selectedFile = value);
                  },
                ),
                CustomButton(
                  title: 'File',
                  onpressd: () {
                    pickFile(FileType.FILE)
                        .then((value) => selectedFile = value);
                  },
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  void setShowOption(bool value) {
    setState(() {
      showOption = value;
    });
  }

  Future<FileTypeModel> pickFile(FileType type) async {
    String? path;
    switch (type) {
      case FileType.GALLERY:
        await picker
            .pickImage(source: ImageSource.gallery)
            .then((value) => path = value?.path ?? '');
        break;
      case FileType.CAMERA:
        await picker
            .pickImage(source: ImageSource.camera)
            .then((value) => path = value?.path ?? '');
        break;
      case FileType.FILE:
        await FilePicker.platform
            .pickFiles()
            .then((value) => path = value?.paths[0] ?? '');
        break;
    }
    setShowOption(false);
    return FileTypeModel(path ?? '', type);
  }
}

enum FileType {
  // ignore: constant_identifier_names
  GALLERY,
  CAMERA,
  FILE;
}

class FileTypeModel {
  FileType type;
  String path;

  FileTypeModel(this.path, this.type);
}
