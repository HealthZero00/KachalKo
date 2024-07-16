import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Spina extends StatefulWidget {
  const Spina({super.key});
  @override
  State<Spina> createState() => _SpinaState();
}
String exercises = '''
1.Подтягивания
Выполнение: Повисните на перекладине с хватом шире плеч. Подтяните тело вверх, подтягивая подбородок к перекладине. Медленно опуститесь в исходное положение.

2.Тяга гантели к поясу в наклоне
Выполнение: Поставьте одну ногу и руку на скамью, другая нога на полу, гантель в свободной руке. Наклонитесь вперед, спина прямая. Подтяните гантель к поясу, локоть двигается близко к телу. Медленно опустите гантель в исходное положение.

3.Тяга штанги в наклоне
Выполнение: Встаньте, ноги на ширине плеч, возьмитесь за штангу прямым хватом. Наклонитесь вперед, спина прямая, штанга свисает. Подтяните штангу к поясу, локти идут вдоль тела. Медленно опустите штангу в исходное положение.

4.Тяга верхнего блока к груди
Выполнение: Сядьте на тренажер, закрепите ноги под упорами. Возьмитесь за рукоятку широким хватом. Тяните рукоятку вниз к груди, сводя лопатки. Медленно верните рукоятку в исходное положение.

5.Тяга блока за голову
Выполнение: Сядьте на тренажер, закрепите ноги под упорами. Возьмитесь за рукоятку широким хватом. Тяните рукоятку вниз за голову. Медленно верните рукоятку в исходное положение.
''';

class _SpinaState extends State<Spina> {

  final videoURL = "https://www.youtube.com/watch?v=PIyIztPur5A";
  late  YoutubePlayerController _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);

    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: YoutubePlayerFlags(
            autoPlay: false
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xff006363),
          appBar: AppBar(
            backgroundColor: Color(0xff1D7373),
            title: Text(
              "KachalKo",
              style: TextStyle(fontSize: 24, color: Color(0xffFFAA00)),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child:
                Column(
                  children: [
                    Image.asset("assets/images/zitata4.jpg",),
                    Padding(padding: EdgeInsets.all(15)),
                    Text(exercises, style: TextStyle(
                        height: 1.1 ,
                        color: Color(0xffFFAA00),
                        fontSize: 24
                    ),),
                    YoutubePlayer(controller: _controller,
                      showVideoProgressIndicator: true,
                      onReady:() => debugPrint("Ready"),
                      bottomActions: [
                        CurrentPosition(),
                        ProgressBar(
                          isExpanded: true,
                          colors: ProgressBarColors(
                              playedColor: Colors.amber,
                              handleColor: Colors.amberAccent
                          ),
                        ),
                        PlaybackSpeedButton(),
                      ],)
                  ],
                ),
              )
          )
      ),
    );
  }
}
