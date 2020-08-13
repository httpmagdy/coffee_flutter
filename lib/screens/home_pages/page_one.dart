import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../_routing/routes.dart';
import '../../models/coffee.dart';
import '../../providers/products_prov.dart';
import '../../utils/custom_text.dart';
import '../../utils/custom_title.dart';
import '../../widgets/card_coffee.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProv>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10, top: 20),
            child: CustomTitle(title: 'Best Sales'),
          ),
          Container(
            height: 260.h,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.data2.length,
              itemBuilder: (BuildContext context, i) => GestureDetector(
                onTap: () {},
                child: CardCoffee(
                  title: products.data2[i].title,
                  image: products.data2[i].image,
                  acidity: products.data2[i].acidity,
                  bitterness: products.data2[i].bitterness,
                  intensity: products.data2[i].intensity,
                  body: products.data2[i].body,
                  notes: products.data2[i].aromaticNotes,
                  profile: products.data2[i].aromaticProfile,
                  roasting: products.data2[i].roasting,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10, top: 30),
            child: CustomTitle(title: 'Master Origin'),
          ),
          _contBox(products.data2, context),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
            child: CustomTitle(title: 'Italana'),
          ),
          _contBox(products.data, context),
        ],
      ),
    );
  }

  List<Widget> _valRate(int count, int last, [Widget pNum]) {
    var i = 0;

    List<Widget> value = [];

    for (i; i < count; i++) {
      value.add(Icon(Icons.stop, size: 9, color: Colors.black));
    }
    value.add(pNum ?? Text(''));
    for (i; i < last; i++) {
      value.add(Icon(Icons.stop, size: 9, color: Colors.grey.shade400));
    }

    return value;
  }

  Widget _contBox(List<ModelCoffee> _coffeeList, BuildContext context) {
    return Column(
      children: _coffeeList
          .map(
            (coffee) => Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(5),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.3),
                //     spreadRadius: 1,
                //     blurRadius: 5,
                //     offset: Offset(1, 1), // changes position of shadow
                //   ),
                // ],
              ),
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '$detailsScreenRoute',
                    arguments: coffee,
                  );
                },
                contentPadding: EdgeInsets.only(bottom: 5, left: 10, right: 10),
                leading: Image.network(
                  coffee.image,
                  width: 60.w,
                  height: 60.h,
                ),
                title: CustomTitle(
                  title: coffee.title.toString(),
                  fontSize: ScreenUtil().setSp(16),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      text: coffee.aromaticProfile.toString(),
                      fontSize: ScreenUtil().setSp(14),
                    ),
                    SizedBox(height: 7),
                    Row(
                      children: _valRate(
                          coffee.intensity,
                          13,
                          CustomText(
                            text: coffee.intensity.toString(),
                            fontSize: ScreenUtil().setSp(9),
                            color: Colors.red,
                          )),
                    ),
                  ],
                ),
                trailing: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add_shopping_cart, color: Colors.black),
                      onPressed: () {},
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: '\$130.00',
                      fontSize: ScreenUtil().setSp(10),
                      color: Colors.red,
                    ),
                  ],
                ),
                isThreeLine: true,
              ),
            ),
          )
          .toList(),
    );
  }
}
