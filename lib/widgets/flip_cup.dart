import 'package:flutter/material.dart';

class FlipCup extends StatefulWidget {
  final bool isFlipped;

  const FlipCup({super.key, required this.isFlipped});

  @override
  State<FlipCup> createState() => _FlipCupState();
}

class _FlipCupState extends State<FlipCup> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _animation = Tween<double>(begin: 0, end: 3.14).animate(_controller);

    // başlangıçta tersse direkt oynat
    if (widget.isFlipped) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void didUpdateWidget(covariant FlipCup oldWidget) {
    super.didUpdateWidget(oldWidget);

    final current = widget.isFlipped;
    final previous = oldWidget.isFlipped;

    if (current != previous) {
      if (current) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final String imagePath = widget.isFlipped
            ? 'lib/assets/images/ters_fincan.png'
            : 'lib/assets/images/duz_fincan.png';

        final imageWidget = Image.asset(imagePath, height: 150);

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationX(_animation.value),
          child: widget.isFlipped
              ? Transform.rotate(
                  angle: 3.1416, // π = 180 derece
                  child: imageWidget,
                )
              : imageWidget,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
