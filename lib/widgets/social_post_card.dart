import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'customfont.dart';

class SocialPostCard extends StatelessWidget {
  final String userName;
  final String userImage;
  final String postImage;
  final String content;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const SocialPostCard({
    super.key,
    required this.userName,
    required this.userImage,
    required this.postImage,
    required this.content,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
              backgroundColor: Colors.grey[300],
            ),
            title: CustomFont(
              text: userName,
              fontSize: 16.sp,
              color: Colors.black,
              fontFamily: 'Klavika',
            ),
            subtitle: Text("October 11"),
            trailing: Icon(Icons.more_horiz),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              content,
              style: TextStyle(fontSize: 14.sp),
            ),
          ),

          // Post image
          Container(
            height: 250.h,
            color: Colors.grey[200],
            child: postImage.isEmpty
                ? Center(child: Icon(Icons.image, size: 50))
                : Image.network(postImage, fit: BoxFit.cover),
          ),

          // Reaction counts
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Row(
              children: [
                Text("177 Likes"),
                SizedBox(width: 16.w),
                Text("42 Comments"),
                SizedBox(width: 16.w),
                Text("5 Shares"),
              ],
            ),
          ),

          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.thumb_up_alt_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.comment_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.share_outlined),
                onPressed: () {},
              ),
               IconButton(
              icon: Icon(Icons.edit),
                onPressed: onEdit,
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: onDelete,
              ),
            ],
          ),

          // Comment input
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(userImage),
                  backgroundColor: Colors.grey[300],
                  radius: 18.r,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey[200],
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
