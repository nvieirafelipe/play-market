# Play Merchant

Play merchant is a gem for verify Google Play In-App purchase receipts.

## Installation

    gem install play_merchant

## Usage

    require 'venice'

    data = "(Receipt Data)"
    if PlayMerchant::Receipt.verify(data)
      p 'Receipt verified'
    end

Highly inspired by __Mattt Thompson__ [Venice](https://github.com/nomad/venice)

## License

Play Merchant is available under the MIT license.