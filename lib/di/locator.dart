import 'package:get_it/get_it.dart';
import 'package:gojek_duplicate/data/datasources/countries/countries_data_source.dart';
import 'package:gojek_duplicate/data/datasources/countries/countries_data_source_impl.dart';
import 'package:gojek_duplicate/data/datasources/news/news_data_source.dart';
import 'package:gojek_duplicate/data/datasources/news/news_data_source_impl.dart';
import 'package:gojek_duplicate/data/repository/countries/countries_repo.dart';
import 'package:gojek_duplicate/data/repository/countries/countries_repo_impl.dart';
import 'package:gojek_duplicate/data/repository/news/news_repo.dart';
import 'package:gojek_duplicate/data/repository/news/news_repo_impl.dart';

final locator = GetIt.instance;

setupGetIt() {
  locator.registerLazySingleton<NewsDataSource>(() => NewsDataSourceImpl());
  locator.registerLazySingleton<NewsRepo>(() => NewsRepoImpl());

  locator.registerLazySingleton<CountriesDataSource>(
      () => CountriesDataSourceImpl());
  locator.registerLazySingleton<CountriesRepo>(() => CountriesRepoImpl());
}
