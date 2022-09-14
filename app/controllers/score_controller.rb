class ScoreController < ApplicationController
  def list
    @scores=Score.all.order(score: :desc)
    if(@scores[0])
     max=@scores[0].score.to_i
     @ans=@scores[0].subject
     @sum=0
     k=0
     @scores.each do |score|
        @sum+=score.score.to_i
        if(score.score.to_i>max)
          max=score.score.to_i
          @ans=@scores[k].subject
        end
        k+=1
      end
    end
  end
  def delete
      Score.destroy_by(id: params[:no])
      redirect_to action:'list'
  end
  def edit
    @no=params[:no]
     @id=params[:id]
     @score=Score.find_by(id:@id)
  end
  def update
    @id=params[:id]
    @score=Score.find_by(id:@id)
    @score.update(subject:params[:subject],score:params[:score])
    redirect_to action:'list'
  end
  def back
    redirect_to action:'list'
  end
end
