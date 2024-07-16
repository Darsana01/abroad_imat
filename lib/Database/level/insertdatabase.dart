import 'package:abroad_imat/Database/level/sqlHelper.dart';
import 'package:abroad_imat/modal/level_modal.dart';

List<Map<String, dynamic>> tileData = [
    {
      'title': 'AUSTRALIA',
      'intake': 'May/July/May/Sept',
      'tuitionFee': {
        'Bachelor\'s': 'AUD \$20,000 - \$50,000 per year',
        'Master\'s': 'AUD \$25,000 - \$60,000 per year'
      }
    },
    {
      'title': 'UK',
      'intake': 'May/July/May/Sept',
      'tuitionFee': {
        'Bachelor\'s': 'GBP 11,400 - 38,000 per year',
        'Master\'s': 'GBP 9,000 - 30,000 per year',
        'Doctorate': 'GBP 9,000 - 30,000 per year'
      },
    },
    {
      'title': 'LITHUANIA',
      'intake': 'May/July/May/Sept',
      'tuitionFee': {
        'Bachelor\'s': '€1,000 - 5,300 per year',
        'Master\'s': '€2,200 - 6,500 per year',
        'Doctoral': '€7,100 - 8,500 per year'
      }
    },
    {
      'title': 'CANADA',
      'intake': 'May/July/May/Sept',
      'tuitionFee': {
        'Bachelor\'s': 'CAD \$7,000 - \$25,000 per year',
        'Master\'s': 'CAD \$10,000 - \$35,000 per year',
        'Diploma': 'CAD \$5,000 - \$15,000 per year'
      }
    },
    {
      'title': 'NEW ZEALAND ',
      'intake': 'May/July/May/Sept',
      'tuitionFee': {
        'Bachelor\'s': 'NZD \$22,000 - \$32,000 per year',
        'Master\'s': 'NZD \$26,000 - \$37,000 per year',
        'Diploma': 'NZD \$14,000 - \$20,000 per year'
      }
    },
    {
      "title": "MALTA",
      "intake": "May/July/May/Sept",
      "tuitionFee": {
        "Bachelor's": "€7,000 - €14,000 per year",
        "Master's": "€8,000 - €16,000 per year",
        "UG Diploma": "€5,500 - €7,000 per year",
        "PG Diploma": "€5,500 - €7,000 per year",
        "Certificate Course": "€5,500 onwards"
      }
    },
    {
      "title": "FRANCE",
      "intake": "May/July/May/Sept",
      "tuitionFee": {
        "Bachelor's": "€2,770 per year",
        "Master's": "€3,770 per year"
      }
    },
    {
      "title": "LATVIA",
      "intake": "May/July/May/Sept",
      "tuitionFee": {
        "Bachelor's": "2,000 - 7,000 Euros per year",
        "Master's": "2,000 - 10,000 Euros per year",
        "Diploma": "2,000 - 7,000 Euros per year"
      }
    },
    {
      "title": "FINLAND",
      "intake": "May/July/May/Sept",
      "tuitionFee": {
        "Bachelor's": "8,000 - 15,000 Euros per year",
        "Master's": "10,000 - 18,000 Euros per year",
        "Diploma": "8,000 - 15,000 Euros per year"
      }
    },
    {
      "title": "POLAND",
      "intake": "May/July/May/Sept",
      "tuitionFee": {
        "Bachelor's": "500 - 6,000 Euros per year",
        "Master's": "1,000 - 8,000 Euros per year",
        "Bachelor's (2nd entry)": "3,000 Euros per year",
        "Master's (2nd entry)": "8,000 - 15,000 Euros per year",
        "Bachelor's (3rd entry)": "3,000 Euros",
        "Master's (3rd entry)": "2,000 Euros"
      }
    },
    {
      "title": "GERMANY",
      "intake": "May/July/May/Sept",
      "tuitionFee": {
        "Bachelor's": "100 - 300 Euros administrative fees. Most states: no tuition fees for undergraduates at public universities",
        "Master's": "Fees range from 200 to 1,500 Euros per semester. Some states have no fees. International students may have additional charges. Check with the university for details"
      }
    },
    {
      "title": "SWEDEN",
      "intake": "May/July/May/Sept",
      "tuitionFee": {
        "Bachelor's": "80,000 - 140,000 SEK per year",
        "Master's": "90,000 - 180,000 SEK per year"
      }
    },
    {
      "title": "NETHERLANDS",
      "intake": "May/July/May/Sept",
      "tuitionFee": {
        "Bachelor's": "8,000 - 15,000 Euros per year",
        "Master's": "8,000 - 20,000 Euros per year",
        "Diploma": "8,000 - 15,000 Euros per year"
      }
    },
  ];
Future<void> insertlevelData() async {
  final dbHelper = DatabaseHelper();
  for (var item in tileData) {
    await dbHelper.insertLevel(
      Levelmodal(
        title: item['title'],
        intake: item['intake'],
        tuitionFee: TuitionFee.fromJson(item['tuitionFee']),
      ),
    );
  }
}

 

