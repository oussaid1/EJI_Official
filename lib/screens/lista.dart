import 'package:EJI/model/player.dart';
import 'package:EJI/repository/repository.dart';
import 'package:flutter/material.dart';

class RatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Players'),
      ),
      body: StreamBuilder(
        stream: FirestoreService().getPlayerz(),
        builder: (BuildContext context, AsyncSnapshot<List<Player>> snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              Player player = snapshot.data[index];
              return ListTile(
                title: Text(player.playerName.toString()),
                subtitle: Text(player.dateOfBirth.toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      color: Colors.blue,
                      icon: Icon(Icons.edit),
                      onPressed: () {},
                    ),
                    IconButton(
                      color: Colors.red,
                      icon: Icon(Icons.delete),
                      onPressed: () {},
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {},
      ),
    );
  }
}
