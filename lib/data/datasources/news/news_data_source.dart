import 'package:gojek_duplicate/data/models/news_model.dart';

abstract class NewsDataSource {
  Future<NewsModel> news();
}
