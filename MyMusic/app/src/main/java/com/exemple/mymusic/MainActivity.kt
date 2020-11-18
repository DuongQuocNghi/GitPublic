package com.exemple.mymusic

import android.os.Bundle
import android.util.DisplayMetrics
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import eu.acolombo.minimap.example.FretboardAdapter
import eu.acolombo.minimap.example.data.MiddleFretboard
import kotlinx.android.synthetic.main.activity_main.*


class MainActivity : AppCompatActivity() {


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val displayMetrics: DisplayMetrics = resources.displayMetrics
        minimapView.maxSize = displayMetrics.widthPixels.toFloat()

        val layoutManager = LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false)
        val adapter = FretboardAdapter(getMiddleFretboards().flatten().toMutableList())

        recyclerView.layoutManager = layoutManager
        recyclerView.adapter = adapter
        recyclerView.minimap = minimapView

    }

    private fun getMiddleFretboards(): List<List<MiddleFretboard>> {
        return mutableListOf(
            mutableListOf(MiddleFretboard(0)),
            mutableListOf(MiddleFretboard(1)),
            mutableListOf(MiddleFretboard(2)),
            mutableListOf(MiddleFretboard(3)),
            mutableListOf(MiddleFretboard(4)),
            mutableListOf(MiddleFretboard(5)),
            mutableListOf(MiddleFretboard(6))
        )
    }

}
