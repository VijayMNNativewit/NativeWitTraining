import 'package:flutter/material.dart';
import 'package:overlap/views/loginpage.dart';
import 'package:overlap/views/registerpage.dart';
import 'package:overlap/views/welcomepage.dart';

/*class CustomTextFieldArguments extends StatelessWidget{
  final String message;
  final IconData iconName;
  final bool obscure;
  CustomTextFieldArguments(this.iconName, this.message, [this.obscure = false,]);
}*/


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key, this.iconName, this.message, this.obscure = false, this.inputTypes = TextInputType.text,
  }) : super(key: key);
  final String message;
  final IconData iconName;
  final bool obscure;
  final TextInputType inputTypes;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              keyboardType: inputTypes,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              decoration: InputDecoration(
                prefixIcon: Icon(iconName, color: Colors.white, size: 35.0,),
                hintText: message,
              ),
              initialValue: message,
              obscureText: obscure,
            ),
          ),


        ],
      ),
    );
  }
}


class MovieImage extends StatelessWidget {
  const MovieImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/1917.jpg',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    );
  }
}

class BackgroundColorBlur extends StatelessWidget {
  const BackgroundColorBlur({
    Key key, this.value
  }) : super(key: key);
final double value;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(value),
    );
  }
}

class TopTitle extends StatelessWidget {
  const TopTitle({
    Key key, this.title,
  }) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 45.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class BlueButton extends StatelessWidget {
  const BlueButton({
    Key key, this.message,
  }) : super(key: key);
final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30.0),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: FloatingActionButton.extended(
              onPressed: () {
                // Add your onPressed code here!
                //print("I have pressed");
              },
              label: Text(message, style: TextStyle(fontSize: 26.0,),),
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },

              child: Text('Forgot Password?', style: TextStyle(fontSize: 20.0, color: Colors.white,),textAlign: TextAlign.center,),
            ),

          ),
        ],
      ),
    );
  }
}