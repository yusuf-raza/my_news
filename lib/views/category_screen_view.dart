import 'package:flutter/material.dart';
import 'package:news_app/components/category_list_chip.dart';
import 'package:news_app/components/topic_screen_topical_news_card.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/utils/utils.dart';
import 'package:news_app/view%20model/category_view_model.dart';

class CategoryScreenView extends StatefulWidget {
  const CategoryScreenView({super.key});

  @override
  State<CategoryScreenView> createState() => _CategoryScreenViewState();
}

class _CategoryScreenViewState extends State<CategoryScreenView> {
  late CategoryViewModel categoryViewModel;
  String category = 'general';
  late Future<CategoryModel> future;
  Utils utils = Utils();

  List<String> categoryList = [
    "general",
    "sports",
    "technology",
    "business",
    "pakistan",
    "entertainment",
    "fashion",
    "south asia",
  ];

  @override
  void initState() {
    super.initState();
    categoryViewModel = CategoryViewModel();
    future = categoryViewModel.fetchCategoryApi(categoryList.first);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: width,
              height: 50,
              child: ListView.builder(
                  itemCount: categoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(3),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            future = categoryViewModel
                                .fetchCategoryApi(categoryList[index].toString());
                          });
                        },
                        child: CategoryListChip(
                            categoryName: categoryList[index].toString()),
                      ),
                    );
                  }),
            ),
          ),
          SizedBox(
            height: height * .8,
            child: FutureBuilder<CategoryModel>(
                future: future,
                builder: (BuildContext context,
                    AsyncSnapshot<CategoryModel> snapshot) {
                  if (!snapshot.hasData) {
                    return utils.customShimmerTwo(width, height);
                  } else {
                    var articlesData = snapshot.data!.articles;
                    return ListView.builder(
                        itemCount: articlesData!.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return TopicScreenNewsCard(
                              imageUrl:
                                  articlesData[index].urlToImage.toString(),
                              width: width,
                              height: height,
                              title: articlesData[index].title.toString(),
                              source: articlesData[index].source!.name.toString(),
                              publishedAt:
                                  articlesData[index].publishedAt.toString(),
                              url: articlesData[index].url.toString(),
                              content: articlesData[index].content.toString(),
                              author: articlesData[index].author.toString());
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
