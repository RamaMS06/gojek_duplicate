import 'package:dio/dio.dart';
import 'package:gojek_duplicate/data/datasources/news/news_data_source.dart';
import 'package:gojek_duplicate/data/models/news_model.dart';

class NewsDataSourceImpl implements NewsDataSource {
  @override
  Future<NewsModel> news() async {
    final response =
        await Dio().get('https://newsapi.org/v2/everything', queryParameters: {
      'q': 'tesla',
      'from': '2023-06-11',
      'sortBy': '',
      'publishedAt': '',
      'apiKey': 'ae2555fe185b4dffad53702781e6adf9'
    });
    return NewsModel.fromJson(response.data);
  }
}
