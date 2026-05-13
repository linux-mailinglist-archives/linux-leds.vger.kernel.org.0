Return-Path: <linux-leds+bounces-8085-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJwGLdtoBGpDIQIAu9opvQ
	(envelope-from <linux-leds+bounces-8085-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 14:04:43 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C34E532BC4
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 14:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 907A630DF858
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 11:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4570338F94C;
	Wed, 13 May 2026 11:59:18 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DA0401A06;
	Wed, 13 May 2026 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673558; cv=none; b=DWHKUaV6LW04H1LgamX47xbGRvs5YBmV46B9epvU91UKde2R7gBkbIyLcVLDSMe2cHRqLXwPGgsXQz3AI8lwgodbzwo8X3dWOnMeI4mC9YFFfKcP5Zjw3TdHOcCYOHft58FG3agnNFhnRuaOwWfDN68Z8ycYhfyglq8RSi2qXn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673558; c=relaxed/simple;
	bh=b6KqNP1EKYRqCEQSusQTM/5yL0w2eiE3ArkGYryufb0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RO8qfoi3RKK6SGEagkUxdT4TuV6X8scKTE/MTPLuqRmTyTAQLo2W6D5X49xdBDUFsaubV0MjxxRi+Qf+QXsLYDBeM06jUGqtE6ZXVMkGfFbuMa60YLewpS1X5Aact5na65Iq1Y9RKe4ovP9X/3CIWki/CItYQxGhsUC6ws/poD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from albans-vm.. (unknown [88.128.94.33])
	(Authenticated sender: albeu@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0D0942003C1;
	Wed, 13 May 2026 13:58:59 +0200 (CEST)
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: linux-leds@vger.kernel.org
Cc: Pavel Machek <pavel@kernel.org>,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	Alban Bedel <alban.bedel@lht.dlh.de>
Subject: [PATCH v2] leds: class: Use firmware nodes for device lookup
Date: Wed, 13 May 2026 13:58:53 +0200
Message-Id: <20260513115853.1584230-1-alban.bedel@lht.dlh.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1C34E532BC4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[lht.dlh.de : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8085-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alban.bedel@lht.dlh.de,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,dlh.de:email]
X-Rspamd-Action: no action

Replace the OF based lookup with the fwnode equivalent to get support
for ACPI and software nodes.

Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
---
v2: * Keep the doc string
    * Update comment to reference the function now used
---
 drivers/leds/led-class.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 9e14ae588f78..a17db3d6644f 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -249,32 +249,34 @@ static const struct class leds_class = {
 };
 
 /**
- * of_led_get() - request a LED device via the LED framework
- * @np: device node to get the LED device from
+ * fwnode_led_get() - request a LED device via the LED framework
+ * @fwnode: firmware node to get the LED device from
  * @index: the index of the LED
  * @name: the name of the LED used to map it to its function, if present
  *
  * Returns the LED device parsed from the phandle specified in the "leds"
  * property of a device tree node or a negative error-code on failure.
  */
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
-	 * If it cannot be found, then of_parse_phandle() will propagate the error.
+	 * If it cannot be found, then fwnode_find_reference() will propagate
+	 * the error.
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
@@ -332,7 +334,7 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
 	if (!dev)
 		return ERR_PTR(-EINVAL);
 
-	led = of_led_get(dev->of_node, index, NULL);
+	led = fwnode_led_get(dev_fwnode(dev), index, NULL);
 	if (IS_ERR(led))
 		return led;
 
@@ -354,7 +356,7 @@ struct led_classdev *led_get(struct device *dev, char *con_id)
 	const char *provider = NULL;
 	struct device *led_dev;
 
-	led_cdev = of_led_get(dev->of_node, -1, con_id);
+	led_cdev = fwnode_led_get(dev_fwnode(dev), -1, con_id);
 	if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
 		return led_cdev;
 
-- 
2.39.5


