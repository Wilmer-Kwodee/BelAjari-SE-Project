import 'package:flutter/material.dart';
import 'package:flutter_app_testing/backend/model/user/tutor.dart';
import 'package:flutter_app_testing/backend/model/user/User.dart';
import 'package:flutter_app_testing/screens/components/search/tutor/certificate_carousel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:video_player/video_player.dart';

class TutorProfile extends StatelessWidget {
  final Tutor tutor;
  final User user;

  TutorProfile({required this.tutor, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.pictureUrl),
              ),
              SizedBox(height: 16),
              // User Name
              Text(
                user.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // Introduction Video
              if (tutor.introductionVideoUrl != "")
                Card(
                  elevation: 4,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: VideoPlayerWidget(
                        videoUrl: tutor.introductionVideoUrl!),
                  ),
                ),
              SizedBox(height: 16),
              // CV
              if (tutor.cvUrl != null)
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.description),
                    title: Text(
                      'CV',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      launchUrl(Uri.parse(tutor.cvUrl));
                    },
                  ),
                ),
              SizedBox(height: 16),
              // Certificate Carousel
              if (tutor.certificateUrls != null &&
                  tutor.certificateUrls!.isNotEmpty)
                Card(
                  elevation: 4,
                  child: CertificateCarousel(
                    certificateUrls: tutor.certificateUrls,
                  ),
                ),
              SizedBox(height: 16),
              // Services
              if (tutor.serviceIds != null && tutor.serviceIds!.isNotEmpty)
                Card(
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Services:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ...tutor.serviceIds!
                          .map((id) => ListTile(
                                title: Text(id),
                                leading: Icon(Icons.check),
                              ))
                          .toList(),
                    ],
                  ),
                ),
              SizedBox(height: 16),
              // Phone Number
              Card(
                elevation: 4,
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(
                    'Phone Number: ${tutor.phoneNumber}',
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {
                    launch("tel://${tutor.phoneNumber}");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageOrVideoWidget extends StatelessWidget {
  final String title;
  final String url;

  ImageOrVideoWidget({required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  VideoPlayerWidget({required this.videoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_controller.value.isPlaying) {
            _controller.pause();
            _isPlaying = false;
          } else {
            _controller.play();
            _isPlaying = true;
          }
        });
      },
      child: _controller.value.isInitialized
          ? Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                if (!_controller.value.isPlaying && !_isPlaying)
                  Icon(Icons.play_arrow, size: 50),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: Icon(Icons.fullscreen, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenVideoPlayer(
                            videoUrl: widget.videoUrl,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          : CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class FullScreenVideoPlayer extends StatefulWidget {
  final String videoUrl;

  FullScreenVideoPlayer({required this.videoUrl});

  @override
  _FullScreenVideoPlayerState createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _isPlaying = true;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  if (!_controller.value.isPlaying)
                    IconButton(
                      icon:
                          Icon(Icons.play_arrow, size: 50, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          _controller.play();
                          _isPlaying = true;
                        });
                      },
                    ),
                  Positioned(
                    top: 40,
                    right: 20,
                    child: IconButton(
                      icon: Icon(Icons.fullscreen_exit, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
