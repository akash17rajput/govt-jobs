// ignore_for_file: no_logic_in_create_state, must_be_immutable, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:govt_job_app/Api/api_service.dart';

import 'Api/modelClass.dart';

class MyMessages extends StatefulWidget {
  String post = '';
  MyMessages({super.key, required this.post});

  @override
  State<MyMessages> createState() => _MyMessagesState(
        post: post,
      );
}

class _MyMessagesState extends State<MyMessages> {
  String post = '';

  late Future<List<Post>> _futurePosts;
  _MyMessagesState({required this.post});
  dynamic data = {};

  @override
  void initState() {
    super.initState();
    _futurePosts = ApiService.fetchData();
    _futurePosts.then((value) => {
          // print(value),
          data = value.firstWhere((element) => element.postName == post),
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Messages',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.edit_note,
                        size: 30,
                        color: Colors.deepPurple,
                      )
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'search a chat or message',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      prefixIcon: Icon(CupertinoIcons.search)),
                ),
              ),
              const Row(
                children: [
                  Text(
                    'Companies',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext, int) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/google.png',
                                scale: size.height * .03,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'PostName',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: size.height / 4),
                                          child: Text(
                                            '11:45 am',
                                            style: TextStyle(
                                                color: Colors.grey.shade500,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                        'Are you available for an intervi......')
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
