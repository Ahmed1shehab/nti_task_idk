import 'dart:convert';
import 'package:http/http.dart' as http;

class DogApi {
  final String imageUrl;

  DogApi({required this.imageUrl});

  factory DogApi.fromJson(Map<String, dynamic> json) {
    return DogApi(
      imageUrl: json['message'] as String,
    );
  }
}

Future<DogApi> fetchRandomDogImage() async {
  const String url = 'https://dog.ceo/api/breeds/image/random';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return DogApi.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load dog image');
    }
  } catch (e) {
    throw Exception('Error fetching dog image: $e');
  }
}
