import 'package:flutter/material.dart';
import '../../service/request.dart';

class Home extends StatelessWidget {
  final Color bgColors;
  const Home(this.bgColors, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
        backgroundColor: bgColors,
      ),
      body: MyWidget(),
    ));
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    HttpRequest.request('users').then((res) {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
