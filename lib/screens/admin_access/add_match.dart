import 'package:EJI/model/matchday.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/home_screen.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/cupertino.dart';

class AddMatch extends StatefulWidget {
  final MatchDay matchDay;
  final int matchDayIndex;

  AddMatch({this.matchDay, this.matchDayIndex});

  @override
  State<StatefulWidget> createState() {
    return _AddMatchsState();
  }
}

class _AddMatchsState extends State<AddMatch> {
  final CloudDatabase cD = Get.put(CloudDatabase());

  String _id;
  String _matchdayDate;
  String _matchdayType;
  String _matchdayReferee;
  String _matchdayHome;
  String _matchdayAway;
  String _matchdayHomeScore;
  String _matchdayAwayScore;
  int _matchdayHomeRedC;
  int _matchdayAwayRedC;
  int _matchdayHomeYellC;
  int _matchdayAwayYellC;

  String _myDate;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController regdateController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController dateController = TextEditingController();

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
        dateController.text = _myDate;
      });
    }
  }

  int _selectedGender = 0;
  List<DropdownMenuItem<int>> genderList = [];
  List<dynamic> itemsList = [
    'Friendly'.tr,
    'Competetion'.tr,
    'Qualifications'.tr,
    'Training'.tr,
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
    MatchDay matchDay = new MatchDay(
        id: 'id',
        matchdayDate: 'matchdaydate',
        matchdayType: 'matchdaytype',
        matchdayReferee: 'matchdayreferee',
        matchdayHome: 'matchdayhome',
        matchdayAway: 'matchdayaway',
        matchdayHomeScore: 'matchdayhomescore',
        matchdayAwayScore: 'matchdayawayscore',
        matchdayHomeRedC: 2,
        matchdayAwayRedC: 4,
        matchdayHomeYellC: 1,
        matchdayAwayYellC: 2);

    await cD.addMatch(matchDay);
  }

  Widget _buildDateOfMatch(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: dateController,
      onSaved: (value) {
        setState(() {});
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
          labelText: 'MacthDate'.tr,
          labelStyle: hinttext),
      validator: (value) {
        if (value.length == 0) {
          return 'selectMacthDate'.tr;
        } else
          return null;
      },
    );
  }

  Widget _buildMatchDayType() {
    return Container(
        height: 50,
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
                  'MatchType'.tr,
                  style: subtext1,
                ),
              )),
              Expanded(
                child: Container(
                  width: 60.0,
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
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildHomeTeam() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
        child: new TextFormField(
    controller: nameController,
    cursorColor: Colors.white,
    style: maintext2,
    decoration: InputDecoration(
        prefixIcon: Icon(Icons.home, color: secondaryColor),
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
        labelText: 'HomeTeam'.tr,
        labelStyle: hinttext),
    validator: (value) {
      if (value.length == 0) {
        return 'insertHomeTeam'.tr;
      } else
        return null;
    },
    onSaved: (value) {
      setState(() {});
    },
        ),
      );
  }

  Widget _buildDescription(){
    return Row(
        children: <Widget>[
    Container(
      width: 50,
      height: 50,
      color: primaryColor,
      child: Image.asset('assets/images/redcards.png',fit:BoxFit.contain,))
        ],
      );
  }

  Widget _buildHomeScore() {
    return Expanded(
      child: Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: secondaryColor),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          width: Get.width / 3,
          child: Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_up,
                    size: 30,
                    color: secondaryColor,
                  ),
                  onPressed: () {},
                ),
                Text('$_matchdayHomeScore',style:subtext3),
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: secondaryColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildHomeYellowCards() {
    return Expanded(
      child: Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: secondaryColor),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          width: Get.width / 3,
          child: Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_up,
                    size: 30,
                    color: secondaryColor,
                  ),
                  onPressed: () {},
                ),
                Text('$_matchdayHomeScore',style:subtext3),
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: secondaryColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildHomeRedCard() {
    return Expanded(
      child: Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: secondaryColor),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          width: Get.width / 3,
          child: Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_up,
                    size: 30,
                    color: secondaryColor,
                  ),
                  onPressed: () {},
                ),
                Text('$_matchdayHomeScore',style:subtext3),
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: secondaryColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildAwayTeam() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
      child: new TextFormField(
        onSaved: (value) {
          setState(() {});
        },
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.white,
        style: maintext2,
        decoration: InputDecoration(
            prefixIcon:
                Icon(FontAwesomeIcons.arrowRight, color: secondaryColor),
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
            labelText: 'AwayTeam',
            labelStyle: hinttext),
        validator: (value) {
          if (value.length == 0) {
            return 'insertAwayTeam'.tr;
          } else
            return null;
        },
      ),
    );
  }

  Widget _buildAwayScore() {
    return Expanded(
      child: Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: secondaryColor),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          width: Get.width / 3,
          child: Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_up,
                    size: 30,
                    color: secondaryColor,
                  ),
                  onPressed: () {},
                ),
                Text('$_matchdayHomeScore',style:subtext3),
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: secondaryColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildAwayYellowCards() {
    return Expanded(
          child: Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: secondaryColor),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          width: Get.width / 3,
          child: Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_up,
                    size: 30,
                    color: secondaryColor,
                  ),
                  onPressed: () {},
                ),
                Text('$_matchdayHomeScore',style:subtext3),
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: secondaryColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),),
    );
  }

  Widget _buildAwayRedCard() {
    return Expanded(
          child: Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: secondaryColor),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          width: Get.width / 3,
          child: Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_up,
                    size: 30,
                    color: secondaryColor,
                  ),
                  onPressed: () {},
                ),
                Text('$_matchdayHomeScore',style:subtext3),
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: secondaryColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )),
    );
  }

  @override
  void initState() {
    _loadGenderList();
    if (widget.matchDay != null) {}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _loadGenderList();
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: MyDrawer(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              _buildDateOfMatch(context),
              _buildMatchDayType(),
              Column(
                children: <Widget>[
                  _buildHomeTeam(),
                  _buildDescription(),
                  Row(
                    children: <Widget>[
                      
                      _buildHomeRedCard(),
                      _buildHomeScore(),
                      _buildHomeYellowCards(),
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  _buildAwayTeam(),
                  Row(
                    children: <Widget>[
                     
                      _buildAwayRedCard(),
                      _buildAwayScore(),
                      _buildAwayYellowCards(),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              widget.matchDay == null
                  ? RaisedButton(
                      color: accentColor,
                      child: Text(
                        'Submit'.tr,
                        style: maintext,
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
                              Get.to(HomePage());
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
                          color: accentColor,
                          child: Text(
                            "Update".tr,
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
                            "Cancel".tr,
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

  void _flushAll() {
    setState(() {
      nameController.clear();
      emailController.clear();
      phoneController.clear();
      dateOfBirthController.clear();
      regdateController.clear();
      placeOfBirthController.clear();
      dateController.clear();
    });
  }
}
