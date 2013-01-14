# Admin module definitions

exports.controllers = 

  AdminCtrl: [
    '$scope','rpc',
    ($scope, rpc) ->

      $scope.selectBriq = (id) ->
        $scope.id = id
        for input in id.info.inputs or []
          input.value = null
      
      $scope.installBriq = ->
        info = $scope.id.info
        key = [info.name]
        for input in info.inputs or []
          key.push input.value or input.default
        $scope.store 'installed', key.join(':'), info.name
      
      $scope.uninstallBriq = (id) ->
        $scope.id = null
        $scope.store 'installed', id
  ]
