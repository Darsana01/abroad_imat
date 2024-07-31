



  import 'package:abroadimat/Database/univercity/sqlhelper.dart';

import '../../modal/university_modal.dart';

final List<Map<String, dynamic>> universityData = [
     {
      'title': 'UK',
      'content': ['University of the West of Scotland - London', 'University of Plymouth', 'University of York', 'The University of Manchester', 'Lancaster university', 'The University of Edinburgh', 'London school of economics', 'University of Reading', 'University of Sussex', 'University of Lincoln', 'Kings college London', 'Heriot-Watt university', 'University of Nottingham', 'Liverpool john moores university', 'University of Chester', 'University of the West of Scotland', 'University of sunderland', 'University of Worcester', 'Manchester metropolitan university', 'St Georges University of London', 'Durham University', 'University college of London', 'Loughborough University', 'Solent University', 'Cambridge Ruskin International College', 'Hertfordshire International College', 'Leicester University Global Study Centre', 'London Brunel International College', 'Bellerbys College', 'University of Huddersfield', 'University of Leeds Beckett', 'Liverpool John Moores University', 'Royal Holloway University of London', 'University of Strathclyde', 'Northumbria University London Campus', 'Ulster University - London & Birmingham', 'University Of Bangor', 'Strathclyde glasgow', 'University of exeter', 'University of stirling', 'Newcastle University London', 'Cambridge Seminars College', 'Bournmouth university', 'Arts University Bournemouth', 'Regents University- United Kingdom', 'University of East Anglia- United Kingdom'],
    },
    {
      'title': 'CANADA',
      'content': ['Sault College', 'Cegep de la Gaspesie et des Iles', 'Acadia University', 'Thompson Rivers University', 'University of Northern British Columbia', 'Wilfrid Laurier International College', 'Trebas Institute', 'Cape Breton University', 'Mount Saint Vincent University', 'University of Lethbridge'],
    },
{
      'title': 'LATVIA',
      'content': ['Riga Aeronautical Institute', 'Riga Technical University', 'Riga Stradins University', 'University of Latvia', 'Riga International School of Business and Administration', 'Liepaja university', 'Turiba University', 'Ventspils University College', 'Latvian Academy of Sport Education', 'Transport and telecommunication institute(TSI)', 'Riseba University of Business, Arts and Technology', 'TSI University of Applied Sciences', 'Latvia University of Life Sciences and Technologies', 'Vidzeme University of Applied Sciences', 'Riga Graduate School of Law', 'Liepaja University', 'Country Specific-Latvia'],
    },
{
      'title': 'LITHUANIA',
      'content':['Kaunas University of Technology', 'Vilnius Gediminas Technical University', 'Lithuanian school of law and business', 'Lithuanian Sports University', 'Vytautas Magnus University', 'International School Of Law and Business', 'SMK University Of Applied Sciences', 'Mykolas Romeris University', 'ISM University of Management and Economics', 'Kaunas College /University of Applied Sciences', 'Vilnius College of Technology and Design', 'Klaipeda State University of Applied Sciences(KVK)', 'SiauliaI University', 'Lithuanian University of Health Sciences', 'Klaipeda University', 'Kaunas Forestry and Environmental Engineering University of Applied Sciences (KMAIK)', 'Country Specific-Lithuania', 'ALYTAUS KOLEGIJA/University of Applied Sciences', 'Klaipeda State College (KVK)', 'Lithuanian Maritime Academy', 'St.Ignatius of Loyola College', 'North Lithuania College'],
    },
    {
      'title': 'SLOVAKIA',
      'content':['University of Economics in Bratislava''Slovak University of Technology in Bratislava', 'Technical university of Kosice', 'University of Žilina', 'University of Ss. Cyril and Methodius in Trnava', 'University of Veterinary Medicine and Pharmacy in Košice', 'Comenius University in Bratislava', 'City University of Seattle (VŠM)Bratislava', 'Dubnica Technology Institute', 'University of Nova Gorica']

    },
    {
      'title': 'SLOVENIA',
      'content':['University of Maribor', 'GEA College of Entrepreneurship Piran', 'Doba Business School', 'University of Ljubljana', 'University of Primorska', 'University of Nova Gorica', 'International School for Social and Business Studies Celje', 'Jezikovna Akademija', 'Country Specific-Slovenia', 'Svarog Educational Institute'],
    },
    {
      'title': 'POLAND',
      'content':['Warsaw University of Technology', 'Cracow University of Economics', 'Warsaw school of economics', 'Silesian University of Technology in Gliwice', 'Vincent Pol University', 'Lublin University of Technology', 'Opole University of Technology', 'International University of Logistics & Transport', 'Adam Mickiewicz University Poznan', 'SWPS University of Social Sciences and Humanities', 'University of Wroclaw'],
    },
    {
      'title': 'CZECH REPUBLIC',
      'content':['University of South Bohemia in České Budějovice', 'Czech University of Life Sciences Prague', 'Technical University of Liberec', 'Skoda Auto University', 'Prague Film School', 'Czech Technical University', 'University of Pardubice', 'University of Ostrava', 'Technical University of Ostrava', 'University of Hradec Kralove', 'University of Economics Prague', 'University of Masaryk', 'Jan Evangelista Purkyne University', 'Tomas Bata University in Zlín', 'University Of New York In Prague (UNYP)', 'Dublin City University', 'Anglo-American University,Prague', 'FAMU Film and TV School of the Academy of Performing Arts in Prague', 'CEVRO Institute', 'University of Economics and Management', 'Institute of Technology and Business', 'University of West Bohemia', 'Mendel University Brno', 'College of polytechnics jihlava', 'University of Chemistry and Technology, Prague', 'University of Veterinary and Pharmaceutical Sciences Brno', 'Academy of Arts Architecture and Design in Prague', 'Film Academy of Miroslav in Písek', 'Newton College', 'Jan Amos Komensky University', 'College of Business Studies in Prague', 'University of Finance and Administration Prague', 'Masaryk University in Brno', 'Unicorn College', 'Institute of Hospitality Management in Prague / Vysoká škola hotelová v Praze', 'Brno Univeristy of Technology', 'Polytechnic College in Jihlava', 'College of Business and Hotel Brno', 'Silesian University in Opava', 'Jan Evangelista Purkyne University in Usti nad Labem', 'Country Specific-Czech Republic', 'Palacký University Olomouc'],

    },
    {
      'title': 'FINLAND',
      'content':['University of Helsinki', 'HAMK University Of Applied Sciences', 'university of vaasa', 'Hanken School of Economics', 'University of Eastern Finland', 'University of Turku', 'Aalto university', 'Helsinki School of Business (HELBUS)', 'Metropolia University of Applied Sciences', 'Turku University of Applied Sciences', 'Seinäjoki university of applied sciences (seamk)', 'Kajaani University of Applied Sciences (KAMK)', 'Haaga-Helia University of Applied Sciences', 'Lappeenranta University of Technology', 'Satakunta University of Applied Sciences', 'Abo Akademi University', 'Oulu University of Applied Sciences', 'University of Oulu', 'Jyväskylä University', 'Savonia University of Applied Sciences', 'University Of Arts Helsinki', 'Tampere University of applied Sciences', 'Arcada university of applied science', 'Laurea University of Applied Sciences', 'University of Lapland', 'Novia University of Applied Sciences', 'EURECOM - Graduate school and Research center in Digital Science', 'Tampere University', 'Country Specific-Finland'],

    },
    {
      'title': 'NETHERLANDS',
      'content':['NHL Stenden University of Applied Sciences', 'TIO University of Applied Sciences', 'HAN University of Applied Sciences', 'Rotterdam Business School', 'Tilburg University', 'Rotterdam School Of Management', 'Eindhoven university of Technology', 'Utrecht University', 'Breda University of Applied Sciences', 'Radboud University', 'Maastricht University', 'Leiden University', 'Vrije Universiteit Amsterdam', 'Aeres University of Applied Sciences', 'KIT Royal Tropical Institute', 'Codarts, University for the Arts', 'Zuyd University of Applied Sciences', 'Erasmus University Rotterdam', 'HU University of Applied Sciences Utrecht', 'Amsterdam University of Applied Sciences', 'HAS University of Applied Science', 'Business School Netherlands', 'Team Academy', 'Amsterdam University of the Arts', 'Netherlands Business Academy', 'HZ University of Applied Sciences', 'The Hague University of Applied Sciences', 'Delft University of Technology', 'University of Arts, The Hague', 'TIAS School for Business and Society', 'Maastricht School of Management (MSM)', 'Saxion University of Applied Sciences', 'Rotterdam University of applied Sciences', 'University of Amsterdam', 'Fontys University of Applied Sciences', 'Avans University of Applied Sciences', 'Windesheim University of Applied Sciences'],
    },
    {
      'title': 'GERMANY',
      'content':['Hochschule Hof', 'Cologne Business School', 'University of Cologne', 'Frankfurt School of Finance & Management', 'Munich Business School', 'Jacobs University Bremen', 'Heidelberg University', 'IUBH University of Applied Sciences', 'International School of Management (ISM)', 'ESB Business School', 'GISMA Business School', 'TH Koln, University of Applied Sciences', 'CODE University of Applied Sciences', 'FHWS - University of Applied Sciences Wurzburg-Schweinfurt', 'Hochschule Mannheim University of Applied Sciences', 'Gisma Business School Germany', 'Hochschule Worms University of Applied Sciences', 'Hochschule fur Technik und Wirtschaft Berlin (HTW Berlin)', 'Rhein-Waal University of Applied Sciences', 'Technische Hochschule Ingolstadt', 'KU Eichstatt-Ingolstadt', 'Fachhochschule des Mittelstands (FHM)', 'Steinbeis University Berlin', 'Country Specific-Germany', 'Friedrich Schiller University Jena'],
    },
    {
      'title': 'ITALY',
      'content':['Alma Mater Studiorum - Università di Bologna', 'University of Padua', 'Politechnico Di Milano', 'Politecnico di Torino', 'University of Mesinna', 'Free University of Bozen-Bolzano', 'University of Bari Aldo Moro', 'Università degli Studi di Genova', 'Sapienza University of Rome', 'University of Parma', 'University of Genoa', 'University of Trento', 'Alma Mater Studiorum - Università di Bologna', 'University of Milan Bococca', 'Bologna Business School', 'University of Milan'],
    },
    {
      'title': 'FRANCE',
      'content':['ESC Rennes school of business', 'La Rochelle Business School', 'Grenoble school of management', 'Epita France', 'Esc Toulouse', 'Skema Business School', 'Le Cordon Bleu', 'IPAG Business School', 'Neoma Business School', 'Toulouse Business School (TBS)', 'IESEG School of Business', 'ISC Paris Business School', 'Dijon Burgundy School of Business,France', 'Grenoble Ecole de Management,France', 'ESC PAU, Programme Grand Ecole', 'EM Normandie', 'EM Strasbourg, Programme Grand Ecole', 'Telecom Ecole de Management', 'The American Business School of Paris', 'EDHEC Business School', 'ISCID-CO, University of Artois, France', 'ESCE International Business School', 'Burgundy School of Business', 'Emlyon', 'ESSCA School of Management', 'Grenoble INP - ENSIMAG', 'ESSEC Business School', 'EMLV Business School', 'ICN Business School', 'Toulouse School of Management', 'EPITECH Toulouse', 'NEOMA Business School', 'ESC Troyes', 'ESMOD France', 'PSB Paris School of Business', 'INSEEC Business School', 'IESEG School of Management', 'IEA PARIS', 'Audencia Business School', 'IAE NICE Graduate School of Management', 'Ecole de Management de Normandie', 'Groupe ESAIP', 'INSEEC Business School', 'IESEG School of Management', 'Ecole des Ponts ParisTech', 'Country Specific-France'],
    },
    {
      'title': 'SPAIN',
      'content':['University of Barcelona', 'Nebrija University', 'Universidad Europea/European University', 'Marbella International University Centre', 'Escuela Universitaria de Hotelería y Turismo de Sant Pol', 'Schellhammer Business School', 'United International Business Schools (UIBS)', 'EU Business school', 'University Pablo De Olavide''Universidad Camilo José Cela(UCJC)'],
    },
    {
      'title': 'HUNGARY',
      'content':['CEU - Central European University', 'Budapest Metropolitan University', 'Budapest University of Technology and Economics', 'International Business School Budapest', 'McDaniel College Budapest', 'Semmelweis University', 'University of Debrecen', 'University of Pécs', 'University of Szeged', 'University of Veterinary Medicine Budapest', 'Country Specific-Hungary', 'University of Debrecen Medical School'],
    },
    {
      'title': 'CROATIA',
      'content':['University of Split', 'University Of Zagreb', 'Libertas International University', 'University of Rijeka', 'University of Zadar', 'Zagreb School of Economics and Management', 'Algebra university college.', 'VIMAL - Academy for Human Resources Development', 'University of Zadar', 'Country Specific-Croatia', 'Aspira University College', 'University of Osijek'],
    },
    {
      'title': 'BELGIUM',
      'content':['Karel de grote university college', 'Karel de grote Hogeschool', 'KU Leuven', 'Vlerick Business School', 'Thomas More University of Applied Sciences', 'Ghent University', 'LUCA School of Arts', 'University College of Namur -Liège-Luxembourg', 'University College West Flanders / Hogeschool West-Vlaanderen', 'Free University of Brussels / Vrije Universiteit Brussel', 'University of Brussels', 'Vesalius College Brussels', 'University of Mons'],

    },
    {
      'title': 'MALTA',
      'content':['London School of Commerce', 'Global College Malta', 'University of Malta', 'Malta Business School', 'University of london and university of middlesex', 'EEC-ITIS Malta Tourism and Languages Institute', 'CAMAS Academy', 'Gateway School Of English', 'American University of Malta', 'Malta College of Arts, Science and Technology (MCAST)', 'Institute of Tourism Studies Malta'],

    },
    {
      'title': 'SWEDEN',
      'content':['University of Skovd', 'Karolinska Institute', 'Linnaeus University', 'Dalarna University', 'Malardalen University', 'Boras University', 'Linkoping University', 'KTH Royal Institute of Technology University', 'University of Skövde', 'Umea University', 'University of Gothenburg'],

    },
    {
      'title': 'PORTUGAL',
      'content':['University of Fernando Pessoa', 'Polytechnic Institute of Coimbra', 'Instituto Politecnico De Leiria', 'Universidade NOVA de Lisboa', 'Catholic University of Portugal', 'Nova School of Business and Economics', 'University of Coimbra', 'University of Algarve'],
    },
    {
      'title':'SWITZERLAND',
      'content':['Montreux school of Business', 'BHMS', 'SWISS SCHOOL OF BUSINESS AND MANAGEMENT', 'AISTS (International Academy of Sport Science and Technology', 'Bern University of Applied Sciences', 'Business School Lausanne', 'Franklin University Switzerland', 'Geneva Business School', 'Glion Institute of Higher Education', 'University of Lausanne'],
    }

  ];

Future<void> insertUnivercityData() async {
  final dbHelper = UniversityDatabaseHelper();
  for (var item in universityData) {
    await dbHelper.insertUniversity(University(
      title: item['title'],
      content: List<String>.from(item['content']),
    ));
  }
}

 
