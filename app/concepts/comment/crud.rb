class Comment < ActiveRecord::Base
  class Create < Trailblazer::Operation
    include CRUD
    model Comment, :create

    contract do
      include Reform::Form::ModelReflections
      reform_2_0!

      def self.weights
        {?0 => 'Nice!', ?1 => 'Rubbish!'}
      end

      def weights
        [self.class.weights.to_a, :first, :last]
      end

      property :body
      property :weight
      property :thing

      validates :body, length: {in: 6..160}
      validates :weight, inclusion: {in: weights.keys}
      validates :thing, :user, present: true

      property :user do
        property :email
        validates :email, presence: true, email: true
      end

      def weight
        super or '0'
      end
    end

    def process(params)
    end
  end
end
