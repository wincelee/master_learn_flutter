import 'package:flutter/material.dart';
import 'package:master_learn/classes/config.dart';

Widget setUpUserImage(imageFetchType, picture) {
  if (Config().equalsIgnoreCase("imageNetwork", imageFetchType ?? '')) {
    return CircleAvatar(
        radius: 100,
        child: ClipOval(
          child: Image.network(
            picture ?? Config.nullNetworkImage,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ));
  } else if (Config()
      .equalsIgnoreCase("circleAvatarWithRadius", imageFetchType ?? '')) {
    return CircleAvatar(
      backgroundColor: Colors.orangeAccent,
      // radius of the circle image view limit mostly to 30
      radius: 100.0,
      child: CircleAvatar(
        backgroundImage: NetworkImage(picture ?? Config.nullNetworkImage),
        // radius of the image inside the circle
        radius: 98.0,
      ),
    );
  } else if (Config().equalsIgnoreCase(
      "circleAvatarInsideCircleAvatar", imageFetchType ?? '')) {
    return CircleAvatar(
      // radius of the circle image view limit mostly to 30
      radius: 100,
      backgroundColor: Colors.lightGreen,
      child: CircleAvatar(
        // radius of the image inside the circle
        radius: 98,
        backgroundImage: NetworkImage(picture ?? Config.nullNetworkImage),
      ),
    );
  } else if (Config().equalsIgnoreCase("fadeInImage", imageFetchType ?? '')) {
    return SizedBox(
      height: 200,
      width: 200,
      child: FadeInImage.assetNetwork(
        placeholder: 'images/loading_dots.gif',
        image: picture ?? Config.nullNetworkImage,
      ),
    );
  } else if (Config()
      .equalsIgnoreCase("circularFadeInImage", imageFetchType ?? '')) {
    return SizedBox(
      width: 200,
      height: 200,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: ClipOval(
          child: FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              placeholder: "images/converging_dots.gif",
              image: picture ?? Config.nullNetworkImage),
        ),
      ),
    );
  }

  return CircleAvatar(
    radius: 100,
    backgroundImage: NetworkImage(picture ?? Config.nullNetworkImage),
  );
}
