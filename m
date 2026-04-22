Return-Path: <linux-leds+bounces-7806-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBZpDjDd6GnOQwIAu9opvQ
	(envelope-from <linux-leds+bounces-7806-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 22 Apr 2026 16:37:36 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E387447528
	for <lists+linux-leds@lfdr.de>; Wed, 22 Apr 2026 16:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3D3D300F5CF
	for <lists+linux-leds@lfdr.de>; Wed, 22 Apr 2026 14:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6605330E0C0;
	Wed, 22 Apr 2026 14:33:31 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107B3220F49;
	Wed, 22 Apr 2026 14:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776868411; cv=none; b=KYdivO0XabYEmXCAd0+eU2w51nX+AhuXA3616fkbKHo72nes+EWaCwFpm7fRByXckYjLofsMajTmHzptC87xYwJ2Px+EjB5pk41Ke/D2seJGO/H31FJ9gqfgJPVTZ5BLmEAdElD1PLgOyEi63npFTMEKQwY6RpkvBmVvejzkLJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776868411; c=relaxed/simple;
	bh=RrqH9WOa6QB7sIKe5bP7W2eOU3JRjp1gI3AIvKar86k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hAfpEvONssS6Si0Db5YLi3w9IMCM2oMLb7PQzJr64yLiy3bJqRwrrchD3AxPt1X2v1pdk25yX8+jtOOyf0dYnBjXwZGcEWDOcaJf0kAg/WNz5S1LAC7qrsZj4y336QBOnhcsBPwUw/AxjLsXmV3bTXVLWv5lXbSQ8PJyxylZI6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 9A3BCDF91D7;
	Wed, 22 Apr 2026 16:23:50 +0200 (CEST)
Received: from albans-vm.. (unknown [213.61.141.186])
	(Authenticated sender: albeu@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 124FF2003C3;
	Wed, 22 Apr 2026 16:23:37 +0200 (CEST)
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-kernel@vger.kernel.org,
	Alban Bedel <alban.bedel@lht.dlh.de>
Subject: [PATCH] leds: class: Use firmware nodes for device lookup
Date: Wed, 22 Apr 2026 16:23:24 +0200
Message-Id: <20260422142324.1079185-1-alban.bedel@lht.dlh.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[lht.dlh.de : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7806-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FROM_NEQ_ENVFROM(0.00)[alban.bedel@lht.dlh.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8E387447528
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the OF based lookup with the fwnode equivalent to get support
for ACPI and software nodes.

Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
---
 drivers/leds/led-class.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 9e14ae588f780..d578cc0abb7c7 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -248,33 +248,25 @@ static const struct class leds_class = {
 	.pm = &leds_class_dev_pm_ops,
 };
 
-/**
- * of_led_get() - request a LED device via the LED framework
- * @np: device node to get the LED device from
- * @index: the index of the LED
- * @name: the name of the LED used to map it to its function, if present
- *
- * Returns the LED device parsed from the phandle specified in the "leds"
- * property of a device tree node or a negative error-code on failure.
- */
-static struct led_classdev *of_led_get(struct device_node *np, int index,
-				       const char *name)
+static struct led_classdev *fwnode_led_get(struct fwnode_handle *fwnode,
+					   int index, const char *name)
 {
+	struct fwnode_handle *led_node;
 	struct device *led_dev;
-	struct device_node *led_node;
 
 	/*
 	 * For named LEDs, first look up the name in the "led-names" property.
 	 * If it cannot be found, then of_parse_phandle() will propagate the error.
 	 */
 	if (name)
-		index = of_property_match_string(np, "led-names", name);
-	led_node = of_parse_phandle(np, "leds", index);
-	if (!led_node)
-		return ERR_PTR(-ENOENT);
+		index = fwnode_property_match_string(fwnode, "led-names",
+						     name);
+	led_node = fwnode_find_reference(fwnode, "leds", index);
+	if (IS_ERR(led_node))
+		return ERR_CAST(led_node);
 
-	led_dev = class_find_device_by_fwnode(&leds_class, of_fwnode_handle(led_node));
-	of_node_put(led_node);
+	led_dev = class_find_device_by_fwnode(&leds_class, led_node);
+	fwnode_handle_put(led_node);
 
 	return led_module_get(led_dev);
 }
@@ -332,7 +324,7 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
 	if (!dev)
 		return ERR_PTR(-EINVAL);
 
-	led = of_led_get(dev->of_node, index, NULL);
+	led = fwnode_led_get(dev_fwnode(dev), index, NULL);
 	if (IS_ERR(led))
 		return led;
 
@@ -354,7 +346,7 @@ struct led_classdev *led_get(struct device *dev, char *con_id)
 	const char *provider = NULL;
 	struct device *led_dev;
 
-	led_cdev = of_led_get(dev->of_node, -1, con_id);
+	led_cdev = fwnode_led_get(dev_fwnode(dev), -1, con_id);
 	if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
 		return led_cdev;
 
-- 
2.39.5


