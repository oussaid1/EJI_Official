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
      width: Get.width -60,
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
                color: secondaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: secondaryColor, width: 0.5)),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('President'.tr,
                  textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
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
                color: secondaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: secondaryColor, width: 0.5)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('${staff.presedent}',
                      textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
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
      width: Get.width,
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: secondaryColor, width: 0.5)),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: Get.width / 1.14,
          
            decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: secondaryColor, width: 0.5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('TechnicalStuff'.tr,
                  textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
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
                      color: secondaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: secondaryColor, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Main Coach'.tr,
                            textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
                      ),
                    ),
                    Container(
                     decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: secondaryColor, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${staff.coach}',
                            textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
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
                  color: secondaryColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: secondaryColor, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Assistant Coach'.tr,
                        textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
                  ),
                ),
                Container(
                 decoration: BoxDecoration(
                  color: secondaryColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: secondaryColor, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${staff.coachAssistant}',
                        textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
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
                      color: secondaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: secondaryColor, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Physical Trainer'.tr,
                            textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
                      ),
                    ),
                    Container(
                     decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: secondaryColor, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${staff.trainerPHY}',
                            textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
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
                      color: secondaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: secondaryColor, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Medical Assistant'.tr,
                            textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
                      ),
                    ),
                    Container(
                     decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: secondaryColor, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${staff.medicalAssistant}',
                            textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
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
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: Get.width / 1.14,
              height: Get.height / 17,
              decoration: BoxDecoration(
                  color: secondaryColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: secondaryColor, width: 0.5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('AdminStaff'.tr,
                    textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
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
                        color: secondaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: secondaryColor, width: 0.5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Coordinators'.tr,
                              textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
                        ),
                      ),
                      Container(
                       decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: secondaryColor, width: 0.5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${staff.coordinator1}',
                              textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
                        ),
                      ),
                      Container(
                       decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: secondaryColor, width: 0.5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${staff.coordinator2}',
                              textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
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
                    color: secondaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: secondaryColor, width: 0.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Chief Excutive'.tr,
                          textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
                    ),
                  ),
                  Container(
                   decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: secondaryColor, width: 0.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${staff.chefExc} ',
                          textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
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
                    color: secondaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: secondaryColor, width: 0.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Finance Director'.tr,
                          textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
                    ),
                  ),
                  Container(
                   decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: secondaryColor, width: 0.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${staff.financeDir}',
                          textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
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
                        color: secondaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: secondaryColor, width: 0.5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Councellors'.tr,
                              textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
                        ),
                      ),
                      Container(
                       decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: secondaryColor, width: 0.5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${staff.counceler1}',
                              textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
                        ),
                      ),
                      Container(
                       decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: secondaryColor, width: 0.5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${staff.counceler2}',
                              textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
                        ),
                      ),
                      Container(
                       decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: secondaryColor, width: 0.5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${staff.counceler3}',
                              textAlign: TextAlign.center, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor)),
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
      appBar: AppBar(
        title: Center(child: Text('EJI Staff'.tr, style: TextStyle(fontSize:26,fontWeight: FontWeight.w600,color: fontColor))),
      ),
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
               
                child: StreamBuilder(
                  stream: c.getStaff('adminStaff'),
                  builder: (BuildContext context, AsyncSnapshot<List<Staff>> snapshot) {
                    staff=snapshot.data[0];
                    return ListView(
                      children: <Widget>[
                       
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                                'CurrentSituation'.tr,
                                style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor),
                                textAlign: TextAlign.center,
                              ),
                            Text('2019-2022',
                                textAlign: TextAlign.center, style: TextStyle(fontSize:14,fontWeight: FontWeight.w200,color: fontColor)),
                            
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
                       
                        SizedBox(
                          height: 60,
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
