class DetailedRecipeResponse {
  String? id;
  String? category;
  String? description;
  String? title;
  String? videoURL;

  DetailedRecipeResponse({
    this.id,
    this.category,
    this.description,
    this.title,
    this.videoURL,
  });

  factory DetailedRecipeResponse.fromJson(Map<String, dynamic> json) {
    return DetailedRecipeResponse(
      id: json['id'],
      category: json['category'],
      description: json['description'],
      title: json['title'],
      videoURL: json['video_url'],
    );
  }
}
