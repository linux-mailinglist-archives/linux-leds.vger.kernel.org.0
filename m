Return-Path: <linux-leds+bounces-8594-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tU9DN6mgL2pCDgUAu9opvQ
	(envelope-from <linux-leds+bounces-8594-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 08:50:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0A5683EE4
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 08:50:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8594-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8594-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02E1B3006F2C
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 06:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EE7358387;
	Mon, 15 Jun 2026 06:50:11 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716FF212566;
	Mon, 15 Jun 2026 06:50:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506211; cv=none; b=R+vXC/3KaqRNRT2MlbOPt7sIc5RV/wC4eEtLJZOMscuXkJilJzqJPaIueRM819SeRCjNj/lxoZf8TfQzs4Ls0kit+nzwi1DoyeCJ0jRDDsGvn3pgjrTbhOm3h3na73Oq5uG+pH9uwRpE+GrsA4YH2NnfLLaVBbfDJwUmWbkOKXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506211; c=relaxed/simple;
	bh=iid6G0z1OkZ7c32Iam5YBTzEffqOZ3LF+ETQ7EIzt8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TVwaAPLqhjhWnUE2EyjZcvZ4LTFuGQ8cZ2eL6Rw1gK5q2pjfXsF2YOoNdLovRwp2r32y7P6wqV+9vY9xAuhmXwa6t39stlTWOjAuZp2meyRYrpKWW9pM8G9ljYgbaS4cFShqg0mv7OhW9vCB5Z7Sl2lvV/pafXKxVR+rh6mcXc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAAXbhGeoC9qS92TEw--.24765S2;
	Mon, 15 Jun 2026 14:50:06 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: pengpeng@iscas.ac.cn
Subject: [PATCH] leds: lp55xx: roll back engine sysfs group on failure
Date: Mon, 15 Jun 2026 14:49:13 +0800
Message-ID: <20260615064913.58433-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAXbhGeoC9qS92TEw--.24765S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4DuF4ruF4DtryUtrWrXwb_yoW8ArW5pF
	s8GFyYvws5Ja1jq39xAas0va4fKan5trWUGFWxJ3srAr17Jr1fur1rt34jvFW3AFyxCr12
	vFWrtFyUursxCr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU089NUU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-leds@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-8594-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C0A5683EE4

lp55xx_register_sysfs() creates the common engine sysfs group before
creating the optional chip-specific sysfs group.

If the chip-specific group creation fails, the function returns the
error directly and leaves the engine group published even though probe
fails and the chip state will be torn down.

Remove the engine group when the later chip-specific group creation
fails.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/leds/leds-lp55xx-common.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index ea131177de96..501762b02667 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -1090,6 +1090,7 @@ static int lp55xx_register_sysfs(struct lp55xx_chip *chip)
 {
 	struct device *dev = &chip->cl->dev;
 	const struct lp55xx_device_config *cfg = chip->cfg;
+	bool engine_group_created = false;
 	int ret;
 
 	if (!cfg->run_engine || !cfg->firmware_cb)
@@ -1098,10 +1099,17 @@ static int lp55xx_register_sysfs(struct lp55xx_chip *chip)
 	ret = sysfs_create_group(&dev->kobj, &lp55xx_engine_attr_group);
 	if (ret)
 		return ret;
+	engine_group_created = true;
 
 dev_specific_attrs:
-	return cfg->dev_attr_group ?
-		sysfs_create_group(&dev->kobj, cfg->dev_attr_group) : 0;
+	if (!cfg->dev_attr_group)
+		return 0;
+
+	ret = sysfs_create_group(&dev->kobj, cfg->dev_attr_group);
+	if (ret && engine_group_created)
+		sysfs_remove_group(&dev->kobj, &lp55xx_engine_attr_group);
+
+	return ret;
 }
 
 static void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
-- 
2.50.1 (Apple Git-155)


