Return-Path: <linux-leds+bounces-6127-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D1551C5AE18
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 02:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 853194E3174
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 01:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69712192EA;
	Fri, 14 Nov 2025 01:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHJFhiac"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8D535957;
	Fri, 14 Nov 2025 01:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763082682; cv=none; b=sAhJzL4pQGWHsyQ0iZXICtUTf/BeU0JzK+UxulSkmanA6CD8XW2mTUoIE9lT51E2GhelomoxfMTGWwx2GDqZVY7FsDuDM4C32cmzT1kd0PD7yCaaxxxrKNXS545HpTyknR+q9K9pdaQ4y3zFiX0qxl+cLejYokEH4xajruzMuGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763082682; c=relaxed/simple;
	bh=axJqDcNq/1gZy2gIyJwyjy+d2wjZhkg2T2W0GNzPhhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k4y9Ex5uS5324+OwuRSRPgOfhU9kaBRkYtrZJT3rpuHKL+f31rTYExVQbBbjW9MpvGY7u2mOqGUUv95HNn7xaapdvEsFvU/JJgzftYzetinpm/LrAahv0jMq7Skl97uBZTfiI58Md0lRPA3GmG6q1r5HndC73NMWN2tRuXzDYFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHJFhiac; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 548F7C19422;
	Fri, 14 Nov 2025 01:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763082681;
	bh=axJqDcNq/1gZy2gIyJwyjy+d2wjZhkg2T2W0GNzPhhM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=PHJFhiaczeO6zCGi5lGu3HBLT/b2R3sNEb3REE3mplTurSMTPxkMKyBJNCu9B0KXb
	 bdv/je5YqekVo1DFR6kLnNXBm/MIPaMhTVPNJKOcp8SfaYlbD8NDKbpxvICuWABlVM
	 NmFj+xeRdY9FuufE0I4E3m1bBmvtpp+dp62ys9yI6QOR7S/SR6V6V3h/iu8NqwqQwj
	 x0Apr0mhDZSSwzFsCh54nwv2UH6Xo5BYISssiF3p23na4HDCJjLZ4PKwocOx8v0oEs
	 J+CXyE6N17wUu8vwS3LiUnEtzYvy4NNbcLek5yDQE3qdERxoE0yfTumG4yMx3Qw7nF
	 OF4TuG4MUj8xw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46547CD8CBF;
	Fri, 14 Nov 2025 01:11:21 +0000 (UTC)
From: Fenglin Wu via B4 Relay <devnull+fenglin.wu.oss.qualcomm.com@kernel.org>
Date: Fri, 14 Nov 2025 09:11:17 +0800
Subject: [PATCH] leds: rgb: leds-qcom-lpg: Only enable TRILED when LPG is
 used by LED
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-lpg_triled_fix-v1-1-9b239832c53c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALSBFmkC/x2MQQqAIBAAvxJ7TmhrO9hXIiJzswWx0IhA+nvSc
 QZmMiSOwgmGKkPkW5IcoQDWFaz7EhwrsYWhbdoeEUn5081XFM923uRRRKTRkDYdNVCiM3LR/3C
 c3vcDHrP9xWAAAAA=
X-Change-ID: 20251114-lpg_triled_fix-44491b49b340
To: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763082680; l=1599;
 i=fenglin.wu@oss.qualcomm.com; s=20240327; h=from:subject:message-id;
 bh=ZkSaXsvBfZujLAHvPc5ZBO+V5tX5nGnW9dxKHbr4fm4=;
 b=gKYlb6Hc81ZK0ommoX8v83TmgQUCzK6Q9d/HyJngwypBSB2SHhoIMm2+iJktSmD+VGHZ9YXBt
 7icrT0EtEErB1L1MZL4LFkA3f0FqwN/iXxbEVSLjr9Mf+PyCteFvYYg
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=BF8SA4IVDk8/EBCwlBehKtn2hp6kipuuAuDAHh9s+K4=
X-Endpoint-Received: by B4 Relay for fenglin.wu@oss.qualcomm.com/20240327
 with auth_id=406
X-Original-From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Reply-To: fenglin.wu@oss.qualcomm.com

From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

Enabling the TRILED channel will cause a voltage increase on its power
supply, which is unnecessary if the LPG channel is not being used to
control an LED.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 4f2a178e3d265a2cc88e651d3e2ca6ae3dfac2e2..234059b4c0f49d0398030ae5f86967fc1905206d 100644
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
@@ -1247,7 +1247,9 @@ static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	lpg_apply(chan);
 
-	triled_set(lpg, chan->triled_mask, chan->enabled ? chan->triled_mask : 0);
+	/* Only control TRILED if the LPG channel is used by TRILED */
+	if (chan->in_use && chan->triled_mask)
+		triled_set(lpg, chan->triled_mask, chan->enabled ? chan->triled_mask : 0);
 
 out_unlock:
 	mutex_unlock(&lpg->lock);

---
base-commit: ea1c4c7e648d1ca91577071fc42fdc219521098c
change-id: 20251114-lpg_triled_fix-44491b49b340

Best regards,
-- 
Fenglin Wu <fenglin.wu@oss.qualcomm.com>



