import 'package:db_demo/components/tabbar_item.dart';
import 'package:db_demo/view/group/index.dart';
import 'package:db_demo/view/home/index.dart';
import 'package:db_demo/view/mall/index.dart';
import 'package:db_demo/view/profile/index.dart';
import 'package:db_demo/view/subject/index.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣',
      theme: ThemeData(
          highlightColor: Colors.transparent, // 去掉高亮的颜色
          splashColor: Colors.transparent, // 去掉水波纹效果
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 235, 234, 234),
            primary: const Color.fromARGB(255, 58, 168, 76), // 设置主题色
          )),
      home: const MyStackPage(),
    );
  }
}

class MyStackPage extends StatefulWidget {
  const MyStackPage({super.key});

  @override
  State<MyStackPage> createState() => _MyStackPageState();
}

class _MyStackPageState extends State<MyStackPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            Home(Colors.pink),
            Subject(),
            Group(),
            Mall(),
            Profile(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 14, // 未选中时的字体大小
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed, // 导航的Item超过三个无法正常显示,需要加上这个
          items: [
            TabbarItem('首页', 'home', iconSize: 30),
            TabbarItem('书影音', 'subject', iconSize: 30),
            TabbarItem('好友', 'group', iconSize: 30),
            TabbarItem('市集', 'mall', iconSize: 30),
            TabbarItem('我的', 'profile', iconSize: 30),
          ],
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}

BottomNavigationBarItem createTabbarItem(String itemName, String iconName,
    {double iconSize = 30}) {
  return BottomNavigationBarItem(
    label: itemName,
    icon: Image.asset(
      'assets/images/tabbar/$iconName.png',
      width: iconSize,
      height: iconSize,
    ),
    activeIcon: Image.asset(
      'assets/images/tabbar/${iconName}_active.png',
      width: iconSize,
      height: iconSize,
    ),
  );
}
