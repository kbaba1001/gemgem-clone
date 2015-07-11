class Thing < ActiveRecord::Base
  class Create < Trailblazer::Operation
    # これを使うと View で `= form_for @form` と書くときに url を省略して書けるようになる
    # しかし、内部でどのようなことをしているのかよくわからなかった。
    include Trailblazer::Operation::CRUD::ActiveModel
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
