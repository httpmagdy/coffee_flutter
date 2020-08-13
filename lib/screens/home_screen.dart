import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../utils/custom_text.dart';
import './home_pages/page_one.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ScreenUtil.init(context,
        width: size.width, height: size.height, allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
//        elevation: 0.9,
        bottom: _header(),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          PageOne(),
          PageOne(),
          PageOne(),
        ],
      ),
    );
  }

  CustomText tabText(String text) {
    return CustomText(
      text: text,
      fontWeight: FontWeight.bold,
      // fontSize: 17.0,
    );
  }

  PreferredSize _header() {
    double _heightTop = 44;
    return PreferredSize(
      preferredSize: Size.zero + Offset(0, _heightTop + 3),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(0),
                  height: _heightTop,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                      topLeft: Radius.circular(25.0),
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: IconButton(
                        icon: Icon(CupertinoIcons.search),
                        color: Colors.black45,
                        iconSize: 20,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Navigator.pushNamed(context, '$cartViewRoute');
                },
              ),
            ],
          ),
          TabBar(
            controller: tabController,
            indicatorColor: Colors.red,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.withOpacity(0.6),
            isScrollable: false,
            indicatorPadding: EdgeInsets.all(0),
            tabs: <Widget>[
              Tab(
                child: tabText('Coffee'),
              ),
              Tab(
                child: tabText('Machines'),
              ),
              Tab(
                child: tabText('Accessories'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
