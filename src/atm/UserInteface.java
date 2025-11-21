package atm;

import java.util.Scanner;

public class UserInteface {
	private static int status;
	public static void main(String[] args) {
		AtmOpeationImplementation impl = new AtmOpeationImplementation();
		Scanner sc=new Scanner(System.in);
		int atmNumber=123456;
		int atmPin=123;
		System.out.println("WELCOME TP THE ATM MACHINE");
		System.out.println("ENTER THE ATM NUMBER: ");
		int atmNum2=sc.nextInt();
		System.out.println("ENTER THE ATM PIN: ");
		int atmPin2 = sc.nextInt();
		if(atmNumber==atmNum2 && atmPin==atmPin2) {
			while(true) {
			System.out.println("1.viewAvaliable\n 2.WithdrawAmount\n 3.DepositAmount\n 4.ViewMiniStatement 5.EXIT");
			System.out.println("Enter The Choice: ");
			int ch=sc.nextInt();
			if(ch==1) {
				impl.viewBalance();
			}
			else if(ch==2) {
				System.out.println("Enter The amount of the withdraw");
				double withdrawAmount=sc.nextDouble();
				impl.withdrawAmount(withdrawAmount);
				
			}
			else if(ch==3) {
				System.out.println("Enter The Amount To The Depsoit: ");
				double depositAmount=sc.nextDouble();
				impl.depositAmount(depositAmount);
			}
			else if(ch==3) {
				impl.viewMiniStatement();
			}
			else if(ch==5) {
				System.out.println("Collect Your ATM  Card \n Thank You");
				System.exit(status);
			}
		
			}
		}else {
			System.out.println("INCORRECT ATM NUMBER OR PIN");
		}
		sc.close();
		}

}
