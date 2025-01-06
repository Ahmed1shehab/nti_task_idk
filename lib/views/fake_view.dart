import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yarab_elsabr/features/fakeStore/bloc/fake_cubit.dart';
import 'package:yarab_elsabr/features/fakeStore/bloc/fake_state.dart';
import 'package:yarab_elsabr/models/fake_data_model.dart';

class FakeView extends StatelessWidget {
  const FakeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FakeCubit()..fetchFakeData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fake Store - Electronics'),
        ),
        body: BlocBuilder<FakeCubit, FakeState>(
          builder: (context, state) {
            if (state is FakeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FakeLoaded) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  final FakeDataModel product = state.data[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.network(
                        product.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(product.title),
                      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                      onTap: () {},
                    ),
                  );
                },
              );
            } else if (state is FakeError) {
              return Center(child: Text(state.error));
            } else {
              return const Center(child: Text('Something went wrong!'));
            }
          },
        ),
      ),
    );
  }
}
