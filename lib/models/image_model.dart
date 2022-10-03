class ImageModel {
  final String title;
  final String filename;

  ImageModel({
    required this.title,
    required this.filename,
  });

  Map<String, dynamic> toJson() {
    return {
      'filename': filename,
      'title': title,
    };
  }

  factory ImageModel.fromJson(Map<String, dynamic> map) {
    return ImageModel(
      filename: map['filename'] ?? '',
      title: map['title'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageModel && other.filename == filename && other.title == title;
  }

  @override
  int get hashCode => filename.hashCode ^ title.hashCode;
}
