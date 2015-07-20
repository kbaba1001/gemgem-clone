class Thing::Cell < Cell::Concept
  property :name
  property :created_at

  def show
    render
  end

  class Grid < Cell::Concept
    def show
      things = Thing.latest
      concept('thing/cell', collection: things, last: things.last)
    end
  end
end
