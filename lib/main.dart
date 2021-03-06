import 'package:ffmpegtest/Helpers/asset_to_file.dart';
import 'package:ffmpegtest/Provider/data_provider.dart';
import 'package:ffmpegtest/Provider/ffmpeg_provider.dart';
import 'package:ffmpegtest/Provider/gallery_provider.dart';
import 'package:ffmpegtest/Provider/player_provider.dart';
import 'package:ffmpegtest/Provider/record_provider.dart';
import 'package:ffmpegtest/Provider/upload_provider.dart';
import 'package:ffmpegtest/Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final splashVideo = await assetToFile(assetPath: 'assets/Videos/splash.mp4');
  runApp(MyApp(splashVideo));
}

class MyApp extends StatelessWidget {
  final splashVideo;
  MyApp(this.splashVideo);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
        ChangeNotifierProvider(create: (_) => RecordProvider()),
        ChangeNotifierProvider(create: (_) => UploadProvider()),
        ChangeNotifierProvider(create: (_) => GalleryProvider()),
        ChangeNotifierProvider(create: (_) => PlayerProvider()),
        ChangeNotifierProvider(create: (_) => FfmpegProvider())
      ],
      child: MaterialApp(
        title: 'كن معرفا برسول الله ',
        home: SplashScreen(splashVideo),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'NeoSansArabic'),
      ),
    );
  }
}
