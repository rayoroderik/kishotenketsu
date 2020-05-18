import PlaygroundSupport
import SwiftUI


public struct ComicLayoutView: View {
    // title
    @State private var showTitleText: Bool = false
    @State private var title: String = ""
    
    // images
    @State private var showImagePickerKi: Bool = false
    @State private var showImagePickerSho: Bool = false
    @State private var showImagePickerTen: Bool = false
    @State private var showImagePickerKetsu: Bool = false
    
    @State public var imageKi: Image? = nil
    @State public var imageSho: Image? = nil
    @State public var imageTen: Image? = nil
    @State public var imageKetsu: Image? = nil
    
    // panel subtitle
    @State private var showTitleKi: Bool = false
    @State private var showTitleSho: Bool = false
    @State private var showTitleTen: Bool = false
    @State private var showTitleKetsu: Bool = false
    
    @State private var kiTitle: String = ""
    @State private var shoTitle: String = ""
    @State private var tenTitle: String = ""
    @State private var ketsuTitle: String = ""
    
    // action sheet
    @State private var showSheetKi: Bool = false
    @State private var showSheetSho: Bool = false
    @State private var showSheetTen: Bool = false
    @State private var showSheetKetsu: Bool = false
    
    @State private var useCamera: Bool = false
    
    public init() {}
    
