Return-Path: <linux-leds+bounces-6178-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 440CBC670E0
	for <lists+linux-leds@lfdr.de>; Tue, 18 Nov 2025 03:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 123A94E20FE
	for <lists+linux-leds@lfdr.de>; Tue, 18 Nov 2025 02:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE162FB0AB;
	Tue, 18 Nov 2025 02:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBYgu1Tv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E013A38DEC;
	Tue, 18 Nov 2025 02:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763434090; cv=none; b=ZCQ78JL13fm8Nw37yePw3PNhuuCFeyok1forVRbp2Ppl8fstCLacvvGiuzxfXLQNrDRyQRMYoHDR5pIYZRC0MiuRdGK/dbKjoerVq5jCIOrDchSkWLMAeGqM3GCtWVWVnoakqcD+bK4l8Glr/rqbNm53J8n7WsjoHnp2mYElbrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763434090; c=relaxed/simple;
	bh=Zk+9GSdx1LmsnwA/MBfQ5+jwqwU6zNAvVmX83ccBGlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gTpnKAjCwKb6x6LfJBYJpnJXw9zzW246iL/g7czCyg3DJImxDHMXBuBlrVb8I5UBAoteasb/arOv94yZZOMUyKOaEQRAxVsKHYfLutaoKya6YZBFOXVomQEPMZZyaCJyLoSYmgPbCXdtoScT3sNs5svg1y5o43IiP+tvB94NADE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBYgu1Tv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 858C6C19421;
	Tue, 18 Nov 2025 02:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763434086;
	bh=Zk+9GSdx1LmsnwA/MBfQ5+jwqwU6zNAvVmX83ccBGlY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=KBYgu1Tv2Ba1dvplMPOxDJ2mY7RzqNcgb0QLSBSbLknWCkehTzoQ2sBWFh5co15BZ
	 2BJV7XlpySPVTgJNfGwb1C9rBKWWz0SZJJOOwYdGjBQbYdyEdAfMnHV+SlvLStHU0k
	 Rm+PRpGeOy0pVE+Yp1B4F3xs55BlI8IJ6hIHIcmQXoqJP0mW+hjwAJl9CYmmvacX2v
	 XpTyc1x7BlNTsVB1/6p3GlaOQ+4wTn4339HmBmiHKmR7O+VTL7VNOl3O2kFdPZQ4eN
	 mc7VUoyrdM8Csy+ApJNAs9nqzTQsCCLezSKcd+Dm5HY6yDg2KbKY+McSWfmE1l6uZt
	 1mmNdoZ98x0lQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324AFCEBF91;
	Tue, 18 Nov 2025 02:48:06 +0000 (UTC)
From: Fenglin Wu via B4 Relay <devnull+fenglin.wu.oss.qualcomm.com@kernel.org>
Date: Tue, 18 Nov 2025 10:48:03 +0800
Subject: [PATCH v2] leds: rgb: leds-qcom-lpg: Don't enable TRILED when
 configuring PWM
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-lpg_triled_fix-v2-1-6d1e5831333f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGLeG2kC/3WMwQqDMBAFf0X23IibRGh66n8UERNTXVCjiQ0tk
 n9v6r2XBzPw5oBgPdkAt+IAbyMFcksGfinAjN0yWEZ9ZuAVrxFRsmkd2t3TZPv2SW8mpVSopdJ
 CVpBPq7dZn8FHk3mksDv/OfsRf/ZvKiJDpjQX6iq4qYW5uxDK7dVNxs1zmQealNIXrnZ+2LMAA
 AA=
X-Change-ID: 20251114-lpg_triled_fix-44491b49b340
To: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763434085; l=2025;
 i=fenglin.wu@oss.qualcomm.com; s=20240327; h=from:subject:message-id;
 bh=cWR4OonENS/A1Z/FgzwkreX5FEzdr4WK9WkPXocNfU0=;
 b=1BdEDpkIUZ43lhz8o9zOnmCO9uhe6V2GhA+cLZa36KyIzzNvATnKX/Gn5oyRndv6AEVdXYvok
 OgA+w26WvZnD8sUhOwTjNMnVrtJKcgsNkBkHsMp3HS4u5myrXz1SmnR
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=BF8SA4IVDk8/EBCwlBehKtn2hp6kipuuAuDAHh9s+K4=
X-Endpoint-Received: by B4 Relay for fenglin.wu@oss.qualcomm.com/20240327
 with auth_id=406
X-Original-From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Reply-To: fenglin.wu@oss.qualcomm.com

From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

The PWM signal from the LPG channel can be routed to PMIC GPIOs with
proper GPIO configuration, and it is not necessary to enable the
TRILED channel in that case. This also applies to the LPG channels
that mapped to TRILED channels. Additionally, enabling the TRILED
channel unnecessarily would cause a voltage increase in its power
supply. Hence remove it.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v2:
- Check "chan->in_use" flag in lpg_pwm_apply() is not correct, as it
  indicates the channel is being used as a LED and this PWM API would
  never get called. Instead, remove the code line which enables TRILED
  in lpg_pwm_apply() and update the commit text to explain it clearly.

- Link to v1: https://lore.kernel.org/r/20251114-lpg_triled_fix-v1-1-9b239832c53c@oss.qualcomm.com
---
 drivers/leds/rgb/leds-qcom-lpg.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 4f2a178e3d265a2cc88e651d3e2ca6ae3dfac2e2..e197f548cddb03d079c54c4a0f402402c5d047e2 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2017-2022 Linaro Ltd
  * Copyright (c) 2010-2012, The Linux Foundation. All rights reserved.
- * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/bits.h>
 #include <linux/bitfield.h>
@@ -1247,8 +1247,6 @@ static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	lpg_apply(chan);
 
-	triled_set(lpg, chan->triled_mask, chan->enabled ? chan->triled_mask : 0);
-
 out_unlock:
 	mutex_unlock(&lpg->lock);
 

---
base-commit: ea1c4c7e648d1ca91577071fc42fdc219521098c
change-id: 20251114-lpg_triled_fix-44491b49b340

Best regards,
-- 
Fenglin Wu <fenglin.wu@oss.qualcomm.com>



