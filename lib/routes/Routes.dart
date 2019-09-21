
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viewer/pages/Collection.dart';
import 'package:viewer/pages/Items.dart';
import 'package:viewer/pages/RuleDetail.dart';
import 'package:viewer/pages/Rules.dart';
import 'package:viewer/pages/Classifiacrtion.dart';


final routes = {

  "/classification":(context)=>Classification(),

  "/collection":(context)=>Collection(),

  "/Items":(context, {arguments})=>Items(arguments:arguments),

  "/rule":(context)=>Rules(),
  "/rule/ruleDetail":(context)=>RuleDetail(),

};


var onGenerateRoute=(RouteSettings settings){
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];

  if(pageContentBuilder != null){
    if(settings.arguments != null){
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context, arguments:settings.arguments));
      return route;
    }else{
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};


Route onGenerate(RouteSettings settings){
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];

  if(pageContentBuilder != null){
    if(settings.arguments != null){
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context, arguments:settings.arguments));
      return route;
    }else{
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
}