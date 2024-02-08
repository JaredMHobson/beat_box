require './lib/node'
require './lib/linked_list'
require './lib/beat_box'
require './lib/messenger'

RSpec.describe BeatBox do
  it 'exists' do
    bb = BeatBox.new

    expect(bb).to be_instance_of(BeatBox)
  end

  it 'has a linked list by default' do
    bb = BeatBox.new

    expect(bb.list).to be_instance_of(LinkedList)
  end

  it 'can split a multi-word string into separate nodes and append them to the linked list' do
    bb = BeatBox.new

    bb.append("deep doo ditt")

    expect(bb.list.head.data).to eq('deep')
    expect(bb.list.head.next_node.data).to eq('doo')
  end
  it 'can split a multi-word string into separate nodes and append them to the linked list' do
    bb = BeatBox.new

    bb.append("deep doo ditt")

    expect(bb.list.head.data).to eq('deep')
    expect(bb.list.head.next_node.data).to eq('doo')
  end

  it 'can split a multi-word string into separate nodes and prepend them to the linked list' do
    bb = BeatBox.new

    bb.prepend("deep doo ditt")

    expect(bb.list.head.data).to eq('ditt')
    expect(bb.list.head.next_node.data).to eq('doo')
  end

  it 'can count how many nodes are in its list' do
    bb = BeatBox.new

    bb.append("deep doo ditt")

    expect(bb.count).to eq(3)

    bb.append('woo')

    expect(bb.count).to eq(4)
  end
end