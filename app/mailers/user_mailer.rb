class UserMailer < ActionMailer::Base
  default from: "Task Manager <ecodata.task.manager@gmail.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.document_colaborator_add.subject
  #
  def add_user_to_task(user, task)
    @user = user
    @task = task

    mail to: @user.email
  end
end
