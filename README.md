# vroom-processing

Vroom-processing is an experimental [processing][processing] library that
enables communication between processing sketches and [vroom][vroom]
applications.

The following code demonstrates how to send a message from a processing 
sketch.

   ```processing
   import vroom.datastream.*;

   DataStream stream = new DataStream();

   void setup() {
      stream.sendMessage("vroom.control", "Hello from processing");
   }
   ```

The message `"Hello from processing"` would be sent to the `communicate` 
function of any running vroom application.

[processing]: http://processing.org
[vroom]: https://github.com/comscictr/vroom


### Dependencies

Vroom-processing uses the [RabbitMQ][rabbitmq] messaging system. Make sure
that you have this package installed and that the service is running. On
Ubuntu, you can do the following.

   ```sh
   sudo apt-get install rabbitmq-server
   ```

If the service is not running (check `sudo service rabbitmq-server status`)
you can start it as follows.

   ```
   sudo service rabbitmq-server start
   ```

[rabbitmq]: http://www.rabbitmq.com


### Installation

Before installation, you must compile the library. This requires that you
have a Java Development Kit (JDK) installed on you system. On Ubuntu, you
can install the `openjdk` package.

   ```sh
   sudo apt-get install openjdk-7-jdk
   ```

Once you have a JDK installed you can build the processing library.

   ```sh
   cd vroom/src
   ./compile.sh
   ```

Finally, to install the library, simply copy (or link) the `vroom/` 
directory into your processing `libraries/` directory. For example, if
your `sketchbook/` directory is located in your home directory, you 
could do the following.

   ```sh
   cp -r vroom/ ~/sketchbook/libraries
   ```

The next time you launch `processing` you should see `vroom` listed 
as a contributed library.


### Example Programs

There are a couple example programs included with the library. To try them
out open the processing "Examples" window and look under "Contributed 
Libraries".
