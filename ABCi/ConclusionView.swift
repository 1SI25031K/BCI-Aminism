//
//  ConclusionView.swift
//  ABCi
//
//  Created by Kosei Miyamoto on 2025/11/18.
//

import SwiftUI

struct ConclusionView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                // 1. タイトル
                Text("conclusion.title")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)

                // 2. 画像 (象徴的なビジュアル)
                Image("conclusion_image")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )

                // 3. 結論のテキスト (3つの段落)
                VStack(alignment: .leading, spacing: 16) {
                    Text("conclusion.p1")
                    Text("conclusion.p2")
                    Text("conclusion.p3")
                }
                .font(.body)
                .lineSpacing(6) // 行間を少し広げて読みやすく

                // (オプション) もし最後に動画で締めくくりたい場合は、
                // ここに YouTubeView(videoID: "...") を追加できます。
                
                Spacer()
                
                // 4. 最後のメッセージ (強調)
                Text("Will we choose domination, or will we choose coexistence?")
                    .font(.headline)
                    .italic()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 20)
                    .opacity(0.8)
            }
            .padding(40)
        }
    }
}

#Preview {
    ConclusionView()
}
