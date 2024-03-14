// import 'package:advstory/advstory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:share_plus/share_plus.dart';

import 'package:uidemo1/data/ItemList.dart';

import 'package:uidemo1/global_widget/appbar_global.dart';

import 'package:uidemo1/global_widget/nav_model.dart';
import 'package:uidemo1/global_widget/textfield_global.dart';
import 'package:uidemo1/my_story_view.dart';

import 'package:uidemo1/text_List_data.dart';

import 'nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final homeNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  final menuNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  int _selectedTabbar = 0;
  late TabController tabControllerTo;
  bool selectedLike = false;
  // List imagesUrl = [
  //   'https://static.desygner.com/wp-content/uploads/sites/13/2022/05/04141642/Free-Stock-Photos-01.jpg'
  // ];
  List<PostModel> smSpaceList = [PostModel(profileImage: "images/8e9e1960-5745-44c6-8bb5-663087e57f67.jpg",description: "A tall and underweight, honey skinned woman with thoughtful, light brown eyes, thin eyebrows and large ears. She has coiled, dark brown hair, seems shy, and she has small feet, weak legs, and narrow hips.",chat:[],likes: 0,profilePost: "images/Naruto Uzumaki Wallpaper 4K (3).jpg",title: "Hiren",title2: "Hiren_Suarni",chatnumber: 0), PostModel(profileImage: "images/person.jpg",description: "a round chin, an aquiline nose and small ears. He is bald, wears sunglasses, and he has slanted shoulders, and a long torso with no chest muscle tone ",chat:[],likes: 0,profilePost: "images/8e9e1960-5745-44c6-8bb5-663087e57f67.jpg",title2: "Prince",title: "Prince_Rawal",chatnumber: 0)];
  List<PostModel> competitionsList = [PostModel(profileImage: "images/Chibi Blast_ Hero Suit Bakugou Artwork.jpg",description: "tall, pasty skinned woman with dark, dark green eyes, small ears and bony cheeks. She has straight, dark brown hair, has a realistic tattoo across her entire back, and she wears reddish blush and compli",chat:[],likes: 0,profilePost: "images/Cute Baby Monkey D_ Luffy Autumn_Fall Wallpaper.jpg",title: "Hiren",title2: "Hiren_Suarni",chatnumber: 0), PostModel(profileImage: "images/Cute Baby Monkey D_ Luffy Autumn_Fall Wallpaper.jpg",description: "hite skinned woman with alert, brown eyes, a softly shaped jaw, angular eyebrows, large ears and bony cheeks. She has curly, yellow-gold h",chat:[],likes: 0,profilePost: "images/Cute Baby Monkey D_ Luffy Autumn_Fall Wallpaper (1).jpg",title2: "Prince",title: "Prince_Rawal",chatnumber: 0)];
  List<PostModel> mentorsList = [PostModel(profileImage: "images/Cute Baby Monkey D_ Luffy Autumn_Fall Wallpaper (2).jpg",description: "tall, fair skinned man with mysterious, brown eyes, plucked eyebrows, a pointed nose, very thin lips and a square jaw. He has wavy, golde",chat:[],likes: 0,profilePost: "images/Cute Baby Naruto Autumn _ Fall 4K Wallpaper.jpg",title: "Hiren",title2: "Hiren_Suarni",chatnumber: 0), PostModel(profileImage: "images/Cute Baby Naruto Autumn _ Fall 4K Wallpaper.jpg",description: "der, orange skinned man with composed green eyes, puffy cheeks, thin lips and no eyebrows. He has coiled, black hair,",chat:[],likes: 0,profilePost: "images/Cute Baby Naruto Autumn _ Fall 4K Wallpaper (1).jpg",title2: "Prince",title: "Prince_Rawal",chatnumber: 0)];
  List<PostModel> searchList = [PostModel(profileImage: "images/f3041b90-f5b0-4bbd-b81a-d85e1e1f6c8b.jpg",description: "A short and average built, red skinned woman with steady, green eyes, a round chin and",chat:[],likes: 0,profilePost: "images/f3041b90-f5b0-4bbd-b81a-d85e1e1f6c8b.jpg",title: "Hiren",title2: "Hiren_Suarni",chatnumber: 0), PostModel(profileImage: "images/person.jpg",description: "der, orange skinned man with composed green eyes, puffy cheeks, thin lips and no eyebrows. He has coiled, black hair,",chat:[],likes: 0,profilePost: "images/Immerse Yourself in the World of Bleach Anime with Stunning 4K Wallpaper!.jpg",title2: "Prince",title: "Prince_Rawal",chatnumber: 0)];

  bool selected = false;

  List<String> text = [];
  TextEditingController textController = TextEditingController();
  List<NavModel> items = [];
  int likeplus = 0;
  bool isReadMore = false;
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
      child: Scaffold(
        backgroundColor: Colors.white,
bottomNavigationBar: NavBar( pageIndex: selectedTab, onTap: (index) {
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
        body: Column(
          children: [
            appbarThad(
              title: "Sunita's",
              title2: "MAKERSPACE",
              context: context,
              icon1: Icons.add,
              icon2: Icons.add_box_outlined,
              iconColor1: Colors.black,
              iconColor2: Colors.black,
              textColor: Colors.indigo,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                  height: 100,
                  // width: 100,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...myitem.map((e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return MyStoryView(currentStoryIndex: myitem.indexOf(e),);
                              },));
                            },
                            child: Container(padding: const EdgeInsets.all(4),decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.indigo,width: 2.5,)),

                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(e['pi']),),
                            ),
                          ),
                        ))
                      ],
                    ),
                  )
              ),
            ),
