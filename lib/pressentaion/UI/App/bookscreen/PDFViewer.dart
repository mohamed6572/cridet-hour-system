import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';
import 'package:cridet_hour_system/pressentaion/resources/constants_manager.dart';
import 'package:flutter/material.dart';

class PDFViewer_Screen extends StatefulWidget {
   String name;

  PDFViewer_Screen(this.name);

  @override
  State<PDFViewer_Screen> createState() => _PDFViewer_ScreenState();
}

class _PDFViewer_ScreenState extends State<PDFViewer_Screen> {
  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  @override
  void dispose() {
    document.clearImageCache();
    super.dispose();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/images/ch.pdf');
    setState(() => _isLoading = false);
  }

  changePDF(value) async {
    setState(() => _isLoading = true);
    if (value == 1) {
      document = await PDFDocument.fromAsset('assets/images/ch.pdf');
    } else if (value == 2) {
      document = await PDFDocument.fromURL(
          "https://cse.unl.edu/~cbourke/ComputerScienceOne.pdf");
    } else {
      document = await PDFDocument.fromAsset('assets/images/ch.pdf');
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

      appBar: AppBar(
        title:  Text('${widget.name}',style: TextStyle(
          color: Colors.white
        ),),
        leading: IconButton(
          onPressed: (){
           Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        // actions: <Widget>[
        //   GestureDetector(
        //     onTap: () {
        //       setState(() => _isLoading = false);
        //       loadDocument();
        //
        //     },
        //     child: Icon(Icons.cached),
        //   ),
        //
        //   SizedBox(
        //     width: 15,
        //   )
        // ],
      ),
      body: Column(
        children: <Widget>[
          // !_usePDFListView
          //     ?
          Expanded(
                  child: Center(
                    child: _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : PDFViewer(
                            document: document,
                            zoomSteps: 1,
                            //uncomment below line to preload all pages
                            // lazyLoad: false,
                            // uncomment below line to scroll vertically
                            scrollDirection: Axis.horizontal,

                            enableSwipeNavigation: true,
                            showPicker: false,
                            showIndicator: true,
                            showNavigation: true,
                            //uncomment below code to replace bottom navigation with your own
                            navigationBuilder:
                            (context, page, totalPages, jumpToPage, animateToPage) {
                          return ButtonBar(
                            alignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.first_page),
                                onPressed: () {
                                  jumpToPage(page: 0);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  animateToPage(page: page! - 2);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {
                                  animateToPage(page: page);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.last_page),
                                onPressed: () {
                                  jumpToPage(page: totalPages! - 1);
                                },
                              ),
                            ],
                          );
                        },
                          ),
                  ),
                )
              // : Expanded(
              //     child: _isLoading
              //         ? Center(
              //             child: CircularProgressIndicator(),
              //           )
              //         : PDFListViewer(
              //             document: document,
              //             preload: true,
              //           ),
              //   ),
        ],
      ),
    ));
  }
}
