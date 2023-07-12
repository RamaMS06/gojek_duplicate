part of 'card_home_bloc.dart';

abstract class CardHomeEvent extends Equatable {
  const CardHomeEvent();

  @override
  List<Object> get props => [];
}

class CardGetDataEvent extends CardHomeEvent {}

class CardChangeIndexEvent extends CardHomeEvent {
  final int activePage;

  const CardChangeIndexEvent(this.activePage);
}

class CardNextPageEvent extends CardHomeEvent {}

class TestEvent extends CardHomeEvent {}
