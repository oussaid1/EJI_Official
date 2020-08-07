import 'package:EJI/model/matchday.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/repository/variables_controler.dart';
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
  String _matchdayDate = '02-08-2020';
  String _matchdayType = 'friendly'.tr;
  String _matchdayReferee = 'Ali';
  String _matchdayHome = 'EJI Fc';
  String _matchdayAway = 'Tiskmodin Fc';
  String _matchdayHomeScore = '03';
  String _matchdayAwayScore = '01';
  String _matchdayHomeRedC = '0';
  String _matchdayAwayRedC = '0';
  String _matchdayHomeYellC = '0';
  String _matchdayAwayYellC = '0';

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
        _matchdayDate = _myDate;
        matchdateController.text = _myDate;
        print(_matchdayDate);
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
    'Schedueled'.tr,
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

  final GlobalKey<FormState> _formKeyX = GlobalKey<FormState>();

  _saveToDb(BuildContext context) async {
    MatchDay matchDay = new MatchDay(
        matchdayDate: _matchdayDate,
        matchdayType: _matchdayType,
        matchdayReferee: _matchdayReferee,
        matchdayHome: _matchdayHome,
        matchdayAway: _matchdayAway,
        matchdayHomeScore: _selectedGender == 4
            ? '--'
            : _matchdayHomeScore = xc.matchdayHomeScore.value.toString(),
        matchdayAwayScore: _selectedGender == 4
            ? '--'
            : _matchdayAwayScore = xc.matchdayAwayScore.value.toString(),
        matchdayHomeRedC: _selectedGender == 4
            ? '0'
            : _matchdayHomeRedC = xc.matchdayHomeRedC.value.toString(),
        matchdayAwayRedC: _selectedGender == 4
            ? '0'
            : _matchdayAwayRedC = xc.matchdayAwayRedC.value.toString(),
        matchdayHomeYellC: _selectedGender == 4
            ? '0'
            : _matchdayHomeYellC = xc.matchdayHomeYellC.value.toString(),
        matchdayAwayYellC: _selectedGender == 4
            ? '0'
            : _matchdayAwayYellC = xc.matchdayAwayYellC.value.toString());
    print(matchDay);
    await cD.addMatch(matchDay);
  }

  Widget _buildDateOfMatch(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: matchdateController,
      onSaved: (value) {
        setState(() {
          _matchdayDate = value;
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
        height: 60,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(4.0),
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
                        setState(() {
                          _selectedGender = value;
                          _matchdayType = itemsList[value];
                          print(_matchdayType);
                        });
                      },
                    ),
                  ),
                ),
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
            labelStyle: hinttext),
        validator: (value) {
          if (value.length == 0) {
            return 'insertHomeTeam'.tr;
          } else
            return null;
        },
        onSaved: (value) {
          setState(() {
            _matchdayHome = value.toString();
          });
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
                      style: subtext3)),
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
                      style: subtext3)),
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
                      style: subtext3)),
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
        onSaved: (value) {
          setState(() {
            _matchdayAway = value.toString();
          });
        },
        controller: awayteamController,
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
                      style: subtext3)),
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
                    style: subtext3)),
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
                      style: subtext3)),
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
        onSaved: (value) {
          setState(() {
            _matchdayReferee = value.toString();
          });
        },
        controller: refereeController,
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
            labelStyle: hinttext),
        validator: (value) {
          if (value.length == 0) {
            return 'insertRefereeName'.tr;
          } else
            return null;
        },
      ),
    );
  }

  @override
  void initState() {
    _loadGenderList();
    if (widget.matchDay != null) {
      id = widget.matchDayIndex;
      matchdateController.text = widget.matchDay.matchdayDate.toString();
      hometeamController.text = widget.matchDay.matchdayHome.toString();
      awayteamController.text = widget.matchDay.matchdayAway.toString();
      refereeController.text = widget.matchDay.matchdayReferee.toString();
      xc.matchdayHomeScore.value = 0;
      xc.matchdayHomeYellC.value = 0;
      xc.matchdayHomeRedC.value = 0;
      xc.matchdayAwayScore.value = 0;
      xc.matchdayAwayYellC.value = 0;
      xc.matchdayAwayRedC.value = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _loadGenderList();
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  height: 140,
                  child: Image.asset(
                    'assets/images/decor.png',
                    fit: BoxFit.cover,
                  ),
                ),
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
                    ? Container(
                        width: 200,
                        child: RaisedButton(
                          color: accentColor,
                          child: Text(
                            'Submit'.tr,
                            style: maintext,
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
                              Get.snackbar('Alert'.tr, 'SomethingMissing'.tr,
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
                            color: accentColor,
                            child: Text(
                              "Update".tr,
                              style:
                                  TextStyle(color: primaryColor, fontSize: 16),
                            ),
                            onPressed: () {
                             

                      
                              MatchDay matchDayToUpdate = new MatchDay(
                                id: widget.matchDayIndex,
                                matchdayDate: widget.matchDay.matchdayDate,
                                matchdayHome: widget.matchDay.matchdayHome,
                                matchdayAway: widget.matchDay.matchdayAway,
                                matchdayReferee:
                                    widget.matchDay.matchdayReferee,
                                matchdayHomeScore:
                                    widget.matchDay.matchdayHomeScore,
                                matchdayHomeYellC:
                                    widget.matchDay.matchdayHomeYellC,
                                matchdayHomeRedC:
                                    widget.matchDay.matchdayHomeRedC,
                                matchdayAwayScore:
                                    widget.matchDay.matchdayAwayScore,
                                matchdayAwayYellC:
                                    widget.matchDay.matchdayAwayYellC,
                                matchdayAwayRedC:
                                    widget.matchDay.matchdayAwayRedC,
                              );

                              cD.updateMatch(matchDayToUpdate);
                            },
                          ),
                          RaisedButton(
                            color: accentColor,
                            child: Text(
                              "Cancel".tr,
                              style:
                                  TextStyle(color: primaryColor, fontSize: 16),
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
              ],
            ),
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
