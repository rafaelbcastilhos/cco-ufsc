import java.rmi.Naming;
//import java.rmi.registry.*;  
import java.rmi.RMISecurityManager;
import java.lang.SecurityManager;

// Executar:
// java -Djava.security.policy=server.policy Server
  
public class Server {  
//    Registry r;

    public Server() {  
    	if(System.getSecurityManager() == null) {
    	     //System.setSecurityManager(new RMISecurityManager());
    	     System.setSecurityManager(new SecurityManager());
    	  }
    	try { 
            //r = LocateRegistry.getRegistry();
            //System.setProperty("java.rmi.server.hostname", "192.168.1.100");
            //Naming.rebind("//192.168.1.100/Calendario", new ServerImpl());  
            System.setProperty("java.rmi.server.hostname", "127.0.0.1");
            Naming.rebind("//127.0.0.1/Calendario", new ServerImpl());
            //r.rebind("//127.0.0.1/Calendario", new ServerImpl());  
        }  
        catch( Exception e ) {  
            System.out.println( "Trouble: " + e );  
        }  
    }  
  
    public static void main(String[] args) {  
    	new Server();  
    }  
}  
