class AnimePosterImage {
  final String small;
  final String large;

  AnimePosterImage({required this.small, required this.large});

  factory AnimePosterImage.fromJson(Map<String, dynamic> json) {
    return AnimePosterImage(
        small: json['small'] as String, large: json['large'] as String);
  }
}
