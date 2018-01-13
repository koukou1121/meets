class Message < ApplicationMailer

  default from: testmeets@example.com

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message.hello.subject
  #
  def hello
    @name = name

    mail (
      to: "2111atok@gmail.com",
      subject: "meets test mail") do |format|
        format.html
      end
  end
end
