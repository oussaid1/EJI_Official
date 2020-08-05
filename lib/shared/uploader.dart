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
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://eji-official.appspot.com');

  StorageUploadTask _uploadTask;
double progressPercent=0.5;
  /// Starts an upload task
   void _startUpload() {
    /// Unique file name for the file
    String filePath = 'players/${DateTime.now()}.png';

    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
  
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      /// Manage the task state and event subscription with a StreamBuilder
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (_, snapshot) {
            var event = snapshot?.data?.snapshot;
       
  progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0.5;
      

            return Column(
              children: [
               Row(
                    children: <Widget>[
                      FlatButton(
                          child: Icon(Icons.cloud_upload),
                          onPressed: _startUpload,
                        ),
                      if (_uploadTask.isPaused)
                        FlatButton(
                          child: Icon(Icons.play_arrow),
                          onPressed: _uploadTask.resume,
                        ),
                      if (_uploadTask.isInProgress)
                        FlatButton(
                          child: Icon(Icons.pause),
                          onPressed: _uploadTask.pause,
                        ),
                    ],
                  ),

                // Progress bar
                LinearProgressIndicator(value: progressPercent),
                Text('${(progressPercent * 100).toStringAsFixed(2)} % ',style: subtext1,),
              ],
            );
          });
    } return CircularProgressIndicator();
  }
}
