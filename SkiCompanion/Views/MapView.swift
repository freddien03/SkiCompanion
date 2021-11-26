//
//  MapView.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 26/11/2021.
//

import SwiftUI

struct MapView: View {
    let bounds = UIScreen.main.bounds
    var urlString: String = "https://skimap.org/data/989/3788/1580063296jpg_render.jpg"
    @State private var rotate = false
    @State var image: UIImage = UIImage()
    @ObservedObject var mapLoader = MapLoader()
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: { rotate.toggle() }){
                    Image(systemName: "arrow.clockwise")
                        .accentColor(.black)
                }
            }
            .padding()
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: rotate ? 2*bounds.height/3 : bounds.width, height: rotate ? bounds.width : 2*bounds.height/3)
                .onReceive(mapLoader.$image) { image in
                    self.image = image
                }
                .onAppear {
                    mapLoader.loadImage(for: urlString)
                }
                .rotationEffect(rotate ? .degrees(90) : .degrees(0))
            Spacer()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
