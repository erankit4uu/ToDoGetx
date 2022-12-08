import 'package:flutter/material.dart';
import 'package:to_do_getx_tut/app/core/values/color.dart';

List<Icon> getIcons(){
  return const [
    Icon(Icons.person, color: purple,),
    Icon(Icons.work, color: pink,),
    Icon(Icons.movie, color: blue,),
    Icon(Icons.sports, color: yellow,),
    Icon(Icons.directions_transit_filled_sharp, color: red,),
    Icon(Icons.shop, color: green,),
  ];
}