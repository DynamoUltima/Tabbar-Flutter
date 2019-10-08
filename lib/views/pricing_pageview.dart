import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tabbar/adaptive_widgets.dart';

class PricingPager extends StatefulWidget {
  @override
  _PricingPagerState createState() => _PricingPagerState();
}

class _PricingPagerState extends State<PricingPager> {
  PageController pagePriceController = PageController(viewportFraction: 1.0);
  int currentPage;
  bool activer = false;

  
  _myCuperStyle(BuildContext context) {
    var cuperStyle = CupertinoTheme.of(context)
        .textTheme
        .navTitleTextStyle
        .apply(color: CupertinoColors.white);
    return cuperStyle;
  }

  _animationContainerState(bool activeState) {
    if (activeState) {
      activer = true;
    } else {
      activer = false;
    }
  }

  _buildPricingPage1() {
    //Animated Properties
    //bool active=false;
    final double blur = activer ? 30 : 0;
    final double offset = activer ? 20 : 0;
    final double top = activer ? 50 : 100;
    String imageUrl =
        'https://images.unsplash.com/photo-1497367917223-64c44836be50?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60';

    return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.bounceOut,
        margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                  color: Colors.black87,
                  blurRadius: blur,
                  offset: Offset(offset, offset))
            ]),
        child: Center(
          child: Text(
            'Pricers',
            style: _myCuperStyle(context),
          ),
        )); //easoutquit
  }

  _buildPricingPage0() {
    //Animated Properties
    // bool active=false;
    final double blur = activer ? 30 : 0;
    final double offset = activer ? 20 : 0;
    final double top = activer ? 2.5 : 5;
    String imageUrl =
        'https://images.unsplash.com/photo-1497367917223-64c44836be50?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60';

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.bounceOut,
      margin: EdgeInsets.only(top: top, bottom: 50, right: 0),
      decoration: BoxDecoration(
        color: Colors.blue,

        borderRadius: BorderRadius.circular(20),
        // image: DecorationImage(
        //     image: NetworkImage(imageUrl), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
              color: Colors.black87,
              blurRadius: blur,
              offset: Offset(offset, offset))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              100,
              (index) {
                return Center(
                  child: Card(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Image.network(imageUrl),
                        Text(
                          'Item $index',
                          style: Theme.of(context).textTheme.headline,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ); //easoutquit
  }

  _buildPricingPage2() {
    //Animated Properties
    // bool active=false;
    final double blur = activer ? 30 : 0;
    final double offset = activer ? 20 : 0;
    final double top = activer ? 50 : 100;
    String imageUrl =
        'https://images.unsplash.com/photo-1497367917223-64c44836be50?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60';

    return GestureDetector(
      // onTap: (){
      //   setState(() {
      //     active=true;
      //   });
      // },
      child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.bounceOut,
          margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                    color: Colors.black87,
                    blurRadius: blur,
                    offset: Offset(offset, offset))
              ]),
          child: Center(
            child: Text(
              'Pricers',
              style: _myCuperStyle(context),
            ),
          )),
    ); //easoutquit
  }

  @override
  void initState() {
    //super.initState();
    pagePriceController.addListener(() {
      int next = pagePriceController.page.round();

      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List slideList = <Widget>[
      _buildPricingPage0(),
      _buildPricingPage1(),
      _buildPricingPage2()
    ];
    double screenHeight = MediaQuery.of(context).size.height;
    

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        height: screenHeight*0.7,
        // width: 250,
        child: PageView.builder(
          pageSnapping: true,
          controller: pagePriceController,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: slideList.length,
          itemBuilder: (BuildContext context, int index) {
            if (slideList.length >= 1) {
              bool active = index == currentPage;
              _animationContainerState(active);
              return slideList[index];
            }
          },
        ),
      ),
    );
  }
}
