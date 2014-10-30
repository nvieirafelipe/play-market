# Play Market
[![Code Climate](https://codeclimate.com/github/nvieirafelipe/play-market.png)](https://codeclimate.com/github/nvieirafelipe/play-market)

Play market is a gem for verify Google Play In-App purchase receipts.

## Installation

    gem install play_market

## Usage

    require 'play_market'

    data = "(Receipt Data)"
    if PlayMarket::Receipt.verify(data)
      p 'Receipt verified'
    end

Highly inspired by __Mattt Thompson__ [Venice](https://github.com/nomad/venice)

## License

Play Market is available under the MIT license.
