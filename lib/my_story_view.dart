import 'package:flutter/material.dart';
import 'package:story/story.dart';
import 'package:uidemo1/data/ItemList.dart';

class MyStoryView extends StatefulWidget {
  const MyStoryView( {super.key,required this.currentStoryIndex});
  final int currentStoryIndex;

  @override
  State<MyStoryView> createState() => _MyStoryViewState();
}

class _MyStoryViewState extends State<MyStoryView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StoryPageView(
          indicatorPadding: EdgeInsets.zero,
          initialPage: widget.currentStoryIndex,
          itemBuilder: (context, pageIndex, storyIndex) {
            print("pageImage = ${pageIndex},storyIndex = $storyIndex ");
            return Container(
              padding: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color:Colors.indigo,
                  image: DecorationImage(image: AssetImage(myitem[pageIndex]['storys'][storyIndex]),fit: BoxFit.cover)
              ),
            );
          },
          storyLength: (int pageIndex) {
            return myitem[pageIndex]['storys'].length;
          },
          pageLength: myitem.length,
        ),
      ),
    );
  }
}
