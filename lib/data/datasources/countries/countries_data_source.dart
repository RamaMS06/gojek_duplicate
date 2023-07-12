import 'package:gojek_duplicate/data/models/countries_model.dart';

abstract class CountriesDataSource {
  Future<List<CountriesModel>> countries();
}
