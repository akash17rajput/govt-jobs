// ignore_for_file: no_logic_in_create_state, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Api/api_service.dart';
import 'Api/modelClass.dart';

class ViewJob extends StatefulWidget {
  String post = '';

  ViewJob({
    super.key,
    required this.post,
  });

  @override
  State<ViewJob> createState() => _ViewJobState(
        post: post,
      );
}

class _ViewJobState extends State<ViewJob> {
  String post = '';

  _ViewJobState({required this.post});
  late Future<List<Post>> _futurePosts;
  dynamic data = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    _futurePosts = ApiService.fetchData();
    _futurePosts.then((value) => {
          print(value.length),
          data = value.firstWhere((element) => element.postName == post),
          setState(() {
            _loading = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Stack(clipBehavior: Clip.none, children: [
        Positioned(
          top: -60,
          right: 12,
          child: FloatingActionButton.small(
              backgroundColor: Colors.white,
              clipBehavior: Clip.antiAlias,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.close,
                color: Colors.black,
              )),
        ),
        Container(
          height: size.height * 0.88,
          decoration: const BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: _loading
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: CircularProgressIndicator(),
                      ))
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          data.postName,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            fontFamily:
                                                GoogleFonts.lato().fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.place,
                                        color: Colors.deepPurple,
                                      ),
                                      const Text('Location :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                      Text(data.location)
                                    ],
                                  )
                                ],
                              ),
                              Image.asset(
                                'assets/google.png',
                                scale: size.height * .025,
                              )
                            ],
                          ),
                        ],
                      ),
              ),
              const Divider(
                thickness: 1,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Requirement :-',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  " - Master's degree in Design, Computer Science, Computer Interaction, or a related field.\n-  years of relevant industry experience.\n- Ability to lead and ideate products from scratch and improve features, all with a user-centered design process.\n-  Skills in communicating and influencing product design strategy.\n- Excellent problem-solving skills and familiarity with   technical constraints and limitations.\n- Experience designing across multiple platform.\n- Portfolio highlighting multiple projects.",
                  style: TextStyle(
                    fontFamily: GoogleFonts.lato().fontFamily,
                  ),
                ),
              )),

              //
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 100,
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 236, 233, 233),
                            blurRadius: 8)
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Container(
                                  height: 50,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Apply Now',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily:
                                            GoogleFonts.roboto().fontFamily,
                                        fontWeight: FontWeight.w700),
                                  )),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
