import 'package:flutter/material.dart';
import 'package:viewer/components/generalComponents.dart';
import 'package:viewer/routes/Routes.dart' as prefix_route;


final List<String> urls = [
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2728308419,1784858068&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987907653,720009510&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987907653,720009510&fm=26&gp=0.jpg",
  "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4186486800,813755701&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=123807196,3598291508&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1629766254,893572877&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2728308419,1784858068&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987907653,720009510&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987907653,720009510&fm=26&gp=0.jpg",
  "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4186486800,813755701&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=123807196,3598291508&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1629766254,893572877&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2728308419,1784858068&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987907653,720009510&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987907653,720009510&fm=26&gp=0.jpg",
  "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4186486800,813755701&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=123807196,3598291508&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1629766254,893572877&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2728308419,1784858068&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987907653,720009510&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987907653,720009510&fm=26&gp=0.jpg",
  "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4186486800,813755701&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=123807196,3598291508&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1629766254,893572877&fm=26&gp=0.jpg",
];

class Viewer extends StatefulWidget{

  Viewer({Key key}):super(key:key);
  _ViewerState createState()=>_ViewerState();
}

class _ViewerState extends State<Viewer>{

  // 更改显示布局的变量, 默认：0表示列表展示 
  int menuIndex = 0;
  Widget menuItem = getListWidget();

  _ViewerState();

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:"Viewer",
      // 路由传参必须注释，否则无法成功传递
      // routes: prefix_route.routes,
      onGenerateRoute: prefix_route.onGenerateRoute,
      home: Scaffold(
        appBar: AppBar(
          // topbar的菜单按钮
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, size: 29.0),
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          // topbar的搜索按钮
          actions: <Widget>[
            // 搜索按钮
            new IconButton(
              icon: const Icon(Icons.search, size: 29.0),
              padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
              onPressed: () {
                
              },
            ),
            // 主页显示模式按钮
            new IconButton(
              icon: const Icon(Icons.widgets, size: 24.0),
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              onPressed: () {
                if(menuIndex == 0){
                  setState(() {
                    menuIndex = 1;
                    menuItem = getGridWidget();
                  });
                  print("You have change view mode from List to Grid");
                }else{
                  setState(() {
                    menuIndex = 0;
                    menuItem = getListWidget();
                  });
                  print("You have change view mode from Grid to List");
                }
              },
            ),
          ],
        ),
        // 侧边栏菜单
        drawer: SideDrawer(),
        // 列表栏
        body: menuItem
        )
      );
  }

  /*
   * 生成Grid网格显示的Widget
   * @author:周韬
   * @date:2019-9-20
   */
  static Widget getGridWidget(){
    return GridView.builder(
          // Item的数量
          itemCount: urls.length,
          // 样式
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // 左右间距
            crossAxisSpacing: 2.5,
            //  每列显示
            crossAxisCount: 2),
          // 设置padding
          padding: const EdgeInsets.fromLTRB(2.0, 5.0, 0.0, 0.0),
          // 循环生成Items
          itemBuilder: (BuildContext context, int index) {
            // return GridMenuItem(src:urls[index]);
            return General.getGridItemWidget(context, urls[index]);
          }
        );
  }

  /*
   * 显示列表的Widget
   * @author:周韬
   * @date:2019-9-20
   */ 
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

/*
  * 左侧的抽屉函数
  * @author:周韬
  * @date:2019-9-20
  */ 
class SideDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
          child: Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  Expanded(
                    child: DrawerHeader(
                      child: new Text(""),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/tabbg.jpg"),
                          fit: BoxFit.fill,
                        )
                      ),
                    ),
                  ),
                ]
              ),
              ListTile(
                title: Text("站点"),
                leading: CircleAvatar(
                  child: Icon(Icons.folder, size: 25, color: Colors.black),
                  backgroundColor: Colors.white,
                ),
                selected: false,
                onTap: (){
                  Navigator.pushNamed(context, "/rule");
                },
              ),
              ListTile(
                title: Text("分类"),
                leading: CircleAvatar(
                  child: Icon(Icons.folder, size: 25, color: Colors.black),
                  backgroundColor: Colors.white,
                ),
                selected: false,
                onTap: (){
                  Navigator.pushNamed(context, "/classification");
                },
              ),
              ListTile(
                title: Text("收藏"),
                leading: CircleAvatar(
                  child: Icon(Icons.folder, size: 25, color: Colors.black),
                  backgroundColor: Colors.white,
                ),
                selected: false,
                onTap: (){
                  Navigator.pushNamed(context, "/collection");
                },
              ),
              ListTile(
                title: Text("下载"),
                leading: CircleAvatar(
                  child: Icon(Icons.file_download, size: 25, color: Colors.black),
                  backgroundColor: Colors.white,
                ),
                selected: false,
                onTap: (){
                  
                },
              ),
              ListTile(
                title: Text("设置"),
                leading: CircleAvatar(
                  child: Icon(Icons.settings, size: 25, color: Colors.black),
                  backgroundColor: Colors.white,
                ),
                selected: false,
                onTap: (){},
              ),
              ListTile(
                title: Text("关于"),
                leading: CircleAvatar(
                  child: Icon(Icons.info_outline, size: 25, color: Colors.black),
                  backgroundColor: Colors.white,
                ),
                selected: false,
                onTap: (){},
              ),
            ]
          )
    );
  }
}