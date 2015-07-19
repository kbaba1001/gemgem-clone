class ThingsController < ApplicationController
  def new
    form Thing::Create
  end

  def create
    run Thing::Create do |op|
      redirect_to op.model and return
    end

    render :new
  end

  def show
    present Thing::Update
  end

  def edit
    form Thing::Update

    render :new
  end

  def update

  end

end
