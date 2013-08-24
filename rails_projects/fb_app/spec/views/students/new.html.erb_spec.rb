require 'spec_helper'

describe "students/new" do
  before(:each) do
    assign(:student, stub_model(Student,
      :name => "MyString",
      :email => "MyString",
      :password_digest => "MyString",
      :password => "MyString",
      :password_confirmation => "MyString"
    ).as_new_record)
  end

  it "renders new student form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", students_path, "post" do
      assert_select "input#student_name[name=?]", "student[name]"
      assert_select "input#student_email[name=?]", "student[email]"
      assert_select "input#student_password_digest[name=?]", "student[password_digest]"
      assert_select "input#student_password[name=?]", "student[password]"
      assert_select "input#student_password_confirmation[name=?]", "student[password_confirmation]"
    end
  end
end
