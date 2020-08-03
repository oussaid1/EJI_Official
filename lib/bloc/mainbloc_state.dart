part of 'mainbloc_bloc.dart';

abstract class PlayerState extends Equatable {
  const PlayerState();
}

class PlayerInitial extends PlayerState {
  @override
  List<Object> get props => [];
}

class PlayerLoded extends PlayerState {
   final Future<Stream<List<Player>>> pList ;
 // ignore: non_constant_identifier_names
 const PlayerLoded( {this.pList});
  
  @override
  List<Object> get props => [];
}
