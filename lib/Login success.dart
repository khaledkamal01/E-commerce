import 'package:flutter/material.dart';

class LoginSuccess extends StatefulWidget {
  const LoginSuccess({Key? key}) : super(key: key);

  @override
  State<LoginSuccess> createState() => _LoginSuccessState();
}

class _LoginSuccessState extends State<LoginSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login Success",style: TextStyle(color: Colors.black),),

        backgroundColor: Colors.white60,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 100,),
          Image(image: AssetImage('assets/images/success.png')),
          SizedBox(height: 30.0,),
          Text(
            "Login Success",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0),
          ),
          SizedBox(height: 100.0,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.deepOrange,
            ),
            height: 60.0,
            width: 300,
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                "Back to home",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
