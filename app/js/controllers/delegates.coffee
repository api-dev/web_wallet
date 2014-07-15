angular.module("app").controller "DelegatesController", ($scope, $location, $state, Growl, Blockchain, Wallet, RpcService) ->

    $scope.active_delegates = Blockchain.active_delegates
    $scope.inactive_delegates = Blockchain.inactive_delegates
    $scope.approved_delegates = Wallet.approved_delegates

    Wallet.refresh_accounts()
    Blockchain.refresh_delegates()


    Blockchain.get_asset(0).then (asset_type) =>
        $scope.current_xts_supply = asset_type.current_share_supply

    $scope.toggleVoteUp = (name) ->
        if name not of Wallet.approved_delegates or Wallet.approved_delegates[name] < 1
            Wallet.set_trust(name, 1)
        else
            Wallet.set_trust(name, 0)
