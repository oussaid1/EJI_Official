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
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
       height: 50,
          width: 50,
      child: Material(
        child: Container(
          height: 50,
          width: 50,
          color: accentColor2,
          child: Text(position),
        ),
      ),
    );
  }
}
