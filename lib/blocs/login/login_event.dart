part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class FetchCountries extends LoginEvent {}

class LoginAnimate extends LoginEvent{}

class SelectCountries extends LoginEvent {
  final CountriesModel itemCountries;

  const SelectCountries(this.itemCountries);
}

class GoBackToLanding extends LoginEvent {}
