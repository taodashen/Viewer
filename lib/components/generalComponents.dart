

import 'package:flutter/material.dart';

class General{

/*
 * 列表展示组件
 * @author: 周韬
 * @date: 2019-9-20
 */
  static Widget getListItemWidget(context, src){
    if(src==""){
      return null;
    }
    return  ListTile(
            onTap: (){
              Navigator.pushNamed(context, "/Items", arguments: {
                "coverSrc":src,
              });
            },
            contentPadding: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
            subtitle:Container(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(5.0, 5.0, 0, 10.0),
                    child: Image.network(src,
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
          )
    );
  }


  static Widget getGridItemWidget(context, src){
    if(src==""){
      return null;
    }
    return 
      ListTile(
        onTap: (){
          Navigator.pushNamed(context, "/Items", arguments: {
            "coverSrc":src,
          });
      },
      contentPadding: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
      subtitle:new Card(
        child: Column(children: <Widget>[
            Expanded(
              child: Image.network(
                src,
                fit: BoxFit.fill)
            ),
            Container(
              padding: const EdgeInsets.all(2.0),
              child: Text("zhoutaozhotuaozhotuaowtrwtwtr",
              style: TextStyle(fontSize: 15), textAlign: TextAlign.left, maxLines: 1, overflow: TextOverflow.ellipsis),
            )
          ],
          ),
        )
      );
  }


}