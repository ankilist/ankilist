# Initial Import Notes

We will only use the word, additional readings and the definition(s)

## Word itself

The main reading for a word is the **first** keb element

## Additional readings

All keb elements after the first

## Reading in kana

reb element(s)

## Definition

gloss elements: Gloss elements are encased in "senses" (XML elements) which are
groupings of distinctly different meanings (a good example is あくどい 悪くどい)
-- each set of glosses in a sense should be shown as a single element separated
by semi colons -- look at how Jisho handles the above example.

## Database structure

"readings" table:

- id
- reading: string
- primary: bool

"definitions" table:

- id
- definition (semi-colon separated string of definitions?) -- maybe each "sense" should be a separate entry?
- reading_id
