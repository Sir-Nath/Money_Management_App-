
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_management_app/constants/color_constant.dart';

import '../models/card_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                          onTap: (){
                            debugPrint('drawer clicked');
                          },
                      child: SvgPicture.asset('asset/svg/drawer_icon.svg')),
                  Container(
                    height: 59,
                    width: 59,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('asset/images/user_image.png')
                        )
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Good Morning', style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: kBlackColor
                  ),),
                  Text('Peter Nathaniel ', style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor
                  ),),
                ],
              ),
            ),
            Container(
              height: 199,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16, right: 6),
                itemCount: cards.length,
                  itemBuilder: (context, index){
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 199,
                  width: 344,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Color(cards[index].cardBackground)
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        child: SvgPicture.asset(cards[index].cardElementTop),
                      ),
                      Positioned(
                          right: 0,
                          bottom: 0,
                          child: SvgPicture.asset(cards[index].cardElementBottom)),
                      Positioned(
                        left: 29,
                        right: 65,
                        child: Text(
                          'CARD NUMBER',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: kWhiteColor
                          ),
                        ),
                      ),
                      Positioned(
                        left: 29,
                        right: 64 ,
                        child: Text(
                          cards[index].cardNumber,
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kWhiteColor
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
