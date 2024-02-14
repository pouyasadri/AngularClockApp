//
//  ContentView.swift
//  AngularClockApp
//
//  Created by Pouya Sadri on 14/02/2024.
//
// Instagram : pouyasadri_dev

import SwiftUI
//MARK: - Contnet view
struct ContentView: View {
    var body: some View {
        AngularGradientClock()
    }
}

#Preview {
    ContentView()
}
//MARK: - Angular Gradient Clock
struct AngularGradientClock: View {
	var body: some View {
		ZStack{
			ClockFaceView()
			DayNightIndicatorView()
		}
	}
}

//MARK: - ClockFaceView
struct ClockFaceView : View {
	@State private var rotation : Double = 0.0
	
	private let gradient = AngularGradient(
		gradient: Gradient(colors: [.black, .gray, .white]),
		center: .center,
		startAngle: .degrees(0),
		endAngle: .degrees(360)
	)
	var body: some View {
		Circle()
			.fill(self.gradient)
			.frame(width: 1000,height: 1000)
			.rotationEffect(.degrees(rotation))
			.onAppear{
				withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: false)){
					rotation = 360
				}
			}
			.clipShape(Circle())
	}
}
//MARK: - Day Night Indicator
struct DayNightIndicatorView : View {
	var body: some View {
		ZStack{
			Text("Day")
				.font(.system(size: 50,weight: .regular,design: .default))
				.foregroundStyle(.black)
				.offset(y:-300)
			
			Text("Night")
				.font(.system(size: 50,weight: .regular,design: .default))
				.foregroundStyle(.white)
				.offset(y:300)
		}
	}
}
