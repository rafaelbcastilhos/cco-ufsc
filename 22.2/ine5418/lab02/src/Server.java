import java.rmi.Naming;

public class Server {
    public Server() {}

    public static void main(String[] args) {
        Server server = new Server();
        server.execute();
    }

    private void execute() {
        try {
            Naming.rebind("list", new ImplementationList<Integer>());
        } catch (Exception e) {
            System.out.println("Não foi possível iniciar o RMI: " + e.getMessage());
        }
    }
}
