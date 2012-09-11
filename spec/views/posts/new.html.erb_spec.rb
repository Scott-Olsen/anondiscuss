require 'spec_helper'

describe "posts/new" do
  before(:each) do
    assign(:post, stub_model(Post,
      :content => "MyText",
      :visible => false,
      :author_IP => "MyString",
      :username => "MyString"
    ).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path, :method => "post" do
      assert_select "textarea#post_content", :name => "post[content]"
      assert_select "input#post_visible", :name => "post[visible]"
      assert_select "input#post_author_IP", :name => "post[author_IP]"
      assert_select "input#post_username", :name => "post[username]"
    end
  end
end
