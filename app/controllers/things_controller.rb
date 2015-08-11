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
    form Comment::Create
  end

  def edit
    form Thing::Update

    render :new
  end

  def update
    run Thing::Update do |op|
      redirect_to op.model and return
    end

    render :new
  end
end
