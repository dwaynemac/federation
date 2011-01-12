require 'test_helper'

class UnameTest < ActiveSupport::TestCase

  context "UName" do
    setup do
      Uname.make
    end
    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)
    should validate_format_of(:name).with(/^[a-z_\-\.]$/)
    should belong_to(:named)
  end

  context "Uname#to_s" do
    setup do
      @uname = Uname.make(:name => "my_name")
    end

    should "print name" do
      assert_equal "my_name", @uname.to_s
    end
  end
end
