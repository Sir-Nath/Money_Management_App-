import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_management_app/constants/color_constant.dart';

import '../models/card_model.dart';
import '../models/operation_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;

  List<T> map<T>(List list, Function handler){
    List<T> result = [];
    for (var i = 0; i < list.length ; i++){
      result.add(handler(i, list[i]));
    }
    return result;
  }
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
                      onTap: () {
                        debugPrint('drawer clicked');
                      },
                      child: SvgPicture.asset('assets/svg/drawer_icon.svg')),
                  Container(
                    height: 59,
                    width: 59,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('assets/images/user_image.png'))),
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
                  Text(
                    'Good Morning',
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: kBlackColor),
                  ),
                  Text(
                    'Peter Nathaniel ',
                    style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: kBlackColor),
                  ),
                ],
              ),
            ),
            Container(
              height: 199,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16, right: 6),
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      height: 199,
                      width: 344,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: Color(cards[index].cardBackground)),
                      child: Stack(
                        children: [
                          Positioned(
                            child:
                                SvgPicture.asset(cards[index].cardElementTop),
                          ),
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: SvgPicture.asset(
                                  cards[index].cardElementBottom)),
                          Positioned(
                            left: 29,
                            top: 48,
                            child: Text(
                              'CARD NUMBER',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: kWhiteColor),
                            ),
                          ),
                          Positioned(
                            left: 29,
                            top: 65,
                            child: Text(
                              cards[index].cardNumber,
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: kWhiteColor),
                            ),
                          ),
                          Positioned(
                            right: 21,
                            top: 35,
                            child: Image.asset(
                              cards[index].cardType,
                              width: 27,
                              height: 27,
                            ),
                          ),
                          Positioned(
                              left: 29,
                              bottom: 45,
                              child: Text(
                                'CARD HOLDERNAME',
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: kWhiteColor),
                              ),
                          ),
                          Positioned(
                            left: 29,
                            bottom: 21,
                            child: Text(
                              cards[index].user,
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: kWhiteColor),
                            ),
                          ),
                          Positioned(
                            left: 202,
                            bottom: 45,
                            child: Text(
                              'EXPIRY DATE',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: kWhiteColor),
                            ),
                          ),
                          Positioned(
                            left: 202,
                            bottom: 21,
                            child: Text(
                              cards[index].cardExpired,
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: kWhiteColor),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                bottom: 13,
                top: 29,
                right: 8
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(' Operations', style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kBlackColor
                  ),),
                  Row(
                    children: map<Widget> (datas, (index, selected){
                      return Container(
                        alignment: Alignment.centerLeft,
                        height: 9,
                        width: 9,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: current == index? kBlueColor: kTwentyBlueColor
                        ),
                      );
                    })
                  )
                ],
              ),
            ),
            Container(
              height: 123,
              child: ListView.builder(
                itemCount: datas.length,
                  padding: EdgeInsets.only(left: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                  return Container();  //OperationCard();
              }),
            )
          ],
        ),
      ),
    );
  }
}

// class OperationCard extends StatefulWidget {
//
//   late String operation;
//   late final String selectedIcon;
//   final String unSelectedIcon;
//   final bool isSelected ;
//
//   OperationCard({this.operation, this.selectedIcon, this.unSelectedIcon, this.isSelected});
//
//   @override
//   State<OperationCard> createState() => _OperationCardState();
// }
//
// class _OperationCardState extends State<OperationCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 16),
//       width: 123,
//       height: 123,
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: kTenBlackColor,
//             blurRadius: 10,
//             spreadRadius: 5,
//             offset: Offset(8.0, 8.0)
//           ),
//         ],
//           borderRadius: BorderRadius.circular(15), color: widget.isSelected! ? kBlueColor:kWhiteColor
//       ),
//       child: Column(
//         children: [
//           SvgPicture.asset(widget.isSelected ? widget.isSelected: widget.unSelectedIcon),
//           SizedBox( height: 9,),
//           Text(widget.operation,
//           textAlign: TextAlign.center,
//           style: GoogleFonts.inter(
//             fontSize: 15,
//             fontWeight: FontWeight.w700,
//             color: widget.isSelected! ? kWhiteColor : kBlueColor
//           ),)
//
//         ],
//       ),
//     );
//   }
// }
