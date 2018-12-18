require 'bunny'

class Rabbitmq
  # This exercise is to build a method that implement Publish/Subscribe model using RabbitMQ (Messaging Service) and Bunny gem (RabbitMQ Client).
  #
  # The test case will provide a guest name to your method. The method should subscribe to a queue, publish the provided guest to the queue, and then
  # return a string with guest's name. (e.g.: "Received Name's Reservation")
  #
  # The test is pretty basic, but we are looking to see a working Pub/Sub implementation using RabbitMQ.
  #
  # Source (https://www.rabbitmq.com/getstarted.html, http://rubybunny.info/articles/getting_started.html)
  #
  def self.reservation_pub_sub(guest)
    conn = Bunny.new
    # connects to RabbitMQ running on localhost, with the default port,
    # username, password, and virtual host
    conn.start
    # Opens new channel
    ch = conn.create_channel
    # Creates fanout exchange which sends all messages to all queue it knows
    x = ch.fanout("Reservations")
    # Declares queue on channel and binds exchange to queue telling the exchange
    # to send messages to quene
    q = ch.queue("test_queue",   :auto_delete => true).bind(x)

    # Sets queue to outputs message every tiem a message is received on the
    # queue to confirm reciept
    q.subscribe do |delivery_info, metadata, payload|
      puts "#{payload} => test_queue"
    end
    #publishes guests reservation to all queues
    x.publish("#{guest}'s Reservation")
    return "Received #{guest}'s Reservation"
  end
end
