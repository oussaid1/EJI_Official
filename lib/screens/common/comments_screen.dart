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
  final TextEditingController replyControler = TextEditingController();

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
              ),
        ],
      ),
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
                          color: primaryColor.withOpacity(0.9),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  xc.isAdmin.value
                                      ? IconButton(
                                          icon: Icon(
                                            Icons.reply,
                                            color: accentColor,
                                          ),
                                          onPressed: () {
                                            Get.defaultDialog(
                                              title: 'Reply'.tr,
                                              middleText: 'OnlySpokesPerson'.tr,
                                              actions: [
                                                buildTextField(),
                                              ],
                                              confirm: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: RaisedButton.icon(
                                                  icon: Icon(Icons.cancel,color: primaryColor,),
                                                    label: Text(
                                                      'Send'.tr,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    color: accentColor,
                                                    onPressed: () {
                                                      Comments comments =
                                                          new Comments(
                                                        commentsBy:
                                                            comment.commentsBy,
                                                        commentsDate: comment
                                                            .commentsDate,
                                                        commentsReply:
                                                            replyControler.text,
                                                        commentsText: comment
                                                            .commentsText,
                                                        id: comment.id,
                                                        subject:
                                                            comment.subject,
                                                      );
                                                      xc.addReply(comments);
                                                    }),
                                              ),
                                              cancel: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: RaisedButton.icon(
                                                  color: accentColor,
                                                  onPressed: ()=> Navigator.pop(context), icon: Icon(Icons.cancel,color: primaryColor,), label:Text('Cancel')),
                                              ),
                                            );
                                            
                                          })
                                      : Container(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(comment.subject.toString(),
                                        style: subtext2x),
                                  ),
                                  Text('Subject'.tr, style: subtext3xy),
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
                                    comment.commentsText.toString(),
                                    style: subtext2,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 10,
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 2, 16, 2.0),
                                  child: Text(
                                    'Reply'.tr,
                                    style: subtext3xx,
                                  ),
                                ),
                              ],
                            ),
                            comment.commentsReply != null
                                ? Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)),
                                        color: primaryColor,
                                      ),
                                      width: 400, 
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            4, 8, 4, 8),
                                        child: Text(
                                          comment.commentsReply.toString(),
                                          style: subtext2,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 10,
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        comment.commentsDate.toString(),
                                        style: hinttext,
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8.0, left: 8),
                                        child: Text(
                                            comment.commentsBy.toString(),
                                            style: subtext2x),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8),
                                        child: Text('By'.tr, style: subtext3xy),
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
    );
  }

  Container buildTextField() {
    return Container(
     height: 200,
      child: TextField(
        autofocus: true,
       maxLines: 8,
        controller: replyControler,
        textAlign: TextAlign.center,
        style: maintext3,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.textsms,
              color: secondaryColor,
            ),
            hintText: ('insertReply'.tr),
            fillColor: primaryColor,
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: subtext5x,
            focusColor: accentColor2,
            hintStyle: hinttext,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: accentColor, style: BorderStyle.solid, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: accentColor2, style: BorderStyle.solid, width: 1),
            ),
            contentPadding: EdgeInsets.all(8)),
      ),
    );
  }
}
