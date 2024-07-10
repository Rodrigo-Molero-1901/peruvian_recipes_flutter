class MostLikedRecipeResponse {
  String? id;
  String? category;
  String? imageURL;
  String? title;
  int? votes;

  MostLikedRecipeResponse({
    this.id,
    this.category,
    this.imageURL,
    this.title,
    this.votes,
  });

  factory MostLikedRecipeResponse.fromJson(Map<String, dynamic> json) {
    return MostLikedRecipeResponse(
      id: json['id'],
      category: json['category'],
      imageURL: json['image_url'],
      title: json['title'],
      votes: json['votes'],
    );
  }
}
