part of 'landing_bloc.dart';

abstract class LandingState extends Equatable {
  final List<LoginModel>? listLogin;
  final int? index;
  const LandingState({this.listLogin, this.index});

  @override
  List<Object> get props => [index ?? 0];
}

class LandingInitial extends LandingState {
  LandingInitial() : super(listLogin: [], index: 0);
}

class LandingLoaded extends LandingState {
  const LandingLoaded(List<LoginModel> listLogin, int index)
      : super(listLogin: listLogin, index: index);
}
