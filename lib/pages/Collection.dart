import 'package:flutter/material.dart';
import 'package:viewer/components/generalComponents.dart';


final urls = [
"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2728308419,1784858068&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987907653,720009510&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987907653,720009510&fm=26&gp=0.jpg",
  "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4186486800,813755701&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=123807196,3598291508&fm=26&gp=0.jpg",
];


class Collection extends StatefulWidget {
  Collection({Key key}) : super(key: key);

  _CollectionState createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收藏"),
        leading: new IconButton(
            icon: const Icon(Icons.arrow_back, size: 29.0),
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            onPressed: () {
              Navigator.pop(context);
            },
        ),
        actions: <Widget>[
          // 更多按钮
          new IconButton(
            icon: const Icon(Icons.more_vert, size: 29.0),
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            onPressed: () async {
              // final result = 
              final result = await showMenu(
                context: context,
                position: RelativeRect.fromLTRB(100.0, 80.0, 0, 0),
                items: <PopupMenuItem<String>>[
                  new PopupMenuItem<String>(value: '多选', child: new Text('多选')),
                  new PopupMenuItem<String>(value: '删除', child: new Text('删除')),
                  new PopupMenuItem<String>(value: '3', child: new Text('Item Three')),
                  new PopupMenuItem<String>(value: '4', child: new Text('I am Item Four'))
                ]
              );
              // 处理点击事件
              print(result);
            },
          ),
        ],
      ),
      // 列表栏
      body: getListWidget(),
    );
  }

  // 显示列表的Widget
  static Widget getListWidget(){
    return ListView.builder(
      itemCount: urls.length,
      itemBuilder: (BuildContext context, int index) {
        // return ListMenuItem(src:urls[index]);
        return General.getListItemWidget(context, urls[index]);
      }
      );
  }

}
