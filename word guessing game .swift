import Foundation

func startGame() {
    let words = ["kırmızı", "siyah", "beyaz", "mor", "turuncu"]
    let selectedWord = words.randomElement()!
    var displayedWord = Array(repeating: "_", count: selectedWord.count)
    var attemptsLeft = 6
    var usedLetters = [Character]()
    
    print("Oyun Başladı! Rastgele bir kelime belirlendi.")
    
    while attemptsLeft > 0 {
        print("\nKelime: \(displayedWord.joined(separator: " "))")
        print("Kalan deneme hakkınız: \(attemptsLeft)")
        print("Kullanılan harfler: \(usedLetters)")
        
        print("Bir harf tahmin edin veya tüm kelimeyi tahmin edin:")
        if let input = readLine()?.lowercased() {
            if input.count == 1, let letter = input.first {
                if usedLetters.contains(letter) {
                    print("Bu harfi zaten kullandınız.")
                } else {
                    usedLetters.append(letter)
                    if selectedWord.contains(letter) {
                        print("Doğru tahmin!")
                        for (index, char) in selectedWord.enumerated() {
                            if char == letter {
                                displayedWord[index] = String(letter)
                            }
                        }
                    } else {
                        print("Yanlış tahmin!")
                        attemptsLeft -= 1
                    }
                }
            } else if input == selectedWord {
                print("Tebrikler! Kelimeyi doğru tahmin ettiniz: \(selectedWord)")
                break
            } else {
                print("Yanlış tahmin!")
                attemptsLeft -= 1
            }
            
            if displayedWord.joined() == selectedWord {
                print("Tebrikler! Kelimeyi buldunuz: \(selectedWord)")
                break
            }
        } else {
            print("Geçersiz giriş, lütfen tekrar deneyin.")
        }
    }
    
    if attemptsLeft == 0 {
        print("Tahmin hakkınız kalmadı. Doğru kelime: \(selectedWord)")
    }
    
    print("Tekrar oynamak ister misiniz? (Evet/Hayır)")
    if let playAgain = readLine()?.lowercased(), playAgain == "evet" {
        startGame()
    } else {
        print("Oyun sonlandı. Teşekkürler!")
    }
}

startGame()
