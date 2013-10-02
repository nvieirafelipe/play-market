module PlayMarket
  class Receipt
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