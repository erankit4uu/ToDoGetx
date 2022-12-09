import 'package:flutter/material.dart';
import 'package:to_do_getx_tut/app/core/values/color.dart';
import 'package:to_do_getx_tut/app/core/values/icons.dart';

List<Icon> getIcons(){
  return const [
    Icon(IconData(home, fontFamily: 'MaterialIcons'), color: purple,),
    Icon(IconData(work, fontFamily: 'MaterialIcons'), color: pink,),
    Icon(IconData(travel, fontFamily: 'MaterialIcons'), color: blue,),
    Icon(IconData(sports, fontFamily: 'MaterialIcons'), color: yellow,),
    Icon(IconData(shop, fontFamily: 'MaterialIcons'), color: green,),
  ];
}