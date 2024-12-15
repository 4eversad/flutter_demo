import 'package:db_demo/models/user_model.dart';
import 'package:db_demo/view/group/childCmps/line.dart';
import 'package:db_demo/view/group/childCmps/star.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserListItem extends StatefulWidget {
  final UserModels userItem;
  const UserListItem(this.userItem, {super.key});

  @override
  State<UserListItem> createState() => _UserListItemState();
}

class _UserListItemState extends State<UserListItem> {
  final GlobalKey rowkey = GlobalKey();
  double rowHeight = 0;

  @override
  Widget build(BuildContext context) {
    void getSize(BuildContext context) {
      RenderBox? renderBox =
          rowkey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        rowHeight = renderBox.size.height;
      } else {
        print('找不到元素');
      }
    }

    void scheduleGetSize(BuildContext context) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        getSize(context);
      });
    }

    scheduleGetSize(context);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 10, color: Color.fromARGB(236, 216, 216, 216)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getIdWidget(),
          const SizedBox(height: 12),
          getUserWidget(),
          const SizedBox(height: 12),
          getPhoneWidget(),
        ],
      ),
    );
  }

  // 获取id的Widget
  Widget getIdWidget() {
    return Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 239, 187),
            borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.fromLTRB(9, 4, 9, 4),
        child: Text(
          'id: ${widget.userItem.id}',
          style: const TextStyle(
              color: Color.fromARGB(255, 131, 95, 36), fontSize: 18),
        ));
  }

//获取内容Widget
  Widget getUserWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: Image.network(
            'https://p1.meituan.net/imgupload/81345505c2f4dbe98deea4821b0524fd141912.webp%40_100q%7Cwatermark%3D0%7Cformat%3Djpeg',
            width: 80,
          ),
        ),
        getDetilContentWidget(),
        LineWidget(
          Axis.vertical,
          dashHeight: 4,
          height: rowHeight,
          count: 10,
          color: const Color.fromARGB(255, 143, 142, 142),
        ),
        getWishWidget()
      ],
    );
  }

// 获取中间主要内容的Widget
  Widget getDetilContentWidget() {
    return Expanded(
        key: rowkey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('用户名: ${widget.userItem.social?.username}'),
              const Row(
                children: [
                  Text('热度: '),
                  StarWidget(
                    starCount: 5,
                    rate: 5,
                    maxRate: 10,
                    starSize: 20,
                  )
                ],
              ),
              Text('邮箱: ${widget.userItem.social?.email}'),
            ],
          ),
        ));
  }

// 获取想看Widget
  Widget getWishWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Image.asset(
            'assets/images/home/wish.png',
            width: 36,
          ),
          const Text(
            '关注',
            style: TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 235, 170, 60)),
          ),
        ],
      ),
    );
  }

// 获取最下面的电话的Widget
  Widget getPhoneWidget() {
    var addressMap = widget.userItem.social?.address ?? {};
    String address =
        '${addressMap['street']} ${addressMap['suite']} ${addressMap['city']}}';

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
          width: constraints.maxWidth,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 241, 241, 241),
              borderRadius: BorderRadius.circular(4)),
          padding: const EdgeInsets.all(12),
          child: Text(
            'address: $address',
            style: const TextStyle(
                color: Color.fromARGB(255, 81, 81, 81), fontSize: 14),
          ));
    });
  }
}
