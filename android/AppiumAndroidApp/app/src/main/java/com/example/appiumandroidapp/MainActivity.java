package com.example.appiumandroidapp;

import android.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button btnLogin = (Button) findViewById(R.id.btnLogin);
        btnLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                loginAction();
            }
        });
    }

    private void loginAction() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setMessage(R.string.login_dialog_message).setTitle(R.string.login_dialog_title);
        builder.setPositiveButton(R.string.login_dialog_ok, null);
        AlertDialog alertDialog = builder.create();
        alertDialog.show();
    }
}
