package com.example.hybridandroid;

import android.os.Bundle;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.AppCompatActivity;
import android.widget.Button;

import io.flutter.facade.Flutter;

public class MainActivity extends AppCompatActivity {
    private Button mButton;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mButton = findViewById(R.id.button);
        mButton.setOnClickListener(
                view -> {
                   /* View flutterView = Flutter.createView(MainActivity.this, getLifecycle(), "route1");
                    FrameLayout.LayoutParams layout = new FrameLayout.LayoutParams(600, 800);
                    layout.leftMargin = 100;
                    layout.topMargin = 200;
                    addContentView(flutterView, layout);*/

                    FragmentTransaction transaction = getSupportFragmentManager().beginTransaction();
                    transaction.replace(R.id.frame_layout, Flutter.createFragment("route1"));
                    transaction.commit();
                }
        );


    }
}
