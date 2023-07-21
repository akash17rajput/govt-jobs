



 // RefreshIndicator(
          //   onRefresh: () => _futurePosts,
          //   child: FutureBuilder<List<Post>>(
          //     future: _futurePosts,
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         final posts = snapshot.data!;
          //         return Column(
          //           children: [
          //             Expanded(
          //               child: ListView.builder(
          //                 itemCount: posts.length,
          //                 itemBuilder: (context, index) {
          //                   final post = posts[index];
          //                   return Card(
          //                     child: Container(
          //                       height: size.height * 0.25,
          //                       width: size.width * 0.95,
          //                       decoration: BoxDecoration(
          //                         // color:  Color(0xffFFDEAD),
          //                         color: const Color(0xffFFEADD),
          //                         border: Border.all(
          //                             color: const Color(0xffFF9EAA), width: 3),
          //                         borderRadius: const BorderRadius.all(
          //                             Radius.circular(10)),
          //                       ),
          //                       child: Column(
          //                         children: [
          //                           // Logo, Title, Subtitle, Favorite
          //                           SizedBox(
          //                             width: size.width * 0.85,
          //                             height: size.height * 0.1,
          //                             child: Row(
          //                               children: [
          //                                 SizedBox(width: size.width * 0.02),

          //                                 // Logo
          //                                 Container(
          //                                   height: size.height * 0.08,
          //                                   width: size.width * 0.16,
          //                                   decoration: BoxDecoration(
          //                                     color: Colors.white38,
          //                                     border: Border.all(
          //                                         color: Colors.black45,
          //                                         width: 1.5),
          //                                     borderRadius:
          //                                         BorderRadius.circular(10),
          //                                   ),
          //                                   child: Image.asset(
          //                                     'assets/google.png',
          //                                     fit: BoxFit.contain,
          //                                   ),
          //                                 ),

          //                                 SizedBox(width: size.width * 0.05),

          //                                 // Title & Subtitle
          //                                 SizedBox(
          //                                   width: size.width * 0.5359,
          //                                   height: size.height * 0.1,
          //                                   child: Column(
          //                                     crossAxisAlignment:
          //                                         CrossAxisAlignment.start,
          //                                     children: [
          //                                       SizedBox(
          //                                           height: size.height * 0.01),
          //                                       SizedBox(
          //                                         width: size.width * 0.54,
          //                                         height: size.height * 0.025,
          //                                         // color: Colors.amber,
          //                                         child: SingleChildScrollView(
          //                                             scrollDirection:
          //                                                 Axis.horizontal,
          //                                             child: Text(
          //                                               post.postName,
          //                                               style: const TextStyle(
          //                                                 color:
          //                                                     Color(0xff001C30),
          //                                                 fontSize: 15,
          //                                                 fontWeight:
          //                                                     FontWeight.bold,
          //                                               ),
          //                                             )),
          //                                       ),
          //                                       SizedBox(
          //                                           height:
          //                                               size.height * 0.0075),
          //                                       SizedBox(
          //                                         width: size.width * 0.54,
          //                                         height: size.height * 0.056,
          //                                         child: SingleChildScrollView(
          //                                           scrollDirection:
          //                                               Axis.vertical,
          //                                           child: Text(
          //                                             post.company,
          //                                             style: const TextStyle(
          //                                               color:
          //                                                   Color(0xff176B87),
          //                                               fontSize: 12,
          //                                             ),
          //                                           ),
          //                                         ),
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 ),

          //                                 const LikeButton(),
          //                               ],
          //                             ),
          //                           ),

          //                           // Divider
          //                           Container(
          //                             width: size.width * 0.8,
          //                             height: 2.5,
          //                             decoration: BoxDecoration(
          //                               color: Colors.black87,
          //                               borderRadius: BorderRadius.circular(10),
          //                             ),
          //                           ),

          //                           // Location, Salary, Posts, Age
          //                           SizedBox(
          //                             width: size.width * 0.85,
          //                             height: size.height * 0.09,
          //                             child: Row(
          //                               children: [
          //                                 // Location & Salary
          //                                 SizedBox(
          //                                   height: size.height * 0.1,
          //                                   width: size.width * 0.421,
          //                                   child: Row(
          //                                     children: [
          //                                       SizedBox(
          //                                           width: size.width * 0.03),
          //                                       Column(
          //                                         crossAxisAlignment:
          //                                             CrossAxisAlignment.start,
          //                                         children: [
          //                                           SizedBox(
          //                                               height:
          //                                                   size.height * 0.01),
          //                                           Row(
          //                                             children: [
          //                                               const Text(
          //                                                 'Place',
          //                                                 style: TextStyle(
          //                                                   color: Color(
          //                                                       0xff247881),
          //                                                   fontSize: 14,
          //                                                   fontWeight:
          //                                                       FontWeight.bold,
          //                                                 ),
          //                                               ),
          //                                               const Text(
          //                                                 '  -',
          //                                                 style: TextStyle(
          //                                                   color: Colors.black,
          //                                                   fontSize: 15,
          //                                                   fontWeight:
          //                                                       FontWeight.bold,
          //                                                 ),
          //                                               ),
          //                                               SizedBox(
          //                                                 width:
          //                                                     size.width * 0.25,
          //                                                 height: size.height *
          //                                                     0.02,
          //                                                 child: Center(
          //                                                   child: Flexible(
          //                                                     child: Text(
          //                                                       post.location,
          //                                                       style:
          //                                                           const TextStyle(
          //                                                         color: Colors
          //                                                             .black,
          //                                                         fontSize: 14,
          //                                                       ),
          //                                                       overflow:
          //                                                           TextOverflow
          //                                                               .ellipsis,
          //                                                       maxLines: 1,
          //                                                     ),
          //                                                   ),
          //                                                 ),
          //                                               )
          //                                             ],
          //                                           ),
          //                                           SizedBox(
          //                                               height: size.height *
          //                                                   0.015),
          //                                           Row(
          //                                             children: [
          //                                               const Text(
          //                                                 'Salary',
          //                                                 style: TextStyle(
          //                                                   color: Color(
          //                                                       0xff247881),
          //                                                   fontSize: 14,
          //                                                   fontWeight:
          //                                                       FontWeight.bold,
          //                                                 ),
          //                                               ),
          //                                               const Text(
          //                                                 ' -',
          //                                                 style: TextStyle(
          //                                                   color: Colors.black,
          //                                                   fontSize: 15,
          //                                                   fontWeight:
          //                                                       FontWeight.bold,
          //                                                 ),
          //                                               ),
          //                                               SizedBox(
          //                                                 width:
          //                                                     size.width * 0.25,
          //                                                 height: size.height *
          //                                                     0.02,
          //                                                 child:
          //                                                     SingleChildScrollView(
          //                                                   scrollDirection:
          //                                                       Axis.horizontal,
          //                                                   child: Text(
          //                                                     '  '
          //                                                     '${post.salary}',
          //                                                     style:
          //                                                         const TextStyle(
          //                                                       color: Colors
          //                                                           .black,
          //                                                       fontSize: 14,
          //                                                     ),
          //                                                   ),
          //                                                 ),
          //                                               ),
          //                                             ],
          //                                           ),
          //                                         ],
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 ),

          //                                 // Divider
          //                                 Container(
          //                                   height: size.height * 0.085,
          //                                   width: 2.5,
          //                                   decoration: BoxDecoration(
          //                                     color: Colors.black87,
          //                                     borderRadius:
          //                                         BorderRadius.circular(10),
          //                                   ),
          //                                 ),

          //                                 // Posts & Age
          //                                 SizedBox(
          //                                   height: size.height * 0.09,
          //                                   width: size.width * 0.421,
          //                                   child: Row(
          //                                     children: [
          //                                       SizedBox(
          //                                           width: size.width * 0.03),
          //                                       Column(
          //                                         crossAxisAlignment:
          //                                             CrossAxisAlignment.start,
          //                                         children: [
          //                                           SizedBox(
          //                                               height:
          //                                                   size.height * 0.01),
          //                                           Row(
          //                                             children: [
          //                                               const Text(
          //                                                 'Posts',
          //                                                 style: TextStyle(
          //                                                   color: Color(
          //                                                       0xff247881),
          //                                                   fontSize: 14,
          //                                                   fontWeight:
          //                                                       FontWeight.bold,
          //                                                 ),
          //                                               ),
          //                                               const Text(
          //                                                 ' -',
          //                                                 style: TextStyle(
          //                                                   color: Colors.black,
          //                                                   fontSize: 15,
          //                                                   fontWeight:
          //                                                       FontWeight.bold,
          //                                                 ),
          //                                               ),
          //                                               SizedBox(
          //                                                 width:
          //                                                     size.width * 0.25,
          //                                                 height: size.height *
          //                                                     0.02,
          //                                                 child:
          //                                                     SingleChildScrollView(
          //                                                   scrollDirection:
          //                                                       Axis.horizontal,
          //                                                   child: Text(
          //                                                     ' '
          //                                                     '${post.noOfPosts}',
          //                                                     style:
          //                                                         const TextStyle(
          //                                                       color: Colors
          //                                                           .black,
          //                                                       fontSize: 14,
          //                                                     ),
          //                                                   ),
          //                                                 ),
          //                                               ),
          //                                             ],
          //                                           ),
          //                                           SizedBox(
          //                                               height: size.height *
          //                                                   0.015),
          //                                           Row(
          //                                             children: [
          //                                               const Text(
          //                                                 'Age',
          //                                                 style: TextStyle(
          //                                                   color: Color(
          //                                                       0xff247881),
          //                                                   fontSize: 14,
          //                                                   fontWeight:
          //                                                       FontWeight.bold,
          //                                                 ),
          //                                               ),
          //                                               const Text(
          //                                                 '    -',
          //                                                 style: TextStyle(
          //                                                   color: Colors.black,
          //                                                   fontSize: 15,
          //                                                   fontWeight:
          //                                                       FontWeight.bold,
          //                                                 ),
          //                                               ),
          //                                               SizedBox(
          //                                                 width:
          //                                                     size.width * 0.26,
          //                                                 height: size.height *
          //                                                     0.02,
          //                                                 child:
          //                                                     SingleChildScrollView(
          //                                                   scrollDirection:
          //                                                       Axis.horizontal,
          //                                                   child: Text(
          //                                                     '  '
          //                                                     '${post.ageLimit}',
          //                                                     style:
          //                                                         const TextStyle(
          //                                                       color: Colors
          //                                                           .black,
          //                                                       fontSize: 14,
          //                                                     ),
          //                                                   ),
          //                                                 ),
          //                                               ),
          //                                             ],
          //                                           ),
          //                                         ],
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ),

          //                           // Category, Fee, Left Days
          //                           SizedBox(
          //                             width: 350,
          //                             height: size.height * 0.045,
          //                             child: Row(
          //                               children: [
          //                                 SizedBox(width: size.width * 0.05),

          //                                 // Category
          //                                 Container(
          //                                   height: size.height * 0.04,
          //                                   width: size.width * 0.22,
          //                                   decoration: BoxDecoration(
          //                                     border: Border.all(
          //                                         color:
          //                                             const Color(0xff64CCC5),
          //                                         width: 2),
          //                                     borderRadius:
          //                                         const BorderRadius.all(
          //                                       Radius.circular(7.5),
          //                                     ),
          //                                   ),
          //                                   child: Center(
          //                                     child: SingleChildScrollView(
          //                                       scrollDirection:
          //                                           Axis.horizontal,
          //                                       child: Text(
          //                                         post.category,
          //                                         style: const TextStyle(
          //                                             color: Color(0xff435B66),
          //                                             fontSize: 14,
          //                                             fontWeight:
          //                                                 FontWeight.bold),
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ),

          //                                 SizedBox(width: size.width * 0.05),

          //                                 // Fee
          //                                 Container(
          //                                   height: size.height * 0.04,
          //                                   width: size.width * 0.13,
          //                                   decoration: BoxDecoration(
          //                                     border: Border.all(
          //                                         color:
          //                                             const Color(0xff64CCC5),
          //                                         width: 2),
          //                                     borderRadius:
          //                                         const BorderRadius.all(
          //                                       Radius.circular(7.5),
          //                                     ),
          //                                   ),
          //                                   child: Center(
          //                                     child: SingleChildScrollView(
          //                                       scrollDirection:
          //                                           Axis.horizontal,
          //                                       child: Text(
          //                                         post.applicationFee,
          //                                         style: const TextStyle(
          //                                             color: Color(0xff435B66),
          //                                             fontSize: 14,
          //                                             fontWeight:
          //                                                 FontWeight.bold),
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ),

          //                                 SizedBox(width: size.width * 0.05),

          //                                 // Left Days
          //                                 Container(
          //                                   height: size.height * 0.04,
          //                                   width: size.width * 0.26,
          //                                   decoration: BoxDecoration(
          //                                     border: Border.all(
          //                                         color:
          //                                             const Color(0xff64CCC5),
          //                                         width: 2),
          //                                     borderRadius:
          //                                         const BorderRadius.all(
          //                                       Radius.circular(7.5),
          //                                     ),
          //                                   ),
          //                                   child: Center(
          //                                     child: SingleChildScrollView(
          //                                       scrollDirection:
          //                                           Axis.horizontal,
          //                                       child: Text(
          //                                         post.lastDate,
          //                                         style: const TextStyle(
          //                                             color: Color(0xff435B66),
          //                                             fontSize: 14,
          //                                             fontWeight:
          //                                                 FontWeight.bold),
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   );
          //                 },
          //               ),
          //             ),
          //           ],
          //         );
          //       } else if (snapshot.hasError) {
          //         return Center(
          //           child: Text('Error: ${snapshot.error}'),
          //         );
          //       }
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     },
          //   ),
          // ),
