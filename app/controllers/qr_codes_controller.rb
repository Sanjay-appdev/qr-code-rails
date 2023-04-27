class QrCodesController< ApplicationController
  def process_text
    @user_text = params.fetch("content")
    qrcode = RQRCode::QRCode.new(@user_text)
       @svg = qrcode.as_svg
    render({ :template =>"my_templates/text.html.erb" })
  end

def process_wifi
  @ssid_name = params.fetch("ssid")

  @password = params.fetch("pw")

  #WIFI:T:WPA;S:Your network name;P:secret password;;

  @final_string = "WIFI:T:WPA;S:" + @ssid_name +";P:" + @password + ";;"

  qrcode = RQRCode::QRCode.new(@final_string)

  @svg = qrcode.as_svg

  render({ :template =>"my_templates/wifi.html.erb" })
 end

 def process_url

  @user_url = params.fetch("page") 

  qrcode = RQRCode::QRCode.new(@user_url)

  @svg = qrcode.as_svg

  render({ :template =>"my_templates/url.html.erb" })
    end

  def process_sms

    @phone_number = params.fetch("phone").gsub(/\s+/, "")

    @starter_message = params.fetch("message")

    #SMSTO:9876543210:Hi Alice! It's me, 

    @final_string = "SMSTO:"+ @phone_number + ";P:" + @starter_message + ";;"

    qrcode = RQRCode::QRCode.new(@final_string)

    @svg = qrcode.as_svg


    render({ :template =>"my_templates/sms.html.erb" })
    end
end



     
