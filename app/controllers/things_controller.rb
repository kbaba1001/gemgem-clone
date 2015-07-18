class ThingsController < ApplicationController
  def new
    form Thing::Create
  end

  def create
    run Thing::Create do |op|
      redirect_to op.model and return
    end

    render action: :new
  end

  def show
    present Thing::Update
  end

  def edit

  end

  def update

  end

end
