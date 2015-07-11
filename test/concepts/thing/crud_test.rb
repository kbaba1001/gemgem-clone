class ThingCrudTest < Test::Unit::TestCase
  sub_test_case 'Create' do
    test 'persists valid' do
      thing = Thing::Create[
        thing: {
          name: 'Rails',
          description: 'Kickass web dev'
        }
      ].model

      assert { thing.persisted? }
      assert { thing.name == 'Rails' }
      assert { thing.description == 'Kickass web dev' }
    end

    test 'invalid' do
      res, op = Thing::Create.run(
        thing: {
          name: '',
          description: 'hi'
        }
      )

      assert { !res }
      assert { !op.model.persisted? }
      assert { op.errors.get(:name) == ["can't be blank"] }
      assert { op.errors.get(:description) == ['is too short (minimum is 4 characters)'] }
    end
  end
end
