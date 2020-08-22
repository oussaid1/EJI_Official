import 'package:EJI/model/anounce.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/settings/params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_anounce.dart';

class AnouncesScreen extends StatelessWidget {
  AnouncesScreen({
    Key key,
  }) : super(key: key);
  final CloudDatabase xc = Get.put(CloudDatabase());

  @override
  Widget build(BuildContext context) {
    List<Anounce> lista;
    return Scaffold(
    
   backgroundColor: secondaryColor,
 floatingActionButtonLocation: FloatingActionButtonLocation.startTop ,
     floatingActionButton:xc.isAdmin.value? SizedBox(
       height: 40,
       width: 40,
            child: FloatingActionButton(
         elevation: 40,
        
         child: Icon(Icons.add,size:30,color: primaryColor,),
         onPressed: (){  Get.defaultDialog(
                    backgroundColor: Colors.blue[100],
                    title: ('Anounces'.tr),
                    middleText: '',
                    
                    content: AddAnounce(),
                  );}),
     ):Container(),
      body: Stack(
        fit: StackFit.expand,
        children: [
           new Image.asset('assets/images/login.png',fit:BoxFit.fill),
          Column(
            children: [
             
              StreamBuilder(
                stream: xc.getAnounces('anounces'),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Anounce>> snapshot) {
                  if (snapshot.hasError || !snapshot.hasData) {
                    return Center(
                        child: Icon(
                      Icons.list,
                      size: 100,
                      color: secondaryColor,
                    ));
                  } else {
                    lista = snapshot.data;
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: lista.length != 0 ? lista.length : 0,
                      itemBuilder: (context, int index) {
                        Anounce anounce = lista[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: secondaryColor.withOpacity(0.5),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                       Padding(
                                         padding: const EdgeInsets.fromLTRB(16,4,16,4),
                                         child: Text(anounce.subject.toString(),
                                            style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: whitefontColor)),
                                       ),
                                      Text('Subject'.tr, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: accentColor),textDirection:TextDirection.rtl ,),
                                     
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                      color: primaryColor,
                                    ),
                                    width: 400,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 8, 4, 8),
                                      child: Text(
                                        anounce.anounceText.toString(),
                                        style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: fontColor),textDirection:TextDirection.rtl,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 10,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(anounce.anounceDate.toString(),
                                              style: TextStyle(fontSize:14,fontWeight: FontWeight.w200,color: fontColor)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                         
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(anounce.anounceBy.toString(),
                                                style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: whitefontColor)),
                                          ),
                                               Padding(
                                                 padding: const EdgeInsets.only(right:8.0),
                                                 child: Text('By'.tr, style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: accentColor)),
                                               ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                
              ),
                SizedBox(
                height: 60,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
