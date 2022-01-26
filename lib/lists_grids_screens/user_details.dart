import 'package:flutter/material.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/widgets/set_up_user_image.dart';

class UserDetails extends StatefulWidget {
  final String index, email, about, name, picture, imageFetchType;

  const UserDetails(
      {Key? key,
      required this.index,
      required this.email,
      required this.about,
      required this.name,
      required this.picture,
      required this.imageFetchType})
      : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(widget.email),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(5),
                child: setUpUserImage(widget.imageFetchType, widget.picture)),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: Text(widget.name),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: Text("${widget.about} \n\n${widget.imageFetchType}"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5),
              child: Center(
                child: Text("Setting Up Image Using Child And Builder"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Builder(builder: (BuildContext context) {
                if (Config()
                    .equalsIgnoreCase("imageNetwork", widget.imageFetchType)) {
                  return CircleAvatar(
                    radius: 100,
                    child: ClipOval(
                      child: Image.network(
                        widget.picture,
                        width: 190,
                        height: 190,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                    // circle avatar background color
                    backgroundColor: Colors.deepOrange,
                  );
                } else if (Config().equalsIgnoreCase(
                    "circleAvatarWithRadius", widget.imageFetchType)) {
                  return CircleAvatar(
                    backgroundColor: Colors.orangeAccent,
                    // radius of the circle image view limit mostly to 30
                    radius: 100.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.picture),
                      // radius of the image inside the circle
                      radius: 98.0,
                    ),
                  );
                } else if (Config().equalsIgnoreCase(
                    "circleAvatarInsideCircleAvatar", widget.imageFetchType)) {
                  return CircleAvatar(
                    // radius of the circle image view limit mostly to 30
                    radius: 100,
                    backgroundColor: Colors.lightGreen,
                    child: CircleAvatar(
                      // radius of the image inside the circle
                      radius: 98,
                      backgroundImage: NetworkImage(widget.picture),
                    ),
                  );
                } else if (Config()
                    .equalsIgnoreCase("fadeInImage", widget.imageFetchType)) {
                  return FadeInImage.assetNetwork(
                    placeholder: 'images/loading_dots.gif',
                    image: widget.picture,
                  );
                } else if (Config().equalsIgnoreCase(
                    "circularFadeInImage", widget.imageFetchType)) {
                  return Hero(
                    tag: widget.index,
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: ClipOval(
                        child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: "images/converging_dots.gif",
                            image: widget.picture),
                      ),
                    ),
                  );
                }

                return CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(widget.picture),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
