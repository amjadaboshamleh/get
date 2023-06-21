class NewsModel {
  String? status;
  int? totalResults;
  List<Article> articles = [];
  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    totalResults = json["totalResults"];
    json["articles"].forEach((element) {
      articles.add(Article.fromJson(element));
    });
  }
}

class Article {
  Source? source;
  String? title;
  String? description;
  String? author;
  String? url;
  String? image;
  Article.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    description = json["description"];
    author = json["author"];
    url = json["url"];
    image = json["urlToImage"];
    source = Source.fromJson(json["source"]);
  }
}

class Source {
  String? id;
  String? name;
  Source.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }
}
