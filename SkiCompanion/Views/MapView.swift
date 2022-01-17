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
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var mapLoader = MapLoader()
    var body: some View {
        VStack{
            HStack{
                Spacer()
                // rotate button
                Button(action: { rotate.toggle() }){
                    Image(systemName: "arrow.clockwise")
                        //black if light mode, white if dark
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
            }
            .padding()
            // Map image
            Image(uiImage: image)
                // fit the bounds of the screen
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: rotate ? 2*bounds.height/3 : bounds.width, height: rotate ? bounds.width : 2*bounds.height/3)
                .rotationEffect(rotate ? .degrees(90) : .degrees(0))
                .onReceive(mapLoader.$image) { image in
                    // load map
                    self.image = image
                }
                .onAppear {
                    // fetch map
                    mapLoader.loadImage(for: urlString)
                }
            Spacer()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
