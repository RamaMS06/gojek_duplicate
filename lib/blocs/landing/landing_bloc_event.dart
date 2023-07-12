part of 'landing_bloc.dart';

abstract class LandingEvent extends Equatable {
  const LandingEvent();

  @override
  List<Object> get props => [];
}

class GetDataSliderLandingEvent extends LandingEvent {}

class LandingChangeSliderIndexEvent extends LandingEvent {
  final int index;

  const LandingChangeSliderIndexEvent(this.index);
}

class GoToLoginEvent extends LandingEvent {}
