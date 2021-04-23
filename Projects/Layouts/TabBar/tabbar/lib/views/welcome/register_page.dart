import 'package:flutter/material.dart';
import 'package:tabbar/utils/custom_widgets.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageForm createState() {
    return RegisterPageForm();
  }
}

class RegisterPageForm extends State<RegisterPage> {
  final _formKey2 = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  TextEditingController _dateController = TextEditingController();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1890),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _dateController.text = date;
      });
  }

  // final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   key: _scaffoldkey,
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
                    title: "Register",
                  ),
                  Container(
                    child: Column(
                      children: [
                        //CustomTextField(iconName: Icons.alarm,message: "Fullname", inputTypes: TextInputType.name,),
                        //CustomTextField(iconName: Icons.email,message: "Enter Email", inputTypes: TextInputType.emailAddress,),
                        //CustomTextField(iconName: Icons.date_range,message: "Date Of Birth", inputTypes: TextInputType.datetime,),
                        //CustomTextField(iconName: Icons.phone_android,message: "Enter Phone Number", inputTypes: TextInputType.phone,),

                        //BlueButton(message: "Register",),
                        Form(
                          key: _formKey2,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 20.0),
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
                                            return "Name can't be empty";
                                          }
                                          /*else if(!value.contains("@") || !value.contains(".")){
                                  return 'Please enter a valid email address';
                                }*/
                                          else if (!RegExp('[a-zA-Z]')
                                              .hasMatch(value)) {
                                            return 'Please enter a valid name';
                                          }
                                          // emailAddressValue = value;
                                          return null;
                                        },
                                        keyboardType: TextInputType.name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.alarm,
                                            color: Colors.white,
                                            size: 35.0,
                                          ),
                                          hintText: "Fullname",
                                          hintStyle: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                        initialValue: "",
                                        obscureText: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 20.0),
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
                                          } else if (!RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(value)) {
                                            return 'Please enter a valid email address';
                                          }
                                          return null;
                                        },
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.email,
                                            color: Colors.white,
                                            size: 35.0,
                                          ),
                                          hintText:
                                              "Enter Email - test@gmail.com",
                                          hintStyle: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                        initialValue: "",
                                        obscureText: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              /*  Container(
                                padding: EdgeInsets.only(bottom: 20.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.7,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.50),
                                        borderRadius: BorderRadius.circular(35.0),
                                      ),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Date can't be empty";
                                          }
                                          return null;
                                        },
                                        //keyboardType: TextInputType.datetime,
                                        keyboardType: TextInputType.datetime,
                                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.date_range, color: Colors.white, size: 35.0,),
                                          hintText: "Date Of Birth",
                                        ),
                                        initialValue: "Date Of Birth",
                                        obscureText: false,
                                      ),
                                    ),


                                  ],
                                ),
                              ), */
                              Container(
                                padding: EdgeInsets.only(bottom: 20.0),
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
                                            return "Date can't be empty";
                                          }
                                          return null;
                                        },
                                        //keyboardType: TextInputType.datetime,
                                        onTap: () {
                                          print(selectedDate);
                                          return _selectDate(context);
                                        },
                                        controller: _dateController,
                                        keyboardType: TextInputType.datetime,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.date_range,
                                            color: Colors.white,
                                            size: 35.0,
                                          ),
                                          hintText:
                                              "Date Of Birth - DD/MM/YYYY",
                                          hintStyle: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        //initialValue: "",
                                        obscureText: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 20.0),
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
                                            return "Phone Number can't be empty";
                                          } else if (!RegExp(
                                                  r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                              .hasMatch(value)) {
                                            return 'Please enter a valid phone number';
                                          }

                                          return null;
                                        },
                                        keyboardType: TextInputType.phone,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.phone_android,
                                            color: Colors.white,
                                            size: 35.0,
                                          ),
                                          hintText: "Enter Phone Number",
                                          hintStyle: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                        initialValue: "",
                                        obscureText: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Builder(builder: (BuildContext context) {
                                return Container(
                                  padding: EdgeInsets.only(bottom: 30.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: FloatingActionButton.extended(
                                          onPressed: () {
                                            // Add your onPressed code here!
                                            //print("I have pressed");
                                            if (_formKey2.currentState
                                                .validate()) {
                                              // If the form is valid, display a snackbar. In the real world,
                                              // you'd often call a server or save the information in a database.
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      'Login to your account'),
                                                ),
                                              );
                                              Navigator.pop(context);
                                            }

// 1 -> 2
                                          },
                                          label: Text(
                                            "Register",
                                            style: TextStyle(
                                              fontSize: 26.0,
                                            ),
                                          ),
                                          backgroundColor: Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                              /*Container(
                                padding: EdgeInsets.only(bottom: 30.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.7,
                                      child: FloatingActionButton.extended(
                                        onPressed: () {
                                          // Add your onPressed code here!
                                          //print("I have pressed");
                                          if (_formKey2.currentState.validate()) {
                                            // If the form is valid, display a snackbar. In the real world,
                                            // you'd often call a server or save the information in a database.
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(content: Text('Login to your account')));
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(builder: (context) => LoginPage()));
                                          }



                                        },
                                        label: Text("Register", style: TextStyle(fontSize: 26.0,),),
                                        backgroundColor: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),*/
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
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Login',
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
