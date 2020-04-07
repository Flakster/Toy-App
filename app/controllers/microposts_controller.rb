class MicropostsController < ApplicationController
  before_action :set_micropost, only: %i[show edit update destroy]

  # GET /microposts
  # GET /microposts.json
  def index
    @microposts = Micropost.all
  end

  # GET /microposts/1
  # GET /microposts/1.json
  def show; end

  # GET /microposts/new
  def new
    @micropost = Micropost.new
  end

  # GET /microposts/1/edit
  def edit; end

  # POST /microposts
  # POST /microposts.json
  def create
    @micropost = Micropost.new(micropost_params)

    respond_to do |format|
      if @micropost.save
        format.html { redirect_to @micropost, notice: notice_m('created') }
        format.json { render :show, status: :created, location: @micropost }
      else
        format.html { render :new }
        format.json { format_json_properties(2) }
      end
    end
  end

  # PATCH/PUT /microposts/1
  # PATCH/PUT /microposts/1.json
  def update
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to @micropost, notice: notice_m('updated') }
        format.json { format_json_properties(1) }
      else
        format.html { render :edit }
        format.json { format_json_properties(2) }
      end
    end
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to microposts_url, notice: notice_m('destroyed') }
      format.json { head :no_content }
    end
  end

  private

  def format_json_properties(param)
    case param
    when 1
      { render => :show, status => :ok, location => @micropost }
    when 2
      { 'render json' => @micropost.errors, status => :unprocessable_entity }
    end
  end

  def notice_m(word)
    'Micropost was successfully ' + word
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_micropost
    @micropost = Micropost.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def micropost_params
    params.require(:micropost).permit(:content, :user_id)
  end
end
