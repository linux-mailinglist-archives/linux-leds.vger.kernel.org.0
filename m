Return-Path: <linux-leds+bounces-2308-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D44093BDD6
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 10:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 136931F215E9
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 08:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB60167D8C;
	Thu, 25 Jul 2024 08:19:12 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08D61CD11;
	Thu, 25 Jul 2024 08:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721895552; cv=none; b=S8OLl/bTOCP1o1qEGbvErjRNdTaC57yJuAZK+iZBd7c/MuJIoWhbCWFV06uFwzMy08n6123DxZEhdId585Zco9zsU2CU2+0kllwbmutFdtFgW8Vl5oEfsLu+twbMP9moD8ye50ys1m9OY0nqWpmyd4pt/LsOlZbS/RUrwvkN2vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721895552; c=relaxed/simple;
	bh=jEPFkk7dweGg6w4LjWhMpw6+689rnqvVfQxDeHzwFbI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EnUg5YCuDHp4cecd5WC/J+bQOC2S2rCppuwpAiVmlQb7UuXdbSUrETadPosTul+53D91jmu0XI9Ju7B9QTVsuKjHRGjk0Y5ZTi5Jc5pdhRrVzCAPsmdr/Z97xHDv4GS6UnfDFiziQhQIvrXLbrKkJ935mDsuihN1ZDBrykjBRKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAB3f_twCqJmao3wAA--.27495S2;
	Thu, 25 Jul 2024 16:18:57 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: pavel@ucw.cz,
	lee@kernel.org,
	kabel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] leds: ns2: add missing check for fwnode_property_read_u32_array
Date: Thu, 25 Jul 2024 16:15:37 +0800
Message-Id: <20240725081537.3247339-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3f_twCqJmao3wAA--.27495S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4kCw47Gr1kCF4xXr4fKrg_yoWDJrb_ur
	97ZryxKa4jgF4F9rZFyw1Iv3sFkFWUWr48ua12vas3J3W8C3sxXr40vryDurZ7ZF4fArnx
	Cr18Za43Cw13KjkaLaAFLSUrUUUU0b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbhxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAq
	x4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72
	CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7
	MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjqjg7UUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Add check for the return value of fwnode_property_read_u32_array() and
return the error if it fails in order to catch the error.

Fixes: 940cca1ab5d6 ("leds: ns2: convert to fwnode API")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/leds/leds-ns2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index f3010c472bbd..0713f7e9d1af 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -202,8 +202,12 @@ static int ns2_led_register(struct device *dev, struct fwnode_handle *node,
 	if (!modval)
 		return -ENOMEM;
 
-	fwnode_property_read_u32_array(node, "modes-map", (void *)modval,
-				       nmodes * 3);
+	ret = fwnode_property_read_u32_array(node, "modes-map", (void *)modval,
+					     nmodes * 3);
+	if (ret) {
+		dev_err(dev, "Missing modes-map property for %pfw\n", node);
+		return ret;
+	}
 
 	rwlock_init(&led->rw_lock);
 
-- 
2.25.1


