import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';

import 'package:flutter_app_testing/screens/components/user/tutor/interview_page.dart';

class UploadDocuments extends StatefulWidget {
  @override
  _UploadDocumentsState createState() => _UploadDocumentsState();
}

class _UploadDocumentsState extends State<UploadDocuments> {
  String? _cvFileName;
  String? _certificateFileName;
  Uint8List? _cvFile;
  Uint8List? _certificateFile;

  Future<void> _pickCV() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null && result.files.single.bytes != null) {
      setState(() {
        _cvFileName = result.files.single.name;
        _cvFile = result.files.single.bytes;
      });
    }
  }

  Future<void> _pickCertificate() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png'],
    );

    if (result != null && result.files.single.bytes != null) {
      setState(() {
        _certificateFileName = result.files.single.name;
        _certificateFile = result.files.single.bytes;
      });
    }
  }

  void _handleSubmit() {
    Navigator.pushNamed(context, '/interview');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Documents',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFileUploadSection(
                      title: 'Upload CV',
                      fileName: _cvFileName,
                      onPressed: _pickCV,
                    ),
                    SizedBox(height: 20),
                    _buildFileUploadSection(
                      title: 'Upload Certificate',
                      fileName: _certificateFileName,
                      onPressed: _pickCertificate,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: _buildSubmitButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildFileUploadSection({
    required String title,
    String? fileName,
    required VoidCallback onPressed,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: title == 'Upload Documents'
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: onPressed,
              child: Text('Upload', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                fileName ?? 'No file selected',
                style: TextStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _handleSubmit,
        child: Text(
          'Submit',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}