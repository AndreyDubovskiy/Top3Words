text = gets
bad = [",", ".", "!", "?", "\\", "/", "#", "%", "@", "&", "(", ")", "{", "}", "[", "]", "|", ":", ";", "\""]

#In a village of La Mancha, the name of which I have no desire to call to mind, there lived not long since one of those gentlemen that keep a lance in the lance-rack, an old buckler, a lean hack, and a greyhound for coursing. An olla of rather more beef than mutton, a salad on most nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra on Sundays, made away with three-quarters of his income."


def clear_line(line, bad)
  for c in bad
    line = line.gsub(c, " ")
  end
  return line
end

text = clear_line(text, bad)

def get_count(text)
  tmp = [[],[]]
  text = text.split(" ")
  for c in text
    if c != ""
      if not(tmp[0].include? c)
        tmp[0].push(c)
        tmp[1].push(1)
      else
        tmp[1][tmp[0].index(c)] +=1
      end
    end
  end
  return tmp
end

def get_top3(array)
  if array[0].size == 0
    return []
  end
  if array[0].size == 1
    return array[0]
  end
  for i in (0..array[1].size-2)
    for t in (0..array[1].size-2-i)
      if(array[1][t] > array[1][t+1])
        array[1][t], array[1][t+1] = array[1][t+1], array[1][t]
        array[0][t], array[0][t+1] = array[0][t+1], array[0][t]
      end
    end
  end
  if array[0].size == 2
    return [array[0][-1], array[0][-2]]
  end
  return [array[0][-1], array[0][-2], array[0][-3]]
end

array = get_count(text)
array = get_top3(array)
puts(array)