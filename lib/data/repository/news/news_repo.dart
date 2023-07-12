import 'package:gojek_duplicate/data/models/news_model.dart';

abstract class NewsRepo {
  Future<NewsModel> getNews();
}
