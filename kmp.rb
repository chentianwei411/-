def getNext(pattern)
  pLen = pattern.length
  next_s = []
  next_s[0] = -1
  i = 0  #代表主字符串的指针
  j = -1  #代表模式字符串的指针。

  while i < pLen - 1   #只处理前PLen -1个字符的情况。所以是PLen - 1
    if j == -1 || pattern[j] == pattern[i]
      i += 1
      j += 1
      #优化小技巧，直接进行2次递归，跳过第一次无效递归。
      if pattern[j] != pattern[i]
        next_s[i] = j
      else
        next_s[i] = next_s[j]
      end
    else
      j = next_s[j]
    end
  end
  return next_s
end

def next_s_matcher(text, pattern)
  # 传入的text = "abababca"
  next_s = getNext(pattern)
  i, j = 0, 0
  while i < text.length && j < pattern.length
    if j == -1 || text[i] == pattern[j]
      i += 1
      j += 1
    else
      j = next_s[j]
      # 或者使用j = kmp[j - 1] , 但这样无法处理当p等于"x"的情况
      # 当p = 'x'， p[0]不等于text[0]。之后的每轮比较都应当在j等于0时和i比较 。
      # 所以设置j = next_s[0] = -1, 这样if判断就会出现j等于-1，然后j+1，i+1
      # 在下一循环时，就可以对p[0]和text[i]进行比较了。
      # 如此经过O(2n)时间，判断"x"和text不匹配。
    end
  end

  if j == pattern.length   # 返回pattern出现在text中的的位置。
    return  i - j
  else# pattern不匹配text
    return -1
  end
end
text = "abacababc"
a = "abab"
p next_s_matcher(text, a)

def Kmp_matcher(text, pattern)
  # 传入的text = "abababca"
  kmp = [0,0,1,2,3,4,0, 1]

  i, j = 0, 0
  while i < text.length && j < pattern.length
    if text[i] == pattern[j]
      i += 1
      j += 1
    else
      if j == 0 #第一个字符不匹配只能继续i++了
        i += 1
      else
        j = kmp[j - 1]
      end
    end
  end

  if j == pattern.length   # 返回pattern出现在text中的的位置。
    return  i - j
  else# pattern不匹配text
    return "false"
  end
end

# text = "abababca"
# a = "abc"
# p Kmp_matcher(text, a)
