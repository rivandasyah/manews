import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/articles.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/news_detail';
  final Articles news;

  DetailScreen(this.news);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20)),
                    child: Image(
                      height: 270,
                      width: MediaQuery.of(context).size.width,
                      image: NetworkImage('${news.urlToImage}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SafeArea(
                      child: Container(
                    margin: EdgeInsets.only(left: 16, top: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.transparent, width: 2)),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ))
                ],
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '${news.title}',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                letterSpacing: 4)),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Author: ${news.author}',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: 8,
                        letterSpacing: 3,
                        color: Colors.white,
                      )),
                    ),
                    Text(
                      'Published at: ${news.publishedAt}',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: 8,
                        letterSpacing: 3,
                        color: Colors.white,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 4.0),
                      child: Text(
                        '${news.description}',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 4),
                      child: Text(
                        'Source: ${news.source.name}',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontSize: 10,
                          letterSpacing: 3,
                          color: Colors.white,
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(color: Colors.black38)
                          ),
                          onPressed: () async {
                            String url = news.url;
                            bool canVisit = await canLaunch(url);
                            if (canVisit) {
                              launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Text(
                            'Visit the Original Page',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 12,
                                letterSpacing: 2,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
