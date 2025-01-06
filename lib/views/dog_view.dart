import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yarab_elsabr/features/dog/widgets/custom_elevated_btn.dart';

import '../features/dog/bloc/dog_bloc.dart';
import '../features/dog/bloc/dog_state.dart';

class DogView extends StatelessWidget {
  const DogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => DogCubit(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Random Dog',
              style: TextStyle(fontSize: 30),
            ),
            centerTitle: true,
          ),
          body: BlocBuilder<DogCubit, DogState>(
            builder: (context, state) {
              DogCubit cubit = BlocProvider.of(context);
              if (state is DogLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is DogLoaded) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(state.dog.imageUrl),
                      const SizedBox(height: 20),
                      elevatedButton(
                        onPressed: cubit.fetchDogImage,
                        label: 'Generate Dog Image',
                      ),
                    ],
                  ),
                );
              } else if (state is DogError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.error,
                          style: const TextStyle(color: Colors.red)),
                      const SizedBox(height: 20),
                      elevatedButton(
                        onPressed: cubit.fetchDogImage,
                        label: 'Generate Dog Image',
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: elevatedButton(
                    onPressed: cubit.fetchDogImage,
                    label: 'Generate Dog Image',
                  ),
                );
              }
            },
          ),
        ));
  }
}
