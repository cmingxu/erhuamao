# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin photos pic:string desc:string resource:string resource_id:integer 

class Admin::PhotosController < Admin::BaseController
  
  # GET /photos
  # GET /photos.xml
  def index
    @photos = Photo.order("updated_at DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.xml
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.xml
  def new
    @photo = Photo.new
    @gallery = Gallery.find(params[:gallery_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
    @gallery = @photo.gallery
  end

  # POST /photos
  # POST /photos.xml
  def create
    @photo = Photo.new(params[:photo])
    @photo.gallery = Gallery.find(params[:gallery_id])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to([:admin, @photo.gallery], :notice => 'Photo was successfully created.') }
        format.xml  { render :xml => @photo, :status => :created, :location => @photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    @photo = Photo.find(params[:id])
    @gallery = @photo.gallery

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to([:admin, @gallery], :notice => 'Photo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    @photo = Photo.find(params[:id])
    @gallery = @photo.gallery
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to([:admin, @gallery]) }
      format.xml  { head :ok }
    end
  end
end
