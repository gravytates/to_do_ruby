class Task
  attr_reader(:description, :due_date, :list_id)
  # @@all_tasks = []

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @list_id = attributes.fetch(:list_id)
    @due_date = attributes.fetch(:due_date)
  end

  define_method(:==) do |another_task|
    self.description == another_task.description && self.list_id == another_task.list_id && self.due_date == another_task.due_date
  end

  def Task.all
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each do |task|
      description = task.fetch("description")
      list_id = task.fetch('list_id').to_i
      due_date = task.fetch("due_date")
      tasks.push(Task.new({:description => description, :due_date => due_date, :list_id => list_id}))
    end
    tasks
  end

  def Task.order_task
    returned_tasks = DB.exec("SELECT * FROM tasks ORDER BY due_date;")
    tasks = []
      returned_tasks.each do |task|
      description = task.fetch("description")
      list_id = task.fetch('list_id').to_i
      due_date = task.fetch("due_date")
      tasks.push(Task.new({:description => description, :due_date => due_date, :list_id => list_id}))
    end
    tasks
  end

  define_method(:save) do
    DB.exec("INSERT INTO tasks (description, due_date, list_id) VALUES ('#{@description}', '#{@due_date}', #{@list_id});")
  end
end
