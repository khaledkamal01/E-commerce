import 'package:ecommerce/Home.dart';
import 'package:ecommerce/Welcomeback.dart';
import 'package:ecommerce/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  var phoneController = TextEditingController();

  void Verification() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      verificationCompleted: (PhoneAuthCredential credential) {
        FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
       
        print('Verification code sent to the phone number');
      },
      codeAutoRetrievalTimeout: (verificationId) {

        print("Code auto retrieval timed out");
      },
      timeout: const Duration(seconds: 60),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              width: 300,
              height: 90,
              child: TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: ("phone"),
                    hintText: ("Enter your phone number"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    suffixIcon: Icon(Icons.phone_android),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "please enter your phone number";
                    }

                    return null;
                  }),
            ),
            Text(
              "OTP verification",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "We sent your code to + 6515654684 ",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "this code will expired",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "00:13",
                  style: TextStyle(color: Colors.deepOrange),
                )
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey),
                            borderRadius: BorderRadius.circular(12))),
                    style: Theme.of(context).textTheme.headlineMedium,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey),
                            borderRadius: BorderRadius.circular(12))),
                    style: Theme.of(context).textTheme.headlineMedium,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey),
                            borderRadius: BorderRadius.circular(12))),
                    style: Theme.of(context).textTheme.headlineMedium,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey),
                            borderRadius: BorderRadius.circular(12))),
                    style: Theme.of(context).textTheme.headlineMedium,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.deepOrange,
              ),
              height: 60.0,
              width: 300,
              child: MaterialButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Welcome()),
                  );
                },
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Resend OTP code",
                  style: TextStyle(
                      decoration: TextDecoration.underline, color: Colors.grey),
                ))
          ],
        ),
      ),
    );
  }
}
