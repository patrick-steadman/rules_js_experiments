import { Book } from "types"
import * as leftSad from "left-sad"
import { map } from "lodash"

const thing: () => Book = () => {
  const book: Book = {
    author: leftSad("hi", 3),
    id: "1"
  }

  console.log(map<number, number>([1, 2, 3], (element): number => (element + 1)))

  return book
}

export default thing
