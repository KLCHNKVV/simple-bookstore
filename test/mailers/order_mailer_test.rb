require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received order letter" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Your Bookshelf Inc. Store Order Confirmation", mail.subject
    assert_equal ["foo@bar.org"], mail.to
    assert_equal ["klchnkvv@gmail.com"], mail.from
    assert_match /1 x MyString/, mail.body.encoded
  end

  test "shipped order letter" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Your Bookshelf Inc. Store Order Was Shipped.", mail.subject
    assert_equal ["foo@bar.org"], mail.to
    assert_equal ["klchnkvv@gmail.com"], mail.from
    assert_match /1 x MyString/, mail.body.encoded
  end

end
