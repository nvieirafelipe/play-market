# Play Market

Play market is a gem for verify Google Play In-App purchase receipts.

## Installation

    gem install play_market

## Usage

    require 'venice'

    data = "(Receipt Data)"
    if PlayMarket::Receipt.verify(data)
      p 'Receipt verified'
    end

Highly inspired by __Mattt Thompson__ [Venice](https://github.com/nomad/venice)

## License

Play Market is available under the MIT license.