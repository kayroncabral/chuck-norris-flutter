class Joke {
  final String id;
  final String value;
  final categories;
  final String url;
  final String iconUrl;
  final String createdAt;
  final String updatedAt;

  Joke(this.id, this.value, this.categories, this.url, this.iconUrl, this.createdAt, this.updatedAt);

  Joke.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      value = json['value'],
      categories = json['categories'],
      url = json['url'],
      iconUrl = json['icon_url'],
      createdAt = json['created_at'],
      updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'value' : value,
    'categories': categories,
    'url' : url,
    'icon_url' : iconUrl,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };

}