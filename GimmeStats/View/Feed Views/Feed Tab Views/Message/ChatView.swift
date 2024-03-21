//
//  ChatView.swift
//  GimmeStats
//
//  Created by Joey Yong on 12/1/22.
//

import SwiftUI

enum BubblePosition {
    case left
    case right
}

class ChatModel: ObservableObject {
    var text = ""
    @Published var arrayOfMessages : [String] = []
    @Published var arrayOfPositions : [BubblePosition] = []
    @Published var position = BubblePosition.right
}

struct ChatBubble<Content>: View where Content: View {
    let position: BubblePosition
    let color : Color
    let content: () -> Content
    init(position: BubblePosition, color: Color, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.color = color
        self.position = position
    }
    
    var body: some View {
        HStack(spacing: 0 ) {
            content()
                .padding(.all, 15)
                .foregroundColor(Color.white)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .overlay(
                    Image(systemName: "arrowtriangle.left.fill")
                        .foregroundColor(color)
                        .rotationEffect(Angle(degrees: position == .left ? -50 : -130))
                        .offset(x: position == .left ? -5 : 5)
                    ,alignment: position == .left ? .bottomLeading : .bottomTrailing)
        }
        .padding(position == .left ? .leading : .trailing , 15)
        .padding(position == .right ? .leading : .trailing , 60)
        .frame(width: UIScreen.main.bounds.width, alignment: position == .left ? .leading : .trailing)
    }
}

struct CustomScrollView<Content>: View where Content: View {
    var axes: Axis.Set = .vertical
    var reversed: Bool = false
    var scrollToEnd: Bool = false
    var content: () -> Content

    @State private var contentHeight: CGFloat = .zero
    @State private var contentOffset: CGFloat = .zero
    @State private var scrollOffset: CGFloat = .zero
    
    

    var body: some View {
        GeometryReader { geometry in
            if self.axes == .vertical {
                self.vertical(geometry: geometry)
            } else {
                // implement same for horizontal orientation
            }
        }
        .clipped()
    }

    private func vertical(geometry: GeometryProxy) -> some View {
        VStack {
            content()
        }
        .modifier(ViewHeightKey())
        .onPreferenceChange(ViewHeightKey.self) {
            self.updateHeight(with: $0, outerHeight: geometry.size.height)
        }
        .frame(height: geometry.size.height, alignment: (reversed ? .bottom : .top))
        .offset(y: contentOffset + scrollOffset)
        //.animation(.easeInOut)
        .background(Color.white)
        .gesture(DragGesture()
            .onChanged { self.onDragChanged($0) }
            .onEnded { self.onDragEnded($0, outerHeight: geometry.size.height) }
        )
    }

    private func onDragChanged(_ value: DragGesture.Value) {
        self.scrollOffset = value.location.y - value.startLocation.y
    }

    private func onDragEnded(_ value: DragGesture.Value, outerHeight: CGFloat) {
        let scrollOffset = value.predictedEndLocation.y - value.startLocation.y

        self.updateOffset(with: scrollOffset, outerHeight: outerHeight)
        self.scrollOffset = 0
    }

    private func updateHeight(with height: CGFloat, outerHeight: CGFloat) {
        let delta = self.contentHeight - height
        self.contentHeight = height
        if scrollToEnd {
            self.contentOffset = self.reversed ? height - outerHeight - delta : outerHeight - height
        }
        if abs(self.contentOffset) > .zero {
            self.updateOffset(with: delta, outerHeight: outerHeight)
        }
    }

    private func updateOffset(with delta: CGFloat, outerHeight: CGFloat) {
        let topLimit = self.contentHeight - outerHeight

        if topLimit < .zero {
             self.contentOffset = .zero
        } else {
            var proposedOffset = self.contentOffset + delta
            if (self.reversed ? proposedOffset : -proposedOffset) < .zero {
                proposedOffset = 0
            } else if (self.reversed ? proposedOffset : -proposedOffset) > topLimit {
                proposedOffset = (self.reversed ? topLimit : -topLimit)
            }
            self.contentOffset = proposedOffset
        }
    }
}

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = value + nextValue()
    }
}

extension ViewHeightKey: ViewModifier {
    func body(content: Content) -> some View {
        return content.background(GeometryReader { proxy in
            Color.clear.preference(key: Self.self, value: proxy.size.height)
        })
    }
}
struct ChatView: View {
    @ObservedObject var model = ChatModel()
    
    @State private var wrongButton = false
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                
                VStack {
                    Button {
                        self.wrongButton.toggle()
                    } label: {
                        Label("", systemImage: "ellipsis")
                            .navigationDestination(isPresented: $wrongButton) {
                                Message()
                                    .navigationBarBackButtonHidden()
                            }
                    }
                    //MARK:- ScrollView
                    CustomScrollView(scrollToEnd: true) {
                        LazyVStack {
                            ForEach(0..<model.arrayOfMessages.count, id:\.self) { index in
                                ChatBubble(position: model.arrayOfPositions[index], color: model.arrayOfPositions[index] == BubblePosition.right ?.green : .blue) {
                                    Text(model.arrayOfMessages[index])
                                }
                            }
                        }
                    }.padding(.top)
                    //MARK:- text editor
                    HStack {
                        ZStack {
                            TextEditor(text: $model.text)
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                                .foregroundColor(.gray)
                        }.frame(height: 50)
                        
                        Button("send") {
                            if model.text != "" {
                                model.position = model.position == BubblePosition.right ? BubblePosition.left : BubblePosition.right
                                model.arrayOfPositions.append(model.position)
                                model.arrayOfMessages.append(model.text)
                                model.text = ""
                            }
                        }
                    }.padding()
                    
                }
            }
        }
        
    }
    
    struct ChatView_Previews: PreviewProvider {
        static var previews: some View {
            ChatView()
        }
    }
    
}
