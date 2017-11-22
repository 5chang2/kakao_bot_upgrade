class User < ActiveRecord::Base
    
    def plus
        self.chat_room += 1
    end
    
end
