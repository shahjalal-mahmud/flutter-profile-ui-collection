import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ProfileScreen> {

  int textValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile Screen', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(100),
                              child: Image.asset("assets/shahed.jpeg", fit: BoxFit.cover,)),
                        ),
                        Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.add_a_photo, size: 20, color: Colors.white,),
                                ))),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Shahed Oali Noor", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Text("4 Post", style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),),
                            SizedBox(width: 20,),
                            Text("25 Follower", style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text("Edit Profile", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),))),
                    SizedBox(width: 15,),
                    Container(
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text("Share Profile", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),))),
                    SizedBox(width: 15,),
                    Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                        ),
                    child: Icon(Icons.person_add, color: Colors.white, size: 20,),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: (MediaQuery.of(context).size.width - 50)/4,
                height: (MediaQuery.of(context).size.width - 50)/4,
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    child: Image.network("https://mohammadalinijhoom.com/wp-content/uploads/2024/07/bKash-Logo.png", fit: BoxFit.cover,)),
              ),
              Container(
                width: (MediaQuery.of(context).size.width - 50)/4,
                height: (MediaQuery.of(context).size.width - 50)/4,
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                width: (MediaQuery.of(context).size.width - 50)/4,
                height: (MediaQuery.of(context).size.width - 50)/4,
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                width: (MediaQuery.of(context).size.width - 50)/4,
                height: (MediaQuery.of(context).size.width - 50)/4,
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
              ),
            ],
          )
        ],
      ),
    );
  }
}