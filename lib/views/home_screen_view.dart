import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/HeadlinesModel.dart';
import 'package:news_app/utils/utils.dart';
import 'package:news_app/view%20model/headline_view_model.dart';
import 'package:provider/provider.dart';

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
    HeadlinesViewModelProvider headlinesModelProvider = Provider.of<HeadlinesViewModelProvider>(context, listen: false);

    String source = headlinesModelProvider.getSource.toString();

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
                  if ( item.name == FilterList.bbcSports.name ) {
                    headlinesModelProvider.setSource = 'bbc-sport';
                    //source = 'bbc-sport';
                  }
                  if (FilterList.bleacherReport.name ==item.name ) {
                    headlinesModelProvider.setSource = 'bleacher-report';

                   // source = "bleacher-report";
                  }
                  if ( item.name == FilterList.footballItalia.name) {
                   // source = "football-italia";
                    headlinesModelProvider.setSource = 'football-italia';
                  }
                  if ( item.name ==FilterList.foxSports.name) {
                    //source = "fox-sports";
                    headlinesModelProvider.setSource = 'fox-sports';

                  }
                  if (item.name ==FilterList.talkSport.name ) {
                    headlinesModelProvider.setSource = 'talksport';

                    //source = "talksport";
                  }
                  if ( item.name == FilterList.theSportBible.name) {
                   // source = "the-sport-bible";
                    headlinesModelProvider.setSource = 'the-sport-bible';

                  }
                  headlinesModelProvider.fetchNewsHeadlineApi();

                  print(source);
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
                  future: headlinesModelProvider.fetchNewsHeadlineApi(),
                  builder: (BuildContext context,
                      AsyncSnapshot<HeadlinesModel> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          child: SpinKitWaveSpinner(
                            waveColor: Colors.blue.shade300,
                            trackColor: Colors.blueGrey,
                            color: Colors.blue,
                            size: 50,
                          ),
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: SizedBox(
                          child: SpinKitWaveSpinner(
                            waveColor: Colors.blue.shade300,
                            trackColor: Colors.blueGrey,
                            color: Colors.blue,
                            size: 50,
                          ),
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.none) {
                      return const Center(child: Text("no internet!"));
                    } else {
                      var articlesData = snapshot.data!.articles;

                      return ListView.builder(
                          itemCount: articlesData!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            print(articlesData[index]!.urlToImage.toString());
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: articlesData[index]!.urlToImage !=
                                        null
                                        ? CachedNetworkImage(
                                      imageUrl: articlesData[index]!
                                          .urlToImage
                                          .toString(),
                                      placeholder: (context, url) =>
                                          SpinKitWaveSpinner(
                                            waveColor: Colors.blue.shade300,
                                            trackColor: Colors.blueGrey,
                                            color: Colors.blue,
                                            size: 30,
                                          ),
                                      errorWidget:
                                          (context, url, error) =>
                                      const Icon(
                                        Icons.error_outline,
                                        color: Colors.red,
                                      ),
                                      fit: BoxFit.cover,
                                      width: width * .9,
                                      height: height * .6,
                                      alignment: Alignment.center,
                                    )
                                        : ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        height: height * .6,
                                        width: width * .9,
                                        color: Colors.red,
                                        child: const Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              " no image!",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Icon(
                                              Icons.error_outline,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  child: SizedBox(
                                    height: height * .2,
                                    child: Card(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: Colors.white),
                                        alignment: Alignment.bottomCenter,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: width * .8,
                                              //height: height * .2,
                                              child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    articlesData[index]!
                                                        .title
                                                        .toString(),
                                                    style: GoogleFonts.aBeeZee(
                                                        letterSpacing: .6,
                                                        color: Colors.black,
                                                        fontSize: 17),
                                                    maxLines: 3,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                  )),
                                            ),
                                            SizedBox(
                                              width: width * .8,
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Text(
                                                      articlesData[index]!
                                                          .source!
                                                          .name
                                                          .toString(),
                                                      style: GoogleFonts.abel(
                                                          fontSize: 15,
                                                          color: Colors.blue),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          Utils().launchURL(
                                                              articlesData[
                                                              index]!
                                                                  .url
                                                                  .toString());
                                                        },
                                                        icon: const Icon(
                                                          Icons.link,
                                                          color: Colors.blue,
                                                        )),
                                                    Text(
                                                      Utils().formatDate(
                                                          articlesData[index]!
                                                              .publishedAt
                                                              .toString()),
                                                      style: GoogleFonts.abel(
                                                        fontSize: 15,
                                                        color: Colors.blue,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          });
                    }
                  }),
              ),

          ],
        ));
  }
}
