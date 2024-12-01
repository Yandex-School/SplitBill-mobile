class ExampleRecord {
  final int id;
  final String title;
  final int weight;

  ExampleRecord({
    required this.id,
    required this.title,
    required this.weight,
  });

  ExampleRecord copyWith({String? title, int? weight}) {
    return ExampleRecord(
      id: id,
      title: title ?? this.title,
      weight: weight ?? this.weight,
    );
  }
}
