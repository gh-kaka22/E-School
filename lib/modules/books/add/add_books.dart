import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileUpload extends StatefulWidget {
  @override
  _FileUploadState createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  File? _selectedFile; // the file that the user has selected

  // function to handle file selection
  Future<void> _selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'], // only allow PDF files
    );
    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  // function to handle file upload
  Future<void> _uploadFile() async {
    if (_selectedFile == null) {
      return; // no file selected, do nothing
    }
    final url = 'https://example.com/upload'; // replace with the URL of your server endpoint
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(_selectedFile!.path, filename: 'my_file.pdf'),
    });
    final response = await Dio().post(url, data: formData);
    if (response.statusCode == 200) {
      print('File uploaded successfully');
    } else {
      print('File upload failed with status code ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_selectedFile != null) Text(_selectedFile!.path), // show the selected file path, if there is one
            ElevatedButton(
              onPressed: _selectFile,
              child: Text('Select File'),
            ),
            ElevatedButton(
              onPressed: _uploadFile,
              child: Text('Upload File'),
            ),
          ],
        ),
      ),
    );
  }
}