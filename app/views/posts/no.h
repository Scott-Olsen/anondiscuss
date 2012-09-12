<%= ajax_links :section_id => "all_posts" do %>
  <%= will_paginate @posts %>
<% end %>
<div id="all_posts">
<%= ajax_loadzone do %>
  <% @posts.each do |post| %>
    <div class=post>
      <p><%= simple_format(post.content) %></p>
      <p><%= post.created_at.strftime("%l:%M %P %b %e %Y") %></p>
      <p><%= link_to "#{post.comments.count} comments", post %></p>
      <div class="admin_controls">
        <%= link_to 'Edit', edit_post_path(post) %>
        <%= link_to 'Destroy', post, confirm: 'Are you sure?', method: :delete %>
      </div>
    </div>
  <% end %>
<% end %>
</div>
<br />
<%= ajax_links :section_id => "all_posts" do %>
  <%= will_paginate @posts %>
<% end %>
