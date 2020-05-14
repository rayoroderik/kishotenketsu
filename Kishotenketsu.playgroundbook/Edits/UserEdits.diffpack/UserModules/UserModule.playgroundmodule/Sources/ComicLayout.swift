import PlaygroundSupport
import SwiftUI


public struct ComicLayoutView: View {
    public var title: String
    
    public init(title: String = "Title Here") {
        self.title = title
    }
    
    public var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 46))
                .foregroundColor(Color.black)
            
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 400, height: 200)
                    .border(Color.black, width: 1)
                Image(systemName: "camera")
                    .foregroundColor(.gray)
            }
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 400, height: 200)
                    .border(Color.black, width: 1)
                Image(systemName: "camera")
                    .foregroundColor(.gray)
            }
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 400, height: 200)
                    .border(Color.black, width: 1)
                Image(systemName: "camera")
                    .foregroundColor(.gray)
            }
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 400, height: 200)
                    .border(Color.black, width: 1)
                Image(systemName: "camera")
                    .foregroundColor(.gray)
            }
        }.frame(width: 520, height: 1000, alignment: .center).background(Color.white)
    }
}
