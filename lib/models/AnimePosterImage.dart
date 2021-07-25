class AnimePosterImage {
  final String small;

  AnimePosterImage({required this.small});

  factory AnimePosterImage.fromJson(Map<String, dynamic> json) {
    return AnimePosterImage(small: json['small'] as String);
  }
}
