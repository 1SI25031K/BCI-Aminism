//
//  IntroductionView.swift
//  ABCi
//
//  Created by Kosei Miyamoto on 2025/11/17.
//
import SwiftUI

struct IntroductionView: View {
    var body: some View {
        // 1. スクロールできるように ScrollView を使います
        ScrollView {
            // 2. VStackでコンテンツを縦に並べます
            VStack(alignment: .leading, spacing: 20) { // 左揃え、間隔20
                
                // 3. タイトル (String Catalogから)
                Text("intro.title")
                    .font(.largeTitle) // 大きなフォント
                    .fontWeight(.bold) // 太字
                
                // 4. [Image 1] のプレースホルダー
                // 今後、ここに画像を追加します
                Rectangle() // 仮の四角形
                    .fill(Color.gray.opacity(0.3)) // 薄いグレー
                    .frame(height: 250) // 高さを指定
                    .overlay(Text("[Image 1: Conceptual BCI Art]")) // 仮のテキスト
                
                // 5. 段落 (String Catalogから)
                Text("intro.p1")
                    .font(.body)
                
                Text("intro.p2")
                    .font(.body)
                
                Text("intro.p3")
                    .font(.body)
                
                Spacer() // 残りのスペースを埋める
            }
            .padding(40) // 内側に余白を設ける
        }
    }
}

#Preview {
    IntroductionView()
}
