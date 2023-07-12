part of 'submenu_home_bloc.dart';

abstract class SubmenuHomeEvent extends Equatable {
  const SubmenuHomeEvent();

  @override
  List<Object> get props => [];
}

class SubMenuGetDataEvent extends SubmenuHomeEvent {}
