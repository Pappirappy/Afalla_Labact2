import 'package:flutter/material.dart';
import '../widgets/social_post_card.dart';
import '../models/post.dart'; // <- create this model file

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  List<Post> posts = [
    Post(
      userName: 'John Doe',
      userImage: 'https://picsum.photos/200/300?grayscale',
      postImage: 'https://picsum.photos/200/300/?blurs',
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi utLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut',
    ),
    Post(
      userName: 'Jane Smith',
      userImage: 'https://picsum.photos/id/237/200/300',
      postImage: 'https://picsum.photos/seed/picsum/200/300',
      content: 'liquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla',
    ),
  ];

  void addPost(Post newPost) {
    setState(() {
      posts.insert(0, newPost);
    });
  }

  void deletePost(int index) {
    setState(() {
      posts.removeAt(index);
    });
  }

  void editPost(int index, Post updatedPost) {
    setState(() {
      posts[index] = updatedPost;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return SocialPostCard(
          userName: post.userName,
          userImage: post.userImage,
          postImage: post.postImage,
          content: post.content,
          onDelete: () => deletePost(index),
         onEdit: () => showEditDialog(index),
        );
      },
    );
  }
  void showEditDialog(int index) {
  final TextEditingController contentController =
      TextEditingController(text: posts[index].content);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Edit Post'),
        content: TextField(
          controller: contentController,
          decoration: InputDecoration(
            labelText: 'Content',
          ),
          maxLines: null,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                posts[index] = Post(
                  userName: posts[index].userName,
                  userImage: posts[index].userImage,
                  postImage: posts[index].postImage,
                  content: contentController.text,
                );
              });
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  );
}

}
