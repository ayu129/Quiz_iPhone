//
//  QuizViewController.swift
//  Quiz
//
//  Created by 伊藤愛結 on 2021/02/10.
//

import UIKit

class QuizViewController: UIViewController {
    
    //Anyは違う方の値を配列に入れたいときに使うらしい
    var quizArray = [Any]()
    
    //正解数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        quizArray.append(["Appleの2015年現在のCEOの名前は？","スティーブ・ジョブズ","ティム・クック","ジョナサン・アイブ",2])
        quizArray.append(["iPhone6s,iPhone6s Plusから新たに導入された、画面タッチの圧力を検出する機能をなんという？","3Dタッチ","4Dタッチ","スーパータッチ",1])
        quizArray.append(["iPod touchのモデルの中で最大容量のものは何GB？","64GB","128GB","160GB",2])
        quizArray.append(["1985年、Appleを追放されたジョブズが立ち上げた会社名の正式表記は？","NEXt, Inc.","NExT, Inc.","NeXT, Inc.",3])
        quizArray.append(["2015年9月30日にリリースされたOSXの名前は？","El Captain","El Capitan","El Capital",2])
        quizArray.append(["Apple WatchはiPhoneとどんな通信方式でペアリングされる？","FM電波","Wi-Fi","Buletooth",3])
        
        quizArray.shuffle()
        
        choiceQuiz()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func choiceQuiz(){
       let tmpArray = quizArray[0] as! [Any]
        
        quizTextView.text = tmpArray[0] as? String
        
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
    }
    
    
    func performSegueToResult(){
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    @IBAction func choiceAnswer(sender: UIButton){
        let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag{
            correctAnswer += 1
        }
        
        //といた問題をquizarrayから取り除く
        quizArray.remove(at: 0)
        
        
        //画面遷移
        if quizArray.count == 0{
            performSegueToResult()
        }else{
            choiceQuiz()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toResultView"{
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }
    
}
