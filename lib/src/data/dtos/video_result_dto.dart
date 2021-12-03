import 'video_dto.dart';

class VideoResulDto {
  final int id;
  late final List<VideoDto> videos;

  VideoResulDto({required this.id, required this.videos});

  factory VideoResulDto.fromJson(Map<String, dynamic> json) {
    var videos = List<VideoDto>.empty(growable: true);
    if (json['results'] != null) {
      json['results'].forEach((v) {
        var _videoDto = VideoDto.fromJson(v);
        if (_isValidVideo(_videoDto)) {
          videos.add(VideoDto.fromJson(v));
        }
      });
    }

    return VideoResulDto(id: json['id'], videos: videos);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['results'] = videos.map((v) => v.toJson()).toList();
    return data;
  }
}

bool _isValidVideo(VideoDto videoDto) {
  return videoDto.key.isNotEmpty &&
      videoDto.name.isNotEmpty &&
      videoDto.type.isNotEmpty;
}
