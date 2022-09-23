import 'package:clothus/constant.dart';
import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {
  final Function() press;
  final Color color;
  final String text;
  const PrimaryButton({
    Key? key,
    required this.press,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: ColorConstant.bgColor,
            ),
          ),
        ),
      ),
    );
  }
}
