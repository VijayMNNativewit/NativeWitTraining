import 'package:flutter/material.dart';
import 'package:overlap/views/registerpage.dart';
import 'package:overlap/views/welcomepage.dart';
import 'package:overlap/views/customwidgets.dart';


class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
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
                    TopTitle(title: "Login",),
                    Container(

                      child: Column(
                        children: [
                          CustomTextField(iconName: Icons.email,message: "Email Address", inputTypes: TextInputType.emailAddress,),
                          CustomTextField(iconName: Icons.lock,message: "Password", inputTypes: TextInputType.visiblePassword, obscure: true,),
                          BlueButton(message: "Login Now",),
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
                                          MaterialPageRoute(builder: (context) => RegisterPage()));
                                    },

                                    child: Text('Register', style: TextStyle(fontSize: 20.0, color: Colors.white,),textAlign: TextAlign.center,
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



