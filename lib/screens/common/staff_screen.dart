import 'package:EJI/model/staff.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/admin_access/admin_drawer.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class StaffPage extends StatelessWidget {
  final CloudDatabase c = Get.put(CloudDatabase());

   Staff staff;

  Widget _buildPresident(Staff staff) {
    return Container(
      width: Get.width / 1.14,
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: secondaryColor, width: 0.5)),
      height: Get.height / 7.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: Get.width / 1.14,
            height: Get.height / 18,
            decoration: BoxDecoration(
                color: primaryColorShade,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: secondaryColor, width: 0.5)),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('President'.tr,
                  textAlign: TextAlign.center, style: subtext3x),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
               decoration: BoxDecoration(
                color: primaryColorShade,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: secondaryColor, width: 0.5)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text('${staff.presedent}',
                      textAlign: TextAlign.center, style: subtext3xx),
                ),
              ),
             
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildTechnicalStuff(Staff staff) {
    return Container(
      width: Get.width / 1.14,
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: secondaryColor, width: 0.5)),
      height: Get.height / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: Get.width / 1.14,
            height: Get.height / 17,
            decoration: BoxDecoration(
                color: primaryColorShade,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: secondaryColor, width: 0.5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('TechnicalStuff'.tr,
                  textAlign: TextAlign.center, style: subtext4x),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                     decoration: BoxDecoration(
                      color: primaryColorShade,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: secondaryColor, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text('Main Coach'.tr,
                            textAlign: TextAlign.center, style: subtext3),
                      ),
                    ),
                    Container(
                     decoration: BoxDecoration(
                      color: primaryColorShade,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: secondaryColor, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text('${staff.coach}',
                            textAlign: TextAlign.center, style: subtext3xx),
                      ),
                    ),
                  ],
                ),

                 Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                 decoration: BoxDecoration(
                  color: primaryColorShade,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: secondaryColor, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('Assistant Coach'.tr,
                        textAlign: TextAlign.center, style: subtext3),
                  ),
                ),
                Container(
                 decoration: BoxDecoration(
                  color: primaryColorShade,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: secondaryColor, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('${staff.coachAssistant}',
                        textAlign: TextAlign.center, style: subtext3xx),
                  ),
                ),
              ],
            ),
              ],
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                     decoration: BoxDecoration(
                      color: primaryColorShade,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: secondaryColor, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text('Physical Trainer'.tr,
                            textAlign: TextAlign.center, style: subtext3),
                      ),
                    ),
                    Container(
                     decoration: BoxDecoration(
                      color: primaryColorShade,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: secondaryColor, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text('${staff.trainerPHY}',
                            textAlign: TextAlign.center, style: subtext3xx),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                  children: [
                    Container(
                     decoration: BoxDecoration(
                      color: primaryColorShade,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: secondaryColor, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text('Medical Assistant'.tr,
                            textAlign: TextAlign.center, style: subtext3),
                      ),
                    ),
                    Container(
                     decoration: BoxDecoration(
                      color: primaryColorShade,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: secondaryColor, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text('${staff.medicalAssistant}',
                            textAlign: TextAlign.center, style: subtext3xx),
                      ),
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
 Widget _buildDirectory(Staff staff) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width / 1.14,
        decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: secondaryColor, width: 0.5)),
        height: Get.height / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: Get.width / 1.14,
              height: Get.height / 17,
              decoration: BoxDecoration(
                  color: primaryColorShade,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: secondaryColor, width: 0.5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('AdminStaff'.tr,
                    textAlign: TextAlign.center, style: subtext4x),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                       decoration: BoxDecoration(
                        color: primaryColorShade,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: secondaryColor, width: 0.5)),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('Coordinators'.tr,
                              textAlign: TextAlign.center, style: subtext3),
                        ),
                      ),
                      Container(
                       decoration: BoxDecoration(
                        color: primaryColorShade,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: secondaryColor, width: 0.5)),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('${staff.coordinator1}',
                              textAlign: TextAlign.center, style: subtext3xx),
                        ),
                      ),
                      Container(
                       decoration: BoxDecoration(
                        color: primaryColorShade,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: secondaryColor, width: 0.5)),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('${staff.coordinator2}',
                              textAlign: TextAlign.center, style: subtext3xx),
                        ),
                      ),
                    ],
                  ),

                   Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                   decoration: BoxDecoration(
                    color: primaryColorShade,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: secondaryColor, width: 0.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('Chief Excutive'.tr,
                          textAlign: TextAlign.center, style: subtext3),
                    ),
                  ),
                  Container(
                   decoration: BoxDecoration(
                    color: primaryColorShade,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: secondaryColor, width: 0.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('${staff.chefExc} ',
                          textAlign: TextAlign.center, style: subtext3xx),
                    ),
                  ),
                ],
              ),
                ],
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                   decoration: BoxDecoration(
                    color: primaryColorShade,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: secondaryColor, width: 0.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('Finance Director'.tr,
                          textAlign: TextAlign.center, style: subtext3),
                    ),
                  ),
                  Container(
                   decoration: BoxDecoration(
                    color: primaryColorShade,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: secondaryColor, width: 0.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('${staff.financeDir}',
                          textAlign: TextAlign.center, style: subtext3xx),
                    ),
                  ),
                ],
              ),
            ),
            Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                       decoration: BoxDecoration(
                        color: primaryColorShade,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: secondaryColor, width: 0.5)),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('Councellors'.tr,
                              textAlign: TextAlign.center, style: subtext3),
                        ),
                      ),
                      Container(
                       decoration: BoxDecoration(
                        color: primaryColorShade,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: secondaryColor, width: 0.5)),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('${staff.counceler1}',
                              textAlign: TextAlign.center, style: subtext3xx),
                        ),
                      ),
                      Container(
                       decoration: BoxDecoration(
                        color: primaryColorShade,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: secondaryColor, width: 0.5)),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('${staff.counceler2}',
                              textAlign: TextAlign.center, style: subtext3xx),
                        ),
                      ),
                      Container(
                       decoration: BoxDecoration(
                        color: primaryColorShade,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: secondaryColor, width: 0.5)),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('${staff.counceler3}',
                              textAlign: TextAlign.center, style: subtext3xx),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: c.isAdmin.value ? AdminDrawer() : MyDrawer(),
      appBar: AppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/ejisplash.jpg',
            fit: BoxFit.fill,
          ),
          Center(
            child: Container(
              width: Get.width - 10,
              height: Get.height / 1.2,
              child: Card(
                color: primaryColorShade,
                child: StreamBuilder(
                  stream: c.getStaff('adminStaff'),
                  builder: (BuildContext context, AsyncSnapshot<List<Staff>> snapshot) {
                    staff=snapshot.data[0];
                    return ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('EJI Staff'.tr, style: maintext4),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('2019-2022',
                                  textAlign: TextAlign.center, style: hinttext),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildPresident(staff),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildTechnicalStuff(staff),
                              _buildDirectory(staff),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'CurrentSituation'.tr,
                                style: subtextxx,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
