import SwiftUI

// Example was taken from here
// https://www.xtabbas.com/implementing-snap-carousel-in-swiftui/
/// FullscreenCarouselCard is a wrapper view with fixed width and VStack
struct FullscreenCarouselCard<Content: View, ItemData: Identifiable>: View {
    private let content: Content
    private let width: CGFloat
    init(
        _ itemData: ItemData,
        width: CGFloat,
        @ViewBuilder content: (_ itemData: ItemData) -> Content
    ) {
        self.width = width
        self.content = content(itemData)
    }
    var body: some View {
        VStack(spacing: 0) {
            self.content
        }
        .frame(width: width)
    }
}

/// FullscreenCarousel is by the title full screen only, there is no way to swipe more than 1 card
/// the size of the card is the percentage from screen 50-100% cards would be visible by both sides
struct TesteCarroselView<Content: View, ItemData: Identifiable>: View {
    /// iterator content property
    private let content: (ItemData) -> Content
    /// spacing is required to calculate proper offset
    private let spacing: CGFloat
    /// ItemData to pass to iterator content
    let itemsData: [ItemData]
    
    @State private var screenDrag: Float = 0.0
    @State private var activeCard = 0
    @State private var calcOffset: CGFloat
    
    private let cardWidth: CGFloat
    private let numberOfItems: CGFloat
    // think about passing it from top
    private let screenWidth = UIScreen.main.bounds.width
    private let cardWithSpacing: CGFloat
    /// xOffset to shift HStack emulating scroll
    private let xOffsetToShift: CGFloat
    
    init(
        spacing: CGFloat,
        itemsData: [ItemData],
        zoomFactor: CGFloat = 0.9,
        @ViewBuilder content: @escaping (ItemData) -> Content
    ) {
        self.spacing = spacing
        self.cardWidth = screenWidth * zoomFactor - spacing * 2
        self.numberOfItems = CGFloat(itemsData.count)
        self.cardWithSpacing = cardWidth + spacing
        self.xOffsetToShift = cardWithSpacing * numberOfItems / 2 - cardWithSpacing / 2
        self._calcOffset = .init(wrappedValue: self.xOffsetToShift)
        self.itemsData = itemsData
        self.content = content
    }
    
    var body: some View {
        return HStack(spacing: spacing) {
            ForEach(itemsData) { singleItemData in
                FullscreenCarouselCard(
                    singleItemData,
                    width: cardWidth,
                    content: content
                )
            }
        }
        .offset(x: calcOffset, y: 0)
        .animation(
            .easeInOut(duration: 0.15)
        )
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { currentState in
                    self.calculateOffset(Float(currentState.translation.width))
                }
                .onEnded { value in
                    self.handleDragEnd(value.translation.width)
                }
        )
    }
    
    /// calculating proper offset for next slide
    func calculateOffset(_ screenDrag: Float) {
        let activeOffset = xOffsetToShift - (cardWithSpacing * CGFloat(activeCard))
        let nextOffset = xOffsetToShift - (cardWithSpacing * CGFloat(activeCard + 1))
        calcOffset = activeOffset
        if activeOffset != nextOffset {
            calcOffset = activeOffset + CGFloat(screenDrag)
        }
    }
    
    func handleDragEnd(_ translationWidth: CGFloat) {
        let impactMed = UIImpactFeedbackGenerator(style: .medium)
        if translationWidth < -50 && CGFloat(activeCard) < numberOfItems - 1 {
            activeCard += 1
            impactMed.impactOccurred()
        }
        if translationWidth > 50 && activeCard != 0 {
            activeCard -= 1
            impactMed.impactOccurred()
        }
        self.calculateOffset(0)
    }
    
}

private struct TestStruct: Identifiable, Hashable {
    let id = UUID()
    let test = "Test"
}
struct TesteCarroselView_Previews: PreviewProvider {
    static var previews: some View {
        return TesteCarroselView(
            spacing: 25,
            itemsData: [TestStruct(), TestStruct(), TestStruct(), TestStruct()],
            zoomFactor: 0.8
        ) { itemData in
            // this view is wrapped in VStack with proper width
            CardTransacoesView()
        }
    }
}

struct CardTransacoesView: View {
    var body: some View {
        
        GeometryReader { view in
            VStack {
                HStack {
                    Text("+")
                        .foregroundColor(.white)
                        .font(.custom("Quicksand-Regular", size: 50))
                        .frame(width: 50, height: 50, alignment: .center)
                        .background(Color.lightBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                        .padding([.leading, .top], 20.0)
                    
                    ZStack {
                        
                        Image("img1")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.grey200, lineWidth:2))
                            .padding(.leading, -80.0)
                        
                        Image("img1")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.grey200, lineWidth: 2))
                            .padding(.leading, -50.0)
                        
                        Image("img1")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.grey200, lineWidth: 2))
                    }
                    .frame(width: 150, alignment: .trailing)
                    .padding(.top, 20)
                }
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Text("Transações Feitas")
                    .foregroundColor(.darkBlue)
                    .fontWeight(.bold)
                    .font(.custom("Quicksand-Bold", size: 19))
                    .padding(.leading, 20.0)
                    .padding(.top, 10.0)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                
                Text("3.122 lançamentos")
                    .foregroundColor(.grey500)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.custom("Quicksand-Bold", size: 15))
                    .padding(.leading, 20.0)
                    .padding(.top, 3.0)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .frame(width: view.size.width, height: 150, alignment: .top)
            .background(Color.grey200)
        }
    }
}

struct CardTransacoesView_Previews: PreviewProvider {
    static var previews: some View {
        CardTransacoesView()
            .previewLayout(.fixed(width: 250, height: 150))
    }
}
