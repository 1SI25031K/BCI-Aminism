//
//  ShikigamiView.swift
//  ABCi
//
//  Created by Kosei Miyamoto on 2025/11/17.
//
import SwiftUI
import AVFoundation // 音声を扱うために必須

struct ShikigamiView: View {
    
    // 画像の切り替え状態
    @State private var isShowingDoll: Bool = false
    
    // 音声プレーヤーをこのView専用に保持
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                Text("shikigami.title")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                // --- Dynamic Element (Image Tap + Sound) ---
                ZStack {
                    if isShowingDoll {
                        Image("shikigami_doll") // 人形の画像
                            .resizable()
                            .scaledToFit()
                            .transition(.opacity)
                    } else {
                        Image("shikigami_master") // 陰陽師の画像
                            .resizable()
                            .scaledToFit()
                            .transition(.opacity)
                    }
                }
                .frame(height: 300)
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .onTapGesture {
                    // 1. タップ時に音を再生
                    playSound(fileName: "paper_snap", fileType: "mp3")
                    
                    // 2. 画像を切り替え
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isShowingDoll.toggle()
                    }
                }
                .overlay(alignment: .bottomTrailing) {
                    Text("Tap to Transform")
                        .font(.caption)
                        .padding(8)
                        .background(.black.opacity(0.5))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(10)
                }
                // -------------------------------------------

                Text("shikigami.p1")
                    .font(.body)
                
                Text("shikigami.p2")
                    .font(.body)
                
                Text("shikigami.p3")
                    .font(.body)

                Spacer()
            }
            .padding(40)
        }
    }
    
    // このView専用の音声再生関数
    private func playSound(fileName: String, fileType: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: fileType) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("エラー: 音声ファイルを再生できませんでした。 \(error.localizedDescription)")
            }
        } else {
            print("エラー: \(fileName).\(fileType) が見つかりません。")
        }
    }
}

#Preview {
    ShikigamiView()
}
