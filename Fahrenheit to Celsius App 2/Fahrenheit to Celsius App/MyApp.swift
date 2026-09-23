import SwiftUI

struct TemperatureView: View {
    @State private var temperatureF = ""
    @State private var temperatureC = ""
    @State private var convertedCelsius = "??"
    @State private var convertedFahrenheit = "??"

    enum TemperatureUnits {
        case fahrenheit
        case celsius
    }

    func convert(_ inputTemperature: String, to: TemperatureUnits) -> String {
        switch to {
        case .celsius:
            if let temperature = Double(inputTemperature) {
                let celsius = (temperature - 32) * 5 / 9
                let result = String(format: "%.2f", celsius)
                return result
            }

        case .fahrenheit:
            if let temperature = Double(inputTemperature) {
                let fahrenheit = (temperature * 9 / 5) + 32
                let result = String(format: "%.2f", fahrenheit)
                return result
            }
        }

        return ""
    }

    var body: some View {
        VStack {
            Text("Temperature Conversion")
                .font(.largeTitle)

            HStack {
                Text("Fahrenheit: ")

                TextField("", text: $temperatureF)

                Button("To ºC") {
                    convertedCelsius = convert(temperatureF, to: .celsius)
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
            }
            .padding()

            HStack {
                Text("Celsius: ")

                TextField("", text: $temperatureC)

                Button("To ºF") {
                    convertedFahrenheit = convert(temperatureC, to: .fahrenheit)
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
            }
            .padding()

            HStack {
                Text("Celsius Result: ")
                Text(convertedCelsius)
            }

            HStack {
                Text("Fahrenheit Result: ")
                Text(convertedFahrenheit)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    TemperatureView()
}
