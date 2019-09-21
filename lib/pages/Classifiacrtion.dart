import 'package:flutter/material.dart';
import 'package:viewer/components/SideDrawer.dart';
import 'package:viewer/utils/ClassificationService.dart';
import 'package:viewer/utils/Entity/ClassificationEntity.dart';


class Classification extends StatefulWidget {
  Classification({Key key}) : super(key: key);

  _ClassificationState createState() => _ClassificationState();
}

class _ClassificationState extends State<Classification> {

  // 田间分类的变量
  final _textKey = GlobalKey<FormFieldState>();
  String classification;

  // 分类列表变量
  List classificationList = [];
  
  //  获取到数据库访问接口
  ClassificationService db = ClassificationService();

  _ClassificationState(){
    getClassification();
  }

  // 更新数据
  void getClassification() async{
    var result = await db.selectClassification();
    setState(() {
      classificationList = [];
      classificationList.addAll(result);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("分类"),
        leading: new IconButton(
            icon: const Icon(Icons.arrow_back, size: 29.0),
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            onPressed: () {
              Navigator.pop(context);
            },
        ),
        actions: <Widget>[
          // 搜索按钮
          IconButton(
            icon: const Icon(Icons.add, size: 29.0),
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return AlertDialog(
                      contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      title: Text('添加新分类'),
                      content:
                        TextFormField(
                          decoration:InputDecoration(
                            labelText: '分组名称',
                          ),
                          key:_textKey,
                          onSaved: (str) {
                            classification = str;//str为文本的内容值
                          },
                          validator: (str){
                            if(validClassification(str)){
                              return "分类名称不能重复";
                            }else{
                              return null;
                            }
                          },
                        ),
                      actions:<Widget>[
                        FlatButton(
                          child: Text('确定'),
                          onPressed: (){
                            if(_textKey.currentState.validate()){
                              // 保存数据
                              _textKey.currentState.save();
                              // 打印数据
                              print(classification);
                              // 新建分类的对象
                              ClassificationEntity classificationEntity = new ClassificationEntity(classificationName:classification);
                              // 进行保存
                              db.saveClassification(classificationEntity);
                              // 更新数据
                              getClassification();
                              // 关闭弹窗
                              Navigator.pop(context);
                            }     
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
                    );
                });
            },
          ),
        ],
      ),
      // 侧边栏菜单
      drawer: SideDrawer(),
      // 列表栏
      body: ListView.builder(
        itemCount: classificationList.length,
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        itemExtent: 50.0,
        itemBuilder: (BuildContext context,int index){
          return ListTile(
              title: Text(classificationList[index].classificationName),
              onLongPress: (){
                showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return AlertDialog(
                      contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      title: Text('请选择操作'),
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
                                      Navigator.pop(context);
                                      getPopDialog(index);
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
                                      db.deleteClassification(classificationList[index].classificationName);
                                      //  更新数据
                                      getClassification();
                                      Navigator.pop(context);
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
        }
      ),
    );
  }


  void getPopDialog(index){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          title: Text('添加新分类'),
          content:
            TextFormField(
              decoration:InputDecoration(
                labelText: '分组名称',
              ),
              initialValue: classificationList[index].classificationName,
              key:_textKey,
              onSaved: (str) {
                classification = str;//str为文本的内容值
              },
              validator: (str){
                if(validClassification(str)){
                  return "分类名称不能重复";
                }else{
                  return null;
                }
              },
            ),
          actions:<Widget>[
            FlatButton(
              child: Text('确定'),
              onPressed: (){
                if(_textKey.currentState.validate()){
                  // 保存数据
                  _textKey.currentState.save();
                  // 打印数据
                  print(classification);
                  // 新建分类的对象
                  print(index);
                  ClassificationEntity classificationEntity = classificationList[index];
                  classificationEntity.classificationName = classification;
                  // 进行保存
                  db.updateClassification(classificationEntity);
                  // 更新数据
                  getClassification();
                  // 关闭弹窗
                  Navigator.pop(context);
                }
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
        );
      }
    );
  }

  // 验证名称是否合法不重复
  bool validClassification(String str){
    for(var i=0;i<classificationList.length;i++){
      if(classificationList[i].classificationName == str){
        return true;
      }
    }
    return false;
  }

}
