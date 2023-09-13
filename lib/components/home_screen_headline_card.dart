import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/utils.dart';
import 'package:news_app/views/news_description_screen_view.dart';

class HomeScreenHeadlineCard extends StatelessWidget {
  const HomeScreenHeadlineCard(
      {super.key,
      required this.imageUrl,
      required this.width,
      required this.height,
      required this.title,
      required this.source,
      required this.publishedAt,
      required this.url, required this.author, required this.content});

  final String imageUrl;
  final double width;
  final double height;
  final String title;
  final String source;
  final String publishedAt;
  final String url;
  final String author;
  final String content;

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
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
                height: height * .6,
                alignment: Alignment.center,
              )),
        ),
        Positioned(
          bottom: 20,
          child: SizedBox(
            height: height * .2,
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: width * .8,
                      //height: height * .2,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            title,
                            style: GoogleFonts.aBeeZee(
                                letterSpacing: .6,
                                color: Colors.black,
                                fontSize: 17),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ),
                    SizedBox(
                      width: width * .8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              source,
                              style: GoogleFonts.abel(
                                  fontSize: 15, color: Colors.blue),
                            ),
                            OpenContainer(
                              closedElevation: 0,
                              transitionType: ContainerTransitionType.fade,
                                tappable: true,
                                closedBuilder: (BuildContext context, void Function() action) => const Text("Read more", style: TextStyle(color: Colors.blue),),
                                openBuilder: (BuildContext context, void Function() action) => NewsDescriptionScreenView(
                                    source: source,
                                    publishedAt: publishedAt,
                                    author: author,
                                    content: content,
                                    imageUrl: imageUrl,
                                    title: title),
                            ),
                            Text(
                             utils.formatDate(publishedAt),
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
  }
}
