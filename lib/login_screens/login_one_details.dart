import 'package:flutter/material.dart';

class LoginOneDetails extends StatefulWidget {
  final String id,
      fullName,
      phoneNo,
      retailerId,
      retailerName,
      outletId,
      outletName,
      sessionId,
      sessionPassCode,
      success,
      message;

  final bool updatePin;

  const LoginOneDetails(
      {Key? key,
      required this.id,
      required this.fullName,
      required this.phoneNo,
      required this.retailerId,
      required this.retailerName,
      required this.outletId,
      required this.outletName,
      required this.updatePin,
      required this.sessionId,
      required this.sessionPassCode,
      required this.success,
      required this.message})
      : super(key: key);

  @override
  _LoginOneDetailsState createState() => _LoginOneDetailsState();
}

class _LoginOneDetailsState extends State<LoginOneDetails> {
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
          title: const Text("Login One"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                  children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset('images/no_data.png'),
                  ),
                ),
                const Expanded(
                  child: Align(
                    child: Text("Login Success",
                        /*overflow: TextOverflow.ellipsis,*/),
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(widget.success),
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin:  const EdgeInsets.only(left: 1, top: 1, bottom: 1, right: 1),
                        height: 30,
                        width: 30,
                        child: Image.asset('images/no_data.png'),
                      ),
                    ),
                    const Expanded(
                      child: Align(
                        child: Text("Login Success",
                          /*overflow: TextOverflow.ellipsis,*/),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(widget.success),
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text("LoginSuccess: ${widget.success}"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text("LoginMessage: ${widget.message}"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text("Id: ${widget.id}"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text("FullName: ${widget.fullName}"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text("PhoneNumber: ${widget.phoneNo}"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text("RetailerId: ${widget.retailerId}"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text("RetailerName: ${widget.retailerName}"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text("OutletId: ${widget.outletId}"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text("OutletName: ${widget.outletName}"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child:
                    Text("Update Pin Status: ${widget.updatePin.toString()}"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text("SessionId: ${widget.sessionId}"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text("SessionPassCode: ${widget.sessionPassCode}"),
              ),
            ),
          ],
        )));
  }
}
