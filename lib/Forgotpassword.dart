import 'package:ecommerce/Verification.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Forgot Password",style: TextStyle(color: Colors.black),),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(height: 100.0,),
            Text(
              "Forgot Password",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "please enter your email and we will send ",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            Text(
              "you a link to return to your account",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            SizedBox(
              height: 140.0,
            ),
            Container(
              width: 300,
              height: 80,
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: ("Email"),
                  hintText: ("Enter your email"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  suffixIcon: Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {
                  print(value);
                },
                onChanged: (value) {
                  print(value);
                },
              ),
            ),
            SizedBox(height: 150,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.deepOrange,
              ),
              height: 60.0,
              width: 300,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Verification()),
                  );
                },
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dont have an account ?"),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.deepOrange),
                    ))
              ],
            )
          ],),
        ),
      ),
    );
  }
}
