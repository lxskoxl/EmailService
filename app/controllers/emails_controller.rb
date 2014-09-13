class EmailsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def index

  end

  def create_send_email
    parsed = JSON.parse(request.body.read)
    UserEmail.deliver_send_email(parsed["to"], parsed["subject"], parsed["body"]).deliver
  end
end
