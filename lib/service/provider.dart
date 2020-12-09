import 'dart:convert';
import 'dart:io';
import 'package:news_app/model/news.dart';
import 'package:http/http.dart' as http;

Future<News> getNews() async{
  const url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=';
  const api = '983c25e9258b42c7b969cdf8ba3e1357';
  final response = await http.get(url + api);

  if (response.statusCode == 200) {
    return News.fromJsonMap(jsonDecode(response.body));
  } else {
    throw HttpException('Error ${response.reasonPhrase}', uri: Uri.parse(url + api));
  }

}