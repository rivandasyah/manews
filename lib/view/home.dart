import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/common/navigation.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/service/provider.dart';
import 'package:news_app/view/detail.dart';

class BodyScreen extends StatefulWidget {
  @override
  _BodyScreenState createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  Future<News> newsList;

  @override
  void initState() {
    super.initState();
    newsList = getNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<News>(
        future: newsList,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError)
                return Text('Error : ${snapshot.error}');
              return ListView.builder(
                  itemCount: snapshot.data.articles.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailScreen(
                                snapshot.data.articles[index]);
                          }));
                        },
                        child: FittedBox(
                          child: Material(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(18.0),
                            shadowColor: Colors.grey,
                            elevation: 12.0,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 300.0,
                                  height: 125.5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16.0),
                                        topRight:
                                            Radius.circular(16.0)),
                                    child: Image.network(
                                      '${snapshot.data.articles[index].urlToImage}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                    width: 300.0,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.all(18.0),
                                      child: Text(
                                          '${snapshot.data.articles[index].title}',
                                          maxLines: 2,
                                          overflow:
                                              TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  letterSpacing: 3,
                                                  fontSize: 10))),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
          }
          return null;
        });
  }
}
