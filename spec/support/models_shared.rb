shared_context 'factory', type: :model do
  let(:factory){ described_class.name.underscore.to_sym }
end

shared_examples 'had vaid factory', type: :model do
  it 'has valid factory' do
    expect( build(factory) ).to be_valid
  end
end