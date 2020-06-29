class Points {
  final String heading;
  final String details;

  Points({this.heading, this.details,});

  factory Points.fromJson(Map<String, dynamic> json) {
    return new Points(
      heading: json['name'] as String,
      details: json['flag'] as String,
    );
  }
}