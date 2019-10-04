def shell_sort(arr)
  # gap从n/2开始，每轮除以2，最后一轮gap == 1
  gap = arr.length / 2
  while gap > 0
    i = gap
    # 每轮gap：i从gap,加1，直到数组结束。
    # 每个元素都和它同组内的位于它前面的元素进行比较。
    # 分组后的每个组的第一元素，无需再遍历了。因为每组的第2个元素会和它进行比较。
    while i < arr.length
      temp = arr[i]
      # 插入排序
      j = i
      while j >= gap && arr[j - gap] > temp
        arr[j] = arr[j-gap]
        j -= gap
      end
      arr[j] = temp
      i += 1
    end
    gap = gap / 2
  end
  return arr
end

p b = (1..50).to_a.shuffle

p shell_sort(b)
