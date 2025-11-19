//
//  TsukumogamiView.swift
//  ABCi
//
//  Created by Kosei Miyamoto on 2025/11/17.
//
import SwiftUI
import AVFoundation // 音声を扱うために必須

struct TsukumogamiView: View {
    
    // 画像の切り替え状態
    @State private var isShowingYokai: Bool = false
    
    // 音声プレーヤーをこのView専用に保持
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                Text("tsukumogami.title")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                // --- Dynamic Element (Image Tap + Sound) ---
                ZStack {
                    if isShowingYokai {
                        Image("yokai_kasa") // 妖怪の画像
                            .resizable()
                            .scaledToFit()
                            .transition(.opacity)
                    } else {
                        Image("tool_kasa") // 道具の画像
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
                    playSound(fileName: "wood_creak", fileType: "mp3")
                    
                    // 2. 画像を切り替え
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isShowingYokai.toggle()
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

                Text("tsukumogami.p1")
                    .font(.body)
                
                Text("tsukumogami.p2")
                    .font(.body)
                
                // 動画プレーヤー部分
                Text("Video: Hari-kuyō Ceremony")
                    .font(.headline)
                    .padding(.top, 10)
                
                // 実際に再生したいYouTube動画のIDを入れてください
                YouTubeView(videoID: "YOUR_VIDEO_ID_HERE")
                    .frame(height: 220)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                    .shadow(radius: 5)

                Text("tsukumogami.p3")
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
    TsukumogamiView()
}
