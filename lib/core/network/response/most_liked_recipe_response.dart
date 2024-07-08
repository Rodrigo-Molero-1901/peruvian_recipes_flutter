class MostLikedRecipeResponse {
  String? category;
  String? imageURL;
  String? title;
  int? votes;

  MostLikedRecipeResponse({
    this.category,
    this.imageURL,
    this.title,
    this.votes,
  });

  factory MostLikedRecipeResponse.fromJson(Map<String, dynamic> json) {
    return MostLikedRecipeResponse(
      category: json['category'],
      imageURL: json['imageURL'],
      title: json['title'],
      votes: json['votes'],
    );
  }
}
