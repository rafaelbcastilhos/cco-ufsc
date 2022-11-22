import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.Objects;
import java.util.Scanner;

public class Client {
    InterfaceList<String> list;
    Scanner input = new Scanner(System.in);

    public Client() {
        try {
            list = (InterfaceList<String>) Naming.lookup("rmi://127.0.0.1/list");
        } catch (MalformedURLException | NotBoundException | RemoteException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        Client client = new Client();
        client.execute();
    }

    public void execute() {
        String command;
        int index;
        String value;

        System.out.println("Digite uma operação:\n -> add <index> <element>\n -> get <index>\n -> remove <index> \n -> size\n -> exit");

        while (true) {
            try {
                command = input.next();
                if (Objects.equals(command, "add")){
                    index = input.nextInt();
                    value = input.next();
                    list.add(index, value);
                    System.out.println("Elemento adicionado\n");
                } else if (Objects.equals(command, "get")){
                    index = input.nextInt();
                    System.out.println("Elemento capturado: " + list.get(index) + "\n");
                }
                else if (Objects.equals(command, "remove")){
                    index = input.nextInt();
                    System.out.println("Elemento removido: " + list.remove(index) + "\n");
                }
                else if (Objects.equals(command, "size")){
                    System.out.println("Tamanho: " + list.size() + "\n");
                }
                else {
                System.out.println("Finalizando...\n");
                break;
                }
            } catch (Exception e) {
                System.out.println("Algo de errado aconteceu: " + e.getMessage());
            }
        }
    }
}
