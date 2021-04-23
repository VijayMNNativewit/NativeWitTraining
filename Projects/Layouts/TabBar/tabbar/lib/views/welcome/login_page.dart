import 'package:flutter/material.dart';
import 'package:tabbar/utils/custom_widgets.dart';
import 'package:tabbar/views/tab_bar/tab_bar.dart';
import 'package:tabbar/views/welcome/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageForm createState() {
    return LoginPageForm();
  }
}

class LoginPageForm extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var emailAddressValue = "";
  var passwordValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MovieImages(),
          BackgroundColorBlur(
            value: 0.25,
          ),
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
                  TopTitle(
                    title: "Login",
                  ),
                  Container(
                    child: Column(
                      children: [
                        //CustomTextField(iconName: Icons.email,message: "Email Address", inputTypes: TextInputType.emailAddress,),
                        //CustomTextField(iconName: Icons.lock,message: "Password", inputTypes: TextInputType.visiblePassword, obscure: true,),
                        //BlueButton(message: "Login Now",),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  bottom: 20.0,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.50),
                                        borderRadius:
                                            BorderRadius.circular(35.0),
                                      ),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Email can't be empty";
                                          }
                                          /*else if(!value.contains("@") || !value.contains("."),){
                                    return 'Please enter a valid email address';
                                  }*/
                                          else if (!RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(value)) {
                                            return 'Please enter a valid email address';
                                          }
                                          emailAddressValue = value;
                                          return null;
                                        },
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.email,
                                            color: Colors.white,
                                            size: 35.0,
                                          ),
                                          hintText:
                                              "Email Address - test@gmail.com",
                                          hintStyle: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        initialValue: "",
                                        obscureText: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  bottom: 20.0,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.50),
                                        borderRadius:
                                            BorderRadius.circular(35.0),
                                      ),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Password can't be empty";
                                          } else if (!RegExp(
                                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                              .hasMatch(value)) {
                                            return 'Password should have minimum 1 Uppercase, Lowercase, number and special character';
                                          }
                                          passwordValue = value;
                                          return null;
                                        },
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: Colors.white,
                                            size: 35.0,
                                          ),
                                          hintText:
                                              "Password - Min 1 Uppercase, lowercase, number & special character",
                                          hintStyle: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        initialValue: "",
                                        obscureText: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  bottom: 30.0,
                                ),
                                child: Row(
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        return Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          child: FloatingActionButton.extended(
                                            onPressed: () {
                                              // Add your onPressed code here!
                                              //print("I have pressed");
                                              if (_formKey.currentState
                                                  .validate()) {
                                                // If the form is valid, display a snackbar. In the real world,
                                                // you'd often call a server or save the information in a database.
                                                if (emailAddressValue ==
                                                        "test@nativewit.in" &&
                                                    passwordValue ==
                                                        "Nativewit@123") {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Processing Data',
                                                      ),
                                                    ),
                                                  );
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          TabBarWidget(),
                                                    ),
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          'Invalid Credentials'),
                                                    ),
                                                  );
                                                }
                                              }
                                            },
                                            label: Text(
                                              "Login Now",
                                              style: TextStyle(
                                                fontSize: 26.0,
                                              ),
                                            ),
                                            backgroundColor: Colors.blue,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        ForgotPassword(),
                        Container(
                          padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
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
    );
  }
}
