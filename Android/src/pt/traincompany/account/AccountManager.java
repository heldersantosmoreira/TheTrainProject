package pt.traincompany.account;

import pt.traincompany.main.R;
import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;

public class AccountManager extends Activity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_account_manager);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_account_manager, menu);
        return true;
    }
}
