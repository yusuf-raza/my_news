import 'dart:core';

import 'package:flutter/material.dart';
import 'package:news_app/components/topic_screen_topical_news_card.dart';
import 'package:news_app/models/news_by_topic_model.dart';
import 'package:news_app/utils/utils.dart';
import 'package:news_app/view%20model/topic_view_model.dart';

class TopicalNewsViewScreen extends StatefulWidget {
  const TopicalNewsViewScreen({super.key, required this.topicForNews});

  final String topicForNews;

  @override
  State<TopicalNewsViewScreen> createState() => _TopicalNewsViewScreenState();
}

class _TopicalNewsViewScreenState extends State<TopicalNewsViewScreen> {
  late TopicsViewModel topicsViewModel;

  var future;
  Utils utils = Utils();


  @override
  void initState() {
    super.initState();
    topicsViewModel = TopicsViewModel();
    future = topicsViewModel.fetchNewsTopicApi(widget.topicForNews);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
        appBar: AppBar(
          title: Text("News for ${widget.topicForNews}"),
          centerTitle: true,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: height * 1,
              width: width * 1,
              child: FutureBuilder<NewsByTopicModel>(
                  future: future,
                  builder: (BuildContext context,
                      AsyncSnapshot<NewsByTopicModel> snapshot) {
                    if (!snapshot.hasData) {
                      return utils.customShimmer(width, height);
                    } else {
                      var articlesData = snapshot.data!.articles;
                      return ListView.builder(
                          itemCount: articlesData!.length,
                          itemBuilder: (context, index) {
                            return TopicScreenNewsCard(
                              width: width,
                              height: height,
                              imageUrl: articlesData[index].urlToImage.toString(),
                              title: articlesData[index].title.toString(),
                              source: articlesData[index].source!.name.toString(),
                              publishedAt: articlesData[index].publishedAt.toString(),
                              url: articlesData[index].url.toString(),
                              content: articlesData[index].content.toString(),
                              author: articlesData[index].author.toString(),
                            );
                          });
                    }
                  }),
            ),
          ],
        ));
  }
}
