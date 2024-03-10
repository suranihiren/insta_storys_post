

// import 'package:advstory/advstory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story/story.dart';
import 'package:uidemo1/data/ItemList.dart';

import 'package:uidemo1/global_widget/appbar_global.dart';

import 'package:uidemo1/global_widget/nav_model.dart';
import 'package:uidemo1/global_widget/textfield_global.dart';
import 'package:uidemo1/my_story_view.dart';
import 'package:uidemo1/nav_bar.dart';

class HomeScreen  extends StatefulWidget {
  const HomeScreen ({super.key});

  @override
  State<HomeScreen > createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen >  with TickerProviderStateMixin {
  final homeNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  final menuNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  late TabController tabControllerTo;
  bool selectedLike = false;
 List imagesUrl = ['https://static.desygner.com/wp-content/uploads/sites/13/2022/05/04141642/Free-Stock-Photos-01.jpg'];
  List<NavModel> items = [];




@override
  void initState() {
    // TODO: implement initState

  tabControllerTo = TabController(
    length: 4,
    vsync: this,
  );


  items = [
    NavModel(
      page: const TabPage(tab: 1),
      navKey: homeNavKey,
    ),
    NavModel(
      page: const TabPage(tab: 2),
      navKey: searchNavKey,
    ),
    NavModel(
      page: const TabPage(tab: 3),
      navKey: notificationNavKey,
    ),
    NavModel(
      page: const TabPage(tab: 4),
      navKey: profileNavKey,
    ),
    NavModel(
      page: const TabPage(tab: 5),
      navKey: menuNavKey,
    ),
  ];
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white,

        bottomNavigationBar: NavBar(pageIndex: selectedTab, onTap: (index) {
          if (index == selectedTab) {
            items[index]
                .navKey
                .currentState
                ?.popUntil((route) => route.isFirst);
          } else {
            setState(() {
              selectedTab = index;
            });
          }
        },),
      body:

      Column(
        children: [
         appbarThad(title: "Sunita's",title2: "MAKERSPACE",context: context,icon1: Icons.add,icon2: Icons.add_box_outlined,iconColor1: Colors.black,iconColor2: Colors.black,textColor: Colors.indigo,),
Padding(
  padding: const EdgeInsets.only(top: 5),
  child: SizedBox(
    height: 100,
    // width: 100,
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...myitem.map((e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyStoryView(currentStoryIndex: myitem.indexOf(e),);
                },));
              },
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(e['pi']),),
            ),
          ))
        ],
      ),
    )
  ),
)
       /*   Padding(
            padding:  EdgeInsets.only(top: 15),
            child: Stories(
              displayProgress: true,
              showStoryName: false,
              autoPlayDuration: Duration(milliseconds: 30),

              storyItemList: [

                // First group of stories
                StoryItem(
                    name: "",
                    thumbnail: AssetImage(
                      "images/8e9e1960-5745-44c6-8bb5-663087e57f67.jpg",
                    ),
                    stories: [
                      // First story
                      Scaffold(
                        body: Container(color: Colors.deepOrangeAccent,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "images/8e9e1960-5745-44c6-8bb5-663087e57f67.jpg",
                              ),
                            ),
                          ),
                          child: Center(
                            child: textoutfit(color: Colors.black,text: " first screen "),
                          ),
                        ),
                      ),
                      // Second story in first group
                      Scaffold(
                        body:Center(
                          child: textoutfit(color: Colors.black,text: " first screen "),
                        ),
                      ),
                    ]),
                // Second story group
                StoryItem(
                  name: "",
                  thumbnail: AssetImage(
                    "images/Cute Baby Monkey D_ Luffy Autumn_Fall Wallpaper.jpg",
                  ),
                  stories: [
                    Scaffold(
                      body: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "images/Cute Baby Monkey D_ Luffy Autumn_Fall Wallpaper.jpg",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Scaffold(
                      body: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "images/Cute Baby Monkey D_ Luffy Autumn_Fall Wallpaper.jpg",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                StoryItem(
                  name: "",
                  thumbnail: AssetImage(
                    "images/Cute Baby Monkey D_ Luffy Autumn_Fall Wallpaper (2).jpg",
                  ),
                  stories: [
                    Scaffold(
                      body: Center(
                        child: Text(
                          "That's it, Folks !",
                          style: TextStyle(
                            color: Color(0xff777777),
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // First group of stories
                StoryItem(
                    name: "",
                    thumbnail: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbsdDUaGXEWI5JoyK1Eukz_Cn5bf0ITe7rGw&usqp=CAU",
                    ),
                    stories: [
                      // First story
                      Scaffold(
                        body: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbsdDUaGXEWI5JoyK1Eukz_Cn5bf0ITe7rGw&usqp=CAU",
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Second story in first group
                      Scaffold(
                        body:Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://cdn.pixabay.com/photo/2014/08/24/19/01/apps-426559_640.jpg",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                // Second story group
                StoryItem(
                  name: "",
                  thumbnail: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTY_bsrlJdndvor6qeibgEJmF8u87IWgvkj8PtsAEUztaHk3XeJpJSkmca0QVcGze3DNUk&usqp=CAU",
                  ),
                  stories: [
                    Scaffold(
                      body: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTY_bsrlJdndvor6qeibgEJmF8u87IWgvkj8PtsAEUztaHk3XeJpJSkmca0QVcGze3DNUk&usqp=CAU",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Scaffold(
                      body: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://cdn.pixabay.com/photo/2014/08/24/19/01/apps-426559_640.jpg",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                StoryItem(
                  name: "",
                  thumbnail: NetworkImage(
                    "https://insertface.com/fb/726/beautiful-nature-scenery-725675-m32t6-fb.jpg",
                  ),
                  stories: [
                    Scaffold(
                      body: Center(
                        child: Text(
                          "That's it, Folks !",
                          style: TextStyle(
                            color: Color(0xff777777),
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),*/
          ,SizedBox(
            height: 50,
            width: double.maxFinite,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal ,
              child: TabBar(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabControllerTo,
                  isScrollable: true,
                  labelColor:Colors.indigo,
                  tabAlignment: TabAlignment.center,
                  unselectedLabelColor: Colors.indigo,
                  labelStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w700),
                  dividerColor: Colors.indigo,
                  indicator: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.indigo, width: 2))),
                  tabs: const [
                    Tab(text: "  SM Space  ",),
                    Tab(text: " Competitions ",),
                    Tab(text: " Mentors ",),
                    Tab(text: " ScheaSAsASA ",),
                  ]),
            ),
          ),
