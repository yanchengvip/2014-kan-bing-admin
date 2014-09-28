class ConsultAccusesController < ApplicationController
  before_action :set_consult_accuse, only: [:show, :edit, :update, :destroy]

  # GET /consult_accuses
  # GET /consult_accuses.json
  def index

  end
#被举报的咨询
  def index_accuses
    #@consult_accuses = ConsultAccuse.all
    @consult_questions = ConsultQuestion.where('id in (select question_id from consult_accuses)')
    render :json => {:consult_questions => @consult_questions.as_json}
  end
  #被举报的回复
  def index_results
   # @consult_accuses = ConsultAccuse.all
    @consult_results = ConsultResult.where('id in (select result_id from consult_accuses)')
    render :json => {:consult_results => @consult_results.as_json}
  end

  # GET /consult_accuses/1
  # GET /consult_accuses/1.json
  def show
  end

  # GET /consult_accuses/new
  def new
    @consult_accuse = ConsultAccuse.new
  end

  # GET /consult_accuses/1/edit
  def edit
  end
  #根据question_id查询举报信息
  def get_accuses
    if !params[:question_id].nil? && params[:question_id] != ''
      @question = ConsultQuestion.find(params[:question_id])
      @consult_accuses = @question.consult_accuses
    end
    if !params[:result_id].nil? && params[:result_id] != ''
      @result = ConsultResult.find(params[:result_id])
      @consult_accuses = @result.consult_accuses
    end
    render :json => {:consult_accuses => @consult_accuses.as_json}
  end

  # POST /consult_accuses
  # POST /consult_accuses.json
  def create
    respond_to do |format|
      if @consult_accuse.save
        format.html { redirect_to @consult_accuse, notice: 'ConsultAccuse was successfully created.' }
        format.json { render :show, status: :created, location: @consult_accuse }
      else
        format.html { render :new }
        format.json { render json: @consult_accuse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consult_accuses/1
  # PATCH/PUT /consult_accuses/1.json
  def update
    respond_to do |format|
      if @consult_accuse.update(consult_accuse_params)
        format.html { redirect_to @consult_accuse, notice: 'ConsultAccuse was successfully updated.' }
        format.json { render :show, status: :ok, location: @consult_accuse }
      else
        format.html { render :edit }
        format.json { render json: @consult_accuse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consult_accuses/1
  # DELETE /consult_accuses/1.json
  def destroy
    @consult_accuse.destroy
    respond_to do |format|
      format.html { redirect_to consult_accuses_url, notice: 'ConsultAccuse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_consult_accuse
    @consult_accuse = ConsultAccuse.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def consult_accuse_params
    params.permit(:reason, :created_by, :question_id, :result_id)
  end
end
