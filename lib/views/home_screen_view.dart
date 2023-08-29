import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/components/home_screen_headline_card.dart';
import 'package:news_app/models/HeadlinesModel.dart';
import 'package:news_app/utils/utils.dart';
import 'package:news_app/view%20model/headline_view_model.dart';

enum PopUpMenuItemList {
  bbcSports,
  bleacherReport,
  footballItalia,
  foxSports,
  talkSport,
  theSportBible
}

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  late HeadlinesViewModel headlinesViewModel;
  String source = 'the-sport-bible';
  var future;
  Utils utils = Utils();

  @override
  void initState() {
    super.initState();
    headlinesViewModel = HeadlinesViewModel();
    future = headlinesViewModel.fetchNewsHeadlineApi(source);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    PopUpMenuItemList? selectedItem;

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
            PopupMenuButton<PopUpMenuItemList>(
                icon: const Icon(Icons.more_vert),
                initialValue: selectedItem,
                onSelected: (PopUpMenuItemList item) {
                  if (item.name == PopUpMenuItemList.bbcSports.name) {
                    source = 'bbc-sport';
                  }
                  if (item.name == PopUpMenuItemList.bleacherReport.name) {
                    source = "bleacher-report";
                  }
                  if (item.name == PopUpMenuItemList.footballItalia.name) {
                    source = "football-italia";
                  }
                  if (item.name == PopUpMenuItemList.foxSports.name) {
                    source = "fox-sports";
                  }
                  if (item.name == PopUpMenuItemList.talkSport.name) {
                    source = "talksport";
                  }
                  if (item.name == PopUpMenuItemList.theSportBible.name) {
                    source = "the-sport-bible";
                  }

                  setState(() {
                    selectedItem = item;
                    future = headlinesViewModel.fetchNewsHeadlineApi(source);
                  });

                  headlinesViewModel.fetchNewsHeadlineApi(source);
                },
                elevation: 2,
                color: Colors.black54,
                itemBuilder: (context) => <PopupMenuEntry<PopUpMenuItemList>>[
                      const PopupMenuItem<PopUpMenuItemList>(
                        value: PopUpMenuItemList.theSportBible,
                        child: Text("The Sports Bible",
                            style: TextStyle(color: Colors.white)),
                      ),
                      const PopupMenuItem<PopUpMenuItemList>(
                          value: PopUpMenuItemList.footballItalia,
                          child: Text(
                            "Football Italia",
                            style: TextStyle(color: Colors.white),
                          )),
                      const PopupMenuItem<PopUpMenuItemList>(
                          value: PopUpMenuItemList.bleacherReport,
                          child: Text("Bleacher Report",
                              style: TextStyle(color: Colors.white))),
                      const PopupMenuItem<PopUpMenuItemList>(
                          value: PopUpMenuItemList.bbcSports,
                          child: Text("BBC Sports",
                              style: TextStyle(color: Colors.white))),
                      const PopupMenuItem<PopUpMenuItemList>(
                          value: PopUpMenuItemList.foxSports,
                          child: Text("FOX Sports",
                              style: TextStyle(color: Colors.white))),
                      const PopupMenuItem<PopUpMenuItemList>(
                          value: PopUpMenuItemList.talkSport,
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
                  future: future,
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
