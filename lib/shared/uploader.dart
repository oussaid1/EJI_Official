import 'dart:io';

import 'package:EJI/settings/params.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Uploader extends StatefulWidget {
  final File file;
  const Uploader({Key key, @required this.file});

  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final _storage =
      FirebaseStorage.instanceFor(bucket: 'gs://eji-official.appspot.com');

  // StorageUploadTask _uploadTask;
  double progressPercent = 0.5;

  /// Starts an upload task
  void _startUpload() {
    /// Unique file name for the file
    String filePath = 'players/${DateTime.now()}.png';

    setState(() {
      // _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
