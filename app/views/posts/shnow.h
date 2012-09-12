<% provide(:title, 'Post #' + @post.id.to_s) %>
<p id="notice"><%= notice %></p>

<div class="post">
<p>
  <%= simple_format(@post.content) %>
</p>

<p>
  <b>Created:</b>
  <%= @post.created_at.strftime("%l:%M %P %b %e %Y") %>
</p>
</div>
<%= @comments.count %>
<h2>Comments</h2>
<div id='comments'>
<%= render @comments %>
<%= will_paginate @comments, :class => "pagination", :param_name => 'comments_page' %>
</div> 
<%= link_to 'Edit', edit_post_path(@post) %> |
<%= link_to 'Back', posts_path %>