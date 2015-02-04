// Generated by CoffeeScript 1.9.0
(function() {
  'use strict';

  /**
    * @ngdoc service
    * @name todomvcApp.todoService
    * @description
    * # todoService
    * Singletonなtodo機能のインスタンスを提供するFactoryです。
   */
  angular.module('todomvcApp').factory('todoService', function($filter) {
    var Todo, todoService;
    Todo = (function() {
      function Todo(_at_task, _at_isCompleted, _at_editable) {
        this.task = _at_task != null ? _at_task : "";
        this.isCompleted = _at_isCompleted != null ? _at_isCompleted : false;
        this.editable = _at_editable != null ? _at_editable : false;
      }

      Todo.prototype.setTask = function(task) {
        return this.task = task;
      };

      Todo.prototype.setCompleted = function(isCompleted) {
        return this.isCompleted = isCompleted;
      };

      Todo.prototype.toggleCompleted = function() {
        return this.isCompleted = !this.isCompleted;
      };

      Todo.prototype.edit = function() {
        this.editable = true;
        return this.tempTask = this.task;
      };

      Todo.prototype.endEdit = function(isCancel) {
        if (isCancel == null) {
          isCancel = false;
        }
        this.editable = false;
        if (isCancel) {
          return this.task = this.tempTask;
        }
      };

      return Todo;

    })();
    todoService = {
      todos: [],
      addTodo: function(task) {
        return this.todos.push(new Todo(task));
      },
      removeTodo: function(todo) {
        return this.todos = _.without(this.todos, todo);
      },
      getCompleted: function() {
        return $filter('filter')(this.todos, {
          isCompleted: true
        });
      },
      isAllCompleted: function() {
        return _.every(this.todos, function(todo) {
          return todo.isCompleted;
        });
      },
      asAllCompleted: function() {
        return _.map(this.todos, function(todo) {
          todo.isCompleted = true;
          return todo;
        });
      },
      toggleAllCompleted: function() {
        if (this.isAllCompleted()) {
          return _.map(this.todos, function(todo) {
            todo.isCompleted = !todo.isCompleted;
            return todo;
          });
        } else {
          return this.asAllCompleted();
        }
      },
      getNotCompleted: function() {
        return $filter('filter')(this.todos, {
          isCompleted: false
        });
      },
      clearCompleted: function() {
        return this.todos = _.reject(this.todos, function(todo) {
          return todo.isCompleted;
        });
      }
    };
    return todoService;
  });

}).call(this);

//# sourceMappingURL=todoService.js.map