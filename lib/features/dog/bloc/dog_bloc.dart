import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:yarab_elsabr/models/dog_api.dart';

import 'dog_state.dart';

class DogCubit extends Cubit<DogState> {
  DogCubit() : super(DogInitial());

  Future<void> fetchDogImage() async {
    emit(DogLoading());

    const String url = 'https://dog.ceo/api/breeds/image/random';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final dog = DogApi.fromJson(jsonResponse);
        emit(DogLoaded(dog: dog));
      } else {
        emit(DogError(error: 'Failed to load dog image'));
      }
    } catch (e) {
      emit(DogError(error: 'Error fetching dog image: $e'));
    }
  }
}
