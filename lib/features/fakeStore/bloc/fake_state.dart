import 'package:yarab_elsabr/models/fake_data_model.dart';

abstract class FakeState {}
class FakeInit extends FakeState{}
class FakeLoading extends FakeState{}
class FakeLoaded extends FakeState {
  final List<FakeDataModel> data;

  FakeLoaded({required this.data});
}

class FakeError extends FakeState{
  final String error;

  FakeError({required this.error});
}