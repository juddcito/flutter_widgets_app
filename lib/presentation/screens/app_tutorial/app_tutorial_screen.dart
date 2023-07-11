import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SlideInfo {

  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);

}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Excepteur do culpa labore eiusmod dolor. Commodo commodo amet consequat nisi exercitation qui id. Cupidatat non nulla id sunt aute et. Culpa id duis veniam enim sit eu. Sit nostrud fugiat non velit commodo magna.', 'assets/images/1.png'),
  SlideInfo('Entrega rápida', 'In anim ea nisi labore. Lorem ad velit reprehenderit et et ullamco quis anim commodo mollit occaecat voluptate. Minim nulla sint anim aliquip minim et sunt nulla cillum dolor. Sit est nostrud anim proident velit et quis officia. Anim consectetur ullamco elit consectetur anim commodo non qui. Est id mollit veniam proident sit. Qui ipsum veniam officia consectetur magna incididunt nostrud enim excepteur officia.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Cillum irure anim do nisi ea occaecat laborum ad non veniam mollit cupidatat. Officia irure officia ullamco eu ea. Dolor magna proident ipsum ad sunt dolore magna cillum ut. Id mollit sint ex deserunt nisi pariatur nisi in culpa officia minim ad labore nulla. Tempor esse do enim veniam consequat culpa id amet nisi sunt ullamco deserunt.', 'assets/images/3.png'),

];




class AppTutorialScreen extends StatefulWidget {

  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {

      final page = pageViewController.page ?? 0;

      if ( !endReached && page >= ( slides.length - 1.5 ) ){
        setState(() {
          endReached = true;
        });
      }
     });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          PageView(
            controller: pageViewController ,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (slideData) => _Slide(
                title: slideData.title,
                caption: slideData.caption,
                imageUrl: slideData.imageUrl
              )
            ).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            ),
          ),

          endReached ? 
            Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay: const Duration ( seconds: 1 ),
                child: FilledButton(
                  onPressed: () => context.pop(),
                  child: const Text('Comenzar'),
                ),
              ),
            ) : SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage( imageUrl )),
            const SizedBox(height: 20),
            Text( title, style: titleStyle, ),
             const SizedBox(height: 10),
             Text( caption, style: captionStyle, )
          ],
        ),
      ),
      );
  }
}