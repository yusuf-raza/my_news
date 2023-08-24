import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/components/home_screen_headline_card.dart';
import 'package:news_app/models/HeadlinesModel.dart';
import 'package:news_app/utils/utils.dart';
import 'package:news_app/view%20model/headline_view_model.dart';

enum FilterList {
  bbcSports,
  bleacherReport,
  footballItalia,
  foxSports,
  talkSport,
  theSportBible
}
/*
bbc-sport
bleacher-report
football-italia
fox-sports
talksport
the-sport-bible
*/

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    String source = '';

    Utils utils = Utils();

    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
        appBar: AppBar(
          title: const Text("My News"),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {},
              icon: Image.asset(
                "images/category_icon.png",
                height: 20,
                width: 20,
              )),
          actions: [
            PopupMenuButton<FilterList>(
                icon: const Icon(Icons.more_vert),
                initialValue: FilterList.theSportBible,
                onSelected: (FilterList item) {
                  if (item.name == FilterList.bbcSports.name) {
                    source = 'bbc-sport';
                  }
                  if (FilterList.bleacherReport.name == item.name) {
                    source = "bleacher-report";
                  }
                  if (item.name == FilterList.footballItalia.name) {
                    source = "football-italia";
                  }
                  if (item.name == FilterList.foxSports.name) {
                    source = "fox-sports";
                  }
                  if (item.name == FilterList.talkSport.name) {
                    source = "talksport";
                  }
                  if (item.name == FilterList.theSportBible.name) {
                    source = "the-sport-bible";
                  }
                  HeadlinesViewModelProvider().fetchNewsHeadlineApi();
                },
                elevation: 2,
                color: Colors.black54,
                itemBuilder: (context) => <PopupMenuEntry<FilterList>>[
                      const PopupMenuItem<FilterList>(
                        value: FilterList.theSportBible,
                        child: Text("The Sports Bible",
                            style: TextStyle(color: Colors.white)),
                      ),
                      const PopupMenuItem<FilterList>(
                          value: FilterList.footballItalia,
                          child: Text(
                            "Football Italia",
                            style: TextStyle(color: Colors.white),
                          )),
                      const PopupMenuItem<FilterList>(
                          value: FilterList.bleacherReport,
                          child: Text("Bleacher Report",
                              style: TextStyle(color: Colors.white))),
                      const PopupMenuItem<FilterList>(
                          value: FilterList.bbcSports,
                          child: Text("BBC Sports",
                              style: TextStyle(color: Colors.white))),
                      const PopupMenuItem<FilterList>(
                          value: FilterList.foxSports,
                          child: Text("FOX Sports",
                              style: TextStyle(color: Colors.white))),
                      const PopupMenuItem<FilterList>(
                          value: FilterList.talkSport,
                          child: Text("Talksport",
                              style: TextStyle(color: Colors.white))),
                    ])
          ],
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: height * .6,
              width: width * 1,
              child: FutureBuilder<HeadlinesModel>(
                  future: HeadlinesViewModelProvider().fetchNewsHeadlineApi(),
                  builder: (BuildContext context,
                      AsyncSnapshot<HeadlinesModel> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          child: utils.customSpinKitLarge(),
                        ),
                      );
                    } else {
                      var articlesData = snapshot.data!.articles;
                      return ListView.builder(
                          itemCount: articlesData!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            print(articlesData[index]!.urlToImage.toString());
                            return HomeScreenHeadlineCard(
                                imageUrl:
                                    articlesData[index]!.urlToImage.toString(),
                                width: width,
                                height: height,
                                title: articlesData[index]!.title.toString(),
                                source: articlesData[index]!
                                    .source!
                                    .name
                                    .toString(),
                                publishedDate:
                                    articlesData[index]!.publishedAt.toString(),
                                url: articlesData[index]!.url.toString());
                          });
                    }
                  }),
            ),
          ],
        ));
  }
}
