rule putty {
    
    meta: 
        last_updated = "2023-12-30"
        author = "Wade Nelson"
        description = "A YARA ruleset for detecting the putty reverse shell connection."

    strings:
        
        $string1 = "powershell.exe -nop -w hidden -noni -ep bypass" ascii
        $string2 = "create((New-Object System.IO.StreamReader(New-Object System.IO.Compression.GzipStream((New-Object System.IO.MemoryStream(,[System.Convert]::FromBase64String('H4sIAOW/UWECA51W227jNhB991cMXHUtIRbhdbdAESCLepVsGyDdNVZu82AYCE2NYzUyqZKUL0j87yUlypLjBNtUL7aGczlz5kL9AGOxQbkoOIRwK1OtkcN8B5/Mz6SQHCW8g0u6RvidymTX6RhNplPB4TfU4S3OWZYi19B57IB5vA2DC/iCm/Dr/G9kGsLJLscvdIVGqInRj0r9Wpn8qfASF7TIdCQxMScpzZRx4WlZ4EFrLMV2R55pGHlLUut29g3EvE6t8wjl+ZhKuvKr/9NYy5Tfz7xIrFaUJ/1jaawyJvgz4aXY8EzQpJQGzqcUDJUCR8BKJEWGFuCvfgCVSroAvw4DIf4D3XnKk25QHlZ2pW2WKkO/ofzChNyZ/ytiWYsFe0CtyITlN05j9suHDz+dGhKlqdQ2rotcnroSXbT0Roxhro3Dqhx+BWX/GlyJa5QKTxEfXLdK/hLyaOwCdeeCF2pImJC5kFRj+U7zPEsZtUUjmWA06/Ztgg5Vp2JWaYl0ZdOoohLTgXEpM/Ab4FXhKty2ibquTi3USmVx7ewV4MgKMww7Eteqvovf9xam27DvP3oT430PIVUwPbL5hiuhMUKp04XNCv+iWZqU2UU0y+aUPcyC4AU4ZFTope1nazRSb6QsaJW84arJtU3mdL7TOJ3NPPtrm3VAyHBgnqcfHwd7xzfypD72pxq3miBnIrGTcH4+iqPr68DW4JPV8bu3pqXFRlX7JF5iloEsODfaYBgqlGnrLpyBh3x9bt+4XQpnRmaKdThgYpUXujm845HIdzK9X2rwowCGg/c/wx8pk0KJhYbIUWJJgJGNaDUVSDQB1piQO37HXdc6Tohdcug32fUH/eaF3CC/18t2P9Uz3+6ok4Z6G1XTsxncGJeWG7cvyAHn27HWVp+FvKJsaTBXTiHlh33UaDWw7eMfrfGA1NlWG6/2FDxd87V4wPBqmxtuleH74GV/PKRvYqI3jqFn6lyiuBFVOwdkTPXSSHsfe/+7dJtlmqHve2k5A5X5N6SJX3V8HwZ98I7sAgg5wuCktlcWPiYTk8prV5tbHFaFlCleuZQbL2b8qYXS8ub2V0lznQ54afCsrcy2sFyeFADCekVXzocf372HJ/ha6LDyCo6KI1dDKAmpHRuSv1MC6DVOthaIh1IKOR3MjoK1UJfnhGVIpR+8hOCi/WIGf9s5naT/1D6Nm++OTrtVTgantvmcFWp5uLXdGnSXTZQJhS6f5h6Ntcjry9N8eXQOXxyH4rirE0J3L9kF8i/mtl93dQkAAA=='))),[System.IO.Compression.CompressionMode]::Decompress))).ReadToEnd()))" ascii
        $PE_magic_byte = "MZ"
        $sus_hex_string = { 48 34 73 49 41 4f 57 2f 55 57 45 43 41 35 31 57 32 32 37 6a 4e 68 42 39 39 31 63 4d 58 48 55 74 49 52 62 68 64 62 64 41 45 53 43 4c 65 70 56 73 47 79 44 64 4e 56 5a 75 38 32 41 59 43 45 32 4e 59 7a 55 79 71 5a 4b 55 4c 30 6a 38 37 79 55 6c 79 70 4c 6a 42 4e 74 55 4c 37 61 47 63 7a 6c 7a 35 6b 4c 39 41 47 4f 78 51 62 6b 6f 4f 49 52 77 4b 31 4f 74 6b 63 4e 38 42 35 2f 4d 7a 36 53 51 48 43 57 38 67 30 75 36 52 76 69 64 79 6d 54 58 36 52 68 4e 70 6c 50 42 34 54 66 55 34 53 33 4f 57 5a 59 69 31 39 42 35 37 49 42 35 76 41 32 44 43 2f 69 43 6d 2f 44 72 2f 47 39 6b 47 73 4c 4a 4c 73 63 76 64 49 56 47 71 49 6e 52 6a 30 72 39 57 70 6e 38 71 66 41 53 46 37 54 49 64 43 51 78 4d 53 63 70 7a 5a 52 78 34 57 6c 5a 34 45 46 72 4c 4d 56 32 52 35 35 70 47 48 6c 4c 55 75 74 32 39 67 33 45 76 45 36 74 38 77 6a 6c 2b 5a 68 4b 75 76 4b 72 2f 39 4e 59 79 35 54 66 7a 37 78 49 72 46 61 55 4a 2f 31 6a 61 61 77 79 4a 76 67 7a 34 61 58 59 38 45 7a 51 70 4a 51 47 7a 71 63 55 44 4a 55 43 52 38 42 4b 4a 45 57 47 46 75 43 76 66 67 43 56 53 72 6f 41 76 77 34 44 49 66 34 44 33 58 6e 4b 6b 32 35 51 48 6c 5a 32 70 57 32 57 4b 6b 4f 2f 6f 66 7a 43 68 4e 79 5a 2f 79 74 69 57 59 73 46 65 30 43 74 79 49 54 6c 4e 30 35 6a 39 73 75 48 44 7a 2b 64 47 68 4b 6c 71 64 51 32 72 6f 74 63 6e 72 6f 53 58 62 54 30 52 6f 78 68 72 6f 33 44 71 68 78 2b 42 57 58 2f 47 6c 79 4a 61 35 51 4b 54 78 45 66 58 4c 64 4b 2f 68 4c 79 61 4f 77 43 64 65 65 43 46 32 70 49 6d 4a 43 35 6b 46 52 6a 2b 55 37 7a 50 45 73 5a 74 55 55 6a 6d 57 41 30 36 2f 5a 74 67 67 35 56 70 32 4a 57 61 59 6c 30 5a 64 4f 6f 6f 68 4c 54 67 58 45 70 4d 2f 41 62 34 46 58 68 4b 74 79 32 69 62 71 75 54 69 33 55 53 6d 56 78 37 65 77 56 34 4d 67 4b 4d 77 77 37 45 74 65 71 76 6f 76 66 39 78 61 6d 32 37 44 76 50 33 6f 54 34 33 30 50 49 56 55 77 50 62 4c 35 68 69 75 68 4d 55 4b 70 30 34 58 4e 43 76 2b 69 57 5a 71 55 32 55 55 30 79 2b 61 55 50 63 79 43 34 41 55 34 5a 46 54 6f 70 65 31 6e 61 7a 52 53 62 36 51 73 61 4a 57 38 34 61 72 4a 74 55 33 6d 64 4c 37 54 4f 4a 33 4e 50 50 74 72 6d 33 56 41 79 48 42 67 6e 71 63 66 48 77 64 37 78 7a 66 79 70 44 37 32 70 78 71 33 6d 69 42 6e 49 72 47 54 63 48 34 2b 69 71 50 72 36 38 44 57 34 4a 50 56 38 62 75 33 70 71 58 46 52 6c 58 37 4a 46 35 69 6c 6f 45 73 4f 44 66 61 59 42 67 71 6c 47 6e 72 4c 70 79 42 68 33 78 39 62 74 2b 34 58 51 70 6e 52 6d 61 4b 64 54 68 67 59 70 55 58 75 6a 6d 38 34 35 48 49 64 7a 4b 39 58 32 72 77 6f 77 43 47 67 2f 63 2f 77 78 38 70 6b 30 4b 4a 68 59 62 49 55 57 4a 4a 67 4a 47 4e 61 44 55 56 53 44 51 42 31 70 69 51 4f 33 37 48 58 64 63 36 54 6f 68 64 63 75 67 33 32 66 55 48 2f 65 61 46 33 43 43 2f 31 38 74 32 50 39 55 7a 33 2b 36 6f 6b 34 5a 36 47 31 58 54 73 78 6e 63 47 4a 65 57 47 37 63 76 79 41 48 6e 32 37 48 57 56 70 2b 46 76 4b 4a 73 61 54 42 58 54 69 48 6c 68 33 33 55 61 44 57 77 37 65 4d 66 72 66 47 41 31 4e 6c 57 47 36 2f 32 46 44 78 64 38 37 56 34 77 50 42 71 6d 78 74 75 6c 65 48 37 34 47 56 2f 50 4b 52 76 59 71 49 33 6a 71 46 6e 36 6c 79 69 75 42 46 56 4f 77 64 6b 54 50 58 53 53 48 73 66 65 2f 2b 37 64 4a 74 6c 6d 71 48 76 65 32 6b 35 41 35 58 35 4e 36 53 4a 58 33 56 38 48 77 5a 39 38 49 37 73 41 67 67 35 77 75 43 6b 74 6c 63 57 50 69 59 54 6b 38 70 72 56 35 74 62 48 46 61 46 6c 43 6c 65 75 5a 51 62 4c 32 62 38 71 59 58 53 38 75 62 32 56 30 6c 7a 6e 51 35 34 61 66 43 73 72 63 79 32 73 46 79 65 46 41 44 43 65 6b 56 58 7a 6f 63 66 33 37 32 48 4a 2f 68 61 36 4c 44 79 43 6f 36 4b 49 31 64 44 4b 41 6d 70 48 52 75 53 76 31 4d 43 36 44 56 4f 74 68 61 49 68 31 49 4b 4f 52 33 4d 6a 6f 4b 31 55 4a 66 6e 68 47 56 49 70 52 2b 38 68 4f 43 69 2f 57 49 47 66 39 73 35 6e 61 54 2f 31 44 36 4e 6d 2b 2b 4f 54 72 74 56 54 67 61 6e 74 76 6d 63 46 57 70 35 75 4c 58 64 47 6e 53 58 54 5a 51 4a 68 53 36 66 35 68 36 4e 74 63 6a 72 79 39 4e 38 65 58 51 4f 58 78 79 48 34 72 69 72 45 30 4a 33 4c 39 6b 46 38 69 2f 6d 74 6c 39 33 64 51 6b 41 41 41 3d 3d }

    condition:
        
        $PE_magic_byte at 0 and
        ($string1 or $string2) or

        $sus_hex_string
}