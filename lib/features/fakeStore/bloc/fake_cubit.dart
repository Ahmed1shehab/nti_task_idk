import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:yarab_elsabr/features/fakeStore/bloc/fake_state.dart';
import 'package:http/http.dart' as http;
import 'package:yarab_elsabr/models/fake_data_model.dart';

class FakeCubit extends Cubit<FakeState> {
  FakeCubit() : super(FakeInit());

  Future<void> fetchFakeData() async {
    emit(FakeLoading());
    const String url = "https://fakestoreapi.com/products/category/electronics";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        final List<FakeDataModel> fakeList = jsonResponse
            .map((item) => FakeDataModel.fromJson(item))
            .toList();
        emit(FakeLoaded(data: fakeList));
      } else {
        emit(FakeError(error: "Failed to Load"));
      }
    } catch (e) {
      emit(FakeError(error: "Error fetching data: $e"));
    }
  }

}
