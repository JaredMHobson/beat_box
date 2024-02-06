require './lib/node'
require './lib/linked_list'

RSpec.describe LinkedList do
  it 'exists' do
    list = LinkedList.new

    expect(list).to be_instance_of(LinkedList)
  end

  it 'has no head node by default' do
    list = LinkedList.new

    expect(list.head).to eq(nil)
  end

  it 'can add a head node' do
    list = LinkedList.new

    list.append('doop')

    expect(list.head.data).to eq('doop')
  end

  it 'can count how many nodes there are' do
    list = LinkedList.new

    list.append('doop')

    expect(list.count).to eq(1)
  end

  it 'can convert the data to a string' do
    list = LinkedList.new

    list.append('doop')

    expect(list.to_string).to eq('doop')
  end
end