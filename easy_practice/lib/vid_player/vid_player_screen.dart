import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VidPlayerScreen extends StatefulWidget {
  const VidPlayerScreen({super.key});

  @override
  State<VidPlayerScreen> createState() => _VidPlayerScreenState();
}

class _VidPlayerScreenState extends State<VidPlayerScreen> {
  bool isPicking = false;
  bool showIcons = true;
  XFile? video;

  void onLogoTap() async {
    if (isPicking) return;

    isPicking = true;
    try {
      final video = await ImagePicker().pickVideo(
        source: ImageSource.gallery,
      );
      setState(() {
        this.video = video;
      });
      // video를 사용하여 원하는 작업 수행
    } catch (e) {
      print("Error picking video: $e");
    } finally {
      isPicking = false; // 요청 완료 후 플래그 해제
    }
  }

  onSliderChanged(double val) {
    final position = Duration(seconds: val.toInt());

    // videoPlayerController.seekTo(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: video != null
          ? _VideoPlayer(
              video: video!,
              onLogoTap: onLogoTap,
              onSliderChanged: onSliderChanged,
              showIcons: showIcons)
          : _VideoSelector(
              onLogoTap: onLogoTap,
            ),
    );
  }
}

class _VideoSelector extends StatelessWidget {
  final VoidCallback onLogoTap;
  const _VideoSelector({super.key, required this.onLogoTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // stops: [0, 0.3],
          colors: [
            Colors.purple,
            Colors.black,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Logo(
            onTap: onLogoTap,
          ),
          const SizedBox(
            height: 20,
          ),
          const _Title(),
        ],
      ),
    );
  }
}

class _VideoPlayer extends StatefulWidget {
  final XFile video;
  final VoidCallback onLogoTap;
  bool showIcons;
  final ValueChanged<double> onSliderChanged;
  _VideoPlayer({
    super.key,
    required this.video,
    required this.onLogoTap,
    required this.onSliderChanged,
    required this.showIcons,
  });

  @override
  State<_VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<_VideoPlayer> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    initializeController();
  }

  initializeController() async {
    videoPlayerController = VideoPlayerController.file(
      File(
        widget.video.path,
      ),
    );

    await videoPlayerController.initialize();
    // videoPlayerController.addListener(() {
    //   setState(() {});
    // });
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant _VideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.video.path != widget.video.path) {
      initializeController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.showIcons = !widget.showIcons;
        });
      },
      child: Center(
        child: AspectRatio(
          aspectRatio: videoPlayerController.value.aspectRatio,
          child: Stack(
            children: [
              VideoPlayer(
                videoPlayerController,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        final currentPosition =
                            videoPlayerController.value.position;
                        Duration position = const Duration();
                        if (currentPosition.inSeconds > 3) {
                          position =
                              currentPosition - const Duration(seconds: 3);
                        }

                        videoPlayerController.seekTo(position);
                      },
                      icon: const Icon(Icons.rotate_left),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (videoPlayerController.value.isPlaying) {
                            videoPlayerController.pause();
                          } else {
                            videoPlayerController.play();
                          }
                          videoPlayerController.addListener(() {
                            setState(() {});
                          });
                        });
                      },
                      icon: Icon(videoPlayerController.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {
                        final maxPosition =
                            videoPlayerController.value.duration;
                        final currentPosition =
                            videoPlayerController.value.position;

                        Duration position = maxPosition;
                        if ((maxPosition - const Duration(seconds: 3))
                                .inSeconds >
                            currentPosition.inSeconds) {
                          position =
                              currentPosition + const Duration(seconds: 3);
                        }

                        videoPlayerController.seekTo(position);
                      },
                      icon: const Icon(Icons.rotate_right),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${videoPlayerController.value.position.inMinutes.toString().padLeft(2, '0')}:${(videoPlayerController.value.position.inSeconds % 60).toString().padLeft(
                              2,
                              '0',
                            )}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Slider(
                          value: videoPlayerController.value.position.inSeconds
                              .toDouble(),
                          max: videoPlayerController.value.duration.inSeconds
                              .toDouble(),
                          onChanged: widget.onSliderChanged,
                        ),
                      ),
                      Text(
                        '${videoPlayerController.value.duration.inMinutes.toString().padLeft(2, '0')}:${videoPlayerController.value.duration.inSeconds % 60}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  onPressed: widget.onLogoTap,
                  icon: const Icon(Icons.photo_camera_back),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontSize: 32, color: Colors.white, fontWeight: FontWeight.w300);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Video',
          style: textStyle,
        ),
        Text(
          'Player',
          style: textStyle.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _Logo extends StatelessWidget {
  final VoidCallback onTap;
  const _Logo({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'asset/img/logo.png',
      ),
    );
  }
}
