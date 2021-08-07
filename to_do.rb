class ToDo
  ALL_TASKS = []

  def add(task)
    ALL_TASKS.push({ task: task, time: Time.new })
  end

  def del(id)
    if ALL_TASKS.empty? == false
      if ALL_TASKS[id - 1].nil?
        puts "Task with id #{id} not found."
      else
        ALL_TASKS.delete_at(id - 1)
      end
    else
      puts 'nothing to delete.'
    end
  end

  def puts_all_works
    i = 0
    if ALL_TASKS.empty? == false
      ALL_TASKS.each do |t|
        i += 1
        puts "ID: #{i}; Task: #{t[:task]} - added: #{t[:time]}"
      end
    else
      puts "You don't have any tasks!"
    end
  end
end

todo = ToDo.new

print "Hello! Commands:
add: [task] - to add task,
delete: [id] - to delete a task
print tasks - show all tasks\n"

loop do
  input = gets.chomp
  if input.start_with?('add: ')
    task = input.split(': ')
    todo.add(task[1])
  elsif input.start_with?('delete: ')
    task = input.split(': ')
    begin
      id = task[1]
      todo.del(Integer(id))
    rescue ArgumentError
      puts 'Invalid id.'
    end
  elsif input.eql?('print tasks')
    todo.puts_all_works
  else
    puts "I don't know your command!"
  end
end
