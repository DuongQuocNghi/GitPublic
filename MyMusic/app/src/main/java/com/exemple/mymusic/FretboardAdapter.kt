package eu.acolombo.minimap.example

import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.exemple.mymusic.R
import eu.acolombo.minimap.example.data.MiddleFretboard
import kotlinx.android.extensions.LayoutContainer

class FretboardAdapter(val items: MutableList<MiddleFretboard>) :
    RecyclerView.Adapter<FretboardAdapter.ViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int) = ViewHolder(parent.inflate(R.layout.item_middle_fretboards))

    override fun onBindViewHolder(holder: ViewHolder, position: Int) = holder.bind(items[position], position)

    override fun getItemCount() = items.size

    override fun getItemId(position: Int) = position.toLong()

    override fun getItemViewType(position: Int) = position

    inner class ViewHolder(override val containerView: View) : RecyclerView.ViewHolder(containerView), LayoutContainer {
        fun bind(parking: MiddleFretboard, position: Int) {

//            parking.space?.let {
//                containerView.imageSpace.setImageResource(it.image)
//                if (it.mirrorHorizontal) containerView.imageSpace.scaleX = -1f
//                if (it.mirrorVertical) containerView.imageSpace.scaleY = -1f
//
//                containerView.setOnClickListener {
//                    parking.car = if (parking.car != null) null else getRandomCar()
//                    notifyItemChanged(position)
//                    listener.onParkingCountChange(emptyParkingSpots)
//                }
//            }
//
//            parking.car?.let {
//                containerView.imageCar.setImageResource(it.image)
//            }

        }
    }

}
