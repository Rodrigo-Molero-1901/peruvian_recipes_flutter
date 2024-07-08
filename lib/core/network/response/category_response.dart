class CategoryResponse {
  String? title;
  String? imagePath;

  CategoryResponse({
    this.title,
    this.imagePath,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      title: json['title'],
      imagePath: json['imagePath'],
    );
  }
}
