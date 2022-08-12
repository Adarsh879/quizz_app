import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SubjectCard extends StatefulWidget {
  Color BigColor;
  Color MidColor;
  Color SliderColor;
  String BigText;
  String LitText;
  double Perc;
  SubjectCard(
    Color this.BigColor,
    Color this.MidColor,
    Color this.SliderColor,
    String this.BigText,
    String this.LitText,
    double this.Perc,
  );

  @override
  State<SubjectCard> createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child: InkWell(
        // onTap: () async {
        //   try {
        //     // will implent this later using bloc ; now its kinda complicated
        //     var result = await Navigator.of(context).push(MaterialPageRoute(
        //         builder: (context) => QuizzPage(this.widget.BigText)));
        //     print(result);
        //     var temp1 = result["correct"];

        //     setState(() {
        //       Correct_answr = Correct_answr + temp1 as int;
        //     });

        //     if (result["perc"] * 100 > this.widget.Perc) {
        //       setState(() {
        //         this.widget.Perc = result["perc"] * 100;
        //         var temp = result["perc"] * 100;
        //         this.widget.LitText = "$temp% de reussite";
        //       });
        //     }
        //   } catch (e) {
        //     print(e);
        //   }
        // },
        child: Container(
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
                color: this.widget.BigColor,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(21.0, 15, 15, 10),
              child: Row(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 3,
                      ),
                      CircleAvatar(
                        backgroundColor: this.widget.MidColor,
                        radius: 20,
                        child: Icon(
                          Icons.history_edu,
                          color: this.widget.SliderColor,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          this.widget.BigText,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xff2E5961),
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 1),
                        Text(this.widget.LitText,
                            style: TextStyle(
                                color: this.widget.SliderColor,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LinearPercentIndicator(
                              backgroundColor: this.widget.MidColor,
                              width: 190.0,
                              lineHeight: 10.0,
                              barRadius: const Radius.circular(40),
                              percent: this.widget.Perc / 100,
                              progressColor: this.widget.SliderColor,
                            ),
                            const SizedBox(
                              width: 3,
                            )
                          ],
                        ),
                      ]),
                  const SizedBox(width: 20),
                  Column(
                    children: const [
                      SizedBox(height: 13),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xff2E5961),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
