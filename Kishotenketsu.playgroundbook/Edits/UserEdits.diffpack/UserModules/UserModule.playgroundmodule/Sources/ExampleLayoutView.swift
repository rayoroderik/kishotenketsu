
import PlaygroundSupport
import SwiftUI


public struct ExampleLayoutView: View {
    // Title
    @State private var title: String = "WWDC 4-Koma"
    
    // Images
    @State public var imageKi: UIImage = #imageLiteral(resourceName: "firstImage.jpeg")
    @State public var imageSho: UIImage = #imageLiteral(resourceName: "secondImage.jpeg")
    @State public var imageTen: UIImage = #imageLiteral(resourceName: "thirdImage.jpeg")
    @State public var imageKetsu: UIImage = #imageLiteral(resourceName: "fourthImage.jpeg")
    
    // Panel subtitle
    @State private var kiTitle: String = "Me getting ready for WWDC scholarship"
    @State private var shoTitle: String = "Realized the scholarship might be cancelled"
    @State private var tenTitle: String = "But then, Apple announced the Swift Student Challenge!"
    @State private var ketsuTitle: String = "Let's get the bread!"
    
    public init() {}
    
    public var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 46, design: .rounded))
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
            
            // Ki panel section
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 256, height: 160)
                    .border(Color.gray, width: 1)
                Image(uiImage: imageKi)
                    .resizable()
                    .frame(width: 254, height: 158, alignment: .center)
                    .scaledToFit()
                
            }
            VStack {
                Spacer()
                    .frame(height: 12)
                Text(kiTitle)
                    .font(.system(size: 18, design: .rounded))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height: 24)
            }
            
            // Sho panel section
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 256, height: 160)
                    .border(Color.black, width: 1) 
                Image(uiImage: imageSho)
                    .resizable()
                    .frame(width: 254, height: 158, alignment: .center)
                    .scaledToFit()
            }
            VStack {
                Spacer()
                    .frame(height: 12)
                Text(shoTitle)
                    .font(.system(size: 18, design: .rounded))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height: 24)
            }
            
            // Ten panel section
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 256, height: 160)
                    .border(Color.black, width: 1)
                Image(uiImage: imageTen)
                    .resizable()
                    .frame(width: 254, height: 158, alignment: .center)
                    .scaledToFit()
            }
            VStack {
                Spacer()
                    .frame(height: 12)
                Text(tenTitle)
                    .font(.system(size: 18, design: .rounded))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height: 24)
            }
            
            // Ketsu panel section
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 256, height: 160)
                    .border(Color.black, width: 1)
                Image(uiImage: imageKetsu)
                    .resizable()
                    .frame(width: 254, height: 158, alignment: .center)
                    .scaledToFit()
            }
            VStack {
                Spacer()
                    .frame(height: 12)
                Text(ketsuTitle)
                    .font(.system(size: 18, design: .rounded))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height: 24)
            }
        }
        .frame(width: 400, height: 1000, alignment: .center)
        .background(Color.white).cornerRadius(8)
    }
}
