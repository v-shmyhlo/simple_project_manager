@app.controller "TasksController", ($scope, Projects) ->
  $scope.tasks = $scope.project.tasks

  $scope.createNewTask = (item, collection) ->
    item.completed = false
    collection.post(item).then (item) ->
      collection.push(item)
      console.log 'task created'

  $scope.taskClass = (item) ->
    return 'completed' if item.completed

  $scope.updateTask = (item) ->
    item.patch().then ->
      console.log('task updated')

  $scope.removeTask = (item, collection) ->
    item.remove()
    .then ->
      _.pull(collection, item)