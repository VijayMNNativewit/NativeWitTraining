import 'package:flutter/material.dart';
import 'package:tabbar/utils/custom_widgets.dart';

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.25),
        //leading: Text(" "),
        automaticallyImplyLeading: false,
        title: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: IconswithMessage(
                  message: "Sort By",
                  iconName: Icons.arrow_drop_down,
                ),
              ),
              IconswithMessage(
                message: "Filter",
                iconName: Icons.filter_alt,
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                BigCard(
                  imageSource:
                      "https://image.shutterstock.com/image-photo/kuala-lumpur-malaysia-september-14-600w-1185075061.jpg",
                  percentage: "77%",
                  movieTitle: "Johnny English",
                  releaseDate: "April 1, 2020",
                  message:
                      "Johnny English taglined in some countries as Little Brother of James Bond is a 2003 spy action comedy film directed by Peter Howitt and written by Neal Purvis, Robert Wade and William Davies. It is a British-French venture produced by StudioCanal and Working Title Films, and distributed by Universal Pictures.",
                ),
                BigCard(
                  percentage: "65%",
                  movieTitle: "Foreigner",
                  releaseDate: "May 1, 2020",
                  imageSource:
                      "https://image.shutterstock.com/image-photo/kuala-lumpur-malaysia-september-23-600w-724201312.jpg",
                  message:
                      "The Foreigner is a 2017 action thriller film directed by Martin Campbell and written by David Marconi, based on the 1992 novel The Chinaman by Stephen Leather. An American-British-Chinese co-production, it stars Jackie Chan, Pierce Brosnan, Michael McElhatton, Liu Tao, Charlie Murphy, Orla Brady and Katie Leung. The film follows a British-Nung Chinese man who seeks revenge for the death of his daughter.",
                ),
                BigCard(
                  percentage: "60%",
                  movieTitle: "Dora",
                  releaseDate: "Jun 1, 2020",
                  imageSource:
                      "https://image.shutterstock.com/image-photo/bangkok-thailand-30-july-2019-600w-1469937725.jpg",
                  message:
                      "Dora and the Lost City of Gold is a 2019 American adventure comedy film that is a live-action adaptation of the Nick Jr. animated television series Dora the Explorer and directed by James Bobin. The film stars Isabela Moner, Eugenio Derbez, Michael Peña, Eva Longoria, with Danny Trejo as the voice of Boots and Benicio del Toro as the voice of Swiper.",
                ),
                BigCard(
                  percentage: "58%",
                  movieTitle: "Tenet",
                  releaseDate: "Jul 1, 2020",
                  imageSource:
                      "https://image.shutterstock.com/image-photo/bangkok-thailand-sep-17-2020-600w-1819014005.jpg",
                  message:
                      "Tenet is a 2020 science fiction action-thriller film written and directed by Christopher Nolan, who produced it with Emma Thomas. A co-production between the United Kingdom and United States, it stars John David Washington, Robert Pattinson, Elizabeth Debicki, Dimple Kapadia, Michael Caine, and Kenneth Branagh. The film follows a secret agent who learns to manipulate the flow of time to prevent an attack from the future that threatens to annihilate the present world.",
                ),
              ],
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
