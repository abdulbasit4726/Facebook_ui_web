import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';
import './widgets.dart';
import '../models/models.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  Stories({
    required this.currentUser,
    required this.stories,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(
                isAddStory: true,
                currentUser: currentUser,
              ),
            );
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(story: story),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final User? currentUser;
  final bool? isAddStory;
  final Story? story;

  _StoryCard({
    this.currentUser,
    this.isAddStory = false,
    this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: (isAddStory ?? false)
                ? (currentUser?.imageUrl ?? '')
                : (story?.imageUrl ?? ''),
            width: 110.0,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: Palette.storyGradient,
            boxShadow: Responsive.isDesktop(context)
                ? [
                    const BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 4.0,
                    ),
                  ]
                : null,
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: (isAddStory ?? false)
              ? Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    iconSize: 30.0,
                    color: Palette.facebookBlue,
                    onPressed: () => print('Add to Story'),
                    padding: EdgeInsets.zero,
                  ),
                )
              : ProfileAvatar(
                  imageUrl: (story?.user.imageUrl ?? ''),
                  hasBorder: !(story?.isViewed ?? false),
                ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            (isAddStory ?? false) ? 'Add to Story' : (story?.user.name ?? ''),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
