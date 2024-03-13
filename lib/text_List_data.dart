import 'package:flutter/material.dart';
int textSend = 0;
/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
 final List chat;

  const MyStatefulWidget( this.chat, {super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool selected = false;

  // List<String> text = [];
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Colors.white12),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView.builder(padding: EdgeInsets.zero,
                  itemCount: widget.chat.length,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(widget.chat.isNotEmpty?widget.chat[index]:""),
                  );
                },),
              ),
        /*      Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50),
                Text(widget.chat.isNotEmpty?widget.chat:"")
                *//*        TextButton(
                  onPressed: () {
                    setState(() {
                      if(textController.text.length>0){
                        text.add(textController.text);
                        textController.clear();
                      } else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Text is empty"),
                        ));
                      }
                    });
                  },
                  child: Text("add"),
                ),*//*
               ,
              ],
            ),*/ Align(alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    border:  OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.teal),borderRadius: BorderRadius.circular(20)
                    ),
                    prefixIcon: Icon(
                      Icons.emoji_emotions_outlined,
                      color:Colors.indigo,
                    ),
                    suffixIcon: GestureDetector(onTap: () {
                      setState(() {
                        if(textController.text.length>0){

                          widget.chat.add(textController.text+"\n");
                          // widget.chatnumber = widget.chat.length;
                          textController.clear();
                        } else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Text is empty"),
                          ));
                        }
                      });
                    },
                      child: Icon(Icons.send
                      ),
                    ),

                    hintText: "Type here",
                  ),
                ),
              ),
            ),],
          ),
        ),
      ),
    );
  }
}
