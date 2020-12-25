import 'package:flutter/material.dart';
import 'package:flutterweb/CustomButton.dart';
import 'package:flutterweb/Utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ColorConstants.dart'as colorsConstants;


class Login_Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}
class _State extends State<Login_Screen> {

  IconData showPasswordIcon=Icons.visibility;
  bool _isPasswordVisible=false;

  TextEditingController mobileController=TextEditingController();
  TextEditingController passwordController=TextEditingController();


  String mobile_empty='';
  String password_empty='';
  String email_validation='';

  // final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
  Widget commonVertSpace() {
    return SizedBox(
      height: Utils.deviceHeight/50,
    );
  }
  @override
  Widget build(BuildContext context) {
    Utils.deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    Utils.deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    Utils.horizontalMargin = Utils.deviceWidth / 25;
    Utils.verticalMargin = Utils.deviceHeight / 70;
    Utils.textfielHorizaldmargin=Utils.deviceWidth/20;
    Utils.textfieldHeight=Utils.deviceHeight*0.022;
    Utils.deviceHeight= MediaQuery.of(context).size.height;
    Utils.deviceWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: colorsConstants.Background_white,
      body: Container(
        padding :EdgeInsets.symmetric(horizontal: Utils.horizontalMargin,vertical: Utils.verticalMargin),

        child: ListView(
          children: <Widget>  [

            Divider(height: Utils.deviceHeight/28,color: Colors.transparent,),
            Container(
                width: Utils.deviceWidth/2,

                height: Utils.deviceHeight/9,
                decoration: BoxDecoration(color: Colors.transparent,
                    image: DecorationImage(
                      image:
                      AssetImage("assets/images/logo.png"),fit: BoxFit.fitHeight,))),

            Divider(height: Utils.deviceHeight/15,color: Colors.transparent,),

            Align(
                alignment: Alignment.center,
                child: Text("LOGIN", style: TextStyle(fontFamily: 'Segoe UI', fontSize: 25,color:colorsConstants.Login_text,height: 1.12,fontWeight: FontWeight.bold))),
            Divider(height: Utils.deviceHeight/20,color: Colors.transparent,),

            if(mobile_empty.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: Utils.deviceHeight/30,left: Utils.deviceWidth/40),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(mobile_empty,style: Theme.of(context).textTheme.headline1,)),
              ),
            TextField(

                  controller: mobileController,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: Utils.textfieldHeight,horizontal: Utils.textfielHorizaldmargin),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: colorsConstants.Login_textfiled, width: 1,),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: colorsConstants.Login_textfiled, width: 1,),
                    ),
                    hintText: "Mobile",

                  )
              ),

            Divider(height: Utils.deviceHeight/85,color: Colors.transparent,),

            if(password_empty.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: Utils.deviceHeight/70,left: Utils.deviceWidth/40),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(password_empty,style: Theme.of(context).textTheme.headline1,)),
              ),
            TextField(

                    controller: passwordController,
                    obscureText: _isPasswordVisible,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: Utils.textfieldHeight,horizontal: Utils.textfielHorizaldmargin),
                        focusedBorder: OutlineInputBorder
                          (
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: colorsConstants.Login_textfiled, width: 1,),
                          ),
                        enabledBorder: OutlineInputBorder
                          (
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: colorsConstants.Login_textfiled, width: 1,),
                          ),

                        hintText: "Password",

                        suffixIcon: IconButton
                          (
                            icon: Icon(showPasswordIcon,color: Colors.grey,),
                            onPressed:() =>isObsecureText()
                         )
                    )
                ),
            Divider(height: Utils.deviceHeight/50,color: Colors.transparent,),
            FlatButton(child: Text("Forgot Password?",style: GoogleFonts.roboto(color: colorsConstants.blue_text_color,fontSize: 16,fontWeight: FontWeight.w500),),onPressed: (){
            //  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword_MobileScreen()));
              
            },),
            Divider(height: Utils.deviceHeight/50,color: Colors.transparent,),
            CustomButton("Login", onPressed:() async {}


          /*=>_authBloc.loginUser(enteredEmail, enteredPassword,context),*/),
            Divider(height: Utils.deviceHeight/40,color: Colors.transparent,),
            Divider(),
            Divider(height: Utils.deviceHeight/40,color: Colors.transparent,),
            GestureDetector(

              child: Container(
                width: Utils.deviceWidth,
                height: Utils.deviceHeight/15,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: colorsConstants.Signup_Color
                ),
                child: Center(

                  child: Text("Signup",style: Theme.of(context).textTheme.bodyText1 )),

              )),






          ],


        ),
      ),
    );
  }

  isObsecureText()
  {
    setState(() {
      print("called   $_isPasswordVisible");
      showPasswordIcon=_isPasswordVisible?Icons.visibility:Icons.visibility_off;
      _isPasswordVisible=!_isPasswordVisible;
    });
  }

  Future<bool> _validation()async{
    bool status=false;
    setState(() {
      if(mobileController.text.isEmpty)
      {
        print("email is empty");
     //   mobile_empty=toastmessage.empty_mobile;
        status=false;
      }
      else if(mobileController.text.length>10 ||mobileController.text.length<10)
      {
        print("email not valid");

       // mobile_empty=toastmessage.mobile_invalid;
        status=false;
      }
      else
        {
        print("email is ok");
        mobile_empty='';
        status=true;
      }
      if(passwordController.text.isEmpty)
      {
        print("password is empty");

       //password_empty=toastmessage.password_empty;
        status=false;
      }
      else{
        password_empty='';
        status=true;
      }
    });

    return await status;

  }
  bool mobileValiation()
  {
    bool status;
    if(mobileController.text.isEmpty)
    {
    //  mobile_empty=toastmessage.empty_mobile;
      status =false;
    }else if(mobileController.text.length>10 ||mobileController.text.length<10 )
    {
    //  mobile_empty=toastmessage.mobile_invalid;
      status=false;
    }else{
      mobile_empty='';
      status=true;
    }
    return status;

  }


  bool passwordValidation()
  {
    bool status;
    if(passwordController.text.isEmpty)
    {
      print("password is empty");

      password_empty="Password cannot be empty";
      status=false;
    }
    else if(passwordController.text.length<8){
      password_empty="Password must be minimum 8 digits";
      status=false;
    }
    else{
      password_empty='';
      status=true;
    }
    return status;

  }


  bool isEmail(String em) {

    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }



}
