class ContactMailer < ApplicationMailer
def contact_mail(contact)
 @contact = contact

 mail to: "wasiotw@yahoo.co.jp", subject: "お問い合わせの確認メール"
end
def send_mail(inform)
    @inform = inform
    # binding.pry
    mail to: inform, subject: "投稿完了通知"
  end
end
