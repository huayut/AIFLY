# AIFLY
AI

## 自动提交脚本

仓库根目录下新增 `auto_commit.sh` 脚本，用于自动添加、提交并推送变更。

使用方式：

```bash
cd /workspaces/AIFLY
chmod +x auto_commit.sh
./auto_commit.sh "你的提交信息"
```

如果没有传递提交信息，脚本会使用默认信息 `Auto commit from script`。
