// HomePage.dart
import 'package:abroad_imat/Database/country/datainsert.dart';
import 'package:flutter/material.dart';
import 'package:abroad_imat/Database/country/sql_helper.dart';
import 'package:abroad_imat/modal/country_modal.dart';

import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: Abroad_countries(),));
}

class Abroad_countries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class AbroadCountries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Country> countries = [];

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await insertData();
    _fetchCountries();
  }

  Future<void> _fetchCountries() async {
    final dbHelper = DatabaseHelper();
    List<Country> fetchedCountries = await dbHelper.getCountries();
    setState(() {
      countries = fetchedCountries;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Countries we root on",
            selectionColor: Colors.black,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 9.8,
          mainAxisSpacing: 9.8,
        ),
        itemCount: countries.length,
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: Image.network(
              countries[index].image,
              fit: BoxFit.cover,
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black45,
              title: Text(
                countries[index].name,
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