    public var body: some View {
        VStack {
            // Title section
            if !showTitleKetsu {
                Spacer().frame(height: 46)
            } else if !showTitleText {
                TextField("Insert your title here ", text: $title, onCommit: {
                    self.showTitleText = true
                })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200, height: 46, alignment: .center)
            } else {
                Text(title)
                    .font(.system(size: 46, design: .rounded))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
            }
            
            // Ki panel section
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 256, height: 160)
                    .border(Color.gray, width: 1)
                Image(systemName: "photo")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        self.showSheetKi = true
                }
                imageKi?
                    .resizable()
                    .frame(width: 254, height: 158, alignment: .center)
                    .scaledToFit()
                
            }.sheet(isPresented: self.$showImagePickerKi) {
                PhotoCaptureView(
                    showImagePicker: self.$showImagePickerKi, 
                    image: self.$imageKi, 
                    useCamera: self.$useCamera
                )
            }.actionSheet(isPresented: $showSheetKi) {
                ActionSheet(title: Text("What do you want to do?"),  
                            buttons: [
                                .default(Text("Open Camera"), action: {
                                    self.showSheetKi = false
                                    self.useCamera = true
                                    self.showImagePickerKi = true
                                }),
                                .default(Text("Open Gallery"), action: {
                                    self.showSheetKi = false
                                    self.useCamera = false
                                    self.showImagePickerKi = true
                                })
                    ]
                )
            }
            
            VStack {
                Spacer().frame(height: 12)
                if imageKi != nil && !showTitleKi {
                    TextField("Insert your subtitle here ", 
                              text: $kiTitle, 
                              onCommit: {
                                self.showTitleKi = true
                    })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 200, height: 46, alignment: .center)
                } else if showTitleKi {
                    Text(kiTitle)
                        .font(.system(size: 18, design: .rounded))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                }
                Spacer().frame(height: 24)
            }
            
            // Sho panel section
            if showTitleKi {
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 256, height: 160)
                        .border(Color.black, width: 1)
                    Image(systemName: "photo")
                        .foregroundColor(.gray)
                        .onTapGesture {
                            self.showSheetSho = true
                    }
                    imageSho?
                        .resizable()
                        .frame(width: 254, height: 158, alignment: .center)
                        .scaledToFit()
                }.sheet(isPresented: self.$showImagePickerSho) {
                    PhotoCaptureView(
                        showImagePicker: self.$showImagePickerSho, 
                        image: self.$imageSho, 
                        useCamera: self.$useCamera
                    )
                }.actionSheet(isPresented: $showSheetSho) {
                    ActionSheet(title: Text("What do you want to do?"),  
                                buttons: [
                                    .default(Text("Open Camera"), action: {
                                        self.showSheetSho = false
                                        self.useCamera = true
                                        self.showImagePickerSho = true
                                    }),
                                    .default(Text("Open Gallery"), action: {
                                        self.showSheetSho = false
                                        self.useCamera = false
                                        self.showImagePickerSho = true
                                    })
                        ]
                    )
                }
                
                VStack {
                    Spacer().frame(height: 12)
                    if imageSho != nil && !showTitleSho {
                        TextField("Insert your subtitle here ", 
                                  text: $shoTitle, 
                                  onCommit: {
                                    self.showTitleSho = true
                        })
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 200, height: 46, alignment: .center)
                    } else if showTitleSho {
                        Text(shoTitle)
                            .font(.system(size: 18, design: .rounded))
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                    }
                    Spacer().frame(height: 24)
                }
            }
            
            // Ten panel section
            if showTitleSho {
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 256, height: 160)
                        .border(Color.black, width: 1)
                    Image(systemName: "photo")
                        .foregroundColor(.gray).onTapGesture {
                            self.showSheetTen = true
                    }
                    imageTen?
                        .resizable()
                        .frame(width: 254, height: 158, alignment: .center)
                        .scaledToFit()
                }.sheet(isPresented: self.$showImagePickerTen) {
                    PhotoCaptureView(
                        showImagePicker: self.$showImagePickerTen, 
                        image: self.$imageTen, 
                        useCamera: self.$useCamera
                    )
                }.actionSheet(isPresented: $showSheetTen) {
                    ActionSheet(title: Text("What do you want to do?"),  
                                buttons: [
                                    .default(Text("Open Camera"), action: {
                                        self.showSheetTen = false
                                        self.useCamera = true
                                        self.showImagePickerTen = true
                                    }),
                                    .default(Text("Open Gallery"), action: {
                                        self.showSheetTen = false
                                        self.useCamera = false
                                        self.showImagePickerTen = true
                                    })
                        ]
                    )
                }
                
                VStack {
                    Spacer().frame(height: 12)
                    if imageTen != nil && !showTitleTen {
                        TextField("Insert your subtitle here", 
                                  text: $tenTitle, 
                                  onCommit: {
                                    self.showTitleTen = true
                        })
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 200, height: 46, alignment: .center)
                    } else if showTitleTen {
                        Text(tenTitle)
                            .font(.system(size: 18, design: .rounded))
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                    }
                    Spacer().frame(height: 24)
                }
            }
            
            // Ketsu panel section
            if showTitleTen {
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 256, height: 160)
                        .border(Color.black, width: 1)
                    Image(systemName: "photo")
                        .foregroundColor(.gray).onTapGesture {
                            self.showSheetKetsu = true
                    }
                    imageKetsu?
                        .resizable()
                        .frame(width: 254, height: 158, alignment: .center)
                        .scaledToFit()
                }.sheet(isPresented: self.$showImagePickerKetsu) {
                    PhotoCaptureView(
                        showImagePicker: self.$showImagePickerKetsu, 
                        image: self.$imageKetsu, 
                        useCamera: self.$useCamera
                    )
                }.actionSheet(isPresented: $showSheetKetsu) {
                    ActionSheet(title: Text("What do you want to do?"),  
                                buttons: [
                                    .default(Text("Open Camera"), action: {
                                        self.showSheetKetsu = false
                                        self.useCamera = true
                                        self.showImagePickerKetsu = true
                                    }),
                                    .default(Text("Open Gallery"), action: {
                                        self.showSheetKetsu = false
                                        self.useCamera = false
                                        self.showImagePickerKetsu = true
                                    })
                        ]
                    )
                }
                
                VStack {
                    Spacer().frame(height: 12)
                    if imageKetsu != nil && !showTitleKetsu {
                        TextField("Insert your subtitle here ", 
                                  text: $ketsuTitle, 
                                  onCommit: {
                                    self.showTitleKetsu = true
                        })
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 200, height: 46, alignment: .center)
                    } else if showTitleKetsu {
                        Text(ketsuTitle)
                            .font(.system(size: 18, design: .rounded))
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                    }
                    Spacer().frame(height: 24)
                }
            }
        }.frame(width: 400, height: getContentHeight(), alignment: .center)
            .background(Color.white).cornerRadius(8)
    }
    
    private func getContentHeight() -> CGFloat {
        var contentHeight: CGFloat = 400
        if imageKi != nil {
            contentHeight += 200
        }
        if imageSho != nil {
            contentHeight += 200
        }
        if imageTen != nil {
            contentHeight += 200
        }
        
        return contentHeight
    }
}
