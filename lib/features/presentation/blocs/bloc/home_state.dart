part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeCardLoadingState extends HomeState {}

class HomeCardChangeIndexState extends HomeState {
  int? activePage;

  HomeCardChangeIndexState({this.activePage});
}

class HomeCardLoadedState extends HomeState {
  List<CardDataUserModel>? userModel;
  int? activePage;

  HomeCardLoadedState({this.activePage = 0, this.userModel});
}
