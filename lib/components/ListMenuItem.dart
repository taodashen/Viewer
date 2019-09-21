
// // 主页显示的Item----List列表展示
// import 'package:flutter/material.dart';


// /*
//  * 列表展示组件
//  * @author: 周韬
//  * @date: 2019-9-20
//  */

// class ListMenuItem extends StatefulWidget{
//   // 图片地址
//   final src;

//   ListMenuItem({Key key, this.src=""}):super(key : key);

//   _ListMenuItemState createState() => _ListMenuItemState(this.src);

// }

// class _ListMenuItemState extends State<ListMenuItem>{

//   String src;

//   _ListMenuItemState(src){
//     this.src = src;
//   }

//   @override
//   Widget build(BuildContext context){
//     if(this.src==""){
//       return null;
//     }
//     return  ListTile(onTap: (){
//               Navigator.pushNamed(context, "/Items", arguments: {
//                 "coverSrc":this.src,
//               });
//             },
//             contentPadding: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
//             subtitle:Container(
//               child: Row(
//                 children: <Widget>[
//                   Container(
//                     margin: const EdgeInsets.fromLTRB(5.0, 5.0, 0, 10.0),
//                     child: Image.network(
//                     this.src,
//                     fit: BoxFit.fill),
//                     height: 120.0,
//                     width: 100.0,
//                     ),
//                   Container(
//                     margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
//                     alignment: Alignment.topLeft,
//                     child: Column(
//                       children: <Widget>[
//                         Text("这是用于测试的第一篇漫画"),
//                         Text("这是用于测试的第一篇漫画")
//                       ],
//                     ),
//                   )
//                 ],
//               )
//           )
//     );
//   }
// }