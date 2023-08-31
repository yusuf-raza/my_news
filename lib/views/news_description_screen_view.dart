import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/utils.dart';

class NewsDescriptionScreenView extends StatelessWidget {
  const NewsDescriptionScreenView(
      {super.key,
      required this.source,
      required this.publishedAt,
      required this.author,
      required this.content,
      required this.imageUrl});

  final String source;
  final String publishedAt;
  final String author;
  final String content;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    Utils utils = Utils();

    return Scaffold(
      appBar: AppBar(
        title: const Text("News app"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Colors.blue),
          child: Column(
            children: [
              // Stack(
              //   children: [
              //     Container(
              //       decoration: const BoxDecoration(color: Colors.black12),
              //       height: height * .3,
              //       width: width * 8,
              //       child: Center(child: CachedNetworkImage(imageUrl: imageUrl.toString())),
              //     ),
              //     Positioned(left: 10, bottom: 10, child: Text(source)),
              //     Positioned(bottom: 10, right: 10, child: Text(publishedAt))
              //   ],
              // ),
              // Container(
              //   decoration: const BoxDecoration(color: Colors.purple),
              //   width: width * 8,
              //   child: Center(child: Text(content)),
              // ),
              Text("CONTENT "+content),
              Text("AUTHOR "+author),
              Text("PUBLISHED AT "+publishedAt),
              Text("SOURCE "+source),
              Text("IMAGE URL"+imageUrl)
            ],
          ),
        ),
      ),
    );
  }
}
