import 'package:ecommerce/Welcomeback.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0.0,
        title: Text("Profile"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 40.0,
                ),
                SizedBox(width: 20,),
                Text("khalid@gmail.com",style: TextStyle(fontSize: 20),)
              ],
            ),
            SizedBox(height: 30,),
            Text("Name : Khalid Kamal ",style: TextStyle(fontSize: 20)),
            SizedBox(height: 10,),
            Text("Address : Amman ",style: TextStyle(fontSize: 20)),
            SizedBox(height: 10,),

            Text("Phone : 0792964260",style: TextStyle(fontSize: 20)),
            SizedBox(height:50 ,),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.deepOrange,
                ),
                height: 60.0,
                width: 300,
                child: MaterialButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Welcome()),
                    );
                  },
                  child: Text(
                    "SignOut",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
