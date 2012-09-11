require 'spec_helper'

describe "posts/edit" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :content => "MyText",
      :visible => false,
      :author_IP => "MyString",
      :username => "MyString"
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path(@post), :method => "post" do
      assert_select "textarea#post_content", :name => "post[content]"
      assert_select "input#post_visible", :name => "post[visible]"
      assert_select "input#post_author_IP", :name => "post[author_IP]"
      assert_select "input#post_username", :name => "post[username]"
    end
  end
end
