class CarouselRecipeResponse {
  String? id;
  String? category;
  String? imageURL;
  String? title;
  int? votes;

  CarouselRecipeResponse({
    this.id,
    this.category,
    this.imageURL,
    this.title,
    this.votes,
  });

  factory CarouselRecipeResponse.fromJson(Map<String, dynamic> json) {
    return CarouselRecipeResponse(
      id: json['id'],
      category: json['category'],
      imageURL: json['image_url'],
      title: json['title'],
      votes: json['votes'],
    );
  }
}
