import 'package:flutter/material.dart';
import 'package:yarab_elsabr/views/dog_view.dart';
import 'package:yarab_elsabr/views/fake_view.dart';

import 'features/dog/screen/dog_page_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FakeView(),
    );
  }
}
