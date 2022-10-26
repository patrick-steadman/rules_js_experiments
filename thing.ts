import { Book } from "monorepo/types"
import * as leftSad from "left-sad"


const thing: () => Book = () => {
  const book: Book = {
    author: leftSad("hi", 3),
    id: "1"
  }
  return book
}

export default thing
