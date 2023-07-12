part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  final List<CountriesModel>? listCountries;
  final CountriesModel? itemCountries;
  final bool? isShowKeyboard;
  const LoginState(
      {this.listCountries, this.itemCountries, this.isShowKeyboard});

  @override
  List<Object> get props => [
        listCountries ?? [],
        itemCountries ?? CountriesModel(),
        isShowKeyboard ?? false
      ];
}

class LoginInitial extends LoginState {}

class LoginLoaded extends LoginState {
  const LoginLoaded(List<CountriesModel> listCountries,
      {CountriesModel? itemCountries, bool? isShowKeyboard})
      : super(
            listCountries: listCountries,
            itemCountries: itemCountries,
            isShowKeyboard: isShowKeyboard);
}
