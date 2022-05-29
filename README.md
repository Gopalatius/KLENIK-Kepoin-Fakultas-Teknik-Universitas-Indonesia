---
title: KLENIK (Kepoin Fakultas Teknik Universitas Indonesia)
tags: Kepoin Fakultas Teknik Universitas Indonesia
description: Aplikasi berbasis web yang ditujukan untuk membantu mahasiswa maupun non-mahasiswa untuk mengetahui hal yang lebih banyak mengenai Fakultas Teknik Universitas Indonesia.
---

# KLENIK!

<!-- Put the link to this slide here so people can follow -->
slide: 

---



---

## Ini program ngapain?

- Menampilkan tabel data mengenai Jurusan pada FT UI beserta Departemen yang menaunginya, daya tampung, kuota SNMPTN, SBMPTN, SIMAK UI, PPKB dan kuota TS
- Menampilkan tabel data mengenai Jurusan pada FT UI beserta Kurikulum atau Mata Kuliah yang akan dipelajari serta Prospek Karir-nya
- User dapat menambahkan suatu jurusan sebagai jurusan yang ingin mereka ambil atau Wishlist 
- Terdapat forum diskusi dimana user dapat bertanya maupun menjawab serta membaca diskusi/thread yang ada
- User dapat melihat kembali Jurusan yang ingin mereka ambil pada laman Wishlist serta melihat mata kuliah yang akan dipelajari serta prospek karirnya

---

### 70% of our users are developers. Developers :heart: GitHub.

---

{%youtube E8Nj7RwXf0s %}

---

### Usage flow

---


```graphviz
digraph {
  compound=true
  rankdir=RL

  graph [ fontname="Source Sans Pro", fontsize=20 ];
  node [ fontname="Source Sans Pro", fontsize=18];
  edge [ fontname="Source Sans Pro", fontsize=12 ];


  subgraph core {
    c [label="Hackmd-it \ncore"] [shape=box]
  }
  
  c -> sync [ltail=session lhead=session]

  subgraph cluster1 {
     concentrate=true
    a [label="Text source\nGithub, Gitlab, ..."] [shape=box]
    b [label="HackMD Editor"] [shape=box]
    sync [label="sync" shape=plaintext ]
    b -> sync  [dir="both"]
    sync -> a [dir="both"]
    label="An edit session"
  }
}
```

---

### Architecture of extension

---

![](https://i.imgur.com/ij69tPh.png)

---

## Content script

- Bind with each page
- Manipulate DOM
- Add event listeners
- Isolated JavaScript environment
  - It doesn't break things

---

# :fork_and_knife: 

---

<style>
code.blue {
  color: #337AB7 !important;
}
code.orange {
  color: #F7A004 !important;
}
</style>

- <code class="orange">onMessage('event')</code>: Register event listener
- <code class="blue">sendMessage('event')</code>: Trigger event

---

# :bulb: 

---

- Dead simple API
- Only cares about application logic

---

```typescript
import * as Channeru from 'channeru'

// setup channel in different page environment, once
const channel = Channeru.create()
```

---

```typescript
// in background script
const fakeLogin = async () => true

channel.answer('isLogin', async () => {
  return await fakeLogin()
})
```

<br>

```typescript
// in inject script
const isLogin = await channel.callBackground('isLogin')
console.log(isLogin) //-> true
```

---

# :100: :muscle: :tada:

---

### Wrap up

- Cross envornment commnication
- A small library to solve messaging pain
- TypeScript Rocks :tada: 

---

### Thank you! :sheep: 

You can find me on

- GitHub
- Twitter
- or email me
