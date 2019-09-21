import 'package:flutter/material.dart';
import 'package:viewer/components/SideDrawer.dart';


class RuleDetail extends StatefulWidget {
  RuleDetail({Key key}) : super(key: key);

  _RuleDetailState createState() => _RuleDetailState();
}

class _RuleDetailState extends State<RuleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("添加新站点"),
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
        body: getRuleDetailWidget(),

      );
  }

  Widget getRuleDetailWidget(){
    return ListView(children: _getEditpage());
  }


  List<Widget> _getEditpage(){
    List<Widget> ruleEdit = new List<Widget>();
    ruleEdit.add(
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(0.0),
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.centerLeft,
                    child:Text("- 通用",style:TextStyle(color: Colors.blue,fontSize: 20))
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '站点名称',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '站点分类',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '首页URL',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '搜索URL',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '登录URL',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Cookie',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '分类',
                    ),
                  ),

                  // 首页规则
                  Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 10, 0, 0),
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.centerLeft,
                    child:Text("- 首页规则",style:TextStyle(color: Colors.blue,fontSize: 20))
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Item',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Item URL',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '标题',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '作者',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '封面',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '简介',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '上传时间',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '评分',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '类别',
                    ),
                  ),
                  
                  // 搜索规则
                  Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 10, 0, 0),
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.centerLeft,
                    child:Text("- 搜索规则",style:TextStyle(color: Colors.blue,fontSize: 20))
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Item',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Item URL',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '标题',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '作者',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '封面',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '简介',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '上传时间',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '评分',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '类别',
                    ),
                  ),

                  // 目录规则
                  Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 10, 0, 0),
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.centerLeft,
                    child:Text("- 目录规则",style:TextStyle(color: Colors.blue,fontSize: 20))
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Item',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Item URL',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '标题',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '作者',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '封面',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '简介',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '上传时间',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '评分',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '类别',
                    ),
                  ),

                  // 图片规则
                  Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 10, 0, 0),
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.centerLeft,
                    child:Text("- 图片规则",style:TextStyle(color: Colors.blue,fontSize: 20))
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Item',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Item URL',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '标题',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '作者',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '封面',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '简介',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '上传时间',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '评分',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '类别',
                    ),
                  ),


                ],
              ),
            )
          ],
        )
      ));
    
    return ruleEdit;
  }

  // String selectType;

  // Widget _getMark(){

  //   return 
  //     Container(
  //       decoration: BoxDecoration(
  //           border:Border(bottom:BorderSide(width: 1,color: Color(0xffe5e5e5)) )
  //       ),
  //       width: 500,
  //       child: DropdownButtonHideUnderline(
  //           child: new DropdownButton(
  //             items: [
  //               new DropdownMenuItem(
  //                 child: Text('同意'),
  //                 value: '同意',
  //               ),
  //               new DropdownMenuItem(
  //                 child: Text('拒绝'),
  //                 value: '拒绝',
  //               ),
  //             ],
  //             hint: new Text('站点分类'),
  //             onChanged: (value){
  //               setState(() {
  //                 selectType = value;
  //               });
  //             },
  //             value: selectType,
  //             elevation: 24,//设置阴影的高度
  //             style: new TextStyle(
  //               //设置文本框里面文字的样式
  //               color: Color(0xff4a4a4a),
  //               fontSize: 16,
  //             ),
  //             iconSize: 30.0,
  //           )
  //       )
  //   );
  // }


}
