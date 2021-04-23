import 'package:flutter/material.dart';
import 'package:tabbar/utils/custom_widgets.dart';

class ComingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ComingPageTabBar();
  }
}

class ComingPageTabBar extends StatefulWidget {
  @override
  _ComingPageTabBarState createState() => _ComingPageTabBarState();
}

class _ComingPageTabBarState extends State<ComingPageTabBar>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(1.0),
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                controller: _controller,
                tabs: [
                  Tab(
                    text: "Movies",
                  ),
                  Tab(
                    text: "TV Shows",
                  ),
                ],
                indicatorColor: Colors.black,
                indicatorWeight: 4.0,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                unselectedLabelColor: Colors.grey,
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            SmallCardLists(),
            PagewithMessage(
              message: "TV Shows",
            )
          ],
        ),
        //resizeToAvoidBottomInset: true,
      ),
    );
  }
}

/*class Genre{
  final String genreType;
  Genre({this.genreType,});
}*/

class SmallCardLists extends StatelessWidget {
  const SmallCardLists({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              SmallCard(
                movieTitle: "Johnny English",
                releaseDate: "2020-04-01",
                genre: [
                  "Drama",
                  "Detective",
                  "Comedy",
                  "Action",
                ],
                imageSource:
                    "https://image.shutterstock.com/image-photo/kuala-lumpur-malaysia-september-14-600w-1185075061.jpg",
                message:
                    "Johnny English taglined in some countries as Little Brother of James Bond is a 2003 spy action comedy film directed by Peter Howitt and written by Neal Purvis, Robert Wade and William Davies. It is a British-French venture produced by StudioCanal and Working Title Films, and distributed by Universal Pictures.",
              ),
              SmallCard(
                movieTitle: "Foreigner",
                releaseDate: "2020-05-01",
                genre: [
                  "Action",
                  "Adventure",
                  "Comedy",
                ],
                imageSource:
                    "https://image.shutterstock.com/image-photo/kuala-lumpur-malaysia-september-23-600w-724201312.jpg",
                message:
                    "The Foreigner is a 2017 action thriller film directed by Martin Campbell and written by David Marconi, based on the 1992 novel The Chinaman by Stephen Leather. An American-British-Chinese co-production, it stars Jackie Chan, Pierce Brosnan, Michael McElhatton, Liu Tao, Charlie Murphy, Orla Brady and Katie Leung. The film follows a British-Nung Chinese man who seeks revenge for the death of his daughter.",
              ),
              SmallCard(
                movieTitle: "Dora",
                releaseDate: "2020-06-01",
                genre: [
                  "Kids",
                  "Drama",
                ],
                imageSource:
                    "https://image.shutterstock.com/image-photo/bangkok-thailand-30-july-2019-600w-1469937725.jpg",
                message:
                    "Dora and the Lost City of Gold is a 2019 American adventure comedy film that is a live-action adaptation of the Nick Jr. animated television series Dora the Explorer and directed by James Bobin. The film stars Isabela Moner, Eugenio Derbez, Michael Peña, Eva Longoria, with Danny Trejo as the voice of Boots and Benicio del Toro as the voice of Swiper.",
              ),
              SmallCard(
                movieTitle: "Tenet",
                releaseDate: "2020-07-01",
                genre: [
                  "Science Fiction",
                  "Adventure",
                  "Action",
                ],
                imageSource:
                    "https://image.shutterstock.com/image-photo/bangkok-thailand-sep-17-2020-600w-1819014005.jpg",
                message:
                    "Tenet is a 2020 science fiction action-thriller film written and directed by Christopher Nolan, who produced it with Emma Thomas. A co-production between the United Kingdom and United States, it stars John David Washington, Robert Pattinson, Elizabeth Debicki, Dimple Kapadia, Michael Caine, and Kenneth Branagh. The film follows a secret agent who learns to manipulate the flow of time to prevent an attack from the future that threatens to annihilate the present world.",
              ),
              SmallCard(
                movieTitle: "Foreigner",
                releaseDate: "2020-05-01",
                genre: [
                  "Action",
                  "Adventure",
                  "Comedy",
                ],
                imageSource:
                    "https://image.shutterstock.com/image-photo/kuala-lumpur-malaysia-september-23-600w-724201312.jpg",
                message:
                    "The Foreigner is a 2017 action thriller film directed by Martin Campbell and written by David Marconi, based on the 1992 novel The Chinaman by Stephen Leather. An American-British-Chinese co-production, it stars Jackie Chan, Pierce Brosnan, Michael McElhatton, Liu Tao, Charlie Murphy, Orla Brady and Katie Leung. The film follows a British-Nung Chinese man who seeks revenge for the death of his daughter.",
              ),
              SmallCard(
                movieTitle: "Tenet",
                releaseDate: "2020-07-01",
                genre: [
                  "Science Fiction",
                  "Adventure",
                  "Action",
                ],
                imageSource:
                    "https://image.shutterstock.com/image-photo/bangkok-thailand-sep-17-2020-600w-1819014005.jpg",
                message:
                    "Tenet is a 2020 science fiction action-thriller film written and directed by Christopher Nolan, who produced it with Emma Thomas. A co-production between the United Kingdom and United States, it stars John David Washington, Robert Pattinson, Elizabeth Debicki, Dimple Kapadia, Michael Caine, and Kenneth Branagh. The film follows a secret agent who learns to manipulate the flow of time to prevent an attack from the future that threatens to annihilate the present world.",
              ),
              SmallCard(
                movieTitle: "Johnny English",
                releaseDate: "2020-04-01",
                genre: [
                  "Drama",
                  "Detective",
                  "Comedy",
                  "Action",
                ],
                imageSource:
                    "https://image.shutterstock.com/image-photo/kuala-lumpur-malaysia-september-14-600w-1185075061.jpg",
                message:
                    "Johnny English taglined in some countries as Little Brother of James Bond is a 2003 spy action comedy film directed by Peter Howitt and written by Neal Purvis, Robert Wade and William Davies. It is a British-French venture produced by StudioCanal and Working Title Films, and distributed by Universal Pictures.",
              ),
              SmallCard(
                movieTitle: "Foreigner",
                releaseDate: "2020-05-01",
                genre: [
                  "Action",
                  "Adventure",
                  "Comedy",
                ],
                imageSource:
                    "https://image.shutterstock.com/image-photo/kuala-lumpur-malaysia-september-23-600w-724201312.jpg",
                message:
                    "The Foreigner is a 2017 action thriller film directed by Martin Campbell and written by David Marconi, based on the 1992 novel The Chinaman by Stephen Leather. An American-British-Chinese co-production, it stars Jackie Chan, Pierce Brosnan, Michael McElhatton, Liu Tao, Charlie Murphy, Orla Brady and Katie Leung. The film follows a British-Nung Chinese man who seeks revenge for the death of his daughter.",
              ),
            ],
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
