import 'package:EJI/models/matchday.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/controllers/variables_controler.dart';
import 'package:EJI/screens/common/team_home.dart';
import 'package:EJI/settings/params.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/cupertino.dart';

class AddMatch extends StatefulWidget {
  final MatchDay matchDay;
  final String matchDayIndex;

  AddMatch({this.matchDay, this.matchDayIndex});

  @override
  State<StatefulWidget> createState() {
    return _AddMatchsState();
  }
}

class _AddMatchsState extends State<AddMatch> {
  final CloudDatabase cD = Get.put(CloudDatabase());
  final VariablesControler xc = Get.put(VariablesControler());
  String id;

  String _matchdayType = 'friendly'.tr;
  String _winstatusHome = '';
  String _winstatusAway = '';

  String _myDate;

  TextEditingController matchdateController = TextEditingController();
  TextEditingController hometeamController = TextEditingController();
  TextEditingController awayteamController = TextEditingController();
  TextEditingController refereeController = TextEditingController();

  DateTime selectedDate = new DateTime.now();
  DateTime nowDate = new DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1980),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        _myDate = formatter.format(picked);

        matchdateController.text = _myDate;
      });
    }
  }

  int _selectedGender = 0;
  List<DropdownMenuItem<int>> genderList = [];
  List<dynamic> itemsList = [
    'مباراة ودية',
    'مباراة منافسة'.tr,
    'مباراة اقصائية'.tr,
    'مباراة تدريبية'.tr,
    'مباراة مبرمجة'.tr,
  ];
  void _loadGenderList() {
    genderList = [];

    for (int i = 0; i < itemsList.length; i++) {
      genderList.add(new DropdownMenuItem(
        child: new Text(itemsList[i],
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: accentColor)),
        value: i,
      ));
    }
  }

  final GlobalKey<FormState> _formKeyX = GlobalKey<FormState>();

  _saveToDb(BuildContext context) async {
    if (xc.matchdayHomeScore.value > xc.matchdayAwayScore.value) {
      _winstatusHome = 'win';
      _winstatusAway = 'loss';
    } else if (xc.matchdayAwayScore.value > xc.matchdayHomeScore.value) {
      _winstatusHome = 'loss';
      _winstatusAway = 'win';
    } else if (xc.matchdayHomeScore.value == xc.matchdayHomeScore.value) {
      _winstatusHome = 'draw';
      _winstatusAway = 'draw';
    }

    MatchDay matchDay = new MatchDay(
        matchdayDate: matchdateController.text.trim().toString(),
        matchdayType: _matchdayType,
        matchdayReferee: refereeController.text.trim().toString(),
        matchdayHome: hometeamController.text.trim().toString(),
        matchdayAway: awayteamController.text.trim().toString(),
        matchdayHomeScore: xc.matchdayHomeScore.value,
        matchdayAwayScore: xc.matchdayAwayScore.value,
        matchdayHomeRedC: xc.matchdayHomeRedC.value,
        matchdayAwayRedC: xc.matchdayAwayRedC.value,
        matchdayHomeYellC: xc.matchdayHomeYellC.value,
        winStatusHome: _winstatusHome,
        winStatusAway: _winstatusAway,
        matchdayAwayYellC: xc.matchdayAwayYellC.value);

    await cD.addMatch(matchDay);
  }

  _updateInDb(BuildContext context) async {
    if (xc.matchdayHomeScore.value > xc.matchdayAwayScore.value) {
      _winstatusHome = 'win';
      _winstatusAway = 'loss';
    } else if (xc.matchdayAwayScore.value > xc.matchdayHomeScore.value) {
      _winstatusHome = 'loss';
      _winstatusAway = 'win';
    } else if (xc.matchdayHomeScore.value == xc.matchdayHomeScore.value) {
      _winstatusHome = 'draw';
      _winstatusAway = 'draw';
    }
    MatchDay matchDay = new MatchDay(
        id: widget.matchDay.id,
        matchdayDate: matchdateController.text.trim().toString(),
        matchdayType: _matchdayType,
        matchdayReferee: refereeController.text.trim().toString(),
        matchdayHome: hometeamController.text.trim().toString(),
        matchdayAway: awayteamController.text.trim().toString(),
        matchdayHomeScore: xc.matchdayHomeScore.value,
        matchdayAwayScore: xc.matchdayAwayScore.value,
        matchdayHomeRedC: xc.matchdayHomeRedC.value,
        matchdayAwayRedC: xc.matchdayAwayRedC.value,
        matchdayHomeYellC: xc.matchdayHomeYellC.value,
        winStatusHome: _winstatusHome,
        winStatusAway: _winstatusAway,
        matchdayAwayYellC: xc.matchdayAwayYellC.value);
    await cD.updateMatch(matchDay);
  }

  Widget _buildDateOfMatch(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: matchdateController,
      cursorColor: Colors.white,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
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
          labelStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w200, color: fontColor)),
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
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 180.0,
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                isExpanded: true,
                value: _selectedGender,
                items: genderList,
                dropdownColor: primaryColor,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: fontColor),
                onChanged: (dynamic value) {
                  setState(() {
                    _selectedGender = value;
                    _matchdayType = itemsList[value];
                  });
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            'MatchType'.tr,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: fontColor),
          ),
        ),
      ],
    ));
  }

  Widget _buildHomeTeam() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
      child: new TextFormField(
        controller: hometeamController,
        cursorColor: Colors.white,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w600, color: fontColor),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.home, color: secondaryColor),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
                color: secondaryColor,
              ),
              onPressed: () {
                setState(() {
                  hometeamController.clear();
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
            labelStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w200, color: fontColor)),
        validator: (value) {
          if (value.length == 0) {
            return 'insertHomeTeam'.tr;
          } else
            return null;
        },
      ),
    );
  }

  Widget _buildHomeScore() {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            width: 30,
            height: 30,
            color: secondaryColor,
            child: Image.asset(
              'assets/images/whistle.png',
              fit: BoxFit.contain,
            ),
          ),
          Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: secondaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              width: Get.width / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: secondaryColor,
                    ),
                    onPressed: () {
                      xc.decrementScoreHome();
                    },
                  ),
                  Obx(() => Text('${xc.matchdayHomeScore.value.toString()}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: fontColor))),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_drop_up,
                      size: 30,
                      color: secondaryColor,
                    ),
                    onPressed: () {
                      xc.incrementScoreHome();
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildHomeYellowCards() {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            width: 30,
            height: 30,
            color: primaryColor,
            child: Image.asset(
              'assets/images/yellowcards.png',
              fit: BoxFit.contain,
            ),
          ),
          Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: secondaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              width: Get.width / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: secondaryColor,
                    ),
                    onPressed: () {
                      xc.deccrementYellowCHome();
                    },
                  ),
                  Obx(() => Text('${xc.matchdayHomeYellC.value.toString()}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: fontColor))),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_drop_up,
                      size: 30,
                      color: secondaryColor,
                    ),
                    onPressed: () {
                      xc.incrementYellowCHome();
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildHomeRedCard() {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            width: 30,
            height: 30,
            color: primaryColor,
            child: Image.asset(
              'assets/images/redcards.png',
              fit: BoxFit.contain,
            ),
          ),
          Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: secondaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              width: Get.width / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: secondaryColor,
                    ),
                    onPressed: () {
                      xc.deccrementRedCHome();
                    },
                  ),
                  Obx(() => Text('${xc.matchdayHomeRedC.value.toString()}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: fontColor))),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_drop_up,
                      size: 30,
                      color: secondaryColor,
                    ),
                    onPressed: () {
                      xc.incrementRedCHome();
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildAwayTeam() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
      child: new TextFormField(
        controller: awayteamController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.white,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w600, color: fontColor),
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
                  awayteamController.clear();
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
            labelText: 'AwayTeam'.tr,
            labelStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w200, color: fontColor)),
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
      child: Column(
        children: <Widget>[
          Container(
            width: 30,
            height: 30,
            color: secondaryColor,
            child: Image.asset(
              'assets/images/whistle.png',
              fit: BoxFit.contain,
            ),
          ),
          Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: secondaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              width: Get.width / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: secondaryColor,
                    ),
                    onPressed: () {
                      xc.deccrementScoreAway();
                    },
                  ),
                  Obx(() => Text('${xc.matchdayAwayScore.value.toString()}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: fontColor))),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_drop_up,
                      size: 30,
                      color: secondaryColor,
                    ),
                    onPressed: () {
                      xc.incrementScoreAway();
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildAwayYellowCards() {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            width: 30,
            height: 30,
            color: primaryColor,
            child: Image.asset(
              'assets/images/yellowcards.png',
              fit: BoxFit.contain,
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: secondaryColor),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            width: Get.width / 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: secondaryColor,
                  ),
                  onPressed: () {
                    xc.deccrementYellowCAway();
                  },
                ),
                Obx(() => Text('${xc.matchdayAwayYellC.value.toString()}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: fontColor))),
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_up,
                    size: 30,
                    color: secondaryColor,
                  ),
                  onPressed: () {
                    xc.incrementYellowCAway();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAwayRedCard() {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            width: 30,
            height: 30,
            color: primaryColor,
            child: Image.asset(
              'assets/images/redcards.png',
              fit: BoxFit.contain,
            ),
          ),
          Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: secondaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              width: Get.width / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: secondaryColor,
                    ),
                    onPressed: () {
                      xc.deccrementRedCAway();
                    },
                  ),
                  Obx(() => Text('${xc.matchdayAwayRedC.value.toString()}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: fontColor))),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_drop_up,
                      size: 30,
                      color: secondaryColor,
                    ),
                    onPressed: () {
                      xc.incrementRedCAway();
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildReferee() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
      child: new TextFormField(
        controller: refereeController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.white,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: fontColor),
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
                  refereeController.clear();
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
            labelText: 'RefereeName'.tr,
            labelStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w200, color: fontColor)),
        validator: (value) {
          if (value.length == 0) {
            return 'insertRefereeName'.tr;
          } else
            return null;
        },
      ),
    );
  }

  int _switchMatchType(String string) {
    switch (string) {
      case 'Friendly':
        return 0;
        break;
      case 'Competetion':
        return 1;
        break;
      case 'Qualifications':
        return 2;
        break;
      case 'Training':
        return 3;
        break;
      case 'Schedueled':
        return 4;
        break;

      case 'مباراة ودية':
        return 0;
        break;
      case 'مباراة منافسة':
        return 1;
        break;
      case 'مباراة اقصائية':
        return 2;
        break;
      case 'مباراة تدريبية':
        return 3;
        break;
      case 'مباراة مبرمجة':
        return 4;
        break;

      default:
        return 0;
    }
  }

  @override
  void initState() {
    _loadGenderList();
    if (widget.matchDay != null) {
      id = widget.matchDayIndex;
      _selectedGender =
          _switchMatchType(widget.matchDay.matchdayType.trim().toString());
      matchdateController.text = widget.matchDay.matchdayDate.toString();
      hometeamController.text = widget.matchDay.matchdayHome.toString();
      awayteamController.text = widget.matchDay.matchdayAway.toString();
      refereeController.text = widget.matchDay.matchdayReferee.toString();
      xc.matchdayHomeScore.value = widget.matchDay.matchdayHomeScore;
      xc.matchdayHomeYellC.value = widget.matchDay.matchdayHomeYellC;
      xc.matchdayHomeRedC.value = widget.matchDay.matchdayHomeRedC;
      xc.matchdayAwayScore.value = widget.matchDay.matchdayAwayScore;
      xc.matchdayAwayYellC.value = widget.matchDay.matchdayAwayYellC;
      xc.matchdayAwayRedC.value = widget.matchDay.matchdayAwayRedC;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _loadGenderList();
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          new Image.asset('assets/images/login.png', fit: BoxFit.fill),
          Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Form(
                        key: _formKeyX,
                        child: Column(
                          children: <Widget>[
                            _buildDateOfMatch(context),
                            _buildMatchDayType(),
                            _buildHomeTeam(),
                            Row(
                              children: <Widget>[
                                _buildHomeRedCard(),
                                _buildHomeScore(),
                                _buildHomeYellowCards(),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            _buildAwayTeam(),
                            Row(
                              children: <Widget>[
                                _buildAwayRedCard(),
                                _buildAwayScore(),
                                _buildAwayYellowCards(),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            _buildReferee(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    widget.matchDay == null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0)),
                              color: secondaryColor,
                              child: Text(
                                'Submit'.tr,
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor),
                              ),
                              onPressed: () {
                                if (!_formKeyX.currentState.validate()) {
                                  return;
                                }

                                _formKeyX.currentState.save();
                                if (_formKeyX.currentState.validate()) {
                                  Get.defaultDialog(
                                    middleText: 'confirmSave'.tr,
                                    onConfirm: () {
                                      _saveToDb(context);
                                      _flushAll();
                                      Navigator.pop(context, false);
                                      Get.to(TeamHomePage());
                                    },
                                    onCancel: () {},
                                  );
                                } else {
                                  Get.snackbar(
                                      'Alert'.tr, 'SomethingMissing'.tr,
                                      backgroundColor: secondaryColor,
                                      colorText: primaryColor);
                                }
                              },
                            ),
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
                                  if (!_formKeyX.currentState.validate()) {
                                    return;
                                  }

                                  _formKeyX.currentState.save();
                                  if (_formKeyX.currentState.validate()) {
                                    Get.defaultDialog(
                                      middleText: 'confirmSave'.tr,
                                      onConfirm: () {
                                        _updateInDb(context);
                                        _flushAll();
                                        Navigator.pop(context, false);
                                        Get.to(TeamHomePage());
                                      },
                                      onCancel: () {},
                                    );
                                  } else {
                                    Get.snackbar(
                                        'Alert'.tr, 'SomethingMissing'.tr,
                                        backgroundColor: secondaryColor,
                                        colorText: primaryColor);
                                  }
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
            ],
          ),
        ],
      ),
    );
  }

  void _flushAll() {
    setState(() {
      matchdateController.clear();
      hometeamController.clear();
      awayteamController.clear();
      refereeController.clear();
    });
  }
}
