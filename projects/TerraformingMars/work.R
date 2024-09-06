owen_data <- "Owen: 327-113 Gen. 16 Valley Trust
Owen: 248-107 Gen. 16 Teractor
Owen: 260-109 Gen. 16 Morning Star Inc.
Owen: 235-117 Gen. 15 Inventrix
Owen: 277-99 Gen. 16 Valley Trust
Owen: 258-120 Gen. 15 Manutech
Owen: 233-116 Gen. 15 PhoboLog
Owen: 174-113 Gen. 15 Morning Star Inc.
Owen: 195-98 Gen. 15 Robinson Industries
Owen: 219-96 Gen. 14 Valley Trust
Owen: 271-135 Gen. 16 Cheung Shing Mars
Owen: 250-101 Gen. 15 Manutech
Owen: 207-117 Gen. 14 Point Luna
Owen: 183-109 Gen. 15 Cheung Shing Mars
Owen: 237-115 Gen. 15 PhoboLog
Owen: 178-112 Gen. 14 Inventrix
Owen: 265-101 Gen. 16 Cheung Shing Mars
Owen: 254-98 Gen. 16 Morning Star Inc.
Owen: 142-94 Gen. 12 Tharsis Republic
Owen: 328-119 Gen. 16 Terractor
Owen: 260-115 Gen. 15 Manutech
Owen: 291-82 Gen. 15 Cheung Shing Mars
Owen: 247-120 Gen. 16 Inventrix
Owen: 281-116 Gen. 16 Valley Trust
Owen: 135-92 Gen. 13 Viron
Owen: 256-110 Gen. 16 Ecoline
Owen: 268-93 Gen. 15 Vitor
Owen: 166-120 Gen. 14 Morning Star Inc.
Owen: 263-111 Gen. 17 Cheung Shing Mars
Owen: 268-90 Gen. 14. Tharsis Republic
Owen: 269-99 Gen. 14 Credicor
Owen: 164-92 Gen. 12 Point Luna
Owen: 234-99 Gen. 15 Inventrix
Owen: 258-115 Gen. 16 Inventrix
Owen: 238-104 Gen. 14 Robinson Industries
Owen: 242-87 Gen. 15 PhoboLog
Owen: 246-133 Gen. 15 Morning Star Inc.
Owen: 325-127 Gen. 17 Inventrix
Owen: 259-102 Gen. 15 Morning Star Inc.
Owen: 152-98 Gen. 13 Interplanetary Cinematics
Owen: 222-112 Gen. 14 Robinson Industries
Owen: 213-94 Gen. 14 Robinson Industries
Owen: 202-91 Gen. 15 Viron
Owen: 240-105 Gen. 14 PhoboLog
Owen: 227-113 Gen. 16 PhoboLog
Owen: 202-124 Gen. 15 Interplanetary Cinematics
Owen: 224-95 Gen. 14 Point Luna
Owen: 223-140 Gen. 16 PhoboLog
Owen: 198-87 Gen. 14 Cheung Shing Mars
Owen: 215-95 Gen. 15 Point Luna
Owen: 210-108 Gen. 16 Interplanetary Cinematics
Owen: 200-87 Gen. 15 Credicor
Owen: 207-94 Gen. 14 Manutech
Owen: 175-96 Gen. 14 Cheung Shing Mars
Owen: 239-120 Gen. 15 Point Luna
Owen: 202-105 Gen. 14 Manutech
Owen: 242-118 Gen. 16 Teractor
Owen: 312-143 Gen. 16 Credicor
Owen: 203-136 Gen. 16 Teractor
Owen: 324-100 Gen. 16 Cheung Shing Mars
Owen: 166-95 Gen. 13 Vitor
Owen: 308-111 Gen. 17 Valley Trust
Owen: 265-107 Gen. 16 Interplanetary Cinematics
Owen: 228-127 Gen. 16 Cheung Shing Mars
Owen: 271-132 Gen. 17 Helion
Owen: 279-79 Gen. 14 Interplanetary Cinematics"
kyle_data <- "PhoboLog 198-146 Gen 16
Mining Guild 189-101 Gen 14
Aphrodite 196-103 Gen 15
Celestial 209-112 Gen 15
Thorgate 239-100 Gen 15
Cheung Shing mars 198-87 Gen 13
Saturn Systems 244-133 Gen 16
Vitor 239-92 Gen 16
Vitor 178-111 Gen 14
Tharsis Republic 232-86 Gen 14
Saturn Systems 176-123 Gen 15
Tharsis Republic 236-103 Gen 16
Valley Trust 192-102 Gen 14
Valley Trust 180-103 Gen 14
Interplanetary Cinematics 167-107 Gen 14
Interplanetary Cinematics 192-104 Gen 14
Ecoline 207-104 Gen 15
Manutech 188-87 Gen 14
Interplanetary Cinematics 241-96 Gen 16
Celestial 166-90 Gen 14
Thorgate 269-96 Gen 16
Robinson Industries 215-125 Gen 15
Vitor 241-120 Gen 16
Interplanetary Cinematics 153-88 Gen 13
Terractor 209-84 Gen 14
Viron 114-100 Gen 12
Vitor 170-84 Gen 13
Helion 146-85 Gen 12
United Nations Initiative 212-111 Gen 15
United Nations Initiative 202-92 Gen 14
Interplanetary Cinematics 260-99 Gen 14
Tharsis Republic 166-75 Gen 12
Robinson Industries 231-116 Gen 15
PhoboLog 206-78 Gen 14
Mining Guild 206-93 Gen 14
Saturn Systems 294-99 Gen 16
Credicor 294-109 Gen 16
Vitor 209-83 Gen 13
Vitor 227-107 Gen 15
Mining Guild 219-95 Gen 14
Credicor 229-96 Gen 14
Robinson Industries 156-91 Gen 12
Ecoline 196-122 Gen 16
Celestic 257-110 Gen 16
Credicor 227-128 Gen 15
Manutech 229-87 Gen 15
Interplanetary Cinematics 177-87 Gen 13
Vitor 208-123 Gen 15
PhoboLog 249-118 Gen 16
Credicor 204-104 Gen 15
Inventrix 237-109 Gen 16
United Nations Mars Initiative 288-137 Gen 17
Vitor 212-121 Gen 14
Viron 191-105 Gen 15
Robinson Industries 158-101 Gen 14
Morning Star Inc. 126-82 Gen 11
Robinson Industries 206-98 Gen 13
Morning Star Inc. 232-97 Gen 14"
split_o<-owen_data %>% str_split("\n") %>% unlist()
df_o <- tibble(Games = split_o)
owen_parsed_data<-df_o %>% 
  mutate(Player = str_extract(Games,".+(?=:)")) %>%
  mutate(Score = str_extract(Games,"[:digit:]+(?=-)")) %>% 
  mutate(Computer_Score = str_extract(Games,"(?<=-)[:digit:]+")) %>% 
  mutate(Generation = str_extract(Games,"(?<=Gen\\.\\s)[:digit:]+")) %>% 
  mutate(Corporation = str_extract(Games,"(?<=Gen\\.\\s[:digit:]{2}\\s).+")) %>% 
  select(Player,Score,Computer_Score,Generation,Corporation)

split_k<-kyle_data %>% str_split("\n") %>% unlist()
df_k <- tibble(Games = split_k)
kyle_parsed_data <- df_k %>% 
  mutate(Corporation = str_extract(Games,"(^([:alpha:]+\\s[:alpha:]+))|(^([:alpha:]+))")) %>%
  mutate(Score = str_extract(Games,"[:digit:]+(?=-)")) %>% 
  mutate(Computer_Score = str_extract(Games,"(?<=-)[:digit:]+")) %>% 
  mutate(Generation = str_extract(Games,"[:digit:]+$")) %>% 
  mutate(Player = "Kyle") %>% 
  select(Player,Score,Computer_Score,Generation,Corporation)
  


  
