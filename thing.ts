import { Book } from "monorepo/types"

const thing: () => Book = () => {
  const book: Book = {
    author: "hi",
    id: "1"
  }
  return book
}

export default thing
