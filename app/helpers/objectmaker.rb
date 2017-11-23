module ObjectMaker
    class Keyboard

        def getTextKey
            
            json = {
                "type": "text"
            }
            return json
        end
        
        def getBtnKey(*arg)
        
            json = {
              "type": "buttons",
                "buttons": []
            }
            
            arg.each do |a|
                json[:buttons] = a
            end
        
            return json
        
        end
        

    end
    
    class Message
    
        def getMessage(text)
            json = {
                "text": "#{text}"
            }
            return json
        end
        
        def getPicMessage(text,photo_url)
            
            json = {
                "text": text,
                "photo": {
                    "url": photo_url,
                    "width": 960,
                    "height": 960
                    
                }
            }
            
            return json
            
        end
    
    end


    
end