class ArticleModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? image;
  String? data;
  String? content;

  ArticleModel(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.image,
      this.data,
      this.content});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    image = json['urlToImage'];
    data = json['publishedAt'];
    content = json['content'];
  }

}