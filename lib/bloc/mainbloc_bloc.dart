import 'dart:async';

import 'package:EJI/model/player.dart';
import 'package:EJI/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mainbloc_event.dart';
part 'mainbloc_state.dart';

class MainblocBloc extends Bloc<PlayerState, Future<Stream<List<Player>>> > {
   static Future<Stream<List<Player>>> pList;
   
  MainblocBloc() : super(pList);

  @override
  Stream<Future<Stream<List<Player>>>> mapEventToState(
    PlayerState event,
  ) async* {
    if (event is PlayerLoded) {
    yield  pList = FirestoreService().getPlayers();
    
    }
  }
}
