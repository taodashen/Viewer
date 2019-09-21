import 'package:flutter/material.dart';

import 'Viewer.dart';



class Items extends StatefulWidget{

  final Map arguments;

  Items({Key key, this.arguments}):super(key:key);

  _ItemsState createState()=>_ItemsState(arguments: this.arguments);
}

class _ItemsState extends State<Items>{

  Map arguments;

  _ItemsState({this.arguments});

  // 用于收藏按钮变色的变量 
  int favorIndex = 0;
  Color favorColor = Colors.white;
  IconData favorIcon = Icons.favorite_border;


  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("漫画名称"),
          leading: new IconButton(
              icon: const Icon(Icons.arrow_back, size: 29.0),
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              onPressed: () {
                Navigator.pop(context);
              },
          ),
        ),
        
        // 列表栏
        body: ItemLayout(arguments:arguments),

        // 底部菜单栏
        floatingActionButton: new Builder(builder: (BuildContext context) {
        return FloatingActionButton(
          child: const Icon(Icons.local_library),
          tooltip: "更多",
          heroTag: null,
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          elevation: 7.0,
          highlightElevation: 14.0,
          onPressed: (){
            
          },
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // 底部菜单栏主页，收藏按钮
      bottomNavigationBar: BottomAppBar(
        //底部工具栏
        color: Colors.blue,
        //圆形缺口
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment:MainAxisAlignment.spaceAround ,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: (){
                // 跳转到根路径
                Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (context)=>new Viewer()),
                  (route) => route == null);
              },
            ),
            IconButton(
              icon: Icon(favorIcon),
              color: favorColor,
              onPressed: (){
                if(favorIndex == 0){
                  setState(() {
                    favorIndex = 1;
                    favorColor = Colors.red; 
                    favorIcon = Icons.favorite;
                  });
                }else{
                  setState(() {
                    favorIndex = 0;
                    favorColor = Colors.white; 
                    favorIcon = Icons.favorite_border;
                  });
                }
                
              },
            ),
          ],
        ),
      ),
    );
  }
}



class ItemLayout extends StatefulWidget {

final Map arguments;

  ItemLayout({Key key, this.arguments}) : super(key: key);

  _ItemLayoutState createState() => _ItemLayoutState(arguments:this.arguments);
}

// 漫画详细页面的布局框架
class _ItemLayoutState extends State<ItemLayout> {

  Map arguments;

  _ItemLayoutState({this.arguments});
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        
        getFirst(),
        
        Divider(height: 1.0, thickness: 1.0,),
        getSecond(),
        Divider(height: 1.0, thickness: 1.0,),

        getThird(),
        
    ],
    );
  }

  // 展示漫画的详细信息
  Container getFirst(){
    return Container(
      child: Row(
        children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(5.0, 5.0, 0, 10.0),
              child: Image.network(
              "${arguments["coverSrc"]}",
              fit: BoxFit.fill),
              height: 120.0,
              width: 100.0,
              ),
            Container(
              margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Text("这是用于测试的第一篇漫画"),
                  Text("这是用于测试的第一篇漫画")
                ],
              ),
            )
          ],
        )
    );
    
  }


  // 用于正倒序显示的按钮变量
  int itemIndex = 0;
  Color item0Color = Colors.blue;
  Color item1Color = Colors.black;

  // 展示正序倒序展示的图标
  Container getSecond(){
    return  Container(
            margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
            padding: const EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                  Expanded(child:Text("全部章节", style: TextStyle(fontSize: 17))),

                  // 正序按钮容器
                  Container(
                    width: 50,
                    margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    padding: const EdgeInsets.all(0.0),
                    child:FlatButton(
                      textColor: item0Color,
                      child: Text("正序", style: TextStyle(fontSize: 17)),
                      padding: const EdgeInsets.all(0.0),
                      onPressed: (){
                        if(itemIndex == 1){
                          setState(() {
                            itemIndex = 0;
                            item0Color = Colors.blue;
                            item1Color = Colors.black;
                          });
                        }
                      })),
                  
                  //  倒序按钮容器
                  Container(
                    width: 50,
                    margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    padding: const EdgeInsets.all(0.0),
                    child:FlatButton(
                      textColor: item1Color,
                      child: Text("倒序", style: TextStyle(fontSize: 17)),
                      padding: const EdgeInsets.all(0.0),
                      onPressed: (){
                        if(itemIndex == 0){
                          setState(() {
                            itemIndex = 1;
                            item1Color = Colors.blue;
                            item0Color = Colors.black;
                          });
                        }
                      })),
              ],
            ),
          );
  }

  // 展示漫画目录的组件 
  Container getThird(){
    return Container(
            padding: const EdgeInsets.all(0.0),
            margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            child: GridView.builder(
              itemCount: 30,
              shrinkWrap:true,
              physics: new NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10.0,
                crossAxisCount: 4,
                mainAxisSpacing: 10.0,
                childAspectRatio: 5 / 2.3,),
              padding: const EdgeInsets.fromLTRB(2.0, 2.5, 0.0, 2.5),
              itemBuilder: (BuildContext context, int index) {   
                return AspectRatio(
                  aspectRatio: 2/1,
                  child:RaisedButton(
                    textColor: Colors.black,
                    child:Text("第$index章,zjflg", style:TextStyle(fontSize: 15), maxLines: 1, overflow: TextOverflow.ellipsis),
                    onPressed: (){

                    },
                    )
                  );
                }
              ),
          );
  }
}
