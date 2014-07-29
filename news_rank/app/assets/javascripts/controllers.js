app.controller('MainController', ["$scope", "$http", function($scope, $http) {


    $scope.activeTiles = []

    $scope.tiles = []

    var getArticles = function() {
        $http({
            method: 'GET',
            url: '/articles'
        }).success(function(data) {
            var merged = []
            merged = merged.concat.apply(merged, data)
            for (i = 0; i < merged.length; i++) {
                $scope.tiles.push(merged[i])
            }
            // currently defaults to sort by published date
            initializePage("published")
        })
    }
    
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

    $scope.addFile = function() {
        console.log('hey')
        var stagedFile = document.getElementById('file').files[0]
        var reader = new FileReader()
        reader.onloadend = function(e) {
            var data = e.target.result
            $http.post('/feeds/from_opml', {data: reader.readAsBinaryString(stagedFile) })
        }
        // reader.readAsBinaryString(stagedFile)
    }


    $scope.loadMoreTiles = function() {
        var lastTile = $scope.activeTiles.length
        for (i = 0; i < 9; i++) {
            if ($scope.activeTiles.length < $scope.tiles.length) {
                $scope.activeTiles.push($scope.tiles[i + lastTile])
            }
        }
    }

}]);