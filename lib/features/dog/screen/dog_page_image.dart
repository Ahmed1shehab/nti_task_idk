// import 'package:flutter/material.dart';
// import 'package:yarab_elsabr/features/dog/widgets/custom_elevated_btn.dart';
//
// import '../../../models/dog_api.dart';
//
// class DogImagePage extends StatefulWidget {
//   const DogImagePage({Key? key}) : super(key: key);
//
//   @override
//   State<DogImagePage> createState() => _DogImagePageState();
// }
//
// class _DogImagePageState extends State<DogImagePage> {
//   Future<DogApi>? dogApi;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchDogImage();
//   }
//
//   void fetchDogImage() {
//     setState(() {
//       dogApi = fetchRandomDogImage();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           'Random Dog',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 30,
//           ),
//         ),
//       ),
//       body: Center(
//         child: FutureBuilder<DogApi>(
//           future: dogApi,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();
//             } else if (snapshot.hasData) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.network(snapshot.data!.imageUrl),
//                   const SizedBox(height: 40),
//                   elevatedButton(fetchDogImage)
//                 ],
//               );
//             } else {
//               return const Text('No image to display');
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
