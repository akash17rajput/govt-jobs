// // ignore_for_file: prefer_const_constructors, file_names

// import 'package:flutter/material.dart';
// import 'package:like_button/like_button.dart';

// class MainTile extends StatefulWidget {
//   const MainTile({Key? key}) : super(key: key);

//   @override
//   State<MainTile> createState() => _MainTileState();
// }

// class _MainTileState extends State<MainTile> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       // backgroundColor: const Color(0xff101820),
//       backgroundColor: const Color(0xff393E46),
//       appBar: AppBar(
//         backgroundColor: const Color(0xff000000),
//       ),
//       body: Center(
//         child: Container(
//           height: size.height * 0.25,
//           width: size.width * 0.95,
//           decoration: BoxDecoration(
//             // color: const Color(0xffFFDEAD),
//             color: const Color(0xffFFEADD),
//             border: Border.all(color: const Color(0xffFF9EAA), width: 3),
//             borderRadius: const BorderRadius.all(Radius.circular(10)),
//           ),
//           child: Column(
//             children: [
//               // Logo, Title, Subtitle, Favorite
//               SizedBox(
//                 width: size.width * 0.85,
//                 height: size.height * 0.1,
//                 child: Row(
//                   children: [
//                     SizedBox(width: size.width * 0.02),

//                     // Logo
//                     Container(
//                       height: size.height * 0.08,
//                       width: size.width * 0.16,
//                       decoration: BoxDecoration(
//                         color: Colors.white38,
//                         border: Border.all(color: Colors.black45, width: 1.5),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Image.asset(
//                         'assets/google.png',
//                         fit: BoxFit.contain,
//                       ),
//                     ),

//                     SizedBox(width: size.width * 0.05),

//                     // Title & Subtitle
//                     SizedBox(
//                       width: size.width * 0.5359,
//                       height: size.height * 0.1,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(height: size.height * 0.01),
//                           Text(
//                             'UI/UX DEVELOPER',
//                             style: TextStyle(
//                               color: Color(0xff001C30),
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: size.height * 0.0075),
//                           const Text(
//                             'Google LLC',
//                             style: TextStyle(
//                               color: Color(0xff176B87),
//                               fontSize: 12,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     const LikeButton(),
//                   ],
//                 ),
//               ),

//               // Divider
//               Container(
//                 width: size.width * 0.8,
//                 height: 2.5,
//                 decoration: BoxDecoration(
//                   color: Colors.black87,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),

//               // Location, Salary, Posts, Age
//               SizedBox(
//                 width: size.width * 0.85,
//                 height: size.height * 0.09,
//                 child: Row(
//                   children: [
//                     // Location & Salary
//                     SizedBox(
//                       height: size.height * 0.1,
//                       width: size.width * 0.421,
//                       child: Row(
//                         children: [
//                           SizedBox(width: size.width * 0.03),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(height: size.height * 0.01),
//                               const Row(
//                                 children: [
//                                   Text(
//                                     'Place',
//                                     style: TextStyle(
//                                       color: Color(0xff247881),
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     '  -',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     '  ' 'Maharashtra',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: size.height * 0.015),
//                               const Row(
//                                 children: [
//                                   Text(
//                                     'Salary',
//                                     style: TextStyle(
//                                       color: Color(0xff247881),
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     ' -',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     '  ' '50k to 100k',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),

//                     // Divider
//                     Container(
//                       height: size.height * 0.085,
//                       width: 2.5,
//                       decoration: BoxDecoration(
//                         color: Colors.black87,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),

//                     // Posts & Age
//                     SizedBox(
//                       height: size.height * 0.09,
//                       width: size.width * 0.421,
//                       child: Row(
//                         children: [
//                           SizedBox(width: size.width * 0.03),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(height: size.height * 0.01),
//                               const Row(
//                                 children: [
//                                   Text(
//                                     'Posts',
//                                     style: TextStyle(
//                                       color: Color(0xff247881),
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     ' -',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     ' ' '148',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: size.height * 0.015),
//                               const Row(
//                                 children: [
//                                   Text(
//                                     'Age',
//                                     style: TextStyle(
//                                       color: Color(0xff247881),
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     '    -',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     '  ' '18 to 45 years',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // Category, Fee, Left Days
//               SizedBox(
//                 width: 350,
//                 height: size.height * 0.045,
//                 child: Row(
//                   children: [
//                     SizedBox(width: size.width * 0.05),

//                     // Category
//                     Container(
//                       height: size.height * 0.04,
//                       width: size.width * 0.2,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Color(0xff64CCC5), width: 2),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(7.5),
//                         ),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           'Category',
//                           style: TextStyle(
//                               color: Color(0xff435B66),
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),

//                     SizedBox(width: size.width * 0.05),

//                     // Fee
//                     Container(
//                       height: size.height * 0.04,
//                       width: size.width * 0.13,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Color(0xff64CCC5), width: 2),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(7.5),
//                         ),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           'Free',
//                           style: TextStyle(
//                               color: Color(0xff435B66),
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),

//                     SizedBox(width: size.width * 0.05),

//                     // Left Days
//                     Container(
//                       height: size.height * 0.04,
//                       width: size.width * 0.26,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Color(0xff64CCC5), width: 2),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(7.5),
//                         ),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           '100 Days Left',
//                           style: TextStyle(
//                               color: Color(0xff435B66),
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';

// class text extends StatefulWidget {
//   const text(String s, TextStyle textStyle, {super.key});

//   @override
//   State<text> createState() => _textState();
// }

// class _textState extends State<text> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Center(
//               child: Text(
//                 'dsvemvlemvlmeldsvemvlemvlmeldsvemvlemvlmeldsvemvlemvlmeldsvemvlemvlmeldsvemvlemvlmeldsvemvlemvlmeldsvemvlemvlmel',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                 ),
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//               ),
//             )));
//   }
// }
