class KakaoController < ApplicationController
  
  def keyboard
    render json: {
      "type": "text"
    }
  end

  def message
    @user_msg = params[:content] # 사용자가 보낸 내용은 content에 담아서 전송됩니다.
    @msg = @user_msg
    
    # 메세지를 넣어봅시다.
    @message = {
      text: @msg
    }
    
    # 키보드를 만들어 주겠습니다.
    @basic_keyboard = {
      :type => "text"					
    }
    
    # 응답
    @result = {
      message: @message,
      keyboard: @basic_keyboard
    }
 
    render json: @result
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
