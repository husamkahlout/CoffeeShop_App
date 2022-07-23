import 'package:flutter/material.dart';

import '../widgets/coffee_card.dart';
import '../widgets/special_coffee_card.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  TabController? tabController;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff0c0f14),
        body: SafeArea(
          child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(18),
          children: [
            // const SizedBox(height: ,),
            Container(
              width:MediaQuery.of(context).size.width,
              height: 620,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
        ///============================== Menu ====================================///
                      Container(
                        child: const Icon(
                          Icons.grid_view_rounded,
                          size: 25,
                          color:Color(0xff4d4f52),
                        ),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xff1b2027),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
        ///============================== Profile Image ====================================///
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xff1b2027),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage("assets/images/husam.png"),
                        ),) 
                    ],
                  ),
        
        ///============================== Main Text ====================================///              
                  const SizedBox(height: 25,),
                  const Text("Find the best\ncoffee for you",
                    style: TextStyle(
                    letterSpacing: 1.1,
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold, 
                  ),
                  ),
        ///============================== TextField ====================================///    
                  const SizedBox(height:20,),
                  Container(
                    margin: const EdgeInsets.only(bottom: 6.8),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xff141921),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Find your coffee...",
                        hintStyle: TextStyle(
                        color: Color(0xff3c4046),),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search,color: Color.fromARGB(255, 128, 127, 127)),
                      ),
                    ),
                  ),
        ///============================== Tabs ====================================///
                  const SizedBox(height:10,),
                     TabBar(
                      isScrollable: true,
                      controller: tabController,
                      labelColor: const Color(0xffd17842),
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      unselectedLabelColor: const Color(0xff3c4046),
                      indicator: CircleTabIndicator(color: const Color(0xffd17842), radius: 4),
                      tabs: const [
                        Tab(
                          text: "Cappuccino",
                        ),
                        Tab(
                          text: "Americano",
                        ),
                        Tab(
                          text: "Espresso",
                        ),
                        Tab(
                          text: "Mocha",
                        ),
                        Tab(
                          text: "Macchiato",
                        ),
                        Tab(
                          text: "Doppio",
                        ),
                      ]),
                      CoffeeCard(),
                        const Text(
                    "Special for you",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
             SpecialCoffeeCard(),
                ],
              ),
        ),
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff0c0f14),
        selectedItemColor: const Color.fromRGBO(209, 120, 66, 1),
        unselectedItemColor: const Color(0xff4d4f52),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "",),
          const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          const BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
        ],
        
      ),
          );
  }
}

///============================== Paint Circle under the tab ====================================///
class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({required Color color, required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([void onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
