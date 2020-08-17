import 'package:EJI/model/player.dart';
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
    return Material(
      color: primaryColor.withOpacity(0),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        height: 110,
        width: 80,
        child: widget.squadPlayer != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 56,
                    width: 54,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: FutureBuilder(
                          future: c.getProfileImage(
                              context, widget.squadPlayer.profileImage),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData || snapshot.hasError) {
                              return Image.asset('assets/images/logo.png',
                                  height: 56, width: 54, fit: BoxFit.fill);
                            } else
                              return CachedNetworkImage(
                                imageUrl: snapshot.data,
                                placeholder: (context, url) => Image.asset(
                                    'assets/images/logo.png',
                                    height: 56,
                                    width: 54,
                                    fit: BoxFit.fill),
                                errorWidget: (context, url, error) =>
                                    Image.asset('assets/images/logo.png',
                                        height: 56,
                                        width: 54,
                                        fit: BoxFit.fill),
                              );
                          }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${widget.squadPlayer.position.toString()}',
                        style: subtext3,
                      ),
                      Text(
                        '${widget.squadPlayer.oVR.toString()}',
                        style: TextStyle(fontSize: 24, color: accentColor),
                      ),
                    ],
                  ),
                  Text(
                    '${widget.squadPlayer.playerName.toString()}',
                    style: TextStyle(fontSize: 14, color: secondaryColor),
                    maxLines: 1,
                  ),
                ],
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 56,
                        width: 54,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset('assets/images/logo.png',
                              height: 56, width: 54, fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'GK',
                            style: subtext3,
                          ),
                          Text(
                            '34',
                            style: TextStyle(fontSize: 26, color: accentColor),
                          ),
                        ],
                      ),
                      Text(
                        'Player A',
                        style: TextStyle(fontSize: 12, color: secondaryColor),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
