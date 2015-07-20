class Thing::Cell < Cell::Concept

  def show

  end

  class Grid < Cell::Concept
    def show
      things = Thing.latest
      concept('thing/cell', collection: things, last: things.last)
    end
  end
end
