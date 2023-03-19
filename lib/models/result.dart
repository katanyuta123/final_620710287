class Result {
  final String  choices;
  final int count ;

  Result({
    required this.choices,
    required this.count,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      choices: json['choices'],  //กลับมาแก้อีกนะ
      count: json['count'],
    );
  }
}