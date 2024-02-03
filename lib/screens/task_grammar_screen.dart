import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TaskGrammarScreen extends StatefulWidget {
  const TaskGrammarScreen({super.key});
  @override
  State<TaskGrammarScreen> createState() => _GrammarScreenState();
}

enum TtsState { playing, stopped, paused, continued }

class _GrammarScreenState extends State<TaskGrammarScreen> {
  late FlutterTts flutterTts;
  String language = "en-US";
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;
  String text = "This is my puzzle";

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;

  get isPaused => ttsState == TtsState.paused;

  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;

  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  bool get isWindows => !kIsWeb && Platform.isWindows;

  bool get isWeb => kIsWeb;

  @override
  void initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    if (isAndroid) {
      flutterTts.setInitHandler(() {
        setState(() {
          print("TTS Initialized");
        });
      });
    }

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setPauseHandler(() {
      setState(() {
        print("Paused");
        ttsState = TtsState.paused;
      });
    });

    flutterTts.setContinueHandler(() {
      setState(() {
        print("Continued");
        ttsState = TtsState.continued;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future _speak() async {
    await flutterTts.setLanguage(language);
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    await flutterTts.speak(text);
  }

  Future _speakSlower() async {
    await flutterTts.setLanguage(language);
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(0.2);
    await flutterTts.setPitch(pitch);
    await flutterTts.speak(text);
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Grammar",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.teal[400],
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://images.careerviet.vn/content/images/1-1(2).jpg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: Stack(alignment: Alignment.center, children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/background.png"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 90,
                            child: Text(text,
                                style: const TextStyle(
                                    color: Colors.teal,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                        const Positioned(
                            top: 150,
                            child: Text(
                              'Đây là câu đố của tôi',
                              style:
                              TextStyle(color: Colors.teal, fontSize: 16),
                            )),
                        Positioned(
                            bottom: 20,
                            child: Row(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: IconButton(
                                      onPressed: () => _speakSlower(),
                                      icon: const Icon(
                                        Icons.record_voice_over,
                                        color: Colors.teal,
                                        size: 30,
                                      )),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: IconButton(
                                      onPressed: () => _speak(),
                                      icon: const Icon(Icons.volume_up_rounded,
                                          color: Colors.teal, size: 30)),
                                )
                              ],
                            ))
                      ]))
                ],
              ),
            )));
  }
}