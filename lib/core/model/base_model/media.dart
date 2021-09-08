class Media {
  Media({
    this.pictureList,
    this.videoList,
  });

  final List<dynamic>? pictureList;
  final List<dynamic>? videoList;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        pictureList: List<dynamic>.from(json["pictureList"].map((x) => x)),
        videoList: List<dynamic>.from(json["videoList"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "pictureList": List<dynamic>.from(pictureList!.map((x) => x)),
        "videoList": List<dynamic>.from(videoList!.map((x) => x)),
      };
}
