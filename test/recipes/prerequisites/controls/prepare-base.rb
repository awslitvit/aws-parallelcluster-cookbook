# Use the name matching the recipe name
control 'prepare-base' do
  title 'Prepare base platform'
  # There is nothing to test right now, but usually you should test the outcome of the recipe.
  describe "Something" do
    it { should eq "Something" }
  end
end
