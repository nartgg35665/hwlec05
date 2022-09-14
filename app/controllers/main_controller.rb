class MainController < ApplicationController
  def test
    @number=params["number"]
    @subject=[]
    @score=[]
    @errsubject=[]
    @errscore=[]
    @err=false
    if(params["root"].to_s=='false')
      for i in 0...@number.to_i
        @subject.push(params["subject#{i}"])
        @score.push(params["score#{i}"])
        if(params["subject#{i}"].blank?) 
          @err=true
          @errsubject.push(1)
        else
          @errsubject.push(0)
        end
        if(params["score#{i}"].blank?||!(Integer(params["score#{i}"]) rescue nil))
          @err=true
          @errscore.push(1) 
        else
          @errscore.push(0)
        end
      end
      if(@err==false)
        for i in 0...@number.to_i do
          if(Score.find_by(subject:@subject[i]))
            score=Score.where(subject:@subject[i])
            score.update(score:@score[i].to_i)
          else
            score=Score.create(subject:@subject[i],score:@score[i].to_i)
          end
        end
        redirect_to action: 'result' ,subject:@subject,score:@score
      end
    end
  end
  def index
  end
  def result
    subject=params[:subject]
    score=params[:score]
     max=score[0].to_i
     @ans=subject[0]
     @sum=0
     k=0
     score.each do |score|
        @sum+=score.to_i
        if(score.to_i >max)
          max=score.to_i
          @ans=subject[k]
        end
        k+=1
      end
  end
end
