class PostsController < ApplicationController
  load_and_authorize_resource :only => [:edit, :update, :destroy, :softdelete]
  # GET /posts
  # GET /posts.json
  def index
    #@posts = Post.all
    # Pagination, selecting which posts are visible
    @posts = Post.where(:visible => true).paginate(:page => params[:page], :per_page => 30 ).order('updated_at DESC')
    @recent_invisible_posts = Post.recent_update.where(:visible => false)
    @post = Post.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      ajax_respond format, :section_id => "all_posts"
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.where(:visible => true).paginate(:page => params[:comments_page], :per_page => 10)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html { render action: "new", :locals => { :post => @post }}
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def softdelete
    @post = Post.find(params[:id])
    @post.toggle!(:visible)
    respond_to do |format|
      if @post.update_record_without_timestamping
        format.html { redirect_to :back, notice: 'Post invisible' }
        format.js
      else
        format.html { redirect_to :back, alert: 'Failed making post invisible'}
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
      format.js
    end
  end
end
