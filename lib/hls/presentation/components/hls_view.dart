import 'package:flutter/widgets.dart';
import 'package:flutter_hls_video_player/flutter_hls_video_player/controller/flutter_hls_video_player_controller.dart';
import 'package:flutter_hls_video_player/flutter_hls_video_player/view/flutter_hls_video_player.dart';

class HlsView extends StatefulWidget {
  const HlsView({
    required this.videoUrl,
    required this.width,
    required this.height,
    super.key,
  });

  final double height;
  final double width;
  final String videoUrl;

  @override
  State<HlsView> createState() => _HlsViewState();
}

class _HlsViewState extends State<HlsView> {
  FlutterHLSVideoPlayerController flutterHLSVideoPlayerController =
      FlutterHLSVideoPlayerController();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), _playVideo);
    super.initState();
  }

  Future<void> _playVideo() async {
    await flutterHLSVideoPlayerController.loadHlsVideo(widget.videoUrl);
    await flutterHLSVideoPlayerController.play();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ClipRect(
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: widget.width,
            child: FlutterHLSVideoPlayer(
              controller: flutterHLSVideoPlayerController,
            ),
          ),
        ),
      ),
    );
  }
}
