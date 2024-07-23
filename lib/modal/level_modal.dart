import 'dart:convert';

class Levelmodal {
  String title;
  String intake;
  TuitionFee tuitionFee;

  Levelmodal({
    required this.title,
    required this.intake,
    required this.tuitionFee,
  });

  factory Levelmodal.fromMap(Map<String, dynamic> map) {
    return Levelmodal(
      title: map['title']??'',
      intake: map['intake']?? '',
        tuitionFee: map['tuitionFee'] != null && map['tuitionFee'].isNotEmpty
          ? TuitionFee.fromJson(jsonDecode(map['tuitionFee']))
          : TuitionFee(bachelors: '', masters: ''),
    
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'intake': intake,
      'tuitionFee': jsonEncode(tuitionFee.toJson()),
    };
  }
}

class TuitionFee {
  String bachelors;
  String masters;

  TuitionFee({
    required this.bachelors,
    required this.masters,
  });

  factory TuitionFee.fromJson(Map<String, dynamic> json) => TuitionFee(
        bachelors: json["Bachelor's"] ?? '',
        masters: json["Master's"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "Bachelor's": bachelors,
        "Master's": masters,
      };
}
