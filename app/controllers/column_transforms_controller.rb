class ColumnTransformsController < ApplicationController
  before_action :set_column_transform, only: [:show, :edit, :update, :destroy]

  # GET /column_transforms
  # GET /column_transforms.json
  def index
    @column_transforms = ColumnTransform.all
  end

  # GET /column_transforms/1
  # GET /column_transforms/1.json
  def show
  end

  # GET /column_transforms/new
  def new
    @column_transform = ColumnTransform.new
  end

  # GET /column_transforms/1/edit
  def edit
  end

  # POST /column_transforms
  # POST /column_transforms.json
  def create
    @column_transform = ColumnTransform.new(column_transform_params)

    respond_to do |format|
      if @column_transform.save
        format.html { redirect_to @column_transform, notice: 'Column transform was successfully created.' }
        format.json { render :show, status: :created, location: @column_transform }
      else
        format.html { render :new }
        format.json { render json: @column_transform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /column_transforms/1
  # PATCH/PUT /column_transforms/1.json
  def update
    respond_to do |format|
      if @column_transform.update(column_transform_params)
        format.html { redirect_to @column_transform, notice: 'Column transform was successfully updated.' }
        format.json { render :show, status: :ok, location: @column_transform }
      else
        format.html { render :edit }
        format.json { render json: @column_transform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /column_transforms/1
  # DELETE /column_transforms/1.json
  def destroy
    @column_transform.destroy
    respond_to do |format|
      format.html { redirect_to column_transforms_url, notice: 'Column transform was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_column_transform
      @column_transform = ColumnTransform.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def column_transform_params
      params.require(:column_transform).permit(:internal, :external)
    end
end
