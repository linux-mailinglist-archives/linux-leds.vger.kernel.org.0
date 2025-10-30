Return-Path: <linux-leds+bounces-5941-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C603FC1E2A9
	for <lists+linux-leds@lfdr.de>; Thu, 30 Oct 2025 03:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C60E24E04DA
	for <lists+linux-leds@lfdr.de>; Thu, 30 Oct 2025 02:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D982F361C;
	Thu, 30 Oct 2025 02:54:40 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C1F2BDC14;
	Thu, 30 Oct 2025 02:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761792880; cv=none; b=NKmNrrhdqvDlv5xo6qlvZISoTmBCpkBiqFlGGMlK9nkaM9hBChhwq/J8/N8msZmTr/22ZXoH4GT1HXCxS2aE2YFtA1JsMpkOsBEdXnveAfAtjthpKTO+czXGSJqdTEQVGr2/seIYIus5afCFd/Qa6exbFKLaPVyZp4KZLMogHbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761792880; c=relaxed/simple;
	bh=2nou3+sYzr5FFBks/6IKQLsdlovVhPpCAxuxUPstnEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HfUsobp92diKwx8Yu0zfyhR6vfbTdGYWUGHCe4kVn201wiL7Bm2hLOambB5YYc4VqHWnpc0m+xC+ASufNJUyPUHxBPWl4mBywUZE1zIr57b/8NZjXu8zqipCkT8eceGIz1dP/ZRmkRHC02MV4FOMpDcEkauAvfqKFpu1dhZV+ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowACHqVhh0wJpy4RVBg--.33188S2;
	Thu, 30 Oct 2025 10:54:27 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Markus.Elfring@web.de
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH v2] leds: netxbig: fix GPIO descriptor leak in error paths
Date: Thu, 30 Oct 2025 10:53:12 +0800
Message-ID: <20251030025312.1623-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:zQCowACHqVhh0wJpy4RVBg--.33188S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur13Cr13GrWxtw17tr1fZwb_yoW5ZFyxpr
	W8A3ZYkFy5GFyxJr4jqF4kAFyfuw4ktr4xGa1xKas09F1Iqr1rXa4rJF45Z3WDKrykJrWY
	qF4rWay7uF4DC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AF
	wI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUSNt
	xUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgsLA2kC0GAMlQAAsH

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
Changes in v2:
- Consolidate PTR_ERR(gpiod) extraction into err_gpiod_put label
  (suggested by Markus Elfring)
---
 drivers/leds/leds-netxbig.c | 40 +++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index e95287416ef8..55afb03ee933 100644
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
@@ -374,46 +377,61 @@ static int netxbig_gpio_ext_get(struct device *dev,
 	for (i = 0; i < num_addr; i++) {
 		gpiod = gpiod_get_index(gpio_ext_dev, "addr", i,
 					GPIOD_OUT_LOW);
-		if (IS_ERR(gpiod))
-			return PTR_ERR(gpiod);
+		if (IS_ERR(gpiod)) {
+			ret = PTR_ERR(gpiod);
+			goto err_free_addr;
+		}
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
+			goto err_gpiod_put;
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
+		goto err_gpiod_put;
 	}
 	gpiod_set_consumer_name(gpiod, "GPIO extension enable");
 	gpio_ext->enable = gpiod;
 
 	return devm_add_action_or_reset(dev, netxbig_gpio_ext_remove, gpio_ext);
+
+err_gpiod_put:
+	ret = PTR_ERR(gpiod);
+err_free_data:
+	for (i = 0; i < gpio_ext->num_data; i++)
+		gpiod_put(gpio_ext->data[i]);
+err_free_addr:
+	for (i = 0; i < gpio_ext->num_addr; i++)
+		gpiod_put(gpio_ext->addr[i]);
+	return ret;
 }
 
 static int netxbig_leds_get_of_pdata(struct device *dev,
-- 
2.50.1.windows.1


