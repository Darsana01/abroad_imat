import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(home: BusinessCard()));
}

class BusinessCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 350,
                height: 200,
                
                child: Card(
                  
                  elevation: 4.0,
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    width: 350,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                      end: Alignment.topCenter,
                      colors:[
                        Color(0xFF930404),
                        Color(0xFF6B0606),
                        Color(0xFF410505),
                        Color(0xFF1F0303),
                        Color(0xFF0E0101),
                      ]
                  )
                ),
                    child: Row(
                      children: [
                        Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),

                          ),
                          child: Image.asset("Assets/Images/Imat-logo White.png",fit: BoxFit.cover,),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: Container(
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                      end: Alignment.topCenter,
                      colors:[
                        Color(0xFF930404),
                        Color(0xFF6B0606),
                        Color(0xFFF39D9D),
                        Color(0xFFF8C4C4),
                        Color(0xFFF8F2F2),
                      ]
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.red),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Text('\n34/740 A, Amana Plaza\nMetro Pillar No: 381, Edapally Toll\nErnakulam, Kerala - 682024'),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Icon(Icons.email, color: Colors.red),
                          SizedBox(width: 8.0),
                          GestureDetector(
                            onTap: () => launch('mailto:info@imatglobal.com'),
                            child: Text('info@imatglobal.com'),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Icon(Icons.phone, color: Colors.red),
                          SizedBox(width: 8.0),
                          Text('0484-4044484, 0759-4044484'),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Icon(Icons.web, color: Colors.red),
                          SizedBox(width: 8.0),
                          GestureDetector(
                            onTap: () => launch('https://www.imatglobal.com'),
                            child: Text('www.imatglobal.com'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
