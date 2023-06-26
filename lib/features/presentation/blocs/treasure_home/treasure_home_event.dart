part of 'treasure_home_bloc.dart';

abstract class TreasureHomeEvent extends Equatable {
  const TreasureHomeEvent();

  @override
  List<Object> get props => [];
}

class TreasureGetDataEvent extends TreasureHomeEvent {}
