import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FilePage(),
    );
  }
}

class FilePage extends StatefulWidget {
  const FilePage({super.key});

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  String message = 'No file created yet.';

  Future<void> writeFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/student.txt');

    await file.writeAsString('Hello from Flutter!');

    setState(() {
      message = 'File written successfully.';
    });
  }

  Future<void> readFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/student.txt');

    if (await file.exists()) {
      final content = await file.readAsString();

      setState(() {
        message = content;
      });
    } else {
      setState(() {
        message = 'File does not exist.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Handling'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: writeFile,
              child: const Text('Write File'),
            ),
            ElevatedButton(
              onPressed: readFile,
              child: const Text('Read File'),
            ),
          ],
        ),
      ),
    );
  }
}
