import 'package:news_app/model/articles.dart';

class News {

  String status;
  int totalResults;
  List<Articles> articles;

	News.fromJsonMap(Map<String, dynamic> map): 
		status = map["status"],
		totalResults = map["totalResults"],
		articles = List<Articles>.from(map["articles"].map((it) => Articles.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['status'] = status;
		data['totalResults'] = totalResults;
		data['articles'] = articles != null ? 
			this.articles.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
