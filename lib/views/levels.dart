import 'dart:convert';

import 'package:abroad_imat/Database/level/insertdatabase.dart';
import 'package:abroad_imat/Database/level/sqlHelper.dart';
import 'package:abroad_imat/modal/level_modal.dart';
import 'package:flutter/material.dart';



class Abroad_levels extends StatefulWidget {
  @override
  _AbroadLevelsState createState() => _AbroadLevelsState();
}

class _AbroadLevelsState extends State<Abroad_levels> {
  List<Levelmodal> levelData = [];
  List<Levelmodal> filteredData = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeData();
    _searchController.addListener(_onSearchChanged);
  }

  Future<void> _initializeData() async {
    await insertlevelData();
    _fetchLevel();
  }

  Future<void> _fetchLevel() async {
    final dbHelper = DatabaseHelper();
    List<Levelmodal> fetchedLevels = await dbHelper.getLevels();
    setState(() {
      levelData = fetchedLevels;
      filteredData = fetchedLevels;
    });
  }

  void _onSearchChanged() {
    String searchTerm = _searchController.text.toLowerCase();
    setState(() {
      filteredData = levelData.where((tile) {
        return tile.title.toLowerCase().contains(searchTerm);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.black),
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _searchController.clear();
                filteredData = levelData;
              });
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: filteredData.length,
        itemBuilder: (context, index) {
          
          return GradientBorderCard(
            title: filteredData[index].title,
            intake: filteredData[index].intake,
            tuitionFee: filteredData[index].tuitionFee

          );
        },
      ),
    );
  }
}

class GradientBorderCard extends StatelessWidget {
  final String title;
  final String intake;
  final TuitionFee tuitionFee;

  GradientBorderCard({
    required this.title,
    required this.intake,
    required this.tuitionFee,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.red, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        margin: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.5),
        ),
        child: ExpansionTile(
          title: Text(
            title,
            style: TextStyle(color: Colors.red.shade800),
          ),
          children: [
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: Text(intake),
            ),
            ListTile(
              leading: const Icon(Icons.monetization_on),
              title: Text("Bachelor's: ${tuitionFee.bachelors}"),
            ),
            ListTile(
              leading: const Icon(Icons.monetization_on),
              title: Text("Master's: ${tuitionFee.masters}"),
            ),
            const ListTile(
              leading: Icon(Icons.school),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\n BACHELOR DEGREE'),
                  Text('\n DOCTORAL PhD'),
                  Text('\n INTEGRATED MASTERS DEGREE'),
                  Text('\n MASTER DEGREE'),
                  Text('\n PATHWAY PROGRAM/FOUNDATION PROGRAM'),
                  Text('\n POST GRADUATE CERTIFICATE'),
                  Text('\n POST GRADUATE DIPLOMA'),
                  Text('\n SHORT TERM COURSES'),
                  Text('\n UNDERGRADUATE CERTIFICATE'),
                  Text('\n UNDERGRADUATE DIPLOMA'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
