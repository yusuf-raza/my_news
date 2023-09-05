import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/route_names.dart';
import 'package:news_app/utils/utils.dart';

class TopicScreenNewsCard extends StatelessWidget {
  const TopicScreenNewsCard(
      {super.key,
        required this.imageUrl,
        required this.width,
        required this.height,
        required this.title,
        required this.source,
        required this.publishedAt,
        required this.url, required this.content, required this.author});

  final String imageUrl;
  final double width;
  final String content;
  final double height;
  final String title;
  final String source;
  final String publishedAt;
  final String url;
  final String author;

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: height * .3,
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => utils.customSpinKitMedium(),
                errorWidget: (context, url, error) => const Center(
                    child: Text(
                      "no image :(",
                      style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    )),
                fit: BoxFit.cover,
                width: width * .9,
                height: height * .5,
                alignment: Alignment.center,
              )),
        ),
        Positioned(
          bottom: 5,
          child: Card(
            child: Container(
              height: height * 0.12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: width * .9,
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          title,
                          style: GoogleFonts.aBeeZee(
                              letterSpacing: .6,
                              color: Colors.black,
                              fontSize: 16),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                   InkWell(onTap:(){
                     GoRouter.of(context).pushNamed(
                         RouteNames.newsDescriptionScreen,
                         pathParameters: {
                           "source" : source,
                           "publishedAt":publishedAt,
                           "author":author,
                           "content":content,
                           "imageUrl":imageUrl,
                           "title": title
                     });
                   },child: const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Text("Read more...", style: TextStyle(color: Colors.blue),),
                   ))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

}
