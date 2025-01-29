# IAM User의 Secret Access Key 확인하기

- 암호화된 secret key를 encrypted_secret_key.txt 파일에 저장 후에

```bash
openssl enc -d -aes-256-cbc -a -in encrypted_secret_key.txt -pass pass:<YOUR_ENCRYPTION_KEY>
```
