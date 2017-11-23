require 'objectmaker'
require 'parser'

class KakaoController < ApplicationController
  @@key = ObjectMaker::Keyboard.new
  @@msg = ObjectMaker::Message.new
  
  
  def keyboard
    render json: {"type": "text"}
  end

  def message

    user_msg = params[:content] 
    
    pic = false

    case user_msg
      when "영화"
        movie = Parser::Movie.new
        msg = movie.naver + [" 강추!!", " 나도 안봤지만 추천", " 보던가말던가"].sample
      when "고양이"
        pic = true
        animal = Parser::Animal.new
        msg = "나만고양이없어"
      when "야"
        msg = "호"
      else
        msg = "야옹"
    end
    
    
    if pic
      result = {
        message: @@msg.getPicMessage(msg.to_s, animal.cat),
        keyboard: @@key.getBtnKey(["영화","고양이","??"])
      }
    else
      result = {
        message: @@msg.getMessage(msg.to_s),
        keyboard: @@key.getBtnKey(["영화","고양이","??"])
      }
    end
    render json: result
  end

  def friend_add
    User.create(user_key: params[:user_key], chat_room: 0)
    render nothing: true
  end
  
  def friend_delete
    user = User.find_by(user_key: params[:user_key])
    user.destroy
    render nothing: true
  end

  def chat_room
    user = User.find_by(user_key: params[:user_key])
    user.plus
    user.save
    render nothing: true
  end
  
end
