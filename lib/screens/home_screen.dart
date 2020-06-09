import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../widgets/card_coffee.dart';
import '../models/coffee.dart';
import '../utils/custom_text.dart';
import '../utils/custom_title.dart';

class HomeScreen extends StatelessWidget {

  final List<ModelCoffee> _ispiresoNapoli = [
    ModelCoffee('Ispireso Napoli', 'https://i.ibb.co/5h4Hsh2/napoli-xx.png','Exceptionally dark & creamy', 'Intense', 13, 5, 1, 4, 3),
    ModelCoffee('Ispirazione Palermo Kazaar', 'https://i.ibb.co/PTwXLFk/kazaar-hd-1-1.png','Exceptionally Intense & Syrupy', 'Intense', 12, 5, 1, 4, 3),
    ModelCoffee('Ispirazione Ristretto Italiano', 'https://i.ibb.co/whr34B1/ristretto-hd-3.png','Powerful & Contrasting', 'Intense', 10, 5, 1, 4, 3),
    ModelCoffee('Ispirazione Ristretto Decaffeinato', 'https://i.ibb.co/crG5Zx5/nespresso-2-1-1.png','Powerful & Contrasting', 'Intense', 10, 5, 1, 4, 3),
    ModelCoffee('Ispirazione Firenze Arpeggio', 'https://i.ibb.co/9ZqbcBv/arpeggio-hd-3.png','Intense & Creamy', 'Intense', 9, 5, 1, 4, 3),
    ModelCoffee('Ispirazione Firenze Arpeggio Decaffeinato', 'https://i.ibb.co/pn2qRG8/arpeggio-decaffeinato-hd-new-look-1-1.png','Intense & Creamy', 'Intense', 9, 5, 1, 4, 3),
    ModelCoffee('Ispirazione Venezia', 'https://i.ibb.co/BrCvtfD/venezia-xx.png','Exceptionally dark & creamy', 'Harmoniously balanced & thick body', 8, 5, 1, 4, 3),
    ModelCoffee('Ispirazione Roma', 'https://i.ibb.co/yyBbdz1/roma-hd-2.png','Exceptionally dark & creamy', 'Intense', 8, 5, 1, 4, 3),
    ModelCoffee('Ispirazione Genova Livanto', 'https://i.ibb.co/gWtQzQp/livanto-hd-1.png','Exceptionally dark & creamy', 'Round & Intense', 6, 5, 1, 4, 3),
  ];

  final List<ModelCoffee> _masterOrigin = [
    ModelCoffee('India', 'https://i.ibb.co/mzLTW6B/7712-3.png','Intense And Spicy', 'Balanced', 11, 5, 1, 4, 3),
    ModelCoffee('Indonesia', 'https://i.ibb.co/ZJZsKqw/7711-3.png','Rich And Woody', 'Balanced', 8, 5, 1, 4, 3),
    ModelCoffee('Colombia', 'https://i.ibb.co/1nkBRfS/7715-3.png','Fruity And Vibrant', 'Balanced', 6, 5, 1, 4, 3),
    ModelCoffee('Nicaragua', 'https://i.ibb.co/R748nn8/7713-3.png','Sweet And Harmonious', 'Balanced', 5, 5, 1, 4, 3),
    ModelCoffee('Ethiopia', 'https://i.ibb.co/F0Fc4NC/7714-3.png','Flowery And Bright', 'Balanced', 4, 5, 1, 4, 3),
  ];


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ScreenUtil.init(context, width: size.width, height: size.height, allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(onPressed: () {}, child: Text("Coffee")),
                FlatButton(onPressed: () {}, child: Text("Machines")),
                FlatButton(onPressed: () {}, child: Text("Accessories")),
              ],
            ),
            Container(
              height: 260.h,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _ispiresoNapoli.length,
                itemBuilder: (BuildContext context, i) => CardCoffee(
                  title: _ispiresoNapoli[i].title,
                  image: _ispiresoNapoli[i].image,
                  acidity: _ispiresoNapoli[i].acidity,
                  bitterness: _ispiresoNapoli[i].bitterness,
                  intensity: _ispiresoNapoli[i].intensity,
                  body: _ispiresoNapoli[i].body,
                  notes: _ispiresoNapoli[i].aromaticNotes,
                  profile: _ispiresoNapoli[i].aromaticProfile,
                  roasting: _ispiresoNapoli[i].roasting,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              child: CustomTitle(
                title: 'ISPIRAZIONE ITALIANA :',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                textAlign: TextAlign.start,
              ),
            ),
            _contBox(_ispiresoNapoli),

            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              child: CustomTitle(
                title: 'Master Origin :',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                textAlign: TextAlign.start,
              ),
            ),
            _contBox(_masterOrigin),
          ],
        ),
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

  Widget _contBox(List<ModelCoffee> _coffeeList) {
    return Column(
      children: _coffeeList.map((coffee) => ListTile(
        onTap: () {},
        contentPadding: EdgeInsets.only(bottom: 5, left: 10, right: 10),
        leading: Image.network(
          coffee.image,
          width: 60.w,
          height: 60.h,
        ),
        title: CustomTitle(
          title: coffee.title.toString(),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomText(
              text: coffee.aromaticProfile.toString(),
              fontSize: 14,
            ),
            SizedBox(height: 7),
            Row(
              children: _valRate(coffee.intensity, 13, CustomText(text: coffee.intensity.toString(), fontSize: 9, color: Colors.red,)),
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
              fontSize: 10,
              color: Colors.red,
            ),
          ],
        ),
        isThreeLine: true,
      ),).toList(),
    );
  }

//  Widget _contBox() {
//    return Container(
//      padding: EdgeInsets.symmetric(horizontal: 10),
//      height: 60.h,
//      child: Row(
//
//        children: <Widget>[
//          Image.network(
//            'https://i.ibb.co/5h4Hsh2/napoli-xx.png',
//            width: 60.w,
//            height: 60.h,
//          ),
//          SizedBox(width: 10.w),
//          Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              CustomTitle(
//                title: 'Ispirazione Napoli',
//                fontSize: 16,
//                fontWeight: FontWeight.bold,
//              ),
//
//              CustomText(
//                text: 'Ispirazione Napoli',
//              ),
//            ],
//          ),
//
//        ],
//      ),
//    );
//  }

}
