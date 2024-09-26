Return-Path: <linux-leds+bounces-2831-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B8B987BB2
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 01:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C77101C20BD5
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2024 23:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BDB1B253E;
	Thu, 26 Sep 2024 23:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5eMFceH"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAFA1B1D6E;
	Thu, 26 Sep 2024 23:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392899; cv=none; b=IdrTJ8ow41o/oHMUL81nO/RKlrs4aUdo3N1pRnJZNOBkV3jMc3mII5deWUp22+zPYjL+YTTXf2cIYofjoMJ6VujCwVIjnhwEgKbPxCB0xMlqteswJ4ZsLaGhBdiObjyTwzo/eKRB9EnJMcY04fFyjKZxaLvoTly80V8KN3VX6Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392899; c=relaxed/simple;
	bh=fs0ieuWlVTuCmcLPVCaC9tRU1u41+9gEsw3Vo/oP6MU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bxvJWAaLoryF9rS7lD4MYxCbgJFqGc3RegJ8anSbES+N76UPkKhh2hHTznJyRxWuaYvb165F29eakA/aKnFxGhis2JSbU+6gmIqcybE9TU00Bqmo3ISbJ+LJAHjyMjDzpHDrcC/RQ5enPA0pnUxE6BgyV7kZopnrBkx4wmPY5t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5eMFceH; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d60e23b33so205020466b.0;
        Thu, 26 Sep 2024 16:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392896; x=1727997696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQNsFzUPUUPsb4bHTQ95hMBvvP4G234MZae0hcpLMbY=;
        b=m5eMFceHfJGEwqpIquUFJdMdfLUxmFUd/tWymI+6SKLZwiWOi1XQaM/xh2sWwqD5U9
         LBbcpAFCAinGrwW6kNYA6cjuDeqK6ksjT/1xrZ6iEBBwKJaMn6KYsRtZgXVCTy7fHyFj
         pKJFJfr8sb+8Ssa4hhfCibPQbHExBNXmFb38oRVvE8BQiV93a1FM+LvMJ65XEW4auo1u
         /tdwNfNFMEwTUqiKOdUN4KkbdMZ16Znoz0DcD0Un+kYAeDpiVK3JlzLRJ/nsLVlhbMeA
         fc053Gg20ANLXXEUXp76sDXT0htXBRpJWnLtFAxlnnperwwCKYGIusIYbseb7uQwurS+
         WeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392896; x=1727997696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQNsFzUPUUPsb4bHTQ95hMBvvP4G234MZae0hcpLMbY=;
        b=SCUAVYplG04vIq/m8W8PypjtZk/1WSVOCJhfd1Kw9XNpt0WxcbR+Wd6FOneAnBNChb
         6U85mmpgXbruxFnrX1ZaHb+obmmv8yEWbv6dgaoW1t2aKz83BiUaZkrTPmyAZWgnIZsD
         cPTZc/0rUtbBXVbRfWBTWO7xl6GWQsleeeIDiSKdRjyniry+TH/euXXQzn1vAyPZceZL
         GR/TYn0lxv6Er2NjZVUyipeS9U4rN4MNmqLJFgjUNOjokw9YqSPEvigJ0cBYGBEIJK6d
         0gMXTAPVhGLIuBrk1oL8hnluAuvGc/OxZmfUd2Nd3NEJ0F1L9ywahO/aIzHMEFKqaAqn
         1+6g==
X-Forwarded-Encrypted: i=1; AJvYcCVVf/IPmA4r6jOkW+bKc9emZx4cj6lur1Q5PQn03BqYiKQc73As/GllurJM9G58bKTAwvhp8CptSjMa3p4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6i6O8yWkSzsCJ28TY3Z3G8f2/qj6rSTwKPFtvxiSyZumfsoXe
	k6eHsmqzBx2wsJ0feQfoLfC6D5IhcwfUgh29KDPZBA6+bPjgc5AX
X-Google-Smtp-Source: AGHT+IEyOGNZ71T4Vzvgj3bKvi7dihBSn/dSInDBzZVsM1XUQPQ44OJgPDcuSpfwKzM4zpJDbvxA3w==
X-Received: by 2002:a17:906:794c:b0:a8c:d6a3:d03a with SMTP id a640c23a62f3a-a93c491f3b2mr103908966b.21.1727392896321;
        Thu, 26 Sep 2024 16:21:36 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:35 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:00 +0200
Subject: [PATCH 09/18] leds: lm3697: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-9-95c0614b38c8@gmail.com>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Gene Chen <gene_chen@richtek.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=2273;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=fs0ieuWlVTuCmcLPVCaC9tRU1u41+9gEsw3Vo/oP6MU=;
 b=W7PpV2kxni+RR0wy6YwJI0c2sUNCxXu+i08YXpIMr6XkyMRvsaXGdZ2iuGj13YAu0Wxs7NeRP
 b7bgPKb5Zo6AJcco0ow/T7yOT/DNC6kxjWbdvRLSxzKncZ93rGydqGU
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

After switching to the scoped variant, there is no longer need for a
jump to 'child_out', as an immediate return is possible.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-lm3697.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 99de2a331727..7ad232780a31 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -202,7 +202,6 @@ static int lm3697_init(struct lm3697 *priv)
 
 static int lm3697_probe_dt(struct lm3697 *priv)
 {
-	struct fwnode_handle *child = NULL;
 	struct device *dev = priv->dev;
 	struct lm3697_led *led;
 	int ret = -EINVAL;
@@ -220,19 +219,18 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 	if (IS_ERR(priv->regulator))
 		priv->regulator = NULL;
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct led_init_data init_data = {};
 
 		ret = fwnode_property_read_u32(child, "reg", &control_bank);
 		if (ret) {
 			dev_err(dev, "reg property missing\n");
-			goto child_out;
+			return ret;
 		}
 
 		if (control_bank > LM3697_CONTROL_B) {
 			dev_err(dev, "reg property is invalid\n");
-			ret = -EINVAL;
-			goto child_out;
+			return -EINVAL;
 		}
 
 		led = &priv->leds[i];
@@ -262,7 +260,7 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 						    led->num_leds);
 		if (ret) {
 			dev_err(dev, "led-sources property missing\n");
-			goto child_out;
+			return ret;
 		}
 
 		for (j = 0; j < led->num_leds; j++)
@@ -286,17 +284,13 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 						     &init_data);
 		if (ret) {
 			dev_err(dev, "led register err: %d\n", ret);
-			goto child_out;
+			return ret;
 		}
 
 		i++;
 	}
 
-	return ret;
-
-child_out:
-	fwnode_handle_put(child);
-	return ret;
+	return 0;
 }
 
 static int lm3697_probe(struct i2c_client *client)

-- 
2.43.0


