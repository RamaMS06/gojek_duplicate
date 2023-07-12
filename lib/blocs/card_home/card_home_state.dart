// ignore_for_file: must_be_immutable

part of 'card_home_bloc.dart';

abstract class CardHomeState extends Equatable {
  int? activePage;
  List<CardDataUserModel>? userModel;

  CardHomeState({this.activePage, this.userModel});

  @override
  List<Object> get props => [activePage ?? 0, userModel ?? []];
}

class HomeInitialState extends CardHomeState {
  HomeInitialState() : super(activePage: 0);
}

class HomeCardLoadedState extends CardHomeState {
  HomeCardLoadedState(
    List<CardDataUserModel> userModel,
    int activePage,
  ) : super(
          userModel: userModel,
          activePage: activePage,
        );
}
