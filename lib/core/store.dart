
import 'package:flutter_project/model/cart.dart';
import 'package:flutter_project/model/catalog.dart';
import 'package:velocity_x/velocity_x.dart';


class Mystore extends VxStore{


  CatalogModel catalg=CatalogModel();
  CartModel  cart=CartModel();

  Mystore(){
    cart.catalog=catalg;
  }


}