//
//  YorishiroView.swift
//  ABCi
//
//  Created by Kosei Miyamoto on 2025/11/17.
//

import SwiftUI
import AVFoundation // 1. 音声再生のためにインポート

struct YorishiroView: View {
    
    // 2. オーディオプレイヤーの状態変数
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                Text("yorishiro.title")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                // 静的な画像
                Image("yorishiro_tree")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                // --- Dynamic Element (Audio) ---
                
                // 3. 音声再生ボタン
                Button(action: {
                    playSound()
                }) {
                    HStack {
                        Image(systemName: "play.circle.fill")
                        Text("Play Sacred Bell Sound") // String Catalogで管理
                    }
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primary.opacity(0.1)) // 白黒テーマに追従
                    .cornerRadius(10)
                }
                .buttonStyle(.plain) // ボタンのデフォルトスタイルを解除
                
                // --- 音声ここまで ---

                Text("yorishiro.p1")
                    .font(.body)
                
                Text("yorishiro.p2")
                    .font(.body)

                Spacer()
            }
            .padding(40)
        }
    }
    
    // 4. 音声を再生する関数
    func playSound() {
        guard let url = Bundle.main.url(forResource: "yorishiro_bell", withExtension: "m4a") else {
            print("Audio file not found")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Couldn't load audio file: \(error)")
        }
    }
}

#Preview {
    YorishiroView()
}
