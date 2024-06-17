class Experience {
  final String title;
  final String employmentType;
  final String companyName;
  final DateTime startDate;
  final DateTime? endDate;

  const Experience({
    required this.title,
    required this.employmentType,
    required this.companyName,
    required this.startDate,
    this.endDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'employmentType': employmentType,
      'companyName': companyName,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory Experience.fromMap(Map<String, dynamic> map) {
    return Experience(
      title: map['title'],
      employmentType: map['employmentType'],
      companyName: map['companyName'],
      startDate: map['startDate'],
      endDate: map['endDate'],
    );
  }
}
