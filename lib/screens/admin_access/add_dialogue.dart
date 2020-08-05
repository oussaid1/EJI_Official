import 'dart:io';

import 'package:EJI/model/player.dart';
import 'package:EJI/repository/repository.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddPlayers extends StatefulWidget {
  final Player player;
  final int playerIndex;

  AddPlayers({this.player, this.playerIndex});

  @override
  State<StatefulWidget> createState() {
    return _AddPlayersState();
  }
}

class _AddPlayersState extends State<AddPlayers> {
  String _profileImage = "players/profileImages/logo.png";
  int _regNum = 00001;
  String _playerName;
  String _dateOfBirth = '02-02-2000';
  String _placeOfBirth = 'Idawlstane';
  String _email;
  String _phone;
  String _regDate;
  String _position = 'GK';
  int _seasons = 2;

  String _myDate;
  String _myDate2;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController regdateController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  DateTime selectedDate = new DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        _myDate = formatter.format(picked);
        dateController.text = _myDate;
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
    'LMF',
    '*****',
    'CF'
  ];
  void _loadGenderList() {
    genderList = [];

    for (int i = 0; i < itemsList.length; i++) {
      genderList.add(new DropdownMenuItem(
        child: new Text(itemsList[i], style: maintext2),
        value: i,
      ));
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _saveToDb(BuildContext context) async {
    Player player = new Player(
      profileImage: _profileImage,
      playerName: _playerName,
      phone: _phone,
      email: _email,
      regDate: _regDate,
      position: _position,
      dateOfBirth: _dateOfBirth,
      placeOfBirth: _placeOfBirth,
      seasons: 4,
      regNum: _regNum,
    );
    await FirestoreService().addPlayers(player);
  }

  Widget _buildPlayerPosition() {
    return Container(
        height: 60,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: secondaryColor, width: 1),
          ),
          color: primaryColor,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Player Position ',
                  style: subtext1,
                ),
              )),
              Container(
                width: 100.0,
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      isExpanded: true,
                      value: _selectedGender,
                      items: genderList,
                      dropdownColor: primaryColor,
                      style: maintext3,
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
            ],
          ),
        ));
  }

  Widget _buildName() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
      child: new TextFormField(
        controller: nameController,
        cursorColor: Colors.white,
        style: maintext2,
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
            labelText: 'Full Name',
            labelStyle: hinttext),
        validator: (value) {
          if (value.length == 0) {
            return 'insert name';
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
        style: maintext2,
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
            labelStyle: hinttext),
        validator: (value) {
          if (value.length == 0) {
            return 'insert email';
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
        style: maintext2,
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
            labelText: 'Phone Number',
            labelStyle: hinttext),
        validator: (value) {
          if (value.length == 0) {
            return 'insert phone number';
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
        style: maintext2,
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
            labelText: 'Place Of Birth',
            labelStyle: hinttext),
        validator: (value) {
          if (value.length == 0) {
            return 'select date';
          } else
            return null;
        },
      ),
    );
  }

  Widget _buildDateOfBirth(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: dateController,
      onSaved: (value) {
        setState(() {
          _dateOfBirth = value;
        });
      },
      cursorColor: Colors.white,
      style: maintext2,
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
          labelText: 'Date Of Birth',
          labelStyle: hinttext),
      validator: (value) {
        if (value.length == 0) {
          return 'select date';
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
      style: maintext2,
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
          labelText: 'Regester Date',
          labelStyle: hinttext),
      validator: (value) {
        if (value.length == 0) {
          return 'select date';
        } else
          return null;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.player != null) {}
  }

  final String destination = 'staffImages/goo';
  File _image;
  final picker = ImagePicker();

  Future takeImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future uploadPic(BuildContext context) async {
    String fileName = basename(join(destination,_image.path));
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(destination);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

    setState(() {
      print("Profile Picture uploaded");
     
      print(taskSnapshot.bytesTransferred);
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadGenderList();
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: MyDrawer(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.upload),
            onPressed: () => uploadPic(context),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Padding(
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
                              : Image.network(
                                  "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
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
              ),
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
                      color: accentColor,
                      child: Text(
                        'Submit',
                        style: maintext,
                      ),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }

                        _formKey.currentState.save();

                        _saveToDb(context);
                      },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: accentColor,
                          child: Text(
                            "Update",
                            style: TextStyle(color: primaryColor, fontSize: 16),
                          ),
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }

                            _formKey.currentState.save();
                          },
                        ),
                        RaisedButton(
                          color: accentColor,
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: primaryColor, fontSize: 16),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _showConfirmationDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              content: Text("Are you sure you want to delete?"),
              actions: <Widget>[
                FlatButton(
                  textColor: Colors.red,
                  child: Text("Delete"),
                  onPressed: () => Navigator.pop(context, true),
                ),
                FlatButton(
                  textColor: Colors.black,
                  child: Text("No"),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ],
            ));
  }
}
