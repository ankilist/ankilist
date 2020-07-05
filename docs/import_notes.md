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

## Additional Notes

### Additional Database Considerations

While working on the initial database schema and thinking about the database queries,
I came to the realization that we will need to think about how to handle full text
search for Japanese text. This is not something that Postgres does out of the box
but there is at least one library (PGroonga) that might prove useful. Since this
will require further work, I will add a few links that look potentially useful:

- https://www.compose.com/articles/indexing-for-full-text-search-in-postgresql/
- https://pgroonga.github.io/
- https://stackoverflow.com/questions/3994504/how-do-i-implement-full-text-search-in-chinese-on-postgresql

### Schema

Currently we define two tables, `definitions` and `readings`; however, to a Japanese
user, the `readings` table is the `definitions` table. This probably indicates
that this schema needs to be thought out a bit more. I think this is probably ok
for an initial spike of the app but will likely need to be addressed if we decide
to support this for languages other than English -> Japanese.

### Formatting

To improve the formatting of the XML file you can install the tool `tidy` and run something like:

```shell
tidy -xml -i FILE > formatted_file 2> /dev/null
```
