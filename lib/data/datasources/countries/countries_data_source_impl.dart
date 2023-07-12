import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gojek_duplicate/data/models/countries_model.dart';

import 'countries_data_source.dart';

class CountriesDataSourceImpl implements CountriesDataSource {
  @override
  Future<List<CountriesModel>> countries() async {
    final response =
        await rootBundle.loadString('assets/asset_json/countries.json');
    return (jsonDecode(response) as List)
        .map((e) => CountriesModel.fromJson(e))
        .toList();
  }
}
