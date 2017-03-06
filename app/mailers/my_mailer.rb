class MyMailer < ActionMailer::Base

  def sendgrid_client
    @sendgrid_client ||= SendGrid::API.new(api_key: "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")
  end

  def new_user(user)
    template_id = "Example"

    data = {
      "personalizations": [
        {
          "to": [
            {
              "email": user.email
            }
          ],
          "substitutions": {
            "-name-": "USER_NAME",
            "-content-": user.name
          },
          "subject": "Bienvenido a Iniciación IPN"
        }
      ],
      "from": {
        "email": "iniciacionipn@gmail.com"
      },
      "template_id": "e8b1cf67-5265-40ad-8dc6-9bbea6984c3a"
    }

    sendgrid_client.client.mail._("send").post(request_body: data)
  end
end