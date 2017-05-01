class List

  attr_accessor(:name, :id)

  def initialize(attributes)
    self.name = attributes.fetch(:name)
    self.id = attributes.fetch(:id)
  end

  def List.all
    returned_lists = DB.exec("SELECT * FROM lists")
    lists = []
    returned_lists.each do |list|
      name = list.fetch("name")
      id = list.fetch("id").to_i
      lists.push(List.new({:name => name, :id => id}))
    end
    lists
  end

  def save
    result = DB.exec("INSERT INTO lists (name) VALUES ('#{self.name}') RETURNING id;")
    self.id = result.first.fetch("id").to_i
  end

  def ==(another_list)
    self.name == another_list.name && self.id == another_list.id
  end
end
