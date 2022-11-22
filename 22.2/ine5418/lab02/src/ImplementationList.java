import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.HashMap;

public class ImplementationList<E> extends UnicastRemoteObject implements InterfaceList<E> {
    HashMap<Integer, E> list;

    public ImplementationList() throws RemoteException {
        list = new HashMap<>();
    }

    @Override
    public synchronized void add(int index, E element) throws RemoteException {
        list.put(index, element);
    }

    @Override
    public synchronized E get(int index) throws RemoteException {
        return list.get(index);
    }

    @Override
    public synchronized E remove(int index) throws RemoteException {
        return list.remove(index);
    }

    @Override
    public synchronized int size() throws RemoteException {
        return list.size();
    }
}
