Return-Path: <linux-leds+bounces-6376-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E9CCA2819
	for <lists+linux-leds@lfdr.de>; Thu, 04 Dec 2025 07:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 630D9305FAAF
	for <lists+linux-leds@lfdr.de>; Thu,  4 Dec 2025 06:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23AF25334B;
	Thu,  4 Dec 2025 06:22:12 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1581A2C181;
	Thu,  4 Dec 2025 06:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764829332; cv=none; b=GX9IPY31DJCoqQJ8P95Ow9bbitPQXtOhoXuRtMgbMO2NSWP3p8j+d1ZO0wUYWP56o1x4n/XQx72IBNKUUgL6APzXDUpzriT3VKRXR3tfnlyOUfsqpy2NqhuOF/xmhsAYerz/ZRQi7hs0+r2g+v6GsnibRMVD1fSEUhq9Au5MsKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764829332; c=relaxed/simple;
	bh=z0Jxay3FOofAlB0LYItlOmQCSgShj1gWwmJ/OETfiB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q9I8vO0mz38++wIXNZNlw8ofPjlIJobqhMJ2+sLQFAPLdYFHpjN9bT2h9OEfoHG150n2qJsVUHAsoZ3WScc6mFlaUZTr7jpL5g7YAo1ddyLMqATdV1GQzwNutmOvviXPC4w3liZxwJjwX2JZ8QiZ5EpgVxjjWjS9khMscL1kgHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowADHV9qCKDFpwkodAw--.5119S2;
	Thu, 04 Dec 2025 14:21:55 +0800 (CST)
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
Subject: [PATCH] leds: qcom-lpg: Check the return value of regmap_bulk_write()
Date: Thu,  4 Dec 2025 14:17:28 +0800
Message-ID: <20251204061728.124-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADHV9qCKDFpwkodAw--.5119S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFyUAr45GF4Dtw4xCF13twb_yoW8Xr15pa
	y5CFW2kr4rAas5CayjvFZ8Aas8t3Wftas8GFykGa4S9F9FvF1jqF1rtFy5tFWrJr93Ca15
	JrWYqFWxAF12vFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JU-6pPUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgoGA2kxGKM3JQAAs4

The lpg_lut_store() function currently ignores the return value of
regmap_bulk_write() and always returns 0. This can cause hardware write
failures to go undetected, leading the caller to believe LUT programming
succeeded when it may have failed.

Check the return value of regmap_bulk_write() in lpg_lut_store and return
the error to the caller on failure.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 4f2a178e3d26..76734b1520f6 100644
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
+		ret = regmap_bulk_write(lpg->map, lpg->lut_base + LPG_LUT_REG(idx + i),
 				  &val, sizeof(val));
+		if (ret)
+			return ret;
 	}
 
 	bitmap_set(lpg->lut_bitmap, idx, len);
-- 
2.50.1.windows.1


