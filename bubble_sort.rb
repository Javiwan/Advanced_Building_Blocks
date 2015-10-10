def bubble_sort(arr)

  turns = arr.size - 1 #Max num of turns to sort
  var = 0
  changed = false

  turns.times do |x|

    arr.each_with_index do |num, index|

      if (index < (turns)) && (arr[index] > arr[index + 1])
        var = arr[index]
        arr[index] = arr[index + 1]
        arr[index + 1] = var
        changed = true
      end

    end

  return arr if changed == false
  changed = false

  end

return arr
end

#---------------------------------------------------------------------

def bubble_sort_by(arr)

  turns = arr.size - 1 #Max num of turns to sort
  var = 0
  changed = false

  turns.times do |x|

    arr.each_with_index do |num, index|

      if (index < (turns)) && yield(arr[index], arr[index + 1]) > 0
        var = arr[index]
        arr[index] = arr[index + 1]
        arr[index + 1] = var
        changed = true
      end

    end

  return arr if changed == false
  changed = false

  end

return arr
end
#---------------------------------------------------------------------
array_cambio = ["hi","hello","hey"]
bubble_sort_by(array_cambio) do |left, right|
  left.length - right.length
end

print array_cambio

puts bubble_sort([3,4,78,2,0,2,24,100]).inspect
