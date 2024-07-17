import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/strings.dart';
import 'home_screen.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SvgPicture.asset(
                  "assets/images/business.svg",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.5,
                  fit: BoxFit.cover,
                )
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(Strings.newsFromAroundTheWorldForYou,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
               Strings.bestTimeToRoadTakeYourTimeToRead,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: (){
                Get.to(()=>const HomeScreen());
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blue,borderRadius: BorderRadius.circular(25)
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(child: Text(Strings.getStarted,style: const TextStyle(fontSize:20,color: Colors.white,fontWeight:FontWeight.w500,),)),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
