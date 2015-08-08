class Thing::Cell < Cell::Concept
  property :name
  property :created_at

  include Cell::GridCell
  self.classes = %w(box large-3 columns)

  include Cell::CreatedAt

  def show
    render
  end

  private

  def name_link
    link_to name, thing_path(model)
  end

  class Grid < Cell::Concept
    def show
      things = Thing.latest
      concept('thing/cell', collection: things, last: things.last)
    end
  end
end
