import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends CachedNetworkImage {
  CachedImage({Key? key, required String image, BoxFit? fit})
      : super(
          key: key,
          fit: fit ?? BoxFit.cover,
          imageUrl: image,
          errorWidget: (__, ___, _) {
            return const Icon(Icons.fastfood_outlined);
          },
          placeholder: (context, _) => Container(
            color: Colors.black38,
          ),
        );
}

// class Chache extends StatelessWidget {
//   const Chache({Key? key, this.fit, required this.image}) : super(key: key);
//   final BoxFit? fit;
//   final String image;
//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       fit: fit ?? BoxFit.cover,
//       imageUrl: image,
//       placeholder: (context, _) => Container(
//         color: Colors.black38,
//       ),
//     );
//   }
// }