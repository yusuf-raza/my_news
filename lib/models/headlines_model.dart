
class HeadlinesModelArticlesSource {

  String? id;
  String? name;

  HeadlinesModelArticlesSource({
    this.id,
    this.name,
  });
  HeadlinesModelArticlesSource.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class HeadlinesModelArticles {
  HeadlinesModelArticlesSource? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  HeadlinesModelArticles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
  HeadlinesModelArticles.fromJson(Map<String, dynamic> json) {
    source = (json['source'] != null) ? HeadlinesModelArticlesSource.fromJson(json['source']) : null;
    author = json['author']?.toString();
    title = json['title']?.toString();
    description = json['description']?.toString();
    url = json['url']?.toString();
    urlToImage = json['urlToImage']?.toString();
    publishedAt = json['publishedAt']?.toString();
    content = json['content']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

class HeadlinesModel {

  String? status;
  int? totalResults;
  List<HeadlinesModelArticles?>? articles;

  HeadlinesModel({
    this.status,
    this.totalResults,
    this.articles,
  });
  HeadlinesModel.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toString();
    totalResults = json['totalResults']?.toInt();
    if (json['articles'] != null) {
      final v = json['articles'];
      final arr0 = <HeadlinesModelArticles>[];
      v.forEach((v) {
        arr0.add(HeadlinesModelArticles.fromJson(v));
      });
      articles = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      final v = articles;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['articles'] = arr0;
    }
    return data;
  }
}
