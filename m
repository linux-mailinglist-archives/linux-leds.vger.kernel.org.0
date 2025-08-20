Return-Path: <linux-leds+bounces-5254-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DACB2D703
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 10:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8BF83ABCD7
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 08:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249FC2D97A4;
	Wed, 20 Aug 2025 08:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KB4Wh/fI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAC92D97BE;
	Wed, 20 Aug 2025 08:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755679641; cv=none; b=ZddRk4W4yY6vwzkiDIBXMelIqLEidFe79GKtQ1yg8ovqei/Fp3G23yQgQ9999/0NU4tqgiuEwfNAv8EGdJmiQ5sL4AZyelzEDtYgd7tsUgDK7YppCtyLPO4bffgi1u6fzMzEBrfu4a/InlDhBIMvF/4d6jZ9btCJnk0Jg3dBWmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755679641; c=relaxed/simple;
	bh=pgn0AbX8RFlvQ5v7Qq1Plx71CSWg6jfnKWWkncRYq3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VmYLBamXfqTSAUFXjgQ63SOwDi2QKDEK752WMGdUpjaxBkdYKweoFsY7B+KWFgRq8fmx50SdIvCRvS6PLJ9j/i0wE0JcM7ceQ1ArBMEk+pN/8oYcW2NOrkbiO8Tm5IZugu1R+TfbbZUksOBLgYSeoLuZJRHt6MOx0VukudY/tMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KB4Wh/fI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7362EC113D0;
	Wed, 20 Aug 2025 08:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755679640;
	bh=pgn0AbX8RFlvQ5v7Qq1Plx71CSWg6jfnKWWkncRYq3c=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=KB4Wh/fIry8N9tvIl3bcxYExjCRETzQRAWXeEd2Kk6yTxajsVPPX3Erw7VwHqYfEj
	 4kTwVlzu09f785ajmjsGliWEU8LjZ30PrudmyudSC6tD8hwhEragGbhKaSjD9jnDFy
	 wFA9YudF5SY6G3jT0Qdum1CAQG4Y1YZGSrVNgnaKRgiHQu4Ec5ahx7ntIrGlC7dTu7
	 4isvDwsX7wTys7zkr2iD6ylt5l8S4U7SzcODhC9t+9P2b7BdJrMAAohINaz6STbnsn
	 D6pBFoq3K4AqUy61+zYecyFaokd8Bz9djqZdCF9zUfC83lNOr/fDvoQf24apoSesdh
	 WTwe9qU8CrShw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E54CA0EF8;
	Wed, 20 Aug 2025 08:47:20 +0000 (UTC)
From: Andrei Lalaev via B4 Relay <devnull+andrei.lalaev.anton-paar.com@kernel.org>
Date: Wed, 20 Aug 2025 10:47:12 +0200
Subject: [PATCH] leds: leds-lp55xx: use correct address for memory
 programming
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-lp5562-prog-mem-address-v1-1-8569647fa71d@anton-paar.com>
X-B4-Tracking: v=1; b=H4sIAI+LpWgC/x3MwQqDMAyA4VeRnA10qR3iqwwPnU01MLUkIIPiu
 6/s+B3+v4KxChtMXQXlS0zOo+HRd7Bs8VgZJTUDOQpuJIefEsKTsOi54s47xpSUzTBn7+NC4c0
 0QKuLcpbv//ya7/sHE2NruWkAAAA=
X-Change-ID: 20250820-lp5562-prog-mem-address-ff33ac25be24
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andrei Lalaev <andrei.lalaev@anton-paar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755679639; l=2080;
 i=andrei.lalaev@anton-paar.com; s=20250820; h=from:subject:message-id;
 bh=8WvWq+dM1/5loxJ8nu3rUh9bYc0hws/+X0jjGLoaSrc=;
 b=aBLz/tpvJEzPDaAHWI4BCDHTmY+tWTlHTu4HCifxtdidOgtoNyVPGWJ5kt2KhMbk+Dpl/2jMA
 pcqqBTyEw1SDiAjK7ruwhq6h9+Sfsf/xUEwd5n2fV/29RuXsZPp45xb
X-Developer-Key: i=andrei.lalaev@anton-paar.com; a=ed25519;
 pk=728nZXw7ILalhZmxQ0hPJ77AKRvsdNkq+v6XdryA5fM=
X-Endpoint-Received: by B4 Relay for andrei.lalaev@anton-paar.com/20250820
 with auth_id=496
X-Original-From: Andrei Lalaev <andrei.lalaev@anton-paar.com>
Reply-To: andrei.lalaev@anton-paar.com

From: Andrei Lalaev <andrei.lalaev@anton-paar.com>

Memory programming doesn't work for devices without page support.
For example, LP5562 has 3 engines but doesn't support pages,
the start address is changed depending on engine number.
According to datasheet [1], the PROG MEM register addresses for each
engine are as follows:

  Engine 1: 0x10
  Engine 2: 0x30
  Engine 3: 0x50

However, the current implementation incorrectly calculates the address
of PROG MEM register using the engine index starting from 1:

  prog_mem_base = 0x10
  LP55xx_BYTES_PER_PAGE = 0x20

  Engine 1: 0x10 + 0x20 * 1 = 0x30
  Engine 2: 0x10 + 0x20 * 2 = 0x50
  Engine 3: 0x10 + 0x20 * 3 = 0x70

This results in writing to the wrong engine memory, causing pattern
programming to fail.

To correct it, the engine index should be decreased:
  Engine 1: 0x10 + 0x20 * 0 = 0x10
  Engine 2: 0x10 + 0x20 * 1 = 0x30
  Engine 3: 0x10 + 0x20 * 2 = 0x50

1 - https://www.ti.com/lit/ds/symlink/lp5562.pdf

Fixes: 31379a57cf2f ("leds: leds-lp55xx: Generalize update_program_memory function")
Signed-off-by: Andrei Lalaev <andrei.lalaev@anton-paar.com>
---
 drivers/leds/leds-lp55xx-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index e71456a56ab8dae56988f50edd267e8e55090df8..fd447eb7eb15e243f1c470085f7780a8da866286 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -212,7 +212,7 @@ int lp55xx_update_program_memory(struct lp55xx_chip *chip,
 	 * For LED chip that support page, PAGE is already set in load_engine.
 	 */
 	if (!cfg->pages_per_engine)
-		start_addr += LP55xx_BYTES_PER_PAGE * idx;
+		start_addr += LP55xx_BYTES_PER_PAGE * (idx - 1);
 
 	for (page = 0; page < program_length / LP55xx_BYTES_PER_PAGE; page++) {
 		/* Write to the next page each 32 bytes (if supported) */

---
base-commit: b19a97d57c15643494ac8bfaaa35e3ee472d41da
change-id: 20250820-lp5562-prog-mem-address-ff33ac25be24

Best regards,
-- 
Andrei Lalaev <andrei.lalaev@anton-paar.com>



