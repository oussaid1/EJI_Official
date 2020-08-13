import 'package:EJI/model/comments_model.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:EJI/screens/common/add_comment.dart';
import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentScreen extends StatelessWidget {
  CommentScreen({
    Key key,
  }) : super(key: key);
  final CloudDatabase xc = Get.put(CloudDatabase());

  @override
  Widget build(BuildContext context) {
    List<Comments> lista;
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Center(
          child: Text(
                    'Remarks&Sugestion'.tr,
                    style: maintext3,
                  ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.add_comment,
                color: secondaryColor,
              ),
              onPressed: () {
                Get.defaultDialog(
                  backgroundColor: Colors.blue[100],
                  title: ('AddRemark'.tr),
                  middleText: 'you are responsible of your words'.tr,
                  content: AddComment(),
                );
              } // Get.to(AddComment()),
              )
        ],
      ),
      backgroundColor: primaryColor,
      body: Column(
        children: [
         
          StreamBuilder(
            stream: xc.getComments('remarks'),
            builder:
                (BuildContext context, AsyncSnapshot<List<Comments>> snapshot) {
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
                    Comments comment = lista[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: primaryColorShade,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(comment.subject.toString(),
                                      style: subtext2x),
                                  Text('Subject'.tr, style: subtext3xy),
                                  
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                              child: Container(
                                color: primaryColor,
                                width: 400,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 8, 4, 8),
                                  child: Text(
                                    comment.commentsText.toString(),
                                    style: subtext2,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 10,
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(comment.commentsDate.toString(),
                                          style: hinttext,textDirection: TextDirection.rtl,),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                       Text(comment.commentsBy.toString(),
                                          style: subtext2x),
                                      Text('By'.tr, style: subtext3xy),
                                     
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
    );
  }
}
