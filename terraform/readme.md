# IAM User의 Secret Access Key 확인하기

- 암호화된 secret key를 encrypted_secret_key.txt 파일에 저장 후에

```bash
echo "<ENCRYPTED_SECRET>" | openssl enc -aes-256-cbc -d -a -salt -pbkdf2 -pass pass:"<YOUR_ENCRYPTION_KEY>"
```
