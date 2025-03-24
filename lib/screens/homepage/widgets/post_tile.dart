import 'package:empher/constants/beauty_texts.dart';
import 'package:empher/models/post.dart';
import 'package:empher/screens/homepage/widgets/post_buttons.dart';
import 'package:empher/screens/homepage/widgets/post_verification_pill.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final Post post;
  const PostTile({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                maxRadius: 20,
                minRadius: 20,
                backgroundImage: AssetImage("assets/images/homer.png"),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Homer Girl",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(width: 5),
                      Icon(Icons.shield, color: Colors.white70, size: 17),
                      SizedBox(width: 5),
                      Text("•"),
                      SizedBox(width: 5),
                      Text(
                        "Follow",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 77, 190, 224)),
                      ),
                    ],
                  ),
                  Text("Posted ${beautyDate(post.postTime)}"),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                post.title,
                style: TextStyle(color: Colors.white, fontSize: 16.5),
              ),
              PostVerificationPill(
                  aiFactCheck: post.aiFactCheck ?? AIFactCheck.unverified)
            ],
          ),
          SizedBox(height: 2),
          Text(
            post.description ?? '',
            style: TextStyle(
              color: Colors.white.withAlpha(200),
            ),
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PostButton(
                  buttonWork: ButtonWork.upvote,
                  onTap: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Upvote", style: TextStyle(color: Colors.white)),
                        SizedBox(width: 7.5),
                        Icon(
                          Icons.arrow_upward_outlined,
                          size: 20.0,
                          color: Colors.white,
                        )
                      ]),
                ),
                PostButton(
                    buttonWork: ButtonWork.downvote,
                    onTap: () {},
                    child: Icon(Icons.arrow_downward_outlined,
                        size: 20.0,
                        color: Colors.white.withValues(alpha: 0.9))),
                SizedBox(width: 20),
                IconButton(
                  onPressed: () {},
                  icon: Row(
                    children: [
                      Icon(Icons.comment,
                          color: Colors.white.withValues(alpha: 0.9)),
                      SizedBox(width: 5),
                      Text(
                        "169",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withValues(alpha: 0.8)),
                      ),
                    ],
                  ),
                  iconSize: 25,
                  padding: EdgeInsets.zero,
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: Row(
                    children: [
                      Icon(Icons.share,
                          color: Colors.white.withValues(alpha: 0.7)),
                      SizedBox(width: 5),
                    ],
                  ),
                  iconSize: 25,
                  padding: EdgeInsets.zero,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                    vertical: 2.5, horizontal: 10.0)),
                            minimumSize: WidgetStatePropertyAll(Size(0, 0)),
                            backgroundColor: WidgetStatePropertyAll(
                                const Color.fromARGB(255, 216, 18, 4)),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Report",
                              style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.7)),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.report_problem_outlined,
                              color: Colors.white.withValues(alpha: 0.7),
                            )
                          ],
                        )),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}
