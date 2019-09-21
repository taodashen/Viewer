
// import 'package:flutter/material.dart';


// /*
//  * 网格展示组件
//  * @author: 周韬
//  * @date: 2019-9-20
//  */


// // 主页显示的Item----Grid网格展示
// class GridMenuItem extends StatefulWidget{
//   // 图片地址
//   final src;

//   GridMenuItem({Key key, this.src=""}):super(key : key);

//   _GridMenuItemState createState() => _GridMenuItemState(this.src);

// }

// class _GridMenuItemState extends State<GridMenuItem>{

//   String src;

//   _GridMenuItemState(src){
//     this.src = src;
//   }

//   @override
//   Widget build(BuildContext context){
//     if(this.src==""){
//       return null;
//     }
//     return ListTile(onTap: (){
//               Navigator.pushNamed(context, "/Items");
//             },
//             contentPadding: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
//             subtitle:new Card(
//               child: Column(children: <Widget>[
//                   Expanded(
//                     child: Image.network(
//                       "${this.src}",
//                        fit: BoxFit.fill)
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(2.0),
//                     child: Text("zhoutaozhotuaozhotuaowtrwtwtr",
//                     style: TextStyle(fontSize: 15), textAlign: TextAlign.left, maxLines: 1, overflow: TextOverflow.ellipsis),
//                   )
//                 ],
//                 ),
//               )
//             );
//   }
// }
