require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "document_colaborator_add" do
    mail = UserMailer.document_colaborator_add
    assert_equal "Document colaborator add", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
