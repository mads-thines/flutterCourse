class ImageModel {
  int id;
  String url;
  String title;

  // Create image from ID and URL
  ImageModel(this.id, this.url, this.title);

  // Create image from parsedJson
  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    url = parsedJson['url'];
    title = parsedJson['title'];
  }
}
