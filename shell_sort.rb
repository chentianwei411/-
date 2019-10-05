def shell_sort(arr)
  gap = arr.length / 2
  while gap > 0
    i = gap
    while i < arr.length
      # 插入排序
      temp = arr[i]
      j = i
      while j >= gap && arr[j - gap] > temp
        arr[j] = arr[j-gap]
        arr[j - gap] = nil
        j -= gap
      end
      arr[j] = temp

      i += 1
    end
    gap = gap / 2
  end
  return arr
end

# 便于理解shell_sort的代码：上面的方法是更优化的算法。
def shell_sort1(arr)
  gap = arr.length/2
  # 使用的是n除以2的i次方的步距。最后一轮gap等于1.
  while gap > 0
    i = gap
    # 遍历从i开始的元素， i前面的元素无需遍历。因为插入排序法，从后往前比较。
    while i < arr.length
      # 设置指针j, 指针是要前移的。
      # 相当于在队尾插入一个新元素，然后和前面的同组相邻元素比较和交换位置。
      # 如此反复直到该元素找到确定位置。
      j = i
      while j >= gap && arr[j - gap] > arr[j]
        # 被分到同组的相邻元素交换位置
        temp = arr[j]
        arr[j] = arr[j - gap]
        arr[j - gap ] = temp
        # 指针前移一个位置
        # 此时，arr[j]位置的值是插入的元素，它会在下轮循环和前面的元素比较。
        j = j - gap
      end
      i += 1
    end
    gap = gap/2
  end
  return arr
end

p b = (1..50).to_a.shuffle

p shell_sort(b)
