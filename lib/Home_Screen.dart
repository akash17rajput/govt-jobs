// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:govt_job_app/Api/api_service.dart';


import 'Api/modelClass.dart';
import 'ViewJob.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with TickerProviderStateMixin {
  late Future<List<Post>> _futurePosts;
  AnimationController? _controller;

  late AnimationController _Animcontroller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _futurePosts = ApiService.fetchData();
    _Animcontroller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation =
        CurvedAnimation(parent: _Animcontroller, curve: Curves.easeOut);
    _Animcontroller.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    _Animcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              Stack(children: [
                Container(
                  height: size.height / 3,
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurStyle: BlurStyle.outer,
                          color: Colors.black,
                          blurRadius: 15,
                        )
                      ],
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(80))),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: ScaleTransition(
                              scale: _animation,
                              child: Text(
                                "JobTree",
                                style: TextStyle(
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: const CircleAvatar(
                                backgroundImage: AssetImage('assets/user.png')),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ScaleTransition(
                          scale: _animation,
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search),
                                contentPadding: const EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                hintText: 'search here...',
                                filled: true),
                          ),
                        ),
                      ),
                      ScaleTransition(
                        scale: _animation,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            "JobTree is the #1 destination to find\n    and list incredible remote jobs.",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: GoogleFonts.lato().fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              RefreshIndicator(
                onRefresh: () => _futurePosts,
                child: FutureBuilder<List<Post>>(
                    future: _futurePosts,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final posts = snapshot.data!;
                        return Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: posts.length,
                            itemBuilder: (context, index) {
                              final post = posts[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                child: ScaleTransition(
                                  scale: _animation,
                                  child: Container(
                                    height: size.height * .14,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        // image: DecorationImage(
                                        //     image: AssetImage('assets/bg2.png'),
                                        //     fit: BoxFit.fill,
                                        //     opacity: 200),
                                        boxShadow: const <BoxShadow>[
                                          BoxShadow(
                                              blurRadius: 4,
                                              color: Colors.grey,
                                              blurStyle: BlurStyle.outer)
                                        ],
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 2),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              top: Radius
                                                                  .circular(
                                                                      16))),
                                                  isScrollControlled: true,
                                                  context: context,
                                                  builder: (context) => ViewJob(
                                                        post: post.postName,
                                                      ));
                                            },
                                            child: SizedBox(
                                              height: 100,
                                              width: size.width,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/google.png',
                                                        scale:
                                                            size.height * .06,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Text(
                                                          post.postName,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(vertical: 0),
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.business,
                                                          color: Colors.grey,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: Text(
                                                            post.company,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.place,
                                                            color: Colors
                                                                .deepPurple,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10),
                                                            child: Text(
                                                                post.location),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            post.salary,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black54),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      }
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: size.height / 3.5),
                          child: const LinearProgressIndicator(),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}




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
