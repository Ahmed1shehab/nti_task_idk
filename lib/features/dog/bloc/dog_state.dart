import 'package:yarab_elsabr/models/dog_api.dart';

abstract class DogState {}

class DogInitial extends DogState {}

class DogLoading extends DogState {}

class DogLoaded extends DogState {
  final DogApi dog;

  DogLoaded({required this.dog});
}

class DogError extends DogState {
  final String error;

  DogError({required this.error});
}