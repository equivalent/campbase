# README

#### Initial Setup

```bash
rails new  --database=postgresql --asset-pipeline=propshaft campbase --skip-test
rails g model project title:string description:text status:string
```