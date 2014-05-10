class Message < ActiveRecord::Base
  attr_accessible :body, :email, :name

  after_create :send_email_to_ryan

  validates_presence_of :name, :email, :body

  default_scope order('created_at desc')

  private

  def send_email_to_ryan
    SitesMailer.contact_form(name, email, body).deliver
  end
end
