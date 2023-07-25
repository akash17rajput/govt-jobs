// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:govt_job_app/Home_Screen.dart';
import 'package:govt_job_app/settings.dart';
import 'package:http/http.dart';

import 'Api/api_service.dart';
import 'Api/modelClass.dart';
import 'message.dart';

class MyBottomSheet extends StatefulWidget {
  String post = '';
  MyBottomSheet({super.key, required this.post});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState(
        post: post,
      );
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  String post = '';

  _MyBottomSheetState({required this.post});
  late Future<List<Post>> _futurePosts;
  int _selectedIndex = 0;

  dynamic data = {};
  final List<Widget> _pages = <Widget>[
    const MyHome(),
    MyMessages(
      post: '',
    ),
    const Notifications(),
  ];

  @override
  void initState() {
    _futurePosts = ApiService.fetchData();
    _futurePosts.then((value) => {
          print(value.length),
          data = value.firstWhere((element) => element.postName == post),
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: 'message'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'notification '),
          ],
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
        body: _pages.elementAt(_selectedIndex));
  }
}
