import 'package:EJI/model/player.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/repository/player_ratings_Controler.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class PlayerRanking extends StatefulWidget {
  const PlayerRanking({Key key}) : super(key: key);

  @override
  _PlayerRankingState createState() => _PlayerRankingState();
}

class _PlayerRankingState extends State<PlayerRanking> {
  bool isOpenToRate = false;
  final String image = "players/profileImages/logo.png";
  bool enabledDsc = true;
  bool enabledTr = true;
  bool enabledPo = true;
  bool enabledAv = true;
  List<Player> lista;
  bool isVoted = false;
  CloudDatabase c = Get.put(CloudDatabase());
  PlayerRatingsControler prc = Get.put(PlayerRatingsControler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(),
        body: ListView(
          children: [
            StreamBuilder(
                stream: c.getPlayerz('players'),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Player>> snapshot) {
                  if (snapshot.hasError || !snapshot.hasData) {
                    return Center(
                        child: Icon(
                      Icons.person,
                      size: 100,
                      color: secondaryColor,
                    ));
                  } else {
                    lista = snapshot.data;
                  }

                  return Container(
                    height: 340,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                              child: SizedBox(
                                width: 260,
                                height: 276,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 260,
                                      height: 276,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: const Color(0x7f144060),
                                        border: Border.all(
                                            width: 1.0,
                                            color: const Color(0xff707070)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xff000000),
                                            offset: Offset(6, 6),
                                            blurRadius: 20,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 8, 8, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/dawd.png',
                                                    fit: BoxFit.fill,
                                                    width: 80,
                                                    height: 80,
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text.rich(
                                                          TextSpan(
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 42,
                                                              color:
                                                                  accentColor2,
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                text: '45',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: 'pts',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      ' الحسين ايت داود',
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18,
                                                        color: const Color(
                                                            0xffffffff),
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'CB',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 42,
                                                  color:
                                                      const Color(0xffedcca9),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        14, 0, 14, 2),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '8',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 20,
                                                        color: const Color(
                                                            0xfff1811e),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Text(
                                                      'الإنضباط',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18,
                                                        color: const Color(
                                                            0xffedcca9),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        14, 0, 14, 2),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '12',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 20,
                                                        color: const Color(
                                                            0xfff1811e),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Text(
                                                      'التداريب',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18,
                                                        color: const Color(
                                                            0xffedcca9),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        14, 0, 14, 2),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '23',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 20,
                                                        color: const Color(
                                                            0xfff1811e),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Text(
                                                      'اتقان المركز',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18,
                                                        color: const Color(
                                                            0xffedcca9),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        14, 0, 14, 2),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '8',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 20,
                                                        color: const Color(
                                                            0xfff1811e),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Text(
                                                      'المتاحية',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18,
                                                        color: const Color(
                                                            0xffedcca9),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 34,
                                      left: 120,
                                      height: 120,
                                      child: VerticalDivider(
                                        width: 4,
                                        color: secondaryColor,
                                        thickness: 4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0x7f144060),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff707070)),
                ),
                child: Column(
                  children: <Widget>[
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          color: const Color(0xffffffff),
                        ),
                        children: [
                          TextSpan(
                            text: 'التقييم ',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: isOpenToRate ? 'مفتوح' : 'مغلق',
                            style: TextStyle(
                              fontSize: 28,
                              color:
                                  isOpenToRate ? accentColor2 : Colors.red[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 0, 14, 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.thumb_up,
                                          color: prc.enabledDsc.value
                                              ? secondaryColor
                                              : primaryColor),
                                      onPressed: (){
                                        setState(() {
                                          if (prc.enabledDsc.value){
                                            prc.enabledDsc.value=false;
                                              prc.deccrementDescipline();
                                          }else {
                                             prc.enabledDsc.value=true;
                                           
                                             prc.incrementDescipline();
                                          }
                                       
                                        });
                                      }),
                                  Text(
                                    '${prc.descipline.value}',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      color: const Color(0xfff1811e),
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Text(
                                'الإنضباط',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  color: const Color(0xffedcca9),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.thumb_up,
                                          color: prc.enabledTr.value
                                              ? secondaryColor
                                              : primaryColor),
                                      onPressed: (){
                                        setState(() {
                                          if (prc.enabledTr.value){
                                            prc.enabledTr.value=false;
                                              prc.deccrementTraining();
                                          }else {
                                             prc.enabledTr.value=true;
                                           
                                             prc.incrementTraining();
                                          }
                                       
                                        });
                                      }),
                                  Text(
                                    '${prc.training.value}',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      color: const Color(0xfff1811e),
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Text(
                                'التداريب',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  color: const Color(0xffedcca9),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                 IconButton(
                                      icon: Icon(Icons.thumb_up,
                                          color: prc.enabledPo.value
                                              ? secondaryColor
                                              : primaryColor),
                                      onPressed: (){
                                        setState(() {
                                          if (prc.enabledPo.value){
                                            prc.enabledPo.value=false;
                                              prc.decrementPositionMastery();
                                          }else {
                                             prc.enabledPo.value=true;
                                           
                                             prc.incrementPositionMastery();
                                          }
                                       
                                        });
                                      }),
                                  Text(
                                    '${prc.positionMastery.value}',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      color: const Color(0xfff1811e),
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Text(
                                'اتقان المركز',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  color: const Color(0xffedcca9),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.thumb_up,
                                          color: prc.enabledAv.value
                                              ? secondaryColor
                                              : primaryColor),
                                      onPressed: (){
                                        setState(() {
                                          if (prc.enabledAv.value){
                                            prc.enabledAv.value=false;
                                              prc.decrementAvailability();
                                          }else {
                                             prc.enabledAv.value=true;
                                           
                                             prc.incrementAvailability();
                                          }
                                       
                                        });
                                      }),
                                  Text(
                                    '${prc.availability.value}',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      color: const Color(0xfff1811e),
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Text(
                                'المتاحية',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  color: const Color(0xffedcca9),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
