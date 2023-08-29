import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/utils.dart';

class HomeScreenHeadlineCard extends StatelessWidget {
  const HomeScreenHeadlineCard(
      {super.key,
      required this.imageUrl,
      required this.width,
      required this.height,
      required this.title,
      required this.source,
      required this.publishedDate,
      required this.url});

  final String imageUrl;
  final double width;
  final double height;
  final String title;
  final String source;
  final String publishedDate;
  final String url;

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
                            IconButton(
                                onPressed: () {
                                  utils.launchURL(url);
                                },
                                icon: const Icon(
                                  Icons.link,
                                  color: Colors.blue,
                                )),
                            Text(
                             utils.formatDate(publishedDate),
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
