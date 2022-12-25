import 'package:demo_app/HomePage/dataListTile.dart';
import 'package:demo_app/Model/detailsModel.dart';
import 'package:demo_app/Provider/detailsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Details> data = [];
  bool _init = false;
  bool loading = false;
  bool contact = true;
  @override
  Widget build(BuildContext context) {
    if (!_init) {
      getDetails();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 70,
              backgroundColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                    icon: Icon(
                      Icons.account_circle_outlined,
                      size: 35,
                      color: Colors.grey.shade700,
                    ),
                    onPressed: () {}),
              ),
              actions: [
                Icon(
                  Icons.settings,
                  size: 35,
                  color: Colors.grey.shade700,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Icon(
                    Icons.search_outlined,
                    size: 35,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 20),
                  child: Text(
                    'My Queries',
                    style: GoogleFonts.inter(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade900),
                  ),
                ),
              ],
            )),
            (_init == true)
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                    (context, index) => DataListTile(
                      queryId: data[index].queryId,
                      querytext: data[index].querytext,
                      comments: data[index].comments,
                      date: data[index].date,
                      location: data[index].location,
                    ),
                    childCount: data.length,
                  ))
                : (_init != true)
                    ? SliverFillRemaining(
                        child: Transform(
                          transform: Matrix4.translationValues(0, -40, 0),
                          child: Center(
                            // height: 30,
                            // width: 30,
                            child: Lottie.asset(
                                'assets/fading-cubes-loader-2.json',
                                height: 150,
                                width: 150),
                          ),
                        ),
                      )
                    : (_init != true && data.isEmpty)
                        ? SliverFillRemaining(
                            child: Center(
                              child: Text(
                                'No Data',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade800),
                              ),
                            ),
                          )
                        : SliverToBoxAdapter()
          ],
        ),
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45),
          ),
          color: Colors.white,
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.18,
              top: MediaQuery.of(context).size.height * 0.89,
              right: MediaQuery.of(context).size.width * 0.18),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 5, right: 10, bottom: 5),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.home,
                      size: 30,
                      color: Colors.grey.shade800,
                    )),
              ),
              Spacer(
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 20, bottom: 5),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chat_bubble_outline,
                      size: 25,
                      color: Colors.grey.shade600,
                    )),
              ),
            ],
          ),
        ),
      ]),

      //   Lottie.network(
      //       'https://assets10.lottiefiles.com/private_files/lf30_pidikbny.json'),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Container(
          height: 65,
          width: 65,
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.grey.shade800,
            child: Icon(
              Icons.add,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  getDetails() async {
    DetailsProvider detailsProvider =
        Provider.of<DetailsProvider>(context, listen: false);
    setState(() {
      loading = true;
    });
    await detailsProvider.getDetails().then((value) {
      setState(() {
        data = value;

        loading = false;
        _init = true;
      });
    });
  }
}
