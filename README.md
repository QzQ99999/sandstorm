# Sandstorm

2026-11-01 冻结版本 / Frozen release.

- [GitHub Repository](https://github.com/QzQ99999/sandstorm)
- [GitHub Pages — 在线运行 / Play](https://qzq99999.github.io/sandstorm/)
- [Releases — 完整离线 HTML 与源码存档 / Offline HTML and source archive](https://github.com/QzQ99999/sandstorm/releases)

敌人距离玩家 **7米以内（含7米）** 开始奔跑；生成与检测距离保持20米。
游戏模式按 **2**（支持数字小键盘）同时隐藏/恢复左上角提示与帧数，退出游戏后恢复显示。
完整光照、即时破碎和碎片碰撞保留。

Enemies start running within **7 metres**, inclusive. Spawn and detection remain
20 metres. In game mode, **2** (including numpad 2) toggles the upper-left hints
and FPS. Leaving game mode restores them. Full lighting, immediate fracture and
debris collisions remain enabled.

建议使用支持 WebGPU 的新版桌面 Chrome 或 Edge。首次加载含完整内嵌资源，文件约166MB。
Use a current desktop Chrome or Edge with WebGPU support. The first load contains
all embedded assets and is approximately 166MB.

## Controls / 操作

- `1`：进入/退出游戏 / Enter or leave game mode
- `W A S D`：移动 / Move
- `Shift`：疾跑 / Sprint
- 按住鼠标右键：瞄准；单击左键：射击 / Hold right mouse to aim; click left to fire
- `2`：显示/隐藏提示与帧数 / Toggle hints and FPS
- `Tab`：普通模式下打开编辑器 / Open editor outside game mode

## Frozen version / 版本冻结

未经用户明确确认，不得修改本版本、源码、工作台、资源、启动器、存档或再次发布。
No later source changes, updates, rebuilds or publication are authorized without
the user's explicit confirmation. See [AGENTS.md](AGENTS.md).

Standalone HTML SHA-256:

```
cce2f524539485ea18bee299e0de33579dd560be3a17af6fc06b7728a908e71b
```

## Exact deployment / 逐字节发布

完整HTML超过GitHub单个Git文件的大小限制，因此仓库保存不超过32MiB的UTF-8分片。
GitHub Pages通过Jekyll原样拼接分片，得到与本地冻结文件逐字节一致的`index.html`；
不会重新编译游戏代码，也不会改写内嵌资源。完整离线HTML和源码归档作为Release附件提供。

The standalone HTML exceeds GitHub's per-file Git limit. This repository stores
UTF-8 fragments of at most 32MiB. Jekyll concatenates their raw bodies into
`index.html`, preserving the frozen HTML byte for byte. It does not recompile game
code or rewrite embedded assets. Complete offline HTML and source archives are
provided as release assets.

Check all fragment hashes and the reconstructed HTML hash without modifying files:

```
python verify-parts.py
```

Optionally reconstruct the offline HTML (refuses to overwrite an existing file):

```
python verify-parts.py --output Sandstorm.html
```

Place `Launch Sandstorm.cmd` beside the reconstructed or downloaded `Sandstorm.html`
to open the offline game. `initial-workbench.json` preserves the complete embedded
scene preset. `THREE-LICENSE.txt` contains the Three.js license.
