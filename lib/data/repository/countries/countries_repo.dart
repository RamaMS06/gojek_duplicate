import 'package:gojek_duplicate/data/models/countries_model.dart';

abstract class CountriesRepo {
  Future<List<CountriesModel>> getCountries();
}
