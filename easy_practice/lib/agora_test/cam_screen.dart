import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CamScreen extends StatefulWidget {
  const CamScreen({super.key});

  @override
  State<CamScreen> createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen> {
  RtcEngine? engine;
  String appId = '';
  String channelName = '';
  String token = '';
  int? uid = 0;
  int? remoteUid;

  Future<void> init() async {
    final resp = await [Permission.camera, Permission.microphone].request();

    final cameraPermission = resp[Permission.camera];
    final microphonePermission = resp[Permission.microphone];

    if (cameraPermission != PermissionStatus.granted ||
        microphonePermission != PermissionStatus.granted) {
      throw '카메라 또는 마이크 권한이 없습니다';
    }

    if (engine == null) {
      engine = createAgoraRtcEngine();

      await engine!.initialize(RtcEngineContext(
        appId: appId,
      ));

      engine!.registerEventHandler(RtcEngineEventHandler(
          onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
        setState(() {
          this.remoteUid = remoteUid;
        });
      }));

      await engine!.enableVideo();
      await engine!.stopPreview();

      ChannelMediaOptions options = const ChannelMediaOptions();
      await engine!.joinChannel(
        token: token,
        channelId: channelName,
        uid: uid!,
        options: options,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Live',
        ),
      ),
      body: FutureBuilder<void>(
          future: init(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }

            return Stack(
              children: [
                Container(
                  color: Colors.red,
                  child: remoteUid == null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : AgoraVideoView(
                          controller: VideoViewController.remote(
                            rtcEngine: engine!,
                            canvas: VideoCanvas(
                              uid: remoteUid!,
                            ),
                            connection: RtcConnection(
                              channelId: channelName,
                            ),
                          ),
                        ),
                ),
                Container(
                  width: 120,
                  height: 160,
                  color: Colors.blue,
                  child: AgoraVideoView(
                    controller: VideoViewController(
                      rtcEngine: engine!,
                      canvas: VideoCanvas(
                        uid: uid,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ElevatedButton(
                    onPressed: () {
                      engine!.leaveChannel();
                      engine!.release();
                    },
                    child: const Text(
                      '나가기',
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
