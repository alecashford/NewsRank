
// CR move method definition outside of method call.  Use named functions. Move towards implementing Models (or at a minimum Modules)

app.controller('MainController', ["$scope", "$http", function($scope, $http) {


    $scope.activeTiles = []

    $scope.tiles = []


    getArticles()



    var initializePage = function(sortBy) {
        sortFeed($scope.tiles, sortBy)
        if ($scope.tiles.length < 30) {
            var minimumCount = $scope.tiles.length
        } else {
            var minimumCount = 30
        }
        for (i = 0; i < minimumCount; i++) {
            $scope.activeTiles.push($scope.tiles[i])
        }
    }

    var sortFeed = function(sortMe, sortBy) {
        var spaceship = function(a, b) {
            if (a[sortBy] < b[sortBy]) {
                return -1
            }
            else if (a[sortBy] > b[sortBy]) {
                return 1
            }
            else {
                return 0
            }
        }
        sortMe = sortMe.sort(spaceship)
    }

    $scope.addFeedFromUrl = function() {
        $http.post('/feeds/from_url', { url: $scope.newFeedUrl })
    }

    // $scope.addFeedFromOpml = function() {
    //     // $http.post('/feeds/from_url', { url: $scope.newFeedUrl })
    // }

    $scope.loadMoreTiles = function() {
        var lastTile = $scope.activeTiles.length
        for (i = 0; i < 9; i++) {
            if ($scope.activeTiles.length < $scope.tiles.length) {
                $scope.activeTiles.push($scope.tiles[i + lastTile])
            }
        }
    }

}]);
