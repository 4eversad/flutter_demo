import 'package:db_demo/models/user_model.dart';
import 'package:db_demo/view/group/childCmps/user_list_item.dart';
import 'package:flutter/material.dart';
import '../../service/request.dart';

class Group extends StatelessWidget {
  const Group({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      appBar: AppBar(title: const Text('好友')),
      body: const Center(child: MyWidget()),
    ));
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<UserModels> userItems = [];
  @override
  void initState() {
    HttpRequest.request('users').then((res) {
      List<UserModels> list = [];
      final result = res.data;
      for (var i in result) {
        list.add(UserModels.fromMap(i));
      }
      setState(() {
        userItems = list;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: userItems.length,
        itemBuilder: (BuildContext context, int index) {
          return UserListItem(userItems[index]);
        });
  }
}
