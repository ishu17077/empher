import 'package:empher/constants/colors.dart';
import 'package:flutter/material.dart';

enum ButtonWork { upvote, downvote }

class PostButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final ButtonWork buttonWork;
  const PostButton(
      {super.key,
      required this.child,
      required this.buttonWork,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(kButtonColor),
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.only(
              topLeft: buttonWork == ButtonWork.upvote
                  ? Radius.circular(20)
                  : Radius.zero,
              bottomLeft: buttonWork == ButtonWork.upvote
                  ? Radius.circular(20)
                  : Radius.zero,
              bottomRight: buttonWork == ButtonWork.downvote
                  ? Radius.circular(20)
                  : Radius.zero,
              topRight: buttonWork == ButtonWork.downvote
                  ? Radius.circular(20)
                  : Radius.zero,
            ))),
        elevation: WidgetStatePropertyAll(2.0),
        minimumSize: WidgetStatePropertyAll(Size(15, 15)),
      ),
      onPressed: onTap,
      child: Container(
        padding: EdgeInsets.only(
            left: buttonWork == ButtonWork.upvote ? 15.0 : 4.0,
            right: buttonWork == ButtonWork.downvote ? 10.0 : 4.0,
            top: 4.0,
            bottom: 4.0),
        decoration: BoxDecoration(
            // color: kButtonColor,
            border: Border(
              right: buttonWork == ButtonWork.downvote
                  ? BorderSide(color: Colors.white60, width: 2)
                  : BorderSide.none,
              left: BorderSide(color: Colors.white60, width: 2),
              top: BorderSide(color: Colors.white60, width: 2),
              bottom: BorderSide(color: Colors.white60, width: 2),
            ),
            borderRadius: BorderRadius.only(
              topLeft: buttonWork == ButtonWork.upvote
                  ? Radius.circular(20)
                  : Radius.zero,
              bottomLeft: buttonWork == ButtonWork.upvote
                  ? Radius.circular(20)
                  : Radius.zero,
              bottomRight: buttonWork == ButtonWork.downvote
                  ? Radius.circular(20)
                  : Radius.zero,
              topRight: buttonWork == ButtonWork.downvote
                  ? Radius.circular(20)
                  : Radius.zero,
            )),
        child: child,
      ),
    );
  }
}
