package eu.acolombo.minimap.example

import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.exemple.mymusic.R
import eu.acolombo.minimap.example.data.MiddleFretboard
import kotlinx.android.extensions.LayoutContainer
import kotlinx.android.synthetic.main.layout_middle_fretboards.view.*

class FretboardAdapter(val items: MutableList<MiddleFretboard>) :
    RecyclerView.Adapter<RecyclerView.ViewHolder>() {

    private val TYPE_FRIST_FRETBOARD = 1
    private val TYPE_MIDDLE_FRETBOARD = 2
    private val TYPE_LAST_FRETBOARD = 3

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
        if (viewType == TYPE_FRIST_FRETBOARD) {
            return FristFretboardsViewHolder(parent.inflate(R.layout.layout_first_fretboards))
        }else if (viewType == TYPE_MIDDLE_FRETBOARD) {
            return MiddleFretboardsViewHolder(parent.inflate(R.layout.item_middle_fretboards))
        }else{
            return LastFretboardsViewHolder(parent.inflate(R.layout.layout_last_fretboards))
        }
    }

    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int){
        if (holder is MiddleFretboardsViewHolder) {
            holder.bind(items[position], position)
        }
    }

    override fun getItemCount() = items.size

    override fun getItemId(position: Int) = position.toLong()

    override fun getItemViewType(position: Int): Int{
        if (position == 0) {
            return TYPE_FRIST_FRETBOARD
        }else if(position == items.size - 1){
            return TYPE_LAST_FRETBOARD
        }else{
            return TYPE_MIDDLE_FRETBOARD
        }
    }

    internal class MiddleFretboardsViewHolder(override val containerView: View) :  RecyclerView.ViewHolder(containerView), LayoutContainer {
        fun bind(middleFretboard: MiddleFretboard, position: Int) {
            containerView.fretboardOne.text = "C${middleFretboard.index}"
        }
    }

    internal class FristFretboardsViewHolder(override val containerView: View) :  RecyclerView.ViewHolder(containerView), LayoutContainer {
        fun bind(middleFretboard: MiddleFretboard, position: Int) {

        }
    }

    internal class LastFretboardsViewHolder(override val containerView: View) :  RecyclerView.ViewHolder(containerView), LayoutContainer {
        fun bind(middleFretboard: MiddleFretboard, position: Int) {

        }
    }

}
