local filesystem = require("filesystem")

function AddNewTask()

    print("Please write your request: (q to cancel)")
    local message = io.read()
    if message == "" or message == "q" then
        MainMenu()
    end

    print(message .. ", is this okay? (y/n)")
    local inp = io.read()
    if inp == "y" then
        local file = io.open(tostring(os.time()), "w")
        file:write(message)
        file:close()
        print("Task added! Add more tasks? (y/n)")
        inp = io.read()
        if inp == "y" then
            AddNewTask()
        end
    else
        AddNewTask()
    end
end

-- function ListTasks()
--     filesystem.get()

-- end


function MainMenu()
    while true do
        print("\nWelcome to the taskboard!")
        print("1. Add new task")
        print("\nEnter a number: ")
        local inp = io.read()
        if inp == "1" then
            AddNewTask()
        end
        print(inp)
    end
end

MainMenu()