
require 'rspec'
require 'exercises.rb'
require 'byebug'

# my_uniq is called on an array

describe '#my_uniq' do
  subject(:arr) { Array.new([1,2,3,3]) }

  it 'is called on an array' do
    expect(arr).not_to be_empty
    arr.my_uniq
  end

  it 'should return an array' do
    expect(arr.my_uniq).to be_an_instance_of(Array)
  end

  it 'should return uniq elements' do
    expect(arr.my_uniq).to eq([1,2,3])
  end

  it 'should return uniq elements in order they first appear' do
    expect(arr.my_uniq).to eq(arr.my_uniq.sort)
  end
end


describe '#two_sum' do
  subject(:arr) { Array.new([-1, 0, 2, -2, 1]) }

  it 'sorts within pairs smaller index before bigger index' do
    expect(arr.two_sum[0][0]).to be < arr.two_sum[1][0]
    arr.two_sum
  end

  it 'is called on an array' do
    expect { "array".two_sum }.to raise_error(NoMethodError)
  end

  it 'should return a nested array' do
    expect(arr.two_sum).to include(Array)
  end
end


describe '#my_transpose' do
  subject(:arr) { Array.new([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]) }
  let (:arr2) {Array.new([[0, 3, 6], [1, 4, 7], [2, 5, 8]]) }


  it 'is called on an array' do
    expect { my_transpose("arr") }.to raise_error(NoMethodError)
  end

  it 'should return an array of length 3' do
    expect(my_transpose(arr).length).to eq(3)
  end

  it 'should return an array that has been transposed'do
    expect(my_transpose(arr)).to eq(arr2)
  end

end
