module PlayMarket
  class Receipt
    class Order
      attr_reader :notification_id, :order_id, :package_name, :product_id,
                  :purchase_time, :purchase_state

      def initialize(attrs)
        @notification_id = attrs['notificationId']
        @order_id = attrs['orderId']
        @package_name = attrs['packageName']
        @product_id = attrs['productId']
        @purchase_time = Time.at(attrs['purchase_time'].to_i / 1000)
        @purchase_state = attrs['purchaseState']
      end
    end

    attr_reader :nonce, :orders

    def initialize(attrs)
      @nonce = attrs['nonce']
      @orders = attrs['orders'].map { |order_attrs| Order.new(order_attrs) }
    end

    class << self
      def verify(data, signature)
        verify!(data, signature) rescue false
      end

      def verify!(data, signature)
        client = Client.new

        begin
          client.verify!(data, signature)
        rescue PlayMarket::VerificationError => error
          raise error
        end
      end
    end
  end
end