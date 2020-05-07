class API::V1::EventPdfsController < APIController
  before_action :set_event_pdf, only: [:show, :edit, :update, :destroy]

  # GET /event_pdfs
  # GET /event_pdfs.json
  def index
    @event_pdfs = EventPdf.all
  end

  # GET /event_pdfs/1
  # GET /event_pdfs/1.json
  def show
  end

  # GET /event_pdfs/new
  def new
    @event_pdf = EventPdf.new
  end

  # GET /event_pdfs/1/edit
  def edit
  end

  # POST /event_pdfs
  # POST /event_pdfs.json
  def create
    @event_pdf = EventPdf.new(event_pdf_params)

    respond_to do |format|
      if @event_pdf.save
        format.html { redirect_to @event_pdf, notice: 'Event pdf was successfully created.' }
        format.json { render :show, status: :created, location: @event_pdf }
      else
        format.html { render :new }
        format.json { render json: @event_pdf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_pdfs/1
  # PATCH/PUT /event_pdfs/1.json
  def update
    respond_to do |format|
      if @event_pdf.update(event_pdf_params)
        format.html { redirect_to @event_pdf, notice: 'Event pdf was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_pdf }
      else
        format.html { render :edit }
        format.json { render json: @event_pdf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_pdfs/1
  # DELETE /event_pdfs/1.json
  def destroy
    @event_pdf.destroy
    respond_to do |format|
      format.html { redirect_to event_pdfs_url, notice: 'Event pdf was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_pdf
      @event_pdf = EventPdf.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_pdf_params
      params.fetch(:event_pdf, {})
    end
end
