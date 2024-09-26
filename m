Return-Path: <linux-leds+bounces-2834-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F40987BB9
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 01:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A6AA1C21CF4
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2024 23:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1111B2EE7;
	Thu, 26 Sep 2024 23:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAaxqIAD"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B19A1B2ED0;
	Thu, 26 Sep 2024 23:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392905; cv=none; b=ZRuH56q08UeOjkg5QMJKJJwzG+1sqFhuymObZJsAmGfnN/f9yNQS+L9GDJUv7fKkwiEJhLxTVApVbPU54LfDYnVikxkraYAV/yD7X2tohKTnmEBU2liBdrbFwufAZKnV4bY24T1oBCxooYGwYfHPaESTr+0uH4TIyL3TnQh7lEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392905; c=relaxed/simple;
	bh=Jz/4B/tgbBWqjdHctAGZYjiz0MxFy7WzJiMpp8ER/SE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pdl6t8EpIsS2VFBTMc5F7UcQ1h52DPKJYyaJW03vPtrDpo0TeLjnRZOiRVWHQxKwzHTw6ANA3i4awtR1PGbidrLAnbnAEe7WRwe69iG5uXfYL/t+eZNv160kR8X3QmEBFismJvRuopAqsRjeO1MjmxdPQI3fJXtsSrOXnD90c7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAaxqIAD; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d2b4a5bf1so181261466b.2;
        Thu, 26 Sep 2024 16:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392903; x=1727997703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7h6S8dVKu0rivFQ344WPkvtRjYXL2xD9tqPuM/hQA0=;
        b=JAaxqIAD4cdQDqpMNzdT+aLhoNN3divup7toGEUs/QwdF+7zcFGz1N6yw8NAnwYH1J
         4IatnLyl1GJ6Nja6i6mLGR9MTCeDlvyrLdUbwsOI8zkUDtZ0FWrCnFwtcRAt8yFrrxrC
         aLycCwcTAa8HqYFYvVrjnMtvosYj6XSxagPdNNrtXykvlx6b6XPjCJzVl47yEB76hDSK
         7nTtF4Q+1rEX4CMmsWnKT10euxLnw3yLMgx5vVtbRRvI7s4HHV+JUhBx6hgkxYnPfrO1
         LH9DmfwQ+2JWrjXT4+TfzJchza162e2xlApptN1IC80v6rhEUvcFZHJNm7i+H1luLS7E
         kKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392903; x=1727997703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7h6S8dVKu0rivFQ344WPkvtRjYXL2xD9tqPuM/hQA0=;
        b=A3T52sHgZm+3KwPlI7sl/wqvvzVGjF79b+9Kkzs+bbKbY44waWdo/qfUqojRNHZ0iH
         lljp2znhfkZOup5WDKAm6axI1mgstYdBCcFEK8J0UK8+wy/VVV5pbZqr8bH9xjrl/5M2
         1wZAILt9IpUf2uze6b5Z+JvOxy/9bQ8LaHKegDnkSvhHk/B8mXNQN05v5pMzFNA2wwbX
         /V0nV0xZgQMicGrtvnSjgrygAmOVGY5u01MzSU3gvTko9uQFHaNhM7PzRiO29E8K6wQo
         VcKKQVlRDB0MAXr4fOog8Rfi4nsIzvMQwuPO3Lziu99e13/fv2lEF2z8HhQ8utRJ2Enr
         X3eA==
X-Forwarded-Encrypted: i=1; AJvYcCVQvmDyAQqFUG9GCHnhOlFbSyztY6S1/pFbV+tyk2rWef/93amDNvVRtOw7OUk/oIK0ac2ZilqWXEmTsWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOdeILt1PxtqQIMuGO1EAiP03aQWV8N5ISNPakwCO+sn9w6Uz+
	FCQm92GEx9EvEFWx7FksrhZY33JD5iRVgAR//yC4z625ysGNR3c2tJ7debE6
X-Google-Smtp-Source: AGHT+IGvoYtTRlxo+ZCSr+7IZ7oL03DwfddA8kVTy/0vVLsrqZIZv4yAr3ANwPUYnXfyhoxnViIYyQ==
X-Received: by 2002:a17:907:3fa2:b0:a8d:29b7:ecfd with SMTP id a640c23a62f3a-a93c4aab828mr100357366b.54.1727392902592;
        Thu, 26 Sep 2024 16:21:42 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:41 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:03 +0200
Subject: [PATCH 12/18] leds: ns2: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-12-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1248;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Jz/4B/tgbBWqjdHctAGZYjiz0MxFy7WzJiMpp8ER/SE=;
 b=qKqtyfzAGtYGnjb8UqcfA9/S/SX/eIKdm4rVtvNbSdblTDBXwzHMlUAHLJLiyKXWonL5oGDQU
 78Jcr4LvBg5AaqQMyyw/4oVbokWmBpUiGyTqttgSpH73fYZpZIVLpnW
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error path.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-ns2.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index f3010c472bbd..4c6f04a5bd87 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -238,7 +238,6 @@ static int ns2_led_register(struct device *dev, struct fwnode_handle *node,
 static int ns2_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct fwnode_handle *child;
 	struct ns2_led *leds;
 	int count;
 	int ret;
@@ -251,12 +250,10 @@ static int ns2_led_probe(struct platform_device *pdev)
 	if (!leds)
 		return -ENOMEM;
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		ret = ns2_led_register(dev, child, leds++);
-		if (ret) {
-			fwnode_handle_put(child);
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;

-- 
2.43.0


