class RecipeResponse {
  String? id;
  String? category;
  String? imageURL;
  String? title;

  RecipeResponse({
    this.id,
    this.category,
    this.imageURL,
    this.title,
  });

  factory RecipeResponse.fromJson(Map<String, dynamic> json) {
    return RecipeResponse(
      id: json['id'],
      category: json['category'],
      imageURL: json['image_url'],
      title: json['title'],
    );
  }
}
