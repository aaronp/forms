# Forms

A small project for creating forms

# Design

Form:
  title : string
  about : string
  questions : Question[]

Question:
  question : string
  values : Value[]
  type : [ slider, single, multiple, text]
  required : bool
  weight : double

Value : 
  value : [ String | Double | Boolean ]
  score : Int

# Features:

Save/Export to Json, CSV, PDF