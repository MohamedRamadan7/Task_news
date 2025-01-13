import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'features/views/home/home_view.dart';

void main() {
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FilePickerDemo(title: "File picker demo"),
    );
  }
}

class FilePickerDemo extends StatefulWidget {
  const FilePickerDemo({super.key, required this.title});

  final String title;

  @override
  State<FilePickerDemo> createState() => _FilePickerDemoState();
}

class _FilePickerDemoState extends State<FilePickerDemo> {
  FilePickerResult? result;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("File picker demo"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (result != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Selected file:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: result?.files.length ?? 0,
                        itemBuilder: (context, index) {
                          return Text(result?.files[index].name ?? '',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 5,
                          );
                        },
                      )
                    ],
                  ),
                ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () async {
                    result = await FilePicker.platform.pickFiles(
                      allowMultiple: true,
                      type: FileType.custom,
                      allowedExtensions: ['jpg', 'doc'],
                    );
                    if (result == null) {
                      print("No file selected");
                    } else {
                      setState(() {});
                      for (var element in result!.files) {
                        print(element.name);
                      }
                    }
                  },
                  child: const Text("Files Picker"),
                ),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    result = await FilePicker.platform.pickFiles();
                    if (result == null) {
                      print("No file selected");
                    } else {
                      setState(() {});
                      for (var element in result!.files) {
                        print(element.name);
                      }
                    }
                    // Open single file
                    final file = result!.files.first;
                    openFile(file);
                    print('Bytes: ${file.bytes}');
                    print('Name: ${file.name}');
                    print('Size: ${file.size}');
                    print('Extension: ${file.extension}');
                    print('Path: ${file.path}');

                    final newFile = await saveFilePermently(file);
                    print('From Path: ${file.path}');
                    print('To Path: ${newFile.path}');
                  },
                  child: const Text("File Picker"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<File> saveFilePermently(PlatformFile file) async {
  final appStorage = await getApplicationDocumentsDirectory();
  final newFile = File('${appStorage.path}/${file.name}');
  return File(file.path!).copy(newFile.path);
}

void openFile(PlatformFile file) {
  OpenFile.open(file.path!);
}
