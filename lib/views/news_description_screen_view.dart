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
      required this.imageUrl, required this.title});

  final String source;
  final String publishedAt;
  final String author;
  final String content;
  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    Utils utils = Utils();

    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration:  BoxDecoration(
              border:Border.all(color: Colors.black12),
              borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
          child: SizedBox(
            width: width * .9,
            child: Column(
              children: [
                SizedBox(
                  height: height * .3,
                  child: CachedNetworkImage(imageUrl: imageUrl.toString(),fit: BoxFit.cover,),
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(source),
                    Text(utils.formatDate(publishedAt))
                  ],
                ),
                const SizedBox(height: 5,),

                Text(title, style: const TextStyle(fontSize: 18),),
                const SizedBox(height: 5,),

                Center(child: Text(content,maxLines: 40,)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
