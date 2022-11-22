import java.rmi.RemoteException; //import java.rmi.server.UnicastRemoteObject;  
import java.lang.String;
import javax.swing.JOptionPane;

public class CalImpl {

	public CalImpl() throws RemoteException {
		cal = new boolean[10][7];
		descricao = new String[10];
		inicializaVetorMatriz();
	}

	boolean cal[][];
	String[] descricao;

	public int retornaIntDiaSemana(String diaSemana) {
		if (diaSemana.equals("Segunda")) {
			return 0;
		}
		if (diaSemana.equals("Terca")) {
			return 1;
		}
		if (diaSemana.equals("Quarta")) {
			return 2;
		}
		if (diaSemana.equals("Quinta")) {
			return 3;
		}
		if (diaSemana.equals("Sexta")) {
			return 4;
		}
		if (diaSemana.equals("Sabado")) {
			return 5;
		}
		if (diaSemana.equals("Domingo")) {
			return 6;
		}
		System.out.println("ERRO4");
		return -1;
	}

	public void inicializaVetorMatriz() {
		for (int b = 0; b < 10; b++) {
			for (int c = 0; c < 7; c++) {
				cal[b][c] = false;
			}
		}
		for (int d = 0; d < 10; d++) {
			descricao[d] = "null";
		}
	}

	public int temDescricao(String des) {
		for (int a = 0; a < 10; a++) {
			if (descricao[a].equals(des)) {
				return a;
			}
			if (descricao[a].equals("null")) {
				descricao[a] = des;
				return a;
			}
		}
		System.out.printf("Já está lotado");
		return -1;
	}

	public void insereMarcacao(String msg, String diaSemana) {
		int diaIndice = retornaIntDiaSemana(diaSemana);

		int existe = temDescricao(msg);

		if (existe != -1) {
			cal[existe][diaIndice] = true;
		} else {
			JOptionPane.showMessageDialog(null, "erro");
		}
	}

	public void retiraMarcacao(String msg, String diaSemana) {
		int diaIndice = retornaIntDiaSemana(diaSemana);
		int existe = temDescricao(msg);
		boolean vazio = true;
		if (existe != -1) {
			cal[existe][diaIndice] = false;
			for (int a = 0; a < 7; a++) {
				if (cal[existe][a]) {
					vazio = false;
				}
			}
			if (vazio) {
				descricao[existe] = null;
			}
		}
	}

	public String consultaDesDiaSemana(String diaSemana) {
		String descs = " ";
		int diaIndice = retornaIntDiaSemana(diaSemana);
		for (int a = 0; a < 10; a++) {
			if (cal[a][diaIndice] == true) {
				descs = descs + descricao[a] + ", ";
			}
		}		
		return descs;
	}

	public int consultaFrequenciaDia(String diaSemana) {
		int cont = 0;
		int diaIndice = retornaIntDiaSemana(diaSemana);
		for (int a = 0; a < 10; a++) {
			if (cal[a][diaIndice] == true) {
				cont++;
			}
		}		
		return cont;
	}
}
