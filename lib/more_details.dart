// ignore_for_file: no_logic_in_create_state, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'Api/api_service.dart';
import 'Api/modelClass.dart';

class MoreDetails extends StatefulWidget {
  String post = '';
  MoreDetails({
    super.key,
    required this.post,
  });

  @override
  State<MoreDetails> createState() => _MoreDetailsState(post: post);
}

class _MoreDetailsState extends State<MoreDetails>
    with TickerProviderStateMixin {
  String post = '';
  AnimationController? _controller;

  dynamic data = {};
  bool _loading = true;
  _MoreDetailsState({required this.post});
  late Future<List<Post>> _futurePosts;

  late AnimationController _Animcontroller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _futurePosts = ApiService.fetchData();
    _futurePosts.then((value) => {
          data = value.firstWhere((element) => element.postName == post),
          setState(() {
            _loading = false;
          })
        });

    _Animcontroller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animation =
        CurvedAnimation(parent: _Animcontroller, curve: Curves.easeOut);
    _Animcontroller.forward();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    _controller!.repeat(reverse: true);
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
      body: Stack(children: [
        _loading
            ? Shimmer(
                direction: const ShimmerDirection.fromLTRB(),
                duration: const Duration(seconds: 1),
                color: Colors.black,
                child: Container(
                  height: size.height / 3,
                  width: size.width,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(80))),
                ),
              )
            : Column(
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
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(80))),
                    ),
                    Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: size.height * .08),
                            child: Container(
                              height: 90,
                              width: 90,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/google.png'),
                                      scale: 18),
                                  shape: BoxShape.circle,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Text(
                          data.postName,
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ]),
                ],
              ),
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
                      color: Color.fromARGB(255, 236, 233, 233), blurRadius: 8)
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
                          child: ScaleTransition(
                            scale: _animation,
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
                                    fontFamily: GoogleFonts.roboto().fontFamily,
                                    fontWeight: FontWeight.w700),
                              )),
                            ),
                          ),
                        )),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
