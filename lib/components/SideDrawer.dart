import 'package:flutter/material.dart';


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