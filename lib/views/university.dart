
import 'package:abroad_imat/modal/univercity_modal.dart';
import 'package:flutter/material.dart';

import '../Database/university/insertDatabase.dart';
import '../Database/university/sqlhelper.dart';


class UniversityScreen extends StatefulWidget {
  const UniversityScreen({super.key});

  @override
  
  State<UniversityScreen> createState() => _UniversityScreenState();
}

class _UniversityScreenState extends State<UniversityScreen> {
  List<University> universities = [];
  List<University> filteredUniversities = [];
  TextEditingController _searchController = TextEditingController();
  UniversityDatabaseHelper dbHelper = UniversityDatabaseHelper();

  @override
  void initState() {
    super.initState();
    _initializeData();
    _searchController.addListener(_onSearchChanged);
  }

  Future<void> _initializeData() async {
    await insertUnivercityData();
    _fetchUniversities();
  }

  Future<void> _fetchUniversities() async {
    List<University> fetchedUniversities = await dbHelper.getUniversities();
    setState(() {
      universities = fetchedUniversities;
      filteredUniversities = fetchedUniversities;
    });
  }

  void _onSearchChanged() {
    String searchTerm = _searchController.text.toLowerCase();
    setState(() {
      filteredUniversities = universities.where((university) {
        return university.title.toLowerCase().contains(searchTerm) ||
            university.content.any((content) => content.toLowerCase().contains(searchTerm));
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
                filteredUniversities = universities;
              });
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: filteredUniversities.length,
        itemBuilder: (context, index) {
          return GradientBorderCard(
            title: filteredUniversities[index].title,
            content: filteredUniversities[index].content,
          );
        },
      ),
    );
  }
}

class GradientBorderCard extends StatelessWidget {
  final String title;
  final List<String> content;

  const GradientBorderCard({
    required this.title,
    required this.content,
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
          children: content.map((item) {
            return ListTile(
              title: Text(item),
            );
          }).toList(),
        ),
      ),
    );
  }
}
