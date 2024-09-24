/// Copyright (c) 2024 Kodeco Inc.
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct ContentView: View {
  @State var colorChoice: String?
  @State var quantity = 1
  let item = Item(name: "Shirt", imageName: "tshirt.fill")

  let model = Model(
    name: "Sam",
    height: 170,
    size: "M",
    preferredTermsOfAddress: [])

  var body: some View {
    VStack {
      Grid {
        GridRow {
          Text(item.name)
            .gridCellColumns(2)
        }

        GridRow {
          VStack {
            Text("This is a man's \(item.name.lowercased()) that is never worn as well as by a woman.")
            .multilineTextAlignment(.center)
            .padding(.horizontal, 40)

            Divider()

            Text("🏃🏻‍➡️\(model.name) is \(model.height) cm tall. He wears size \(model.size).")

            Divider()

            Text("Tap to select the color of your \(item.name.lowercased()):")
          }
          .gridCellColumns(2)
          .font(.body)
        }

        Divider()

        GridRow {
          ColorButton(
            colorChoice: $colorChoice,
            color: "red",
            fgColor: .red,
            imageName: item.imageName)

          ColorButton(
            colorChoice: $colorChoice,
            color: "blue",
            fgColor: .blue,
            imageName: item.imageName)
        }

        Divider()

        GridRow {
          ColorButton(
            colorChoice: $colorChoice,
            color: "green",
            fgColor: .green,
            imageName: item.imageName)

          ColorButton(
            colorChoice: $colorChoice,
            color: "black",
            fgColor: .black,
            imageName: item.imageName)
        }

        Divider()

        GridRow {
          if let colorChoice {
            HStack {
              Stepper(value: $quantity, in: 1...10) {
                Text("\(quantity) \(colorChoice) \(item.name.lowercased())")
                  .padding(.horizontal, 60)
              }
            }
            .gridCellColumns(2)
            .font(.body)
          }
        }
      }
      .font(.largeTitle)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct ColorButton: View {
  @Binding var colorChoice: String?
  let color: String
  let fgColor: Color
  let imageName: String
  var body: some View {
    // swiftlint:disable:next multiple_closures_with_trailing_closure
    Button(action: { colorChoice = color }) {
      VStack {
        Image(systemName: imageName)
          .foregroundColor(fgColor)
        Text(color)
      }
    }
  }
}