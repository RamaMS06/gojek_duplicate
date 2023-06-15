part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeCardChangeEvent extends HomeEvent {
  int? index;
  HomeCardChangeEvent({this.index = 0});
}

class HomeCardLoadedEvent extends HomeEvent {
  List<CardDataUserModel>? userModel;
  int? index;

  HomeCardLoadedEvent({this.userModel, this.index});
}
