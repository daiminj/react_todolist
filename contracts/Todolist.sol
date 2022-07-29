//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Todolist {
  uint public count = 0;

  struct Task {
    uint taskid;
    string content;
    bool completed;
  }

  mapping(uint => Task) public tasks;

  event TaskCreated(
    uint createid,
    string content,
    bool completed
  );

  event TaskCompleted(
    uint completeid,
    bool completed
  );

  constructor()  {
    createTask("Test Task");
  }

  function createTask(string memory _content) public {
    count ++;
    tasks[count] = Task(count, _content, false);
    emit TaskCreated(count, _content, false);
  }

  function checkTask(uint _taskid) public {
    Task memory _task = tasks[_taskid];
    _task.completed = !_task.completed;
    tasks[_taskid] = _task;
    emit TaskCompleted(_taskid, _task.completed);
  }
}