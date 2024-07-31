

import 'package:abroadimat/Database/country/sql_helper.dart';
import 'package:abroadimat/modal/country_modal.dart';
final List<Map<String, dynamic>> items = [
  {
      'name': 'UK',
      'image':
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV7IA-PfjRF4PBJjUSdbn5mk9BoZM02Kx3SatXHrUiRwBG6ribqmrPaLpT8IcVLHxOx4A&usqp=CAU",
    },
    {
      'name': 'CANADA',
      'image':
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7E0IGWAszPh_SzC6PhbPPfVwUaRGG72rdMQ&usqp=CAU",
    },
    {
      'name': 'LATVIA',
      'image':
      "https://www.trafalgar.com/real-word/wp-content/uploads/sites/3/2015/09/riga-latvia-cityscape-in-sunny-summer-day-famous-PY9RNEW-1.jpg",
    },
    {
      'name': 'LITHUANIA',
      'image':
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3EJ_5AqtbR13WBTrUQDyw-NJ0VmNQ36QVh3_lBjLp1N_3BiXMe83qAOBzXr1Gri-qzrY&usqp=CAU",
    },
    {
      'name': 'SLOVAKIA ',
      'image':
      "https://www.thediaryofanomad.com/wp-content/uploads/2021/02/best-places-to-visit-in-slovakia-50.jpg",
    },
    {
      'name': 'SLOVENIA ',
      'image':
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiw3cnhx2VBs2gqWROBpJoVvN18c6Xq-4DmVDYeBMk-xA45g6SHV7Cf77IoV9aO2i2Y3s&usqp=CAU",
    },
    {
      'name': 'POLAND ',
      'image':
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc9fITKRdA2lqYdBN6e5PODP2AwvahMecKjw&usqp=CAU",
    },
    {
      'name': 'CZECH REPUBLIC',
      'image':
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWLyqZHNBmXPUrBQU07talBulazzbhNRbnM1HyqADHmLjnjttVopgSik5Y5uVVApIgzHk&usqp=CAU",
    },
    {
      'name': 'FINLAND',
      'image':
      "https://cdn1.matadornetwork.com/blogs/1/2011/05/Amsterdam-Netherlands-cityscape-canals-waterfront-destinations-1200x900.jpg",
    },
    {
      'name': 'NETHERLANDS ',
      'image':
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxC5PtYR0ee6UkW7LYRDgoobCXvK_UVPTgYA&usqp=CAU",
    },
    {
      'name': 'GERMANY ',
      'image':
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8wUvSco7nDQZ93I9MIL84FWdwQwyoKvbooA&usqp=CAU",
    },
    {
      'name': 'ITALY',
      'image':
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4MbzCpHNPYzJzzE3D-wIy4CfqMUVe79VjHg&usqp=CAU",
    },
    {
      'name': 'FRANCE ',
      'image':
      "https://internationalliving.com/_next/image/?url=https%3A%2F%2Fimages.ctfassets.net%2Fwv75stsetqy3%2F5H8g02dSEMDHT2lMSIm2nw%2F230df7b3796546593cc2997de811d046%2FFrance.jpg%3Fq%3D60%26fit%3Dfill%26fm%3Dwebp&w=3840&q=60"
    },
    {
      'name': 'SPAIN ',
      'image':
      "https://images.goabroad.com/image/upload/images2/program_content/1-1612106365.jpg",
    },
    {
      'name': 'HUNGARY ',
      'image':
      "https://media1.thrillophilia.com/filestore/cwwz812x9q2kw19pwod1xi62blzi_shutterstock_562412311.jpg?w=400&dpr=2"
    },
    {
      'name': 'CROATIA ',
      'image':
      "https://www.croatiatravelco.com/wp-content/uploads/2014/02/Rovinj.foto_.yachtsngulets.com_.jpg"
    },
    {
      'name': 'BELGIUM ',
      'image':
      "https://lp-cms-production.imgix.net/2022-05/GettyRF_597070535.jpg?auto=format&w=1920&h=640&fit=crop&crop=faces,edges&q=75"
    },
    {
      'name': 'MALTA ',
      'image':
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScvwaikQ0sLzhz1IKAkQA4GBkfKZwbjT0y8yIXCR-dDEuT1bkttXGqOhJzpfQwxBNBIUU&usqp=CAU",
    },
    {
      'name': 'SWEDEN',
      'image':
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5Sv97PamISooC4tqu0DeGGcoMIoObUYnwrg&usqp=CAU",
    }
  // Add other items here...
];

Future<void> insertData() async {
  final dbHelper = DatabaseHelper();
  for (var item in items) {
    await dbHelper.insertCountry(Country.fromMap(item));
  }
}
