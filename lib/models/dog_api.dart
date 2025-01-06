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

