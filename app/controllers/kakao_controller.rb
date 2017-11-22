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
  end
  
  def friend_delete
  end

  def chat_room
  end
end
