import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:show_movies/model/movie.dart';
import 'package:show_movies/network/network_service.dart';
import 'package:show_movies/utils/custom_widgets.dart';

class CastDetailsPageSliver extends StatefulWidget {
  const CastDetailsPageSliver({
    Key key,
    this.name,
    this.profilePath,
    this.id,
  }) : super(key: key);
  final String name;
  final String profilePath;
  final int id;

  @override
  _CastDetailsPageSliverState createState() => _CastDetailsPageSliverState();
}

class _CastDetailsPageSliverState extends State<CastDetailsPageSliver>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  //int _selectedIndex;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      setState(() {
        // _selectedIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: 200.0,
                  //snap: true,
                  floating: true,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      child: Container(
                        padding: const EdgeInsets.all(50.0),
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                NetworkApiRoutes.imageSource +
                                    widget.profilePath,
                                //    scale: 5.0,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        // child: CircleAvatar(
                        //   radius: 100,
                        //   child: Image.network(
                        //     imageSource + widget.profilePath,
                        //     fit: BoxFit.contain,
                        //   ),
                        //
                        //   // backgroundImage: NetworkImage(
                        //   //   imageSource + widget.profilePath,
                        //   //   // scale: 100.0,
                        //   // ),
                        //   //backgroundColor: Colors.transparent,
                        // ),
                      ),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Colors.blue,
                            Colors.deepPurpleAccent,
                          ],
                        ),
                      ),
                    ),
                    centerTitle: true,
                    title: Text(
                      widget.name,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      labelColor: Colors.white,
                      indicatorColor: Colors.greenAccent,
                      controller: _controller,
                      tabs: <Widget>[
                        Tab(
                          icon: Icon(
                            Icons.movie,
                            size: Theme.of(context).accentIconTheme.size,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.tv,
                            size: Theme.of(context).accentIconTheme.size,
                          ),
                        ),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              controller: _controller,
              children: <Widget>[
                FutureBuilder<MovieCreditsResults>(
                  future: NetworkApiRoutes.fetchMovieCredits(widget.id),
                  builder: (BuildContext context,
                      AsyncSnapshot<MovieCreditsResults> snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                    }

                    return snapshot.hasData
                        ? MovieCreditsDisplay(
                            movieCredits: snapshot.data.movieCreditsResults)
                        : const Center(child: CircularProgressIndicator());
                  },
                ),
                FutureBuilder<TvCreditsResults>(
                  future: NetworkApiRoutes.fetchTvCredits(widget.id),
                  builder: (BuildContext context,
                      AsyncSnapshot<TvCreditsResults> snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                    }

                    return snapshot.hasData
                        ? TvCreditsDisplay(
                            tvCredits: snapshot.data.tvCreditsResults)
                        : const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            Colors.blue,
            Colors.deepPurpleAccent,
          ],
        ),
      ),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
