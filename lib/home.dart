import 'dart:ui';
import 'package:epviassignment/ddatabase.dart';
import 'package:epviassignment/exfab.dart';
import 'package:epviassignment/fab.dart';
import 'package:epviassignment/suggestion_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isAppBarPinned = true;
  bool _isImageBlurred = true;
  bool isFAB = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isAppBarPinned = _scrollController.offset == 0;
        _isImageBlurred = !_isAppBarPinned;
      });
      if (_scrollController.offset > 50) {
        setState(() {
          isFAB = true;
        });
      } else {
        setState(() {
          isFAB = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
    //  print(_scrollController.offset);
    });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            pinned: true,

            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_downward_rounded,color: Colors.white,)),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline,color: Colors.white,))
            ],
            onStretchTrigger: () async {
            },
            stretchTriggerOffset: 300.0,
            expandedHeight: 400.0,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/tower.jpg',
                      fit: BoxFit.cover,
                    ),
                    ClipRect(
                      child: BackdropFilter(
                        filter: _isAppBarPinned
                            ? ImageFilter.blur(sigmaX: 0, sigmaY: 0)
                            : ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                    ),
                    Positioned(
                      left: _isAppBarPinned ? 20 : 100,
                      bottom: 16.0,
                       child:  Column(

                        children: [
                       _isAppBarPinned ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.green,
                            ),
                            child:const Text("On Sale",style: TextStyle(color: Colors.white),),
                          )  : const SizedBox(),
                          const  Text(
                            'SliverAppBar',
                            style: TextStyle(
                              color: Colors.white ,
                              fontSize: 25.0,
                            ),
                          ),
                          const Row(
                            children: [
                              Icon(Icons.location_on_outlined,color: Colors.white,),
                          Text("Paris, France",style: TextStyle(color: Colors.white, fontSize: 15,),)
                          ],)
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40).copyWith(
                  bottomLeft: Radius.zero,bottomRight: Radius.zero
                ),
                color: Colors.white
              ),
              child://children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30.0),
                    SuggestionList("", Hotel.recommendation),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text("Originally developed by Google and now managed by ECMA, Flutter offers free and open-source UI development support. With one programming language and one codebase,"),
                    ),
                    const   Center(child: Text("Read More",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 20),)),

                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                      height: MediaQuery.of(context).size.height / 5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "assets/icons/slogan.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text("Read More",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 20),),
                    ),

                    Row(children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width/2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            "assets/icons/slogan.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                     const Expanded(
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Music & Life",style: TextStyle(color: Colors.grey, fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Dart, a programming language developed by Google, is used to code Flutter apps ",style: TextStyle(color: Colors.grey, fontSize: 15),),
                          ),
                        ],),
                      )
                    ],),
                    const SizedBox(height: 20,),
                  ],
                ),
              //  ],
              //),
            ),
          ),
        ],
      ),
      floatingActionButton: isFAB ?  buildExtendedFAB() : buildFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}