///asas

            SizedBox(
              height: 50,
              width: double.maxFinite,
              child: TabBar(
                  onTap: (index) {
                    setState(() {
                      _selectedTabbar = index;
                    });
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabControllerTo,
                  isScrollable: true,
                  labelColor: Colors.indigo,
                  tabAlignment: TabAlignment.center,
                  unselectedLabelColor: Colors.indigo,
                  labelStyle: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w700),
                  dividerColor: Colors.indigo,
                  indicator: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.indigo,
                        width: 2,
                      ),
                    ),
                  ),
                  tabs:  [
                    const Tab(
                      text: "  SM Space  ",
                    ),
                    const Tab(
                      text: " Competitions ",
                    ),
                    const Tab(
                      text: " Mentors ",
                    ),
                    const Tab(
                      text: " ScheaSAsASA ",
                    ),
                  ]),
            ),
                   Flexible(
              child: SizedBox(
                child:TabBarView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller:tabControllerTo,
                    children: [
                      SizedBox(
                        child: ListView.builder(itemCount: smSpaceList.length, itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                    child: SizedBox(
                                      height:
                                      MediaQuery.of(context).size.height * 0.05,
                                      width:
                                      MediaQuery.of(context).size.height * 0.05,
                                      child: CircleAvatar(
                                        backgroundImage:
                                        AssetImage(smSpaceList[index].profileImage.toString()),
                                      ),
                                    ),
                                  ),
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      textoutfit(
                                          color: Colors.black,
                                          text: "${smSpaceList[index].title}",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                      textoutfit(
                                          color: Colors.grey, text: "prince_gupta"),
                                    ],
                                  ),
                                  const Spacer(),
                                  PopupMenuButton(
                                    icon: const Icon(Icons.more_vert,
                                        color: Colors.black),
                                    itemBuilder: (ctx) => [
                                      _buildPopupMenuItem('Search'),
                                      _buildPopupMenuItem('Upload'),
                                      _buildPopupMenuItem('Copy'),
                                      _buildPopupMenuItem('Exit'),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                height: MediaQuery.of(context).size.width * 1,
                                width: MediaQuery.of(context).size.width * 1,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("${smSpaceList[index].profilePost}"),
                                        fit: BoxFit.cover)),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, left: 25, top: 10),
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            // selectedLike = !selectedLike;
                                            // if(selectedLike==true){
                                              smSpaceList[index].likes++;
                                            // }
                                            // print("likeplus-=-------${likeplus}");

                                          });

                                        },
                                        child: Icon(
                                          smSpaceList[index].likes != 0
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: /*selectedLike*/ smSpaceList[index].likes != 0
                                              ? Colors.red
                                              : Colors.grey,
                                          size: 25,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, left: 8, top: 10),
                                    child: textoutfit(
                                        color: Colors.grey,
                                        text: "${smSpaceList[index].likes} Likes",
                                        fontSize: 15),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, left: 20, top: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(context: context,isScrollControlled: true, builder: (context) {
                                          return Padding(
                                            padding: const EdgeInsets.only(top: 30),
                                            child: MyStatefulWidget(smSpaceList[index].chat),
                                          );

                                        },);
                                      },
                                      child: const Icon(
                                        Icons.chat_bubble_outline,
                                        color: Colors.grey,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, left: 8, top: 10),
                                    child: textoutfit(
                                        color: Colors.grey,
                                        text: "${smSpaceList[index].chat.length} comments",
                                        fontSize: 15),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding:  const EdgeInsets.all(10),
                                    child: InkWell(onTap: () {
                                      // _onShare(context);
                                    },
                                      child: const Icon(
                                        Icons.share,
                                        color: Colors.grey,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:  const EdgeInsets.symmetric(horizontal: 15),
                                child: textoutfit(
                                    color: Colors.black87,
                                    text:"${smSpaceList[index].description}",

                                    fontSize: 15,textAlign: TextAlign.start,maxLine: isReadMore ?5:1,overflow: TextOverflow.ellipsis),
                              ),
                              GestureDetector(onTap: () {
                                setState(() {
                                  isReadMore = !isReadMore;
                                });
                              },child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    textoutfit(color: Colors.grey,text:isReadMore?"Read less": "more",),
                                  ],
                                ),
                              )),
                            ],
                          );
                        },),
                      ),
                      SizedBox(
                        child: ListView.builder(itemCount: competitionsList.length, itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                    child: SizedBox(
                                      height:
                                      MediaQuery.of(context).size.height * 0.05,
                                      width:
                                      MediaQuery.of(context).size.height * 0.05,
                                      child: CircleAvatar(
                                        backgroundImage:
                                        AssetImage(competitionsList[index].profileImage.toString()),
                                      ),
                                    ),
                                  ),
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      textoutfit(
                                          color: Colors.black,
                                          text: "${competitionsList[index].title}",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                      textoutfit(
                                          color: Colors.grey, text: "prince_gupta"),
                                    ],
                                  ),
                                  const Spacer(),
                                  PopupMenuButton(
                                    icon: const Icon(Icons.more_vert,
                                        color: Colors.black),
                                    itemBuilder: (ctx) => [
                                      _buildPopupMenuItem('Search'),
                                      _buildPopupMenuItem('Upload'),
                                      _buildPopupMenuItem('Copy'),
                                      _buildPopupMenuItem('Exit'),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                height: MediaQuery.of(context).size.width * 1,
                                width: MediaQuery.of(context).size.width * 1,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("${competitionsList[index].profilePost}"),
                                        fit: BoxFit.cover)),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, left: 25, top: 10),
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            // selectedLike = !selectedLike;
                                            // if(selectedLike==true){
                                            competitionsList[index].likes++;
                                            // }
                                            // print("likeplus-=-------${likeplus}");

                                          });

                                        },
                                        child: Icon(
                                          competitionsList[index].likes != 0
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: /*selectedLike*/ competitionsList[index].likes != 0
                                              ? Colors.red
                                              : Colors.grey,
                                          size: 25,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, left: 8, top: 10),
                                    child: textoutfit(
                                        color: Colors.grey,
                                        text: "${competitionsList[index].likes} Likes",
                                        fontSize: 15),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, left: 20, top: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(context: context,isScrollControlled: true, builder: (context) {
                                          return Padding(
                                            padding: const EdgeInsets.only(top: 30),
                                            child: MyStatefulWidget(competitionsList[index].chat),
                                          );
                                          /*       return Container(
                                            decoration: BoxDecoration(color: Colors.white12),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                TextFormField(
                                                  controller: textController,

                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if(textController.text.length>0){
                                                        text.add(textController.text);
                                                        textController.clear();
                                                      } else{
                                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                          content: Text("Text is empty"),
                                                        ));
                                                      }
                                                    });
                                                  },
                                                  child: Text("add"),
                                                ),
                                                Text(text.isNotEmpty?text.toString():""),
                                              ],
                                            ),
                                          );*/
                                        },);
                                      },
                                      child: const Icon(
                                        Icons.chat_bubble_outline,
                                        color: Colors.grey,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, left: 8, top: 10),
                                    child: textoutfit(
                                        color: Colors.grey,
                                        text: "${competitionsList[index].chat.length} comments",
                                        fontSize: 15),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding:  const EdgeInsets.all(10),
                                    child: InkWell(onTap: () {
                                      // _onShare(context);
                                    },
                                      child: const Icon(
                                        Icons.share,
                                        color: Colors.grey,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:  const EdgeInsets.symmetric(horizontal: 15),
                                child: textoutfit(
                                    color: Colors.black87,
                                    text:"${competitionsList[index].description}",

                                    fontSize: 15,textAlign: TextAlign.start,maxLine: isReadMore ?5:1,overflow: TextOverflow.ellipsis),
                              ),
                              GestureDetector(onTap: () {
                                setState(() {
                                  isReadMore = !isReadMore;
                                });
                              },child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    textoutfit(color: Colors.grey,text:isReadMore?"Read less": "more",),
                                  ],
                                ),
                              )),
                            ],
                          );
                        },),
                      ),
                      SizedBox(
                        child: ListView.builder(itemCount: mentorsList.length, itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                    child: SizedBox(
                                      height:
                                      MediaQuery.of(context).size.height * 0.05,
                                      width:
                                      MediaQuery.of(context).size.height * 0.05,
                                      child: CircleAvatar(
                                        backgroundImage:
                                        AssetImage(mentorsList[index].profileImage.toString()),
                                      ),
                                    ),
                                  ),
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      textoutfit(
                                          color: Colors.black,
                                          text: "${mentorsList[index].title}",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                      textoutfit(
                                          color: Colors.grey, text: "prince_gupta"),
                                    ],
                                  ),
                                  const Spacer(),
                                  PopupMenuButton(
                                    icon: const Icon(Icons.more_vert,
                                        color: Colors.black),
                                    itemBuilder: (ctx) => [
                                      _buildPopupMenuItem('Search'),
                                      _buildPopupMenuItem('Upload'),
                                      _buildPopupMenuItem('Copy'),
                                      _buildPopupMenuItem('Exit'),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                height: MediaQuery.of(context).size.width * 1,
                                width: MediaQuery.of(context).size.width * 1,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("${mentorsList[index].profilePost}"),
                                        fit: BoxFit.cover)),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, left: 25, top: 10),
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            // selectedLike = !selectedLike;
                                            // if(selectedLike==true){
                                            mentorsList[index].likes++;
                                            // }
                                            // print("likeplus-=-------${likeplus}");

                                          });

                                        },
                                        child: Icon(
                                          mentorsList[index].likes != 0
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: /*selectedLike*/ mentorsList[index].likes != 0
                                              ? Colors.red
                                              : Colors.grey,
                                          size: 25,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, left: 8, top: 10),
                                    child: textoutfit(
                                        color: Colors.grey,
                                        text: "${mentorsList[index].likes} Likes",
                                        fontSize: 15),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, left: 20, top: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(context: context,isScrollControlled: true, builder: (context) {
                                          return Padding(
                                            padding: const EdgeInsets.only(top: 30),
                                            child: MyStatefulWidget(mentorsList[index].chat),
                                          );

                                        },);
                                      },
                                      child: const Icon(
                                        Icons.chat_bubble_outline,
                                        color: Colors.grey,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, left: 8, top: 10),
                                    child: textoutfit(
                                        color: Colors.grey,
                                        text: "${mentorsList[index].chat.length} comments",
                                        fontSize: 15),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding:  const EdgeInsets.all(10),
                                    child: InkWell(onTap: () {
                                      // _onShare(context);
                                    },
                                      child: const Icon(
                                        Icons.share,
                                        color: Colors.grey,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:  const EdgeInsets.symmetric(horizontal: 15),
                                child: textoutfit(
                                    color: Colors.black87,
                                    text:"${mentorsList[index].description}",

                                    fontSize: 15,textAlign: TextAlign.start,maxLine: isReadMore ?5:1,overflow: TextOverflow.ellipsis),
                              ),
                              GestureDetector(onTap: () {
                                setState(() {
                                  isReadMore = !isReadMore;
                                });
                              },child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    textoutfit(color: Colors.grey,text:isReadMore?"Read less": "more",),
                                  ],
                                ),
                              )),
                            ],
                          );
                        },),
                      ),
                      SizedBox(
                        child: ListView.builder(itemCount: searchList.length, itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                    child: SizedBox(
                                      height:
                                      MediaQuery.of(context).size.height * 0.05,
                                      width:
                                      MediaQuery.of(context).size.height * 0.05,
                                      child: CircleAvatar(
                                        backgroundImage:
                                        AssetImage(searchList[index].profileImage.toString()),
                                      ),
                                    ),
                                  ),
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      textoutfit(
                                          color: Colors.black,
                                          text: "${searchList[index].title}",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                      textoutfit(
                                          color: Colors.grey, text: "prince_gupta"),
                                    ],
                                  ),
                                  const Spacer(),
                                  PopupMenuButton(
                                    icon: const Icon(Icons.more_vert,
                                        color: Colors.black),
                                    itemBuilder: (ctx) => [
                                      _buildPopupMenuItem('Search'),
                                      _buildPopupMenuItem('Upload'),
                                      _buildPopupMenuItem('Copy'),
                                      _buildPopupMenuItem('Exit'),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                height: MediaQuery.of(context).size.width * 1,
                                width: MediaQuery.of(context).size.width * 1,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("${searchList[index].profilePost}"),
                                        fit: BoxFit.cover)),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, left: 25, top: 10),
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            // selectedLike = !selectedLike;
                                            // if(selectedLike==true){
                                            searchList[index].likes++;
                                            // }
                                            // print("likeplus-=-------${likeplus}");

                                          });

                                        },
                                        child: Icon(
                                          searchList[index].likes != 0
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: /*selectedLike*/ searchList[index].likes != 0
                                              ? Colors.red
                                              : Colors.grey,
                                          size: 25,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, left: 8, top: 10),
                                    child: textoutfit(
                                        color: Colors.grey,
                                        text: "${searchList[index].likes} Likes",
                                        fontSize: 15),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, left: 20, top: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(context: context,isScrollControlled: true, builder: (context) {
                                          return Padding(
                                            padding: const EdgeInsets.only(top: 30),
                                            child: MyStatefulWidget(searchList[index].chat),
                                          );

                                        },);
                                      },
                                      child: const Icon(
                                        Icons.chat_bubble_outline,
                                        color: Colors.grey,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, left: 8, top: 10),
                                    child: textoutfit(
                                        color: Colors.grey,
                                        text: "${searchList[index].chat.length} comments",
                                        fontSize: 15),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding:  const EdgeInsets.all(10),
                                    child: InkWell(onTap: () {
                                      // _onShare(context);
                                    },
                                      child: const Icon(
                                        Icons.share,
                                        color: Colors.grey,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:  const EdgeInsets.symmetric(horizontal: 15),
                                child: textoutfit(
                                    color: Colors.black87,
                                    text:"${searchList[index].description}",

                                    fontSize: 15,textAlign: TextAlign.start,maxLine: isReadMore ?5:1,overflow: TextOverflow.ellipsis),
                              ),
                              GestureDetector(onTap: () {
                                setState(() {
                                  isReadMore = !isReadMore;
                                });
                              },child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    textoutfit(color: Colors.grey,text:isReadMore?"Read less": "more",),
                                  ],
                                ),
                              )),
                            ],
                          );
                        },),
                      ),
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
// void _onShare(BuildContext context) async {
//   final box = context.findRenderObject() as RenderBox?;
//
//   // subject is optional but it will be used
//   // only when sharing content over email
//   // await Share.share('check out my website https://example.com');
//   await Share.share("himachali",
//       subject: "https://web8.rishtaguru.com/",
//       sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
// }