import 'package:EJI/models/player.dart';

import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:EJI/repository/cloud_database.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SquadPlayer extends StatefulWidget {
  SquadPlayer({Key key, this.squadPlayer}) : super(key: key);
  final Player squadPlayer;

  @override
  _SquadPlayerState createState() => _SquadPlayerState();
}

class _SquadPlayerState extends State<SquadPlayer> {
  final CloudDatabase c = Get.put(CloudDatabase());

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 80,
        width: 60,
        child: widget.squadPlayer != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FutureBuilder(
                      future: c.getProfileImage(
                          context, widget.squadPlayer.profileImage),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData || snapshot.hasError) {
                          return Image.asset('assets/images/logo.png',
                              height: 30, width: 30, fit: BoxFit.fill);
                        } else
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Container(
                              height: 30,
                              width: 30,
                              child: CachedNetworkImage(
                                imageUrl: snapshot.data,
                                fit: BoxFit.fill,
                                placeholder: (context, url) => Image.asset(
                                    'assets/images/logo.png',
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.fill),
                                errorWidget: (context, url, error) =>
                                    Image.asset('assets/images/logo.png',
                                        height: 30,
                                        width: 30,
                                        fit: BoxFit.fill),
                              ),
                            ),
                          );
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${widget.squadPlayer.position.toString()}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: primaryColor),
                      ),
                      Text(
                        '${widget.squadPlayer.oVR.toString()}',
                        style: TextStyle(fontSize: 22, color: accentColor),
                      ),
                    ],
                  ),
                  Text(
                    '${widget.squadPlayer.playerName.toString()}',
                    style: TextStyle(fontSize: 12, color: fontColor),
                    maxLines: 1,
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      height: 30,
                      width: 30,
                      child: Image.asset('assets/images/logo.png',
                          height: 30, width: 30, fit: BoxFit.fill),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'GK',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: primaryColor),
                      ),
                      Text(
                        '45',
                        style: TextStyle(fontSize: 22, color: accentColor),
                      ),
                    ],
                  ),
                  Text(
                    'Player X',
                    style: TextStyle(fontSize: 12, color: fontColor),
                    maxLines: 1,
                  ),
                ],
              ));
  }
}
