import 'package:gojek_duplicate/data/datasources/countries/countries_data_source.dart';
import 'package:gojek_duplicate/data/models/countries_model.dart';
import 'package:gojek_duplicate/data/repository/countries/countries_repo.dart';
import 'package:gojek_duplicate/di/locator.dart';

class CountriesRepoImpl implements CountriesRepo {
  @override
  Future<List<CountriesModel>> getCountries() =>
      locator.get<CountriesDataSource>().countries();
}
