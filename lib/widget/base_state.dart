import 'package:flutter/material.dart';

abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {

  double setWidth(double sizeWidth){
    Size size = MediaQuery.of(context).size;
    return size.width * sizeWidth;
  }

    double setHeight(double sizeHeight){
    Size size = MediaQuery.of(context).size;
    return size.height * sizeHeight;
  }


}