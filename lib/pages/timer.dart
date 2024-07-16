import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

void main() => runApp(const TTimer());

class TTimer extends StatelessWidget {
  const TTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Circular Countdown Timer Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const TimerCount(title: 'Circular Countdown Timer'),
    );
  }
}

class TimerCount extends StatefulWidget {
  const TimerCount({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<TimerCount> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TimerCount> {
  final int _duration = 999;
  final CountDownController _controller = CountDownController();

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
        body: Center(
          child: GestureDetector(
            onTap: () {
              if (_controller.isPaused) {
                _controller.resume();
              } else {
                _controller.start();
              }
            },
            child: CircularCountDownTimer(
              duration: _duration,
              initialDuration: 0,
              controller: _controller,
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              ringColor: Color(0xff1D7373),
              ringGradient: null,
              fillColor: Color(0xffFFAA00),
              fillGradient: null,
              backgroundColor: Color(0xff006363),
              backgroundGradient: null,
              strokeWidth: 20.0,
              strokeCap: StrokeCap.round,
              textStyle: const TextStyle(
                fontSize: 33.0,
                color: Color(0xffFFAA00),
                fontWeight: FontWeight.bold,
              ),
              textFormat: CountdownTextFormat.MM_SS,
              isReverse: false,
              isReverseAnimation: false,
              isTimerTextShown: true,
              autoStart: false,
              onStart: () {
                debugPrint('Countdown Started');
              },
              onComplete: () {
                debugPrint('Countdown Ended');
              },
              onChange: (String timeStamp) {
                debugPrint('Countdown Changed $timeStamp');
              },
              timeFormatterFunction: (defaultFormatterFunction, duration) {
                if (duration.inSeconds == 0) {
                  return "Старт";
                } else if (duration.inSeconds >= 60) {
                  return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
                } else {
                  return Function.apply(defaultFormatterFunction, [duration]);
                }
              },
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 30),
            _iconButton(
              icon: Icons.play_arrow,
              onPressed: () => _controller.resume(),
              tooltip: 'Возобновить',
            ),
            const SizedBox(width: 10),
            _iconButton(
              icon: Icons.pause,
              onPressed: () => _controller.pause(),
              tooltip: 'Пауза',
            ),
            const SizedBox(width: 10),
            _iconButton(
              icon: Icons.refresh,
              onPressed: () => _controller.start(),
              tooltip: 'Перезапуск',
            ),
            const SizedBox(width: 10),
            _iconButton(
              icon: Icons.stop,
              onPressed: () => _controller.reset(),
              tooltip: 'Сброс',
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconButton({required IconData icon, required VoidCallback onPressed, required String tooltip}) {
    return IconButton(
      icon: Icon(icon, color: Color(0xffFFAA00)),
      onPressed: onPressed,
      tooltip: tooltip,
      color: Color(0xffFFAA00),
    );
  }
}
