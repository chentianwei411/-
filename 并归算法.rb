def merge(arr)
  if arr.length < 2
    return arr
  end
  mid = arr.length/2
  # 使用Proc对象
  mergeSort = lambda {|left, right|
    result = []
    i,j = 0, 0
    # 当指针增长到大于最后一个元素index的时候，结束循环。
    while  (left.length - 1) >= i && (right.length - 1) >= j
      if left[i] < right[j]
        result << left[i]
        i = i + 1
      else
        result << right[j]
        j = j + 1
      end
    end
    # ruby代码更方便确认范围
    result + left[i..-1] + right[j..-1]
  }

  mergeSort.call(merge(arr[0..(mid -1)]), merge(arr[mid..-1]))
end
#
# 
# def mergeSort(left, right)
#   result = []
#   while left.length > 0 && right.length > 0
#     if left[0] < right[0]
#       result << left.shift
#     else
#       result << right.shift
#     end
#   end
#
#   return result + left + right
# end
a = [11,8,3,6,9,7,4]
p merge(a)
