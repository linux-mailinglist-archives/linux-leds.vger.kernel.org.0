Return-Path: <linux-leds+bounces-5952-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDED4C22F54
	for <lists+linux-leds@lfdr.de>; Fri, 31 Oct 2025 03:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7D7918861E6
	for <lists+linux-leds@lfdr.de>; Fri, 31 Oct 2025 02:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707B426E71E;
	Fri, 31 Oct 2025 02:16:35 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03E41E991B;
	Fri, 31 Oct 2025 02:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761876995; cv=none; b=YMYAmeWpLRYFXrg11JVQxm0gWLwr500YWiXPqvrqEYxRE/JFa/KkIxpZ8NIgclEeJY2M8uozPVX+y04XXDce6WGLPVmPQSXQYMVSioAKDVqJidhZSaQXlEjJ/GHmsw6v96E9gd4+3TlL7K14liFpy5a79hXwI3ESnKd/EYqdJ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761876995; c=relaxed/simple;
	bh=wmtZN01BKnuNsPAH80ENio1nL8/32w+jKhR7z/5i2/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MhqqPSVVTxit+heL5cAR7hkNX4SMBAjhvMnPLXgVxIHBiiRT+Te/1NVn+Cr08SyeBwGfMY02PeZuEiXT4ihUXUXxGLDRYrWA5bdSiN9J6pflfTDee0itgafVrpMQP6W+ZD7fktBG00stifpWce5ECLwMIMbDxvSKi5wKPVwAbVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowADXQWz5GwRpgUK3AA--.6548S2;
	Fri, 31 Oct 2025 10:16:26 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Markus.Elfring@web.de
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH v3] leds: netxbig: fix GPIO descriptor leak in error paths
Date: Fri, 31 Oct 2025 10:16:20 +0800
Message-ID: <20251031021620.781-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20251028082117.276-1-vulab@iscas.ac.cn>
References: <20251028082117.276-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADXQWz5GwRpgUK3AA--.6548S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur13Cr13GrWxtw17Cw17KFg_yoW5urWxpr
	WUA3ZYkFy5Ga4xJr4jqa1kAF93uw48tw4xGay7Ka4Y9F1Ivr1rXa4rtF45Z3WDKryktrWj
	qF4fZay7uF1qk3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbhvtt
	UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAULA2kDfr-quwABs6

The function netxbig_gpio_ext_get() acquires GPIO descriptors but
fails to release them when errors occur mid-way through initialization.
The cleanup callback registered by devm_add_action_or_reset() only
runs on success, leaving acquired GPIOs leaked on error paths.

Add goto-based error handling to release all acquired GPIOs before
returning errors.

Fixes: 9af512e81964 ("leds: netxbig: Convert to use GPIO descriptors")
Suggested-by: Markus Elfring <Markus.Elfring@web.de>
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

---
Changes in v3:
- Rename err_gpiod_put to err_set_code for clarity
- Position err_set_code between err_free_data and err_free_addr
  as suggested by Markus Elfring
Changes in v2:
- Consolidate PTR_ERR(gpiod) extraction into err_gpiod_put label
  (suggested by Markus Elfring)
---
 drivers/leds/leds-netxbig.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index e95287416ef8..99df46f2d9f5 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -364,6 +364,9 @@ static int netxbig_gpio_ext_get(struct device *dev,
 	if (!addr)
 		return -ENOMEM;
 
+	gpio_ext->addr = addr;
+	gpio_ext->num_addr = 0;
+
 	/*
 	 * We cannot use devm_ managed resources with these GPIO descriptors
 	 * since they are associated with the "GPIO extension device" which
@@ -375,45 +378,58 @@ static int netxbig_gpio_ext_get(struct device *dev,
 		gpiod = gpiod_get_index(gpio_ext_dev, "addr", i,
 					GPIOD_OUT_LOW);
 		if (IS_ERR(gpiod))
-			return PTR_ERR(gpiod);
+			goto err_set_code;
 		gpiod_set_consumer_name(gpiod, "GPIO extension addr");
 		addr[i] = gpiod;
+		gpio_ext->num_addr++;
 	}
-	gpio_ext->addr = addr;
-	gpio_ext->num_addr = num_addr;
 
 	ret = gpiod_count(gpio_ext_dev, "data");
 	if (ret < 0) {
 		dev_err(dev,
 			"Failed to count GPIOs in DT property data-gpios\n");
-		return ret;
+		goto err_free_addr;
 	}
 	num_data = ret;
 	data = devm_kcalloc(dev, num_data, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
+	if (!data) {
+		ret = -ENOMEM;
+		goto err_free_addr;
+	}
+
+	gpio_ext->data = data;
+	gpio_ext->num_data = 0;
 
 	for (i = 0; i < num_data; i++) {
 		gpiod = gpiod_get_index(gpio_ext_dev, "data", i,
 					GPIOD_OUT_LOW);
 		if (IS_ERR(gpiod))
-			return PTR_ERR(gpiod);
+			goto err_free_data;
 		gpiod_set_consumer_name(gpiod, "GPIO extension data");
 		data[i] = gpiod;
+		gpio_ext->num_data++;
 	}
-	gpio_ext->data = data;
-	gpio_ext->num_data = num_data;
 
 	gpiod = gpiod_get(gpio_ext_dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(gpiod)) {
 		dev_err(dev,
 			"Failed to get GPIO from DT property enable-gpio\n");
-		return PTR_ERR(gpiod);
+		goto err_free_data;
 	}
 	gpiod_set_consumer_name(gpiod, "GPIO extension enable");
 	gpio_ext->enable = gpiod;
 
 	return devm_add_action_or_reset(dev, netxbig_gpio_ext_remove, gpio_ext);
+
+err_free_data:
+	for (i = 0; i < gpio_ext->num_data; i++)
+		gpiod_put(gpio_ext->data[i]);
+err_set_code:
+	ret = PTR_ERR(gpiod);
+err_free_addr:
+	for (i = 0; i < gpio_ext->num_addr; i++)
+		gpiod_put(gpio_ext->addr[i]);
+	return ret;
 }
 
 static int netxbig_leds_get_of_pdata(struct device *dev,
-- 
2.50.1.windows.1


