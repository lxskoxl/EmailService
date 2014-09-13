class EmailsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def index

  end

  def create_send_email
    if request.body.nil?
      p("No Request Body!")
    else
      parsed = JSON.parse(request.body.read)

      if parsed["to"].nil? or parsed["subject"].nil? or parsed["body"].nil?
        p("Missing parameters to generate email")
      else
        UserEmail.deliver_send_email(parsed["to"], parsed["subject"], parsed["body"]).deliver
      end
    end
  end
end
