import 'package:flutter/material.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class SpecialCoffeeCard extends StatelessWidget {

  List<String> specialImages =[
    "assets/images/coffee5.jpg",
    "assets/images/coffee6.jpg",
    "assets/images/coffee7.jpg"
  ];

  List<String> coffeeName = [
    "Caramel Macchiato ",
    "Turkish Coffee",
    "Cafe Cubanoi"
  ];

  List<String> ingredients = [
    "Ice, Cramel , Espresso",
    "Turkish coffee, Sugar",
    "Ground Coffee, Water"
  ];

  List<String> price = ["5.00", "7.50", "9.00"];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: specialImages.length,
      itemBuilder: (context, index){
      return Column(
        children: [
          Container(
            height: 140,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                //========== Image ===========//
                Container(
                  height: 120,
                  width: 150,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage(
                              specialImages[index]),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(
                  width: 15,
                ),
                //========== Details  ===========// 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffeeName[index],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      ingredients[index],
                      style: const TextStyle(
                          color: Color(0xff919293), fontSize: 12),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      //========== Price  ===========// 
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              r'$ ',
                              style:  TextStyle(
                                  color: Color(0xffd17842),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              // ignore: unnecessary_string_interpolations
                              "${price[index]}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: const Color(0xffd17842),
                                borderRadius:
                                BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ))
                      ],
                    ),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
                color: const Color(0xff141921),
                borderRadius: BorderRadius.circular(20)),
          ),
          const SizedBox(height: 15,),
        ],
      );
    });
  }
}
