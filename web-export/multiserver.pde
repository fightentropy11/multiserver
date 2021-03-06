

// Import the net libraries
import processing.net.*;

// Declare a server
Server server;

String incomingMessage = "";

void setup() {
  size(200, 200);

  // Create the Server on port 5204
  server = new Server(this, 5204);
}

void draw() {
  background(255);

  // Display rectangle with new message color
  fill(0);
  textSize(20);
  textAlign(CENTER);
  text(incomingMessage, width/2, height/2);

  // If a client is available, we will find out
  // If there is no client, it will be"null"
  Client client = server.available();

  // We should only proceed if the client is not null
  if (client != null) {
    // Receive the message
    incomingMessage = client.readStringUntil('*'); 
    // Print to Processing message window
    println( "Client says:" + incomingMessage);
    // Write message back out (note this goes to ALL clients)
    server.write(incomingMessage);
  }
}

// The serverEvent function is called whenever a new client connects.
void serverEvent(Server server, Client client) {
  incomingMessage = "A new client has connected:" + client.ip();
  println(incomingMessage);
}

