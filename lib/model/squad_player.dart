import 'package:EJI/settings/params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SquadPlayer extends StatelessWidget {
  const SquadPlayer(
      {Key key, this.markings, this.abriviation, this.position, this.avatar})
      : super(key: key);
  final int markings;
  final String abriviation;
  final String position;
  final Icon avatar;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor.withOpacity(0),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        height: 100,
        width: 80,
        child: Column(
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
                      child: Image.asset('assets/images/dawd.png',
                          fit: BoxFit.fill),
                    )),
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
                      position != null ? position : 'GK',
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
