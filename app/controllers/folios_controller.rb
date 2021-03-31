class FoliosController < ApplicationController
    def index
        @folio_items = Folio.all.order(created_at: :DESC)
    end
    def show
      @folio_item = Folio.find(params[:id])
    end
    def new
        @folio_item = Folio.new
    end
    def create
        @folio = Blog.new(folio_params)
    
        respond_to do |format|
          if @folio.save
            format.html { redirect_to folios_path, notice: "Folio was successfully created." }
            format.json { render :show, status: :created, location: @folio }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @folio.errors, status: :unprocessable_entity }
          end
        end
    end

    def edit
        @folio_item = Folio.find(params[:id])
    end

    def update
        @folio_item = Folio.find(params[:id])

        respond_to do |format|
          if @folio_item.update(folio_params)
            format.html { redirect_to folios_path, notice: "folio was successfully updated." }
            format.json { render :show, status: :ok, location: @folio }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @folio.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
      @folio_item = Folio.find(params[:id])
      @folio_item.destroy
      respond_to do |format|
        format.html {redirect_to folios_url, notice: "Post was removed."}
        format.json {head :no_content}
      end
    end

    private
    # Only allow a list of trusted parameters through.
    def folio_params
        params.require(:folio).permit(:title, :subtitle, :body)
    end
end
