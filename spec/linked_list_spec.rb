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

    list.append("deep")

    expect(list.count).to eq(2)
  end

  it 'will join all of the node data into one string with spaces between each data' do
    list = LinkedList.new

    list.append('doop')
    list.append("deep")

    expect(list.to_string).to eq('doop deep')
  end

  it 'can change the head while maintaining the existing list' do
    list = LinkedList.new

    list.append("plop")

    expect(list.to_string).to eq('plop')

    list.append("suu")

    expect(list.to_string).to eq('plop suu')

    list.prepend("dop")

    expect(list.to_string).to eq('dop plop suu')
  end

  it 'can insert a node into any position while maintaining the rest of the node' do
    list = LinkedList.new

    list.append("plop")
    list.append("suu")
    list.prepend("dop")

    expect(list.to_string).to eq('dop plop suu')

    list.insert(1, "woo")

    expect(list.to_string).to eq('dop woo plop suu')
  end

  it 'will insert the node at the head if there are no nodes' do
    list = LinkedList.new

    list.insert(5, "woo")

    expect(list.to_string).to eq('woo')
  end

  it 'can find a node at a certain position and a range after' do
    list = LinkedList.new

    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    expect(list.find(2, 1)).to eq('shi')

    expect(list.find(1, 3)).to eq('woo shi shu')
  end

    it 'can check if the linked list includes a node with specific data' do
    list = LinkedList.new

    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    expect(list.includes?('deep')).to be true
  end

  it 'can remove the last node and return its data' do
    list = LinkedList.new

    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    expect(list.to_string).to eq('deep woo shi shu blop')

    expect(list.count).to eq(5)

    expect(list.pop).to eq('blop')

    expect(list.count).to eq(4)

    expect(list.to_string).to eq ('deep woo shi shu')

    expect(list.pop).to eq('shu')

    expect(list.to_string).to eq ('deep woo shi')
  end
end