Return-Path: <linux-leds+bounces-6202-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC18C6CDC1
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 07:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 008942CE02
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 06:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EB831355F;
	Wed, 19 Nov 2025 06:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTU/6E2/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D51C2D6E44;
	Wed, 19 Nov 2025 06:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763532407; cv=none; b=pTtSqudQcBxIvVJxcLy6WMGl/2r+onXVeZOabJfjeaYojtGVBfA3zhcL6mFTpld9rrgD62MQ18EP9JG9ho87EpSRgkn+IKinLr/c1nBcwb/gd5rMrgm6vJoDhKbDFdqx0u4DrZDCKwANoky3BsmV4+c9AiK+f7CHlaOJ1LHMoW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763532407; c=relaxed/simple;
	bh=nEQCnRbdiI4INRoD7nPaYKHd6Awpb50IGD1nJZLNKG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JNEhqiP5bc9aVFVcCz18yFrTKd4ZBw0BH5iprCbRtfPh5Qf1Nz/KTUp8hWEzkJqF5zjU+DAbr3oo/iXZJ5LShdhWKZcHK4PzrD4iR7Mg19CnE5oeHgH9tCFsSj+kuTnrt7xUYy/VogEPHKtEHdMhzS5veQXuH1fK9Ntujxcv25s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTU/6E2/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC6D7C4AF0F;
	Wed, 19 Nov 2025 06:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763532406;
	bh=nEQCnRbdiI4INRoD7nPaYKHd6Awpb50IGD1nJZLNKG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aTU/6E2/XAqZmOXdoI+8BjtDFggxQrDcjvsPFSZBQ5S6s50uCSTk9tv2wcgPJCBn6
	 8solaC6Uu5l6Puxnqx1Dfd9CssBSlINKJ8vvPcOYT3XwHHmDlEyQn2/hdMtKo1LHek
	 HSBwYvKmCaFOr7c2RSTh0QNPyxfKEpSqxHZYXNdb9XJRchfB4aaVZk31Q7vPjHCT7P
	 rEJKHCxXvC9R+RUH7bXryRo5z444vX+OCChVn/lJ2N69blND1jOLdnXdAEWAWliYER
	 eq3Qla2kKh7A6N+OlASuHBsSDOpjWqWTmyycKfJYLZwvdppVlDNK6QJEPl0LMwRhjP
	 1ttHKtLjg/fBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E165CF258F;
	Wed, 19 Nov 2025 06:06:45 +0000 (UTC)
From: Fenglin Wu via B4 Relay <devnull+fenglin.wu.oss.qualcomm.com@kernel.org>
Date: Wed, 19 Nov 2025 14:06:43 +0800
Subject: [PATCH v3 2/2] leds: rgb: leds-qcom-lpg: Don't enable TRILED when
 configuring PWM
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-lpg_triled_fix-v3-2-84b6dbdc774a@oss.qualcomm.com>
References: <20251119-lpg_triled_fix-v3-0-84b6dbdc774a@oss.qualcomm.com>
In-Reply-To: <20251119-lpg_triled_fix-v3-0-84b6dbdc774a@oss.qualcomm.com>
To: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763532404; l=1457;
 i=fenglin.wu@oss.qualcomm.com; s=20240327; h=from:subject:message-id;
 bh=U+wcmaq3xYdZ4UGGBdL6UlkAePK6V2RVv6Nso37Fbso=;
 b=7NXgXUkI+Lc6RUBYvT8HCUX3BNbVJKBH/xcndfzx5AOUB6kvxNrBRFc/IlIzFADoASq4/3wos
 XA0PR8iqBqnBPoAEgnXVFJDxMS/OcEvn3/iuVGwMYBlVCqX8MhhWvf1
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
 

-- 
2.34.1



