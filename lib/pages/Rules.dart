import 'package:flutter/material.dart';

import 'Viewer.dart';

class Rules extends StatefulWidget {
  Rules({Key key}) : super(key: key);

  _RulesState createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("站点"),
          leading: new IconButton(
              icon: const Icon(Icons.arrow_back, size: 29.0),
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              onPressed: () {
                Navigator.pop(context);
              },
          ),
          actions: <Widget>[
            // 添加站点按钮
            new IconButton(
              icon: const Icon(Icons.add, size: 29.0),
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              onPressed: () {
                Navigator.pushNamed(context, "/rule/ruleDetail");
              },
            ),
          ],
        ),
        // 侧边栏菜单
        // drawer: SideDrawer(),
        // 列表栏
        body: ListView.builder(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        itemExtent: 50.0,
        itemBuilder: (BuildContext context,int index){
          return ListTile(
              title: Text("站点规则$index"),
              onTap: (){
                // 跳转到根路径
                Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (context)=>new Viewer()),
                  (route) => route == null);
              },
              onLongPress: (){
                print("站点规则$index");
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                        title: Text('站点规则$index'),
                        content: 
                          Container(
                            margin: const EdgeInsets.fromLTRB(0.0, 10, 0, 0),
                            height: 120,
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: FlatButton (
                                      child: Text(
                                        "编辑                                                                ",
                                        style: TextStyle(fontSize: 16),
                                        textAlign: TextAlign.left
                                        ),
                                      onPressed: (){
                                        Navigator.pushNamed(context, "/rule/ruleDetail");
                                      },
                                    ),
                                  ),
                                ]
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child:FlatButton (
                                      child: Text(
                                        "删除                                                                ", 
                                        style: TextStyle(fontSize: 16), 
                                        textAlign: TextAlign.left
                                        ),
                                      onPressed: (){

                                      },
                                    )
                                  )
                                ]
                              ),
                            ],
                          ),
                        ),
                        backgroundColor:Colors.white,
                        elevation: 20,
                        // 设置成圆角
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      );
                  });
              },
            );
        }),
      );
  }
}
