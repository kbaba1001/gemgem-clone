class Thing < ActiveRecord::Base
  class Create < Trailblazer::Operation
    include CRUD
    model Thing, :create

    contract do
      property :name, validates: {presence: true}
      property :description, validates: {length: {in: 4..160}, allow_blank: true}
    end

    def process(params)
      validate(params[:thing]) do |f|
        f.save
      end
    end
  end
end