Flexible(
  child: SizedBox(
    child:TabBarView(
        physics: AlwaysScrollableScrollPhysics(),
        controller:tabControllerTo,
        children: [
  SizedBox(
    child: Column(
    children: [
      Row(
        children: [Padding(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.05,
            width: MediaQuery.of(context).size.height*0.05,
            child: CircleAvatar(
              backgroundImage:AssetImage('images/person.jpg'),
            ),
          ),
        ),Column(
          children: [
            textoutfit(color: Colors.black,text: "Prince Gupta",fontSize: 15,fontWeight: FontWeight.w600),
            textoutfit(color: Colors.grey,text: "prince_gupta"),
          ],
        ),
          Spacer(),
          PopupMenuButton(icon: const Icon(
              Icons.more_vert, color: Colors.black),
            itemBuilder: (ctx) =>
            [
              _buildPopupMenuItem('Search'),
              _buildPopupMenuItem('Upload'),
              _buildPopupMenuItem('Copy'),
              _buildPopupMenuItem('Exit'),
            ],
          )

        ],
      ),
      Flexible(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/post.png"),fit: BoxFit.fill)
          ),
        ),
      ),
       Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 2,left: 25,top: 10),
            child: GestureDetector(onTap: () {
              setState(() {
                selectedLike =! selectedLike;
              });
            },child: Icon(selectedLike ?Icons.favorite:Icons.favorite_border,color:selectedLike ? Colors.red:Colors.grey,size: 25,)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2,left: 8,top: 10),
            child: textoutfit(color: Colors.grey,text:"215 Likes",fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2,left: 20,top: 10),
            child: Icon(Icons.chat_bubble_outline,color: Colors.grey,size: 25,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2,left: 8,top: 10),
            child: textoutfit(color: Colors.grey,text:"215 comments",fontSize: 15),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(Icons.share,color: Colors.grey,size: 25,),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: textoutfit(color: Colors.black87,text: "Once Brahma divided sugarcane among his sons and each of them ate his share, but the Kumhara who was greatly absorbed in his work, forgot to eat. The piece which he had kept near his clay lump struck root and soon grew into a sugarcane plant. A few days later, when Brahma asked his sons for sugarcane, none of them could give it to him, excepting the Kumhara who offered a full plant. Brahma was pleased by the devotion of the potter to his work and awarded",fontSize: 15),
      )

    ],
  ),),
          SizedBox(
            child: Column(
              children: [
                Row(
                  children: [Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.05,
                      width: MediaQuery.of(context).size.height*0.05,
                      child: CircleAvatar(
                        backgroundImage:AssetImage('images/person.jpg'),
                      ),
                    ),
                  ),Column(
                    children: [
                      textoutfit(color: Colors.black,text: "Prince Gupta",fontSize: 15,fontWeight: FontWeight.w600),
                      textoutfit(color: Colors.grey,text: "prince_gupta"),
                    ],
                  ),
                    Spacer(),
                    PopupMenuButton(icon: const Icon(
                        Icons.more_vert, color: Colors.black),
                      itemBuilder: (ctx) =>
                      [
                        _buildPopupMenuItem('Search'),
                        _buildPopupMenuItem('Upload'),
                        _buildPopupMenuItem('Copy'),
                        _buildPopupMenuItem('Exit'),
                      ],
                    )

                  ],
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/post.png"),fit: BoxFit.fill)
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 2,left: 25,top: 10),
                      child: Icon(Icons.favorite_border,color: Colors.grey,size: 25,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 2,left: 8,top: 10),
                      child: textoutfit(color: Colors.grey,text:"215 Likes",fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 2,left: 20,top: 10),
                      child: Icon(Icons.chat_bubble_outline,color: Colors.grey,size: 25,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 2,left: 8,top: 10),
                      child: textoutfit(color: Colors.grey,text:"215 comments",fontSize: 15),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(Icons.share,color: Colors.grey,size: 25,),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textoutfit(color: Colors.black87,text: "Once Brahma divided sugarcane among his sons and each of them ate his share, but the Kumhara who was greatly absorbed in his work, forgot to eat. The piece which he had kept near his clay lump struck root and soon grew into a sugarcane plant. A few days later, when Brahma asked his sons for sugarcane, none of them could give it to him, excepting the Kumhara who offered a full plant. Brahma was pleased by the devotion of the potter to his work and awarded",fontSize: 15),
                )

              ],
            ),),
          SizedBox(
            child: Column(
              children: [
                Row(
                  children: [Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.05,
                      width: MediaQuery.of(context).size.height*0.05,
                      child: CircleAvatar(
                        backgroundImage:AssetImage('images/person.jpg'),
                      ),
                    ),
                  ),Column(
                    children: [
                      textoutfit(color: Colors.black,text: "Prince Gupta",fontSize: 15,fontWeight: FontWeight.w600),
                      textoutfit(color: Colors.grey,text: "prince_gupta"),
                    ],
                  ),
                    Spacer(),
                    PopupMenuButton(icon: const Icon(
                        Icons.more_vert, color: Colors.black),
                      itemBuilder: (ctx) =>
                      [
                        _buildPopupMenuItem('Search'),
                        _buildPopupMenuItem('Upload'),
                        _buildPopupMenuItem('Copy'),
                        _buildPopupMenuItem('Exit'),
                      ],
                    )

                  ],
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/post.png"),fit: BoxFit.fill)
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 2,left: 25,top: 10),
                      child: Icon(Icons.favorite_border,color: Colors.grey,size: 25,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 2,left: 8,top: 10),
                      child: textoutfit(color: Colors.grey,text:"215 Likes",fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 2,left: 20,top: 10),
                      child: Icon(Icons.chat_bubble_outline,color: Colors.grey,size: 25,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 2,left: 8,top: 10),
                      child: textoutfit(color: Colors.grey,text:"215 comments",fontSize: 15),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(Icons.share,color: Colors.grey,size: 25,),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textoutfit(color: Colors.black87,text: "Once Brahma divided sugarcane among his sons and each of them ate his share, but the Kumhara who was greatly absorbed in his work, forgot to eat. The piece which he had kept near his clay lump struck root and soon grew into a sugarcane plant. A few days later, when Brahma asked his sons for sugarcane, none of them could give it to him, excepting the Kumhara who offered a full plant. Brahma was pleased by the devotion of the potter to his work and awarded",fontSize: 15),
                )

              ],
            ),),
          SizedBox(
            child: Column(
              children: [
                Row(
                  children: [Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.05,
                      width: MediaQuery.of(context).size.height*0.05,
                      child: CircleAvatar(
                        backgroundImage:AssetImage('images/person.jpg'),
                      ),
                    ),
                  ),Column(
                    children: [
                      textoutfit(color: Colors.black,text: "Prince Gupta",fontSize: 15,fontWeight: FontWeight.w600),
                      textoutfit(color: Colors.grey,text: "prince_gupta"),
                    ],
                  ),
                    Spacer(),
                    PopupMenuButton(icon: const Icon(
                        Icons.more_vert, color: Colors.black),
                      itemBuilder: (ctx) =>
                      [
                        _buildPopupMenuItem('Search'),
                        _buildPopupMenuItem('Upload'),
                        _buildPopupMenuItem('Copy'),
                        _buildPopupMenuItem('Exit'),
                      ],
                    )

                  ],
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/post.png"),fit: BoxFit.fill)
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 2,left: 25,top: 10),
                      child: Icon(Icons.favorite_border,color: Colors.grey,size: 25,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 2,left: 8,top: 10),
                      child: textoutfit(color: Colors.grey,text:"215 Likes",fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 2,left: 20,top: 10),
                      child: Icon(Icons.chat_bubble_outline,color: Colors.grey,size: 25,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 2,left: 8,top: 10),
                      child: textoutfit(color: Colors.grey,text:"215 comments",fontSize: 15),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(Icons.share,color: Colors.grey,size: 25,),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textoutfit(color: Colors.black87,text: "Once Brahma divided sugarcane among his sons and each of them ate his share, but the Kumhara who was greatly absorbed in his work, forgot to eat. The piece which he had kept near his clay lump struck root and soon grew into a sugarcane plant. A few days later, when Brahma asked his sons for sugarcane, none of them could give it to him, excepting the Kumhara who offered a full plant. Brahma was pleased by the devotion of the potter to his work and awarded",fontSize: 15),
                )

              ],
            ),),
    ]),
  ),
),

        ],
      ),
      ),
    );
  }
}
PopupMenuItem _buildPopupMenuItem(String title) {
  return PopupMenuItem(
    child: Text(title),
  );
}
class TabPage extends StatelessWidget {
  final int tab;

  const TabPage({Key? key, required this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab $tab')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tab $tab'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Page(tab: tab),
                  ),
                );
              },
              child: const Text('Go to page'),
            )
          ],
        ),
      ),
    );
  }
}
class Page extends StatelessWidget {
  final int tab;

  const Page({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Tab $tab')),
      body: Center(child: Text('Tab $tab')),
    );
  }
}