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
List<PostModel> smSpaceList = [PostModel(profileImage: "images/8e9e1960-5745-44c6-8bb5-663087e57f67.jpg",description: "",chat:[],likes: 0,profilePost: "images/Naruto Uzumaki Wallpaper 4K (3).jpg",title: "Hiren",title2: "Hiren_Suarni",chatnumber: 0),
  PostModel(profileImage: "images/person.jpg",description: "",chat:[],likes: 0,profilePost: "images/8e9e1960-5745-44c6-8bb5-663087e57f67.jpg",title2: "Prince",title: "Prince_Rawal",chatnumber: 0)];
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
                    physics: BouncingScrollPhysics(),
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
                            child: Container(padding: EdgeInsets.all(4),decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.indigo,width: 2.5,)),

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
                  labelStyle: TextStyle(
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
                    Tab(
                      text: "  SM Space  ",
                    ),
                    Tab(
                      text: " Competitions ",
                    ),
                    Tab(
                      text: " Mentors ",
                    ),
                    Tab(
                      text: " ScheaSAsASA ",
                    ),
                  ]),
            ),
                   Flexible(
              child: SizedBox(
                child:TabBarView(
                    physics: AlwaysScrollableScrollPhysics(),
                    controller:tabControllerTo,
                    children: [
                      SizedBox( /* height:MediaQuery.of(context).size.height * 0.87,*/
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
                                  Spacer(),
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
                                      child: Icon(
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
                                  Spacer(),
                                  Padding(
                                    padding:  EdgeInsets.all(10),
                                    child: InkWell(onTap: () {
                                      // _onShare(context);
                                    },
                                      child: Icon(
                                        Icons.share,
                                        color: Colors.grey,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 15),
                                child: textoutfit(
                                    color: Colors.black87,
                                    text:"${smSpaceList[index].description}",

                                    fontSize: 15,textAlign: TextAlign.center,maxLine: isReadMore ?5:1,overflow: TextOverflow.ellipsis),
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
                      SizedBox( /* height:MediaQuery.of(context).size.height * 0.87,*/

                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Container(
                                child: Column(
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
                                              AssetImage('images/Cute Baby Naruto Autumn _ Fall 4K Wallpaper.jpg'),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            textoutfit(
                                                color: Colors.black,
                                                text: "Prince Gupta",
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                            textoutfit(
                                                color: Colors.grey, text: "prince_gupta"),
                                          ],
                                        ),
                                        Spacer(),
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
                                              image: AssetImage("images/Cute Baby Naruto Autumn _ Fall 4K Wallpaper (1).jpg"),
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
                                                  selectedLike = !selectedLike;
                                                  if(selectedLike==true){
                                                    likeplus++;
                                                  }
                                                  print("likeplus-=-------${likeplus}");

                                                });

                                              },
                                              child: Icon(
                                                selectedLike
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: selectedLike
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
                                              text: "$likeplus Likes",
                                              fontSize: 15),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 2, left: 20, top: 10),
                                          child: GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(context: context,isScrollControlled: true, builder: (context) {
                                                return Container()
                                                // return MyStatefulWidget();
                                                /*return Container(
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
                                                 )*/;
                                              },);
                                            },
                                            child: Icon(
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
                                              text: "$textSend comments",
                                              fontSize: 15),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding:  EdgeInsets.all(10),
                                          child: InkWell(onTap: () {
                                            // _onShare(context);
                                          },
                                            child: Icon(
                                              Icons.share,
                                              color: Colors.grey,
                                              size: 25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 15),
                                      child: textoutfit(
                                          color: Colors.black87,
                                          text:
                                          "Once Brahma divided sugarcane among his sons and each of them ate his share, but the Kumhara who was greatly absorbed in his work, forgot to eat. The piece which he had kept near his clay lump struck root and soon grew into a sugarcane plant. A few days later, when Brahma asked his sons for sugarcane, none of them could give it to him, excepting the Kumhara who offered a full plant. Brahma was pleased by the devotion of the potter to his work and awarded",
                                          fontSize: 15,textAlign: TextAlign.center,maxLine: isReadMore ?5:1,overflow: TextOverflow.ellipsis),
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
                                ),
                              ),
                              Container(
                                child: Column(
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
                                              AssetImage('images/Naruto Uzumaki Wallpaper 4K.jpg'),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            textoutfit(
                                                color: Colors.black,
                                                text: "Prince Gupta",
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                            textoutfit(
                                                color: Colors.grey, text: "prince_gupta"),
                                          ],
                                        ),
                                        Spacer(),
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
                                              image: AssetImage("images/Naruto Uzumaki Wallpaper 4K.jpg"),
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
                                                  selectedLike = !selectedLike;
                                                  if(selectedLike==true){
                                                    likeplus++;
                                                  }


                                                });

                                              },
                                              child: Icon(
                                                selectedLike
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: selectedLike
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
                                              text: "$likeplus Likes",
                                              fontSize: 15),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 2, left: 20, top: 10),
                                          child: GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(context: context,isScrollControlled: true, builder: (context) {
                                                return Container();
                                                // return MyStatefulWidget();
                                              },);
                                            },
                                            child: Icon(
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
                                              text: "$textSend comments",
                                              fontSize: 15),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.share,
                                            color: Colors.grey,
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 15),
                                      child: textoutfit(
                                          color: Colors.black87,
                                          text:
                                          "Once Brahma divided sugarcane among his sons and each of them ate his share, but the Kumhara who was greatly absorbed in his work, forgot to eat. The piece which he had kept near his clay lump struck root and soon grew into a sugarcane plant. A few days later, when Brahma asked his sons for sugarcane, none of them could give it to him, excepting the Kumhara who offered a full plant. Brahma was pleased by the devotion of the potter to his work and awarded",
                                          fontSize: 15,textAlign: TextAlign.center,maxLine: isReadMore ?5:1,overflow: TextOverflow.ellipsis),
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox( /* height:MediaQuery.of(context).size.height * 0.87,*/

                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Container(
                                child: Column(
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
                                              AssetImage('images/Gaara Wallpaper 4K.jpg'),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            textoutfit(
                                                color: Colors.black,
                                                text: "Gaara",
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                            textoutfit(
                                                color: Colors.grey, text: "Gaara"),
                                          ],
                                        ),
                                        Spacer(),
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
                                              image: AssetImage("images/Gaara Wallpaper 4K.jpg"),
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
                                                  selectedLike = !selectedLike;
                                                  if(selectedLike==true){
                                                    likeplus++;
                                                  }
                                                  print("likeplus-=-------${likeplus}");

                                                });

                                              },
                                              child: Icon(
                                                selectedLike
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: selectedLike
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
                                              text: "$likeplus Likes",
                                              fontSize: 15),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 2, left: 20, top: 10),
                                          child: GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(context: context,isScrollControlled: true, builder: (context) {
                                                return Container()
                                                // return MyStatefulWidget();
                                                /*return Container(
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
                                                 )*/;
                                              },);
                                            },
                                            child: Icon(
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
                                              text: "$textSend comments",
                                              fontSize: 15),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding:  EdgeInsets.all(10),
                                          child: InkWell(onTap: () {
                                            // _onShare(context);
                                          },
                                            child: Icon(
                                              Icons.share,
                                              color: Colors.grey,
                                              size: 25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 15),
                                      child: textoutfit(
                                          color: Colors.black87,
                                          text:
                                          "Once Brahma divided sugarcane among his sons and each of them ate his share, but the Kumhara who was greatly absorbed in his work, forgot to eat. The piece which he had kept near his clay lump struck root and soon grew into a sugarcane plant. A few days later, when Brahma asked his sons for sugarcane, none of them could give it to him, excepting the Kumhara who offered a full plant. Brahma was pleased by the devotion of the potter to his work and awarded",
                                          fontSize: 15,textAlign: TextAlign.center,maxLine: isReadMore ?5:1,overflow: TextOverflow.ellipsis),
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
                                ),
                              ),
                              Container(
                                child: Column(
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
                                              AssetImage('images/Immerse Yourself in the World of Bleach Anime with Stunning 4K Wallpaper!.jpg'),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            textoutfit(
                                                color: Colors.black,
                                                text: "gaara to",
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                            textoutfit(
                                                color: Colors.grey, text: "prince_gupta"),
                                          ],
                                        ),
                                        Spacer(),
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
                                              image: AssetImage("images/Immerse Yourself in the World of Bleach Anime with Stunning 4K Wallpaper!.jpg"),
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
                                                  selectedLike = !selectedLike;
                                                  if(selectedLike==true){
                                                    likeplus++;
                                                  }


                                                });

                                              },
                                              child: Icon(
                                                selectedLike
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: selectedLike
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
                                              text: "$likeplus Likes",
                                              fontSize: 15),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 2, left: 20, top: 10),
                                          child: GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(context: context,isScrollControlled: true, builder: (context) {
                                                return Container();
                                                // return MyStatefulWidget();
                                              },);
                                            },
                                            child: Icon(
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
                                              text: "$textSend comments",
                                              fontSize: 15),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.share,
                                            color: Colors.grey,
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 15),
                                      child: textoutfit(
                                          color: Colors.black87,
                                          text:
                                          "Once Brahma divided sugarcane among his sons and each of them ate his share, but the Kumhara who was greatly absorbed in his work, forgot to eat. The piece which he had kept near his clay lump struck root and soon grew into a sugarcane plant. A few days later, when Brahma asked his sons for sugarcane, none of them could give it to him, excepting the Kumhara who offered a full plant. Brahma was pleased by the devotion of the potter to his work and awarded",
                                          fontSize: 15,textAlign: TextAlign.center,maxLine: isReadMore ?5:1,overflow: TextOverflow.ellipsis),
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox( /* height:MediaQuery.of(context).size.height * 0.87,*/

                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Container(
                                child: Column(
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
                                              AssetImage('images/Pokemon Pikachu Ash Wallpaper 4K.jpg'),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            textoutfit(
                                                color: Colors.black,
                                                text: "pikachu",
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                            textoutfit(
                                                color: Colors.grey, text: "pikachu"),
                                          ],
                                        ),
                                        Spacer(),
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
                                              image: AssetImage("images/Pokemon Pikachu Ash Wallpaper 4K.jpg"),
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
                                                  selectedLike = !selectedLike;
                                                  if(selectedLike==true){
                                                    likeplus++;
                                                  }
                                                  print("likeplus-=-------${likeplus}");

                                                });

                                              },
                                              child: Icon(
                                                selectedLike
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: selectedLike
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
                                              text: "$likeplus Likes",
                                              fontSize: 15),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 2, left: 20, top: 10),
                                          child: GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(context: context,isScrollControlled: true, builder: (context) {
                                                return Container()
                                                // return MyStatefulWidget();
                                                /*return Container(
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
                                                 )*/;
                                              },);
                                            },
                                            child: Icon(
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
                                              text: "$textSend comments",
                                              fontSize: 15),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding:  EdgeInsets.all(10),
                                          child: InkWell(onTap: () {
                                            // _onShare(context);
                                          },
                                            child: Icon(
                                              Icons.share,
                                              color: Colors.grey,
                                              size: 25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 15),
                                      child: textoutfit(
                                          color: Colors.black87,
                                          text:
                                          "Once Brahma divided sugarcane among his sons and each of them ate his share, but the Kumhara who was greatly absorbed in his work, forgot to eat. The piece which he had kept near his clay lump struck root and soon grew into a sugarcane plant. A few days later, when Brahma asked his sons for sugarcane, none of them could give it to him, excepting the Kumhara who offered a full plant. Brahma was pleased by the devotion of the potter to his work and awarded",
                                          fontSize: 15,textAlign: TextAlign.center,maxLine: isReadMore ?5:1,overflow: TextOverflow.ellipsis),
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
                                ),
                              ),
                              Container(
                                child: Column(
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
                                              AssetImage('images/Pokemon Pikachu 🙊.jpg'),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            textoutfit(
                                                color: Colors.black,
                                                text: "pikachu one",
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                            textoutfit(
                                                color: Colors.grey, text: "pikachu one"),
                                          ],
                                        ),
                                        Spacer(),
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
                                              image: AssetImage("images/Pokemon Pikachu 🙊.jpg"),
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
                                                  selectedLike = !selectedLike;
                                                  if(selectedLike==true){
                                                    likeplus++;
                                                  }


                                                });

                                              },
                                              child: Icon(
                                                selectedLike
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: selectedLike
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
                                              text: "$likeplus Likes",
                                              fontSize: 15),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 2, left: 20, top: 10),
                                          child: GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(context: context,isScrollControlled: true, builder: (context) {
                                                return Container();
                                                // return MyStatefulWidget();
                                              },);
                                            },
                                            child: Icon(
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
                                              text: "$textSend comments",
                                              fontSize: 15),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.share,
                                            color: Colors.grey,
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 15),
                                      child: textoutfit(
                                          color: Colors.black87,
                                          text:
                                          "Once Brahma divided sugarcane among his sons and each of them ate his share, but the Kumhara who was greatly absorbed in his work, forgot to eat. The piece which he had kept near his clay lump struck root and soon grew into a sugarcane plant. A few days later, when Brahma asked his sons for sugarcane, none of them could give it to him, excepting the Kumhara who offered a full plant. Brahma was pleased by the devotion of the potter to his work and awarded",
                                          fontSize: 15,textAlign: TextAlign.center,maxLine: isReadMore ?5:1,overflow: TextOverflow.ellipsis),
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
                                ),
                              ),
                            ],
                          ),
                        ),
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