// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:step_tracker/home/page/home_page.dart';

// class LandingPage extends StatelessWidget {
//   LandingPage({Key? key}) : super(key: key);

//   TextEditingController? nameController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         // resizeToAvoidBottomInset: false,
//         body: Container(
//           // alignment: AlignmentDirectional.bottomCenter,
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//             fit: BoxFit.cover,
//             image: AssetImage('assets/images/landing.jpg'),
//             // fit: BoxFit.fill,
//           )),
//           child: Padding(
//             padding: const EdgeInsets.all(24),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextField(
//                     decoration: const InputDecoration(
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(width: 1)),
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(width: 1)),
//                         hintText: 'Enter Name',
//                         hintStyle: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.w500)),
//                     controller: nameController),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ElevatedButton(
//                     onPressed: () async {
//                       await createUser(nameController!.text);
//                       Navigator.of(context).pushAndRemoveUntil(
//                           MaterialPageRoute(builder: (_) => const HomePage()),
//                           (route) => false);
//                     },
//                     child: const Text('Next'))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Future createUser(String name) async {
//   final docUser = FirebaseFirestore.instance.collection('users').doc();
//   final user = UserEntity(docUser.id, name, 0);
//   final json = user.toJson();
//   docUser.set(json);
// }

// class UserEntity {
//   String id;
//   final String name;
//   int steps;

//   UserEntity(this.id, this.name, this.steps);

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'steps': 0,
//     };
//   }
// }
