import java.rmi.Remote;
import java.rmi.RemoteException;

public interface InterfaceList<E> extends Remote {
    void add(int index, E element) throws RemoteException;
    E get(int index) throws RemoteException;
    E remove(int index) throws RemoteException;
    int size() throws RemoteException;
}
