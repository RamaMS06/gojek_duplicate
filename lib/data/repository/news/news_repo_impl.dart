import 'package:gojek_duplicate/data/datasources/news/news_data_source.dart';
import 'package:gojek_duplicate/data/models/news_model.dart';
import 'package:gojek_duplicate/data/repository/news/news_repo.dart';
import 'package:gojek_duplicate/di/locator.dart';

class NewsRepoImpl extends NewsRepo {
  @override
  Future<NewsModel> getNews() async {
    return await locator.get<NewsDataSource>().news();
  }
}
