import 'dart:io';

import 'package:EJI/models/player.dart';

import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddPlayers extends StatefulWidget {
  final Player player;
  final JuniorPlayer juniorPlayer;
  final CadetPlayer cadetPlayer;
  final int category;

  AddPlayers(
      {@required this.category,
      this.player,
      this.juniorPlayer,
      this.cadetPlayer});

  @override
  State<StatefulWidget> createState() {
    return _AddPlayersState();
  }
}

class _AddPlayersState extends State<AddPlayers> {
  final CloudDatabase cD = Get.put(CloudDatabase());
  bool isCadetr = false;
  bool isSenior = false;
  bool isJunior = false;
  String _id;
  String _profileImage = "players/profileImages/ejilogo.png";
  String _regNum = DateTime.now().millisecondsSinceEpoch.toString();
  String _playerName;
  String _dateOfBirth = '02-02-2000';
  String _placeOfBirth = 'Idawlstane';
  String _email;
  String _phone;
  String _regDate;
  String _position = 'GK';
  int _seasons = 2;
  int _trainingScore;
  int _desciplineScore;
  int _positionMaster;
  int _availability;
  int _oVR;
  bool _rateable = false;
  bool _isGK = false;
  String _myDate;
  String _myDate2;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController regdateController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();

  DateTime selectedDate = new DateTime.now();
  DateTime nowDate = new DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1980),
      lastDate: nowDate,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        _myDate = formatter.format(picked);
        dateOfBirthController.text = _myDate;
      });
    }
  }

  _selectDate2(BuildContext context) async {
    final DateTime picked2 = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked2 != null && picked2 != selectedDate) {
      setState(() {
        _myDate2 = formatter.format(picked2);
        regdateController.text = _myDate2;
      });
    }
  }

  int _selectedGender = 0;
  List<DropdownMenuItem<int>> genderList = [];

  List<dynamic> itemsList = [
    'GK',
    '*****',
    'RB',
    'CB',
    'LB',
    '*****',
    'DMF',
    'LMF',
    'CMF',
    'RMF',
    'AMF',
    '*****',
    'RWF',
    'SS',
    'LWF',
    '*****',
    'CF'
  ];
  void _loadGenderList() {
    genderList = [];

    for (int i = 0; i < itemsList.length; i++) {
      genderList.add(new DropdownMenuItem(
        child: new Text(itemsList[i],
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.w600, color: fontColor)),
        value: i,
      ));
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _saveToDb(BuildContext context) async {
    if (_position == 'GK') {
      return _isGK = true;
    }
    if (widget.category == 1) {
      Player pL1 = new Player(
        profileImage: _profileImage,
        playerName: _playerName,
        phone: _phone,
        email: _email,
        regDate: _regDate,
        position: _position,
        dateOfBirth: _dateOfBirth,
        placeOfBirth: _placeOfBirth,
        seasons: _seasons,
        regNum: _regNum,
        availability: 1,
        desciplineScore: 1,
        positionMaster: 1,
        trainingScore: 1,
        oVR: 4,
        rateable: true,
        isGK: _isGK,
      );
      await cD.addPlayers(pL1);
    } else if (widget.category == 2) {
      JuniorPlayer juniorPlayer = new JuniorPlayer(
        profileImage: _profileImage,
        playerName: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        regDate: regdateController.text,
        position: _position,
        dateOfBirth: dateOfBirthController.text,
        placeOfBirth: placeOfBirthController.text,
        seasons: _seasons,
        regNum: _regNum,
        availability: 1,
        desciplineScore: 1,
        positionMaster: 1,
        trainingScore: 1,
        oVR: 4,
        rateable: true,
        isGK: _isGK,
      );
      await cD.addJuniorPlayer(juniorPlayer);
    } else if (widget.category == 3) {
      CadetPlayer cadetPlayer = new CadetPlayer(
        profileImage: _profileImage,
        playerName: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        regDate: regdateController.text,
        position: _position,
        dateOfBirth: dateOfBirthController.text,
        placeOfBirth: placeOfBirthController.text,
        seasons: _seasons,
        regNum: _regNum,
        availability: 1,
        desciplineScore: 1,
        positionMaster: 1,
        trainingScore: 1,
        oVR: 4,
        rateable: true,
        isGK: _isGK,
      );
      await cD.addCadetPlayer(cadetPlayer);
    }
  }

  _updateInDb(BuildContext context) async {
    if (_position == 'GK') {
      return _isGK = true;
    }
    if (!isJunior) {
      Player pLEdited = new Player(
        id: _id,
        profileImage: _profileImage,
        regNum: _regNum,
        seasons: _seasons,
        playerName: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        regDate: regdateController.text,
        position: _position,
        dateOfBirth: dateOfBirthController.text,
        placeOfBirth: placeOfBirthController.text,
        availability: 1,
        desciplineScore: 1,
        positionMaster: 1,
        trainingScore: 1,
        oVR: 4,
        rateable: false,
        isGK: _isGK,
      );
      await cD.updatePlayer(pLEdited);
    } else if (isJunior) {
      JuniorPlayer juniorPlayerEd = new JuniorPlayer(
        profileImage: _profileImage,
        playerName: _playerName,
        phone: _phone,
        email: _email,
        regDate: _regDate,
        position: _position,
        dateOfBirth: _dateOfBirth,
        placeOfBirth: _placeOfBirth,
        seasons: _seasons,
        regNum: _regNum,
        availability: 1,
        desciplineScore: 1,
        positionMaster: 1,
        trainingScore: 1,
        oVR: 4,
        rateable: false,
        isGK: _isGK,
      );
      await cD.updateJuniorPlayer(juniorPlayerEd);
    }
  }

  Widget _buildPlayerPosition() {
    return Container(
        width: Get.width - 40,
        child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: primaryColor, width: 1),
            ),
            color: primaryColor,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 100.0,
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              isExpanded: true,
                              value: _selectedGender,
                              items: genderList,
                              dropdownColor: primaryColor,
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  color: fontColor),
                              onChanged: (dynamic value) {
                                setState(() {
                                  _selectedGender = value;
                                  _position = itemsList[value];
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'PlayerPosition'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: fontColor),
                        ),
                      ),
                    ],
                  ),
                ])));
  }

  Widget _buildName() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
      child: new TextFormField(
        controller: nameController,
        cursorColor: Colors.white,
        style: TextStyle(
            fontSize: 26, fontWeight: FontWeight.w600, color: fontColor),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.person, color: secondaryColor),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
                color: secondaryColor,
              ),
              onPressed: () {
                setState(() {
                  nameController.clear();
                });
              },
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: accentColor, style: BorderStyle.solid, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: secondaryColor, style: BorderStyle.solid, width: 1),
            ),
            labelText: 'FullName'.tr,
            labelStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w200, color: fontColor)),
        validator: (value) {
          if (value.length == 0) {
            return 'insertname'.tr;
          } else
            return null;
        },
        onSaved: (value) {
          setState(() {
            _playerName = value;
          });
        },
      ),
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
      child: new TextFormField(
        onSaved: (value) {
          setState(() {
            _email = value;
          });
        },
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.white,
        style: TextStyle(
            fontSize: 26, fontWeight: FontWeight.w600, color: fontColor),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.email, color: secondaryColor),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
                color: secondaryColor,
                size: 18,
              ),
              onPressed: () {
                setState(() {
                  emailController.clear();
                });
              },
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: accentColor, style: BorderStyle.solid, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: secondaryColor, style: BorderStyle.solid, width: 1),
            ),
            labelText: 'Email',
            labelStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w200, color: fontColor)),
        validator: (value) {
          if (value.length == 0) {
            return 'insertemail'.tr;
          } else
            return null;
        },
      ),
    );
  }

  Widget _buildPhoneNum() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
      child: new TextFormField(
        onSaved: (value) {
          setState(() {
            _phone = value;
          });
        },
        controller: phoneController,
        keyboardType: TextInputType.phone,
        cursorColor: Colors.white,
        style: TextStyle(
            fontSize: 26, fontWeight: FontWeight.w600, color: fontColor),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone, color: secondaryColor),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
                color: secondaryColor,
                size: 18,
              ),
              onPressed: () {
                setState(() {
                  phoneController.clear();
                });
              },
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: accentColor, style: BorderStyle.solid, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: secondaryColor, style: BorderStyle.solid, width: 1),
            ),
            labelText: 'PhoneNumber'.tr,
            labelStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w200, color: fontColor)),
        validator: (value) {
          if (value.length == 0) {
            return 'insertphonenumber'.tr;
          } else
            return null;
        },
      ),
    );
  }

  Widget _buildPlaceOfBirth() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
      child: new TextFormField(
        onSaved: (value) {
          setState(() {
            _placeOfBirth = value;
          });
        },
        controller: placeOfBirthController,
        cursorColor: Colors.white,
        style: TextStyle(
            fontSize: 26, fontWeight: FontWeight.w600, color: fontColor),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.place, color: secondaryColor),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
                color: secondaryColor,
                size: 18,
              ),
              onPressed: () {
                setState(() {
                  placeOfBirthController.clear();
                });
              },
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: accentColor, style: BorderStyle.solid, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: secondaryColor, style: BorderStyle.solid, width: 1),
            ),
            labelText: 'PlaceOfBirth'.tr,
            labelStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w200, color: fontColor)),
        validator: (value) {
          if (value.length == 0) {
            return 'selectdate'.tr;
          } else
            return null;
        },
      ),
    );
  }

  Widget _buildDateOfBirth(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: dateOfBirthController,
      onSaved: (value) {
        setState(() {
          _dateOfBirth = value;
        });
      },
      cursorColor: Colors.white,
      style: TextStyle(
          fontSize: 26, fontWeight: FontWeight.w600, color: fontColor),
      decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: Icon(
              Icons.calendar_today,
              color: secondaryColor,
            ),
            onPressed: () {
              setState(() {
                _selectDate(context);
              });
            },
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: accentColor, style: BorderStyle.solid, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: secondaryColor, style: BorderStyle.solid, width: 1),
          ),
          labelText: 'DateOfBirth'.tr,
          labelStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w200, color: fontColor)),
      validator: (value) {
        if (value.length == 0) {
          return 'selectdate'.tr;
        } else
          return null;
      },
    );
  }

  Widget _buildRegDate(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: regdateController,
      onSaved: (value) {
        setState(() {
          _regDate = value;
        });
      },
      cursorColor: Colors.white,
      style: TextStyle(
          fontSize: 26, fontWeight: FontWeight.w600, color: fontColor),
      decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: Icon(
              Icons.calendar_today,
              color: secondaryColor,
            ),
            onPressed: () {
              setState(() {
                _selectDate2(context);
              });
            },
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: accentColor, style: BorderStyle.solid, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: secondaryColor, style: BorderStyle.solid, width: 1),
          ),
          labelText: 'RegesterDate'.tr,
          labelStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w200, color: fontColor)),
      validator: (value) {
        if (value.length == 0) {
          return 'selectdate'.tr;
        } else
          return null;
      },
    );
  }

  Widget _imagePlayer() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.fileImport,
              color: secondaryColor,
              size: 30.0,
            ),
            onPressed: () {
              getImage();
            },
          ),
          CircleAvatar(
            radius: 70,
            backgroundColor: Color(0xff476cfb),
            child: ClipOval(
              child: new SizedBox(
                width: 130.0,
                height: 130.0,
                child: (_image != null)
                    ? Image.file(
                        _image,
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        "assets/images/ejilogo.png",
                        fit: BoxFit.fill,
                      ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.camera,
              color: secondaryColor,
              size: 30.0,
            ),
            onPressed: () {
              takeImage();
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.player != null) {
      _id = widget.player.id;
      _profileImage = widget.player.profileImage;
      _regNum = widget.player.regNum;
      _regDate = widget.player.regDate;
      nameController.text = widget.player.playerName;
      emailController.text = widget.player.email;
      phoneController.text = widget.player.phone;
      dateOfBirthController.text = widget.player.dateOfBirth;
      regdateController.text = widget.player.regDate;
      placeOfBirthController.text = widget.player.placeOfBirth;
      _position = widget.player.position;
      _rateable = widget.player.rateable;
      isJunior = false;
    } else if (widget.juniorPlayer != null) {
      _id = widget.juniorPlayer.id;
      _profileImage = widget.juniorPlayer.profileImage;
      _regNum = widget.juniorPlayer.regNum;
      _regDate = widget.juniorPlayer.regDate;
      nameController.text = widget.juniorPlayer.playerName;
      emailController.text = widget.juniorPlayer.email;
      phoneController.text = widget.juniorPlayer.phone;
      dateOfBirthController.text = widget.juniorPlayer.dateOfBirth;
      regdateController.text = widget.juniorPlayer.regDate;
      placeOfBirthController.text = widget.juniorPlayer.placeOfBirth;
      _position = widget.juniorPlayer.position;
      _rateable = widget.juniorPlayer.rateable;

      isJunior = true;
    }
  }

  File _image;
  final picker = ImagePicker();

  Future takeImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
      _profileImage = 'players/profileImages/$_regNum.png';
    });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
      _profileImage = 'players/profileImages/$_regNum.png';
    });
  }

  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://eji-official.appspot.com/');

  StorageUploadTask _uploadTask;
  double progressPercent = 0.5;
  bool isComplete = false;

  /// Starts an upload task
  void _startUpload(BuildContext context) {
    /// Unique file name for the file
    String filePath = 'players/profileImages/$_regNum.png';
    _profileImage = filePath;
    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(_image);
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadGenderList();
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          new Image.asset('assets/images/login.png', fit: BoxFit.fill),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.topCenter,
                      child: _buildUpload(context)),
                  SizedBox(
                    height: 10,
                  ),
                  _imagePlayer(),
                  _buildPlayerPosition(),
                  _buildName(),
                  _buildDateOfBirth(context),
                  _buildPlaceOfBirth(),
                  _buildEmail(),
                  _buildPhoneNum(),
                  _buildRegDate(context),
                  SizedBox(
                    height: 20,
                  ),
                  widget.player == null
                      ? RaisedButton(
                          color: secondaryColor,
                          child: Text(
                            'Submit'.tr,
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: primaryColor),
                          ),
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }

                            _formKey.currentState.save();
                            if (cD.isComplete.value) {
                              Get.defaultDialog(
                                middleText: 'confirmSave'.tr,
                                onConfirm: () {
                                  _saveToDb(context);
                                  _flushAll();
                                  Navigator.pop(context, false);
                                },
                                onCancel: () {},
                              );
                            } else {
                              Get.snackbar('Alert'.tr, 'Imagenotuploaded!'.tr,
                                  backgroundColor: secondaryColor,
                                  colorText: primaryColor);
                            }
                          },
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RaisedButton(
                              color: secondaryColor,
                              child: Text(
                                "Update".tr,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 16),
                              ),
                              onPressed: () {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                }

                                _formKey.currentState.save();

                                Get.defaultDialog(
                                  middleText: 'confirmSave'.tr,
                                  onConfirm: () {
                                    _updateInDb(context);
                                    _flushAll();

                                    Navigator.pop(context, false);
                                  },
                                );
                              },
                            ),
                            RaisedButton(
                              color: secondaryColor,
                              child: Text(
                                "Cancel".tr,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 16),
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpload(BuildContext context) {
    if (_uploadTask != null) {
      /// Manage the task state and event subscription with a StreamBuilder
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (_, snapshot) {
            var event = snapshot?.data?.snapshot;

            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0;
            if (_uploadTask.isComplete) cD.isComplete.value = true;
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Row(
                        children: [
                          if (_uploadTask.isComplete)
                            Text('UploadComplete'.tr,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: fontColor)),
                          if (_uploadTask.isPaused)
                            FlatButton(
                              child: Icon(
                                Icons.play_arrow,
                                color: secondaryColor,
                              ),
                              onPressed: _uploadTask.resume,
                            ),
                          if (_uploadTask.isInProgress)
                            FlatButton(
                              child: Icon(
                                Icons.pause,
                                color: secondaryColor,
                              ),
                              onPressed: _uploadTask.pause,
                            ),
                        ],
                      ),
                    ),
                    LinearProgressIndicator(value: progressPercent),
                    Text(
                      '${(progressPercent * 100).toStringAsFixed(2)} % ',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: fontColor),
                    ),
                  ],
                ),
              ),
            );
          });
    }
    return Container(
      height: 30,
      child: Row(
        children: <Widget>[
          Text(
            'PleaseuploadPhoto'.tr,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
          ),
          FlatButton(
              child: Icon(
                Icons.cloud_upload,
                color: Colors.white,
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _startUpload(context);
                } else {
                  Get.snackbar('Alert'.tr, 'Fillfields'.tr);
                }
              })
        ],
      ),
    );
  }

  void _flushAll() {
    setState(() {
      progressPercent = 0.0;
      nameController.clear();
      emailController.clear();
      phoneController.clear();
      dateOfBirthController.clear();
      regdateController.clear();
      placeOfBirthController.clear();

      _image = null;
      isComplete = false;
    });
  }
}
