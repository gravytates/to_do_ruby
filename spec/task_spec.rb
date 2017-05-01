require "spec_helper"

describe(Task) do
  describe('.all') do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#description") do
    it("lets you read the description out") do
      test_task = Task.new({:description => "learn SQL", :due_date => "2017-05-02", :list_id => 1})
      expect(test_task.description()).to(eq("learn SQL"))
    end
  end

  describe("#due_date") do
    it("lets you read the due date out") do
      test_task = Task.new({:description => "learn SQL", :due_date => "2017-05-02", :list_id => 1})
      expect(test_task.due_date).to(eq("2017-05-02"))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID out") do
      test_task = Task.new({:description => "learn SQL", :due_date => "2017-05-02", :list_id => 1})
      expect(test_task.list_id).to(eq(1))
    end
  end

  describe(".order_task") do
    it('orders tasks by due date') do
      test_task1 = Task.new({:description => "learn SQL", :due_date => "2017-05-03 00:00:00", :list_id => 1})
      test_task2 = Task.new({:description => "learn SQL", :due_date => "2017-05-02 00:00:00", :list_id => 1})
      test_task1.save
      test_task2.save
      expect(Task.order_task[0]).to(eq(test_task2))
    end
  end


  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = Task.new({:description => "learn SQL", :due_date => "2017-05-02", :list_id => 1})
      task2 = Task.new({:description => "learn SQL", :due_date => "2017-05-02", :list_id => 1})

      expect(task1).to(eq(task2))
    end
  end


  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => "learn SQL", :due_date => "2017-05-02 00:00:00", :list_id => 1})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end
end
