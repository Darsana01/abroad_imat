import 'dart:io';

import 'package:abroadimat/views/services.dart';
import 'package:abroadimat/views/settings.dart';
import 'package:abroadimat/views/university.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'contries.dart';
import 'form.dart';
import 'levels.dart';
import 'login.dart';



class homeabroad extends StatefulWidget {
  final String username;

  homeabroad({super.key,required this.username});

  @override
   
  State<homeabroad> createState() => _HomeAbroadState();
}

class _HomeAbroadState extends State<homeabroad> {
@override



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App name'),
      ),
      drawer: Drawer(
        child:Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                colors: [
              Colors.red,Colors.black
            ])
          ),
          child: Column(
            children: [
              DrawerHeader(
                  child:
                  Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.username,
                              //"${widget.username}",
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                            SizedBox(height: 8),
                            Text("Dare to dream",style: TextStyle(color: Colors.white),),
                          ],
                        ),

                      ]
                  )

              ),
              Expanded(child:
              ListView(
                padding: EdgeInsets.zero,
                children:<Widget> [
                  CustomListTile(
                    icon:Icons.support,
                    text:"Support",
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => ServicePage()));
                    },
                  ) ,
                  CustomListTile(
                    icon:Icons.settings,
                    text:"Settings",
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Settings()));
                    },
                  ) ,
                  CustomListTile(
                    icon:Icons.exit_to_app,
                    text:"Exit",
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => homeabroad(username: widget.username,)));
                    },
                  ) ,
                  ListTile(
                    title: const Text('Logout',style: TextStyle(color: Colors.white),),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const LoginPage()));
                    },
                  ),

                ],
              )),

            ],
          ),
        ),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(color: Color(0x14), width: 0.5),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.black, Colors.red],
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Us",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "IMAT global is committed to providing students with comprehensive support and guidance as they embark on their journey to study abroad. With a dedicated team of experienced counselors and education experts, we aim to make the process seamless and rewarding for each student, recognizing that studying abroad is a transformative experience",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 3),
            const Align(
              alignment: Alignment.topLeft,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: Text(
                    "What are you looking for??",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey,
                      shadows: [
                        Shadow(
                          blurRadius: 2,
                          color: Colors.grey,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: SizedBox(
                  height: 120,
                  child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: ListTile(
                        leading: const Icon(
                          FontAwesomeIcons.globe,
                          size: 50,
                          color: Colors.grey,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Abroad_countries(),
                                  ));
                                },
                                child: const Text(
                                  "Countries",
                                  style: TextStyle(
                                      color: Color.fromARGB(168, 255, 0, 0)),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Color.fromARGB(168, 255, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: SizedBox(
                  height: 120,
                  child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: ListTile(
                        leading: const Icon(
                          FontAwesomeIcons.school,
                          size: 50,
                          color: Colors.grey,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => UniversityScreen(),
                                  ));
                                },
                                child: const Text(
                                  "Universities",
                                  style: TextStyle(
                                      color: Color.fromARGB(168, 255, 0, 0)),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Color.fromARGB(168, 255, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: SizedBox(
                  height: 120,
                  child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: ListTile(
                        leading: const Icon(
                          FontAwesomeIcons.userGraduate,
                          size: 50,
                          color: Colors.grey,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Abroad_levels(),
                                  ));
                                },
                                child: const Text(
                                  "Levels",
                                  style: TextStyle(
                                      color: Color.fromARGB(168, 255, 0, 0)),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Color.fromARGB(168, 255, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: SizedBox(
                  height: 120,
                  child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: ListTile(
                        leading: const Icon(
                          FontAwesomeIcons.indent,
                          size: 50,
                          color: Colors.grey,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BusinessCard(),
                                  ));
                                },
                                child: const Text(
                                  "More Enquiry",
                                  style: TextStyle(
                                      color: Color.fromARGB(168, 255, 0, 0)),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Color.fromARGB(168, 255, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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

class CustomListTile extends StatelessWidget{
final IconData icon;
final String text;
final VoidCallback onTap;
CustomListTile({required this.icon,required this.text,required this.onTap});
  @override
  Widget build(BuildContext context) {
   return ListTile(
     leading: Icon(icon,color: Colors.white,),
     title: Text(text,style: TextStyle(color: Colors.white),),
   onTap: onTap
   );
  }


}
