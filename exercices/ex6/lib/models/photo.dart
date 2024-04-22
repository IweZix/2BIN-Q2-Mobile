import 'package:http/http.dart' as http;

class Photo {
  static const baseUrl = "https://unreal-api.azurewebsites.net/photos";

  final int id;
  final String title;
  final String thumbnailUrl;

  const Photo(this.id, this.title, this.thumbnailUrl);

  static addPhoto(String title, String thumbnailUrl) async{
    await http.post(
      Uri.parse(Photo.baseUrl),
      body: {
        'title': title,
        'thumbnailUrl': thumbnailUrl,
      },
    );
  }
}