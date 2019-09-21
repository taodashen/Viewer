import 'package:flutter/material.dart';
import 'package:viewer/components/SideDrawer.dart';


class ClassificationDetail extends StatefulWidget {
  ClassificationDetail({Key key}) : super(key: key);

  _ClassificationDetailState createState() => _ClassificationDetailState();
}

class _ClassificationDetailState extends State<ClassificationDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("添加新分类"),
        leading: new IconButton(
            icon: const Icon(Icons.arrow_back, size: 29.0),
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            onPressed: () {
              Navigator.pop(context);
            },
        ),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.check, size: 29.0),
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      // 侧边栏菜单
      drawer: SideDrawer(),
      // 列表栏
      body: AlertDialog(
            contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            title: Text('添加新分类'),
            content:TextFormField(
                  decoration: InputDecoration(
                    labelText: '分组名称',
                  ),
                ),
            actions:<Widget>[
              FlatButton(
                child: Text('确定'),
                onPressed: (){
                  Navigator.of(context).pop();


                },
              ),
              FlatButton(
                child: Text('取消'),
                onPressed: (){
                  Navigator.of(context).pop();

                },
              ),
            ],
            backgroundColor:Colors.white,
            elevation: 20,
            // 设置成圆角
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
    }
}
