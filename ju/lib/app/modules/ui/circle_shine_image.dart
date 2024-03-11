import 'package:flutter/material.dart';

class CircleShineImage extends StatefulWidget {

  // 阴影最大值
  final double maxBlurRadius;

  // 阴影颜色
  final Color color;

  // 动画时长
  final Duration duration;

  // 动画曲线
  final Curve curve;

  // 图片
  final ImageProvider image;

  // 圆半径
  final double radius;

  const CircleShineImage(
      {Key? key,
        this.maxBlurRadius = 10,
        this.color = Colors.purple,
        this.duration = const Duration(milliseconds: 2000),
        this.curve = Curves.ease,
        this.radius = 30,
        required this.image})
      : super(key: key);

  @override
  State<CircleShineImage> createState() => _CircleShineImageState();
}

class _CircleShineImageState extends State<CircleShineImage> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    // 实例化动画控制器
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..addListener(() {
      setState(() {});
    });
    animation = Tween<double>(begin: 0, end: widget.maxBlurRadius).animate(
      CurvedAnimation(
        parent: animationController,
        curve: widget.curve,
      ),
    );
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.radius * 2,
      width: widget.radius * 2,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: widget.image,
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: widget.color,
            blurRadius: widget.maxBlurRadius,
          ),
        ],
      )
    );
  }
}
