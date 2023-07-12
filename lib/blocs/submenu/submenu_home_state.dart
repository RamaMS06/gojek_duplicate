part of 'submenu_home_bloc.dart';

abstract class SubmenuHomeState extends Equatable {
  final List<SubMenuHomeModel>? subMenuModel;
  const SubmenuHomeState({this.subMenuModel});

  @override
  List<Object> get props => [];
}

class SubmenuHomeInitial extends SubmenuHomeState {}

class SubMenuHomeLoaded extends SubmenuHomeState {
  const SubMenuHomeLoaded(List<SubMenuHomeModel> subMenuModel)
      : super(subMenuModel: subMenuModel);
}
