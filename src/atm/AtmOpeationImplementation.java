package atm;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class AtmOpeationImplementation implements AtmInterFace {
	Atm atm=new Atm();
	Map<Double,String> minstmt=new HashMap<>();
	@Override
	public void viewBalance() {
		System.out.println("View Balance: "+atm.getBalance());
		
	}

	@Override
	public void withdrawAmount(double withdrawAmount) {
		if(withdrawAmount%500==0) {
			if(withdrawAmount<=atm.getBalance()) {
				System.out.println("Collect The Cash: "+withdrawAmount);
				atm.setBalance(atm.getBalance()-withdrawAmount );
				minstmt.put(withdrawAmount, "Amount Withdrawn");
				viewBalance();
			}
			else {
				System.out.println("Insufficient Balance");
			}
			
		}
		else {
			System.out.println("Enter The Amount in terms of 500");
		}
		
	}

	@Override
	public void depositAmount(double depositAmount) {
		System.out.println("DepositedAmount: "+depositAmount);
		atm.setBalance(atm.getBalance()+depositAmount);
		minstmt.put(depositAmount, "deposited Successfully");
		viewBalance();
	}

	@Override
	public void viewMiniStatement() {
		Set<Double> set=minstmt.keySet();
		for(Double d:set) {
			 System.out.println(d+"="+minstmt.get(d));
		}
		
	}
	

}
