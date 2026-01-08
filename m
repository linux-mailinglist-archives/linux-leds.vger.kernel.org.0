Return-Path: <linux-leds+bounces-6588-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CE2D05379
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 18:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D1803010BE4
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 17:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84D72EC54D;
	Thu,  8 Jan 2026 17:53:41 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0DD23EAB4;
	Thu,  8 Jan 2026 17:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767894821; cv=none; b=j7CQ2ipPZGdjXCZA26/JCRmIeIEv+59w5ag7TKT0ijqRqQV/tK2rpqXRyaAwCjSPzGp5yjURRz+Yf8WEuphtC/La/B0sMI6jMZSOUBABBpY47Q0nN10wd5bYfLfX56/uBY5iY12DPlAPTubiSQ2Gs5iyWtjLqhfFsGh7iOKBGzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767894821; c=relaxed/simple;
	bh=KFMPtbgIBxu+Wla/QsqgOA/7d95SuEwC+NC9o34W3FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tPV72yfYpZuXUGfiRhegXwIm+s7eYYGHXRI5Otg+6KWfc54EakOhEeWIvjyituaR3rTW0PmUSm4qYdLl1lF3fN8NAJhBMWY6LYWQ2bKtxH3FClCBCaxbrsh4ilq7CvYeefTiOCAejXuV7ZIoQq3Qog88ZISIIN8OuPoc0537aTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [114.245.38.183])
	by APP-01 (Coremail) with SMTP id qwCowAAXvWgQ719poJDSAw--.17665S2;
	Fri, 09 Jan 2026 01:53:22 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: lee@kernel.org,
	pavel@kernel.org
Cc: abel.vesa@linaro.org,
	marijn.suijten@somainline.org,
	sre@kernel.org,
	andersson@kernel.org,
	anjelique.melendez@oss.qualcomm.com,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH v2] leds: qcom-lpg: Check the return value of regmap_bulk_write()
Date: Fri,  9 Jan 2026 01:51:33 +0800
Message-ID: <20260108175133.638-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20251204061728.124-1-vulab@iscas.ac.cn>
References: <20251204061728.124-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAXvWgQ719poJDSAw--.17665S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFyUAr45GF4Dtw4xCF13twb_yoW8XFy7pa
	y5CFW2kr4rAas5CayjvFWDJa4Yq3Wfta98GF95Ga4S9FnIvF1jqFyrtFy5tFWrJ3s3Ca1U
	ArWYqFW8AF17ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwkBA2lfx8oXOQACsb

The lpg_lut_store() function currently ignores the return value of
regmap_bulk_write() and always returns 0. This can cause hardware write
failures to go undetected, leading the caller to believe LUT programming
succeeded when it may have failed.

Check the return value of regmap_bulk_write() in lpg_lut_store and return
the error to the caller on failure.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

---
Changes in v2:
  - Fix indentation alignment.
---
 drivers/leds/rgb/leds-qcom-lpg.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 4f2a178e3d26..c33a49105dfc 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -369,7 +369,7 @@ static int lpg_lut_store(struct lpg *lpg, struct led_pattern *pattern,
 {
 	unsigned int idx;
 	u16 val;
-	int i;
+	int i, ret;
 
 	idx = bitmap_find_next_zero_area(lpg->lut_bitmap, lpg->lut_size,
 					 0, len, 0);
@@ -379,8 +379,10 @@ static int lpg_lut_store(struct lpg *lpg, struct led_pattern *pattern,
 	for (i = 0; i < len; i++) {
 		val = pattern[i].brightness;
 
-		regmap_bulk_write(lpg->map, lpg->lut_base + LPG_LUT_REG(idx + i),
-				  &val, sizeof(val));
+		ret = regmap_bulk_write(lpg->map, lpg->lut_base + LPG_LUT_REG(idx + i),
+					&val, sizeof(val));
+		if (ret)
+			return ret;
 	}
 
 	bitmap_set(lpg->lut_bitmap, idx, len);
-- 
2.50.1.windows.1


