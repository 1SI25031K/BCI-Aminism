//
//  ContentView.swift
//  ABCi
//
//  Created by Kosei Miyamoto on 2025/11/17.
//

import SwiftUI

// 1. ナビゲーション用のページ識別子
enum Page: Hashable {
    case introduction
    // メインコンテンツ
    case tsukumogami
    case shikigami
    case yorishiro
    // 結論
    case conclusion
}

struct ContentView: View {
    
    // 2. 現在選択中のページを管理する
    @State private var selectedPage: Page? = .introduction // 起動時はIntroductionを選択

    var body: some View {
        NavigationSplitView {
            
            // --- サイドバー (Sidebar) ---
            List(selection: $selectedPage) {
                
                // 3. String Catalogのキーで表示
                Text("intro.title") // Localizable.xcstringsから読み込まれる
                    .tag(Page.introduction)

                // 4. メインコンテンツをフォルダ（DisclosureGroup）でまとめる
                DisclosureGroup("main_content.title") { // キーを追加してください
                    
                    Text("tsukumogami.title") // キーを追加してください
                        .tag(Page.tsukumogami)
                    
                    Text("shikigami.title") // キーを追加してください
                        .tag(Page.shikigami)

                    Text("yorishiro.title") // キーを追加してください
                        .tag(Page.yorishiro)
                }

                Text("conclusion.title") // キーを追加してください
                    .tag(Page.conclusion)
            }
            .navigationTitle("Menu")
            .listStyle(.sidebar) // macOS/iPadOSらしいスタイル
            
        } detail: {
            // --- 詳細ビュー (Detail) ---
            // 5. 選択されたページに応じて表示を切り替え
            VStack {
                switch selectedPage {
                case .introduction:
                    IntroductionView()
                case .tsukumogami:
                    TsukumogamiView()
                case .shikigami:
                    ShikigamiView()
                case .yorishiro:
                    YorishiroView()
                case .conclusion:
                    ConclusionView()
                case .none:
                    Text("Select a topic from the menu.")
                }
            }
            // 6. 白黒シックなUIの基本設定
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("AppBackground")) // 背景を黒に
            .foregroundStyle(Color("AppText")) // 文字を白に
        }
    }
}

#Preview {
    ContentView()
}
