import 'package:flutter/material.dart';
import 'package:flutterweb/Utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ColorConstants.dart' as colorsConstants;
class CustomButton extends StatelessWidget {
  String title;


  CustomButton(this.title,{@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
     /*  fillColor: Colors.green,
      splashColor: Colors.greenAccent,*/
      child: Container(
        width: Utils.deviceWidth,
        height: Utils.deviceHeight/15,

        decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10.0),
          gradient: colorsConstants.LoginButton_gradient1,
           // gradient: colorsConstants.gradient1
        ),
        child: Center(
          child: Text(title,style: Theme.of(context).textTheme.bodyText1,),
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}
