class DnDClass {
  final String name;
  final String index;
  final String url;

  const DnDClass({
    this.name,
    this.index,
    this.url,
  });

  factory DnDClass.fromJson(Map<String, dynamic> json) {
    return DnDClass(
      name: json['name'],
      index: json['index'],
      url: json['url'],
    );
  }
}
