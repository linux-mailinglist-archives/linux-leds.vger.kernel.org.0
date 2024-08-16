Return-Path: <linux-leds+bounces-2452-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 379C1954DBB
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 17:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 874EC28160F
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 15:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEE01C2300;
	Fri, 16 Aug 2024 15:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gOQe+Ndo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02B31C0DD3
	for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 15:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723822328; cv=none; b=mJpEDWxHpmHnoBwNrkosy8QFWuaL8JUyAzrc+WvKXL7B+2gzrNZXBV56oU18U9i2Fd9jJ4RuRFSJWmqkHTmLZ3a1JGEwEzNgdQYJ/VtaVDdo4kW1LfBdLnosvehXCwsFC95SUjGLTG9oZnM0Yu6/F9ATkOn+OCj+tqNjsB4lB0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723822328; c=relaxed/simple;
	bh=m6Hk8gKMX1w5RtMdLACIAQ5rXDRi8vsYTQoqOdYtge4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u226M82cuSSrG7Bcz91yCjKOi3SGGf4sZMsttjnFqdy2ZHIGEu3cGH6FmeV0d7SAU7PFhsnAXFJG6nQyFFvUFWkKwwXs1/z1JzT996D8H2ThmlcdHdUgltYKfl7pE6CaOEKFXTt2bZvX5/3Hor5ARheYJu4T8r0Az4QFOYyQ3dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gOQe+Ndo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-429e29933aaso14822095e9.0
        for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 08:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822325; x=1724427125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpSzvs+nYkevHrGD0uZRXPPuCA8pLPFmiuPfAoAZn4g=;
        b=gOQe+NdoAdEiA8JJG/EuPXAkfi5v4CNVJ7lzNk7Cidi/RNgHC2tKrZ98wJsRdZoONa
         j6sdTNIjk1AATL9VAJnt+oO90HIMj+7002jAnD675vQUtSJ1UEbEWVPBlUxWUWCo80f4
         erTlIOZgSBYOVC3VVcKkUNGKCoMyULx6an+UDf5d75iW7TY5CHxMdjU2fCErMTuhj2Fl
         3cBnJiKD0qR1N/CFr9Fi8r5KDxthBx1+jyflXTOCw8ka6BNRLyIU2SUse7T478EXhZdx
         RlwQ2dRhEpsGHQhwO44UBwP6ncFmOLXbyAWJvqyw5qSNmD9+eY3m1VsK+Jyp7SN/UG5T
         quQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822325; x=1724427125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IpSzvs+nYkevHrGD0uZRXPPuCA8pLPFmiuPfAoAZn4g=;
        b=dqHTrmMmqysSEJsM3fUQDMHcmLf9oJrqtvx2LhXu81/rVkWk8FbxCajn7LlHE2flly
         7XRGeBKtGmPRTbEiYW/BFSkrfQw6r73qMDCh2u9SFXXWhLzgAGrLPacFPhb/h7lf1NiF
         cUM4utPCEr3DcwwNL2gNb8jVxqfjhSQqjTOQRw2KXv5OsckLoq+9xyTrl4WEMw9ykpev
         2d3AoHlrM4C1hdUnv9XyImgpiwJ+FhE0iCNHw9Ih215/qBfLWYTEnV+3hW7LoFsWQmJ8
         WZ41cADC1f3ItNoR7g2f8J9EYEGlKfUmug8e5H9azkF7pIVo+rjhklD21xLiP400Pm+q
         mwbQ==
X-Gm-Message-State: AOJu0YxTWwAE/j15fN6WcTwHVuQDq01BJrvir6RfJusESgqcTg5LLnvs
	9mVML9IoiOUSyg6Yk3WGc16SQeyQpdjGkvt3Jj5NJf5fKYmquxwUiHSKSuAvuoc=
X-Google-Smtp-Source: AGHT+IFIM8SM/oUAoIoij6/+F29yCUYD7CkGrKL1zCzaVxOUpWq9yef5gSYP4cevO1RzYy6a3+hjag==
X-Received: by 2002:a05:600c:3143:b0:426:51ce:bb14 with SMTP id 5b1f17b1804b1-429ed7e43femr20311845e9.30.1723822324872;
        Fri, 16 Aug 2024 08:32:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:39 +0200
Subject: [PATCH 07/17] leds: bcm6328: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-7-1d0292802470@linaro.org>
References: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
In-Reply-To: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Riku Voipio <riku.voipio@iki.fi>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=m6Hk8gKMX1w5RtMdLACIAQ5rXDRi8vsYTQoqOdYtge4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3Dfttu0MwP3EZEIzlwWVIzETU/wM+a6ZdT+U
 j6PqUtmWHWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w3wAKCRDBN2bmhouD
 147yD/9gLAyT7CaUKu376rhokAa5nBq87hnVOfCdhHEcAQUegVx3PHvtzhd1qXPs+duPUC0yuV7
 Do3NvZOVUcUJRIHkBt/UXC6hUR1sJBk6WXUjJOkMj46EOuhLuwpwzLoQt/oVR4u2EO5i1FPOoTG
 D0Dl3i1+iWU8Fp6BAqYuZhd+e0lDEfaAkO9dSIEli4r45FXW2ljOBOky5fHTOUzPo4GoPRatKCN
 OrSd7SNZQ+CiOMREI6sEwJ2HVPu3xmcMAXas9HoDQKcVDdf7zHek0y+kxMU3cRX3tg0ApwR6kcL
 xJqDIBG2fUDG1RyLrMwaSe5nd6+NjEfzjRUQz/BuVkLV7WLafu1R23us2RtQlVzaQfzrnKou4hC
 6jGSuH5a2I9OqFbVh2AwwM79Mfl8xHFEqwPrn0OaC2kKNOLrYTatVf199VGOzrcLbB218zt9LwR
 BRVxtpUk4zm56QgpLS6AW9O0DRGBFsSptO1UFHbsMQK170y6mJaNERN8RnkRLnN14EPw+y/acbL
 VQ5Ok6Ek8WU/LdX4ct0HkFJfcfaV72fBxQ2HSJpQoV+cXp2AKyaznPx9WMLwOfgT1NkS3j+Oo9M
 5CTDWkCmklwcwRPvtNc5/dwJlXbY2Z/WdKS0zlQ6LOniVJx+yMLFFPzOL8+9HuAg+8jbU9MByx/
 5SnE2hJywDwR/8g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/leds-bcm6328.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 246f1296ab09..29f5bad61796 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -392,7 +392,6 @@ static int bcm6328_leds_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev_of_node(&pdev->dev);
-	struct device_node *child;
 	void __iomem *mem;
 	spinlock_t *lock; /* memory lock */
 	unsigned long val, *blink_leds, *blink_delay;
@@ -435,7 +434,7 @@ static int bcm6328_leds_probe(struct platform_device *pdev)
 		val |= BCM6328_SERIAL_LED_SHIFT_DIR;
 	bcm6328_led_write(mem + BCM6328_REG_INIT, val);
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		int rc;
 		u32 reg;
 
@@ -454,10 +453,8 @@ static int bcm6328_leds_probe(struct platform_device *pdev)
 			rc = bcm6328_led(dev, child, reg, mem, lock,
 					 blink_leds, blink_delay);
 
-		if (rc < 0) {
-			of_node_put(child);
+		if (rc < 0)
 			return rc;
-		}
 	}
 
 	return 0;

-- 
2.43.0


