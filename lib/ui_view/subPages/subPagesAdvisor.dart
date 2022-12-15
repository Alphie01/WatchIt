import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_templates/bottom_navigation_view/contents.dart';
import 'package:theme_templates/ui_view/widget/app_large_text.dart';
import 'package:theme_templates/ui_view/widget/app_text.dart';

class GridViewAdvisor extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  GridViewAdvisor({Key? key, this.animation, this.animationController})
      : super(key: key);

  @override
  State<GridViewAdvisor> createState() => _GridViewAdvisorState();
}

class _GridViewAdvisorState extends State<GridViewAdvisor> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.animation!.value), 0.0),
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 25),
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white.withOpacity(0.1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(15),
                      child: AppLargeText(
                        text: "More Like This...",
                        color: Colors.white,
                        size: 22,
                      )),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 3/5,
                                crossAxisCount: 3),
                        itemCount: movies[0].length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                image: DecorationImage(image: NetworkImage(movies[0][index]["imgs"][0]), fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              color: Colors.black.withOpacity(.3),
                            ),
                          );
                        }),
                  ),

                  Container(
                    
                    width: double.maxFinite,
                    padding: EdgeInsets.all(15),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(FontAwesomeIcons.chevronDown, color: Colors.white,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: AppText(text: "Show Even More...", color: Colors.white,size: 14,),
                      )
                    ]),
                  )




                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
