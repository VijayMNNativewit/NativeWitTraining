import 'package:flutter/material.dart';
import 'package:overlap/views/loginpage.dart';
import 'package:overlap/views/welcomepage.dart';
import 'package:overlap/views/customwidgets.dart';


class RegisterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register Page',
      home: Scaffold(
        body: Stack(
          children: [
            MovieImage(),
            BackgroundColorBlur(value: 0.25,),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.all(25.0),
                padding: EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TopTitle(title: "Register",),
                    Container(

                      child: Column(
                        children: [
                          CustomTextField(iconName: Icons.alarm,message: "Fullname", inputTypes: TextInputType.name,),
                          CustomTextField(iconName: Icons.email,message: "Enter Email", inputTypes: TextInputType.emailAddress,),
                          CustomTextField(iconName: Icons.date_range,message: "Date Of Birth", inputTypes: TextInputType.datetime,),
                          CustomTextField(iconName: Icons.phone_android,message: "Enter Phone Number", inputTypes: TextInputType.phone,),

                          BlueButton(message: "Register",),
                          ForgotPassword(),
                          Container(
                            padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.7,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => LoginPage()));
                                    },

                                    child: Text('Login', style: TextStyle(fontSize: 20.0, color: Colors.white,),textAlign: TextAlign.center,
                                    ),

                                  ),

                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],

        ),
      ),
    );
  }
}



