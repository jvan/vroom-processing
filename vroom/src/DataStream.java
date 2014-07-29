package vroom.datastream;

import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.Channel;

public class DataStream {

   private String hostname = "localhost";
   private int port = 5672;

   public void DataStream() { 
   }

   public void setHostname(String host, int port) {
      hostname = host;
      port     = port;
   }

   public void printHostname() {
      System.out.println("(DataStream hostname=" + hostname + ":" + port + ")");
   }

   public void sendMessage(String queue, String message) throws Exception {
      ConnectionFactory factory = new ConnectionFactory();
      factory.setHost(hostname);
      //factory.setPort(port);
      Connection connection = factory.newConnection();
      Channel channel = connection.createChannel();
      channel.queueDeclare(queue, false, false, false, null);
      channel.basicPublish("", queue, null, message.getBytes());
      channel.close();
      connection.close();
   }

}
