Return-Path: <linux-leds+bounces-8928-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qPuEBernR2qbhQAAu9opvQ
	(envelope-from <linux-leds+bounces-8928-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 18:48:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F86704688
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 18:48:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kemnade.info header.s=20220719 header.b=8MHUe8mI;
	dmarc=pass (policy=none) header.from=kemnade.info;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8928-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8928-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC0073010279
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 16:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131CC2475D0;
	Fri,  3 Jul 2026 16:46:46 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6792D220687;
	Fri,  3 Jul 2026 16:46:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783097206; cv=none; b=asK57T8tVB3mCj0MjvH2QkNhWlCrigUDQKgFeJlhy69XobcOOu9PIr/rSh/1oIgx2JZS+dKYlL0zzhuA0SSZyTDDHlzCIJlH2/B/iyKBwoR0rqlO/NizX8SyIAlzxjf1dKLOcjSnlYXP3iQWRHSmD3LxNEUrtiDrIX60mWak66o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783097206; c=relaxed/simple;
	bh=P7Jgz9bR3PqXxOoEs7Z4oOcuduhG0uOu6PRaaeUTmqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a1c/PaDkMRjjQZTwYbKwxtBeVk3n/xpTsrRrAjAtDZvEL1LlQctrWeye0J0hdL8jL8CX5PX9aae+xkynMFYJCp8XD4SoxE36uSZVGuDQ9GU0GDDvqSDK4C5kwx3qWjD+91x0I1d60RmYRBLryEhyAXmjNQsK6TaLpl3Bulkd+kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=8MHUe8mI; arc=none smtp.client-ip=178.238.236.174
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=VEjtVBzHbD8gmyJooTII5qsVjoKcL0rVu0zJQeJ57+0=; t=1783097204; x=1784306804; 
	b=8MHUe8mIPuHTXJHCSmsx/L3xVH6rqtYlwF4CDWXmyYtSc5n5DvSXz+G9rvzEVt4ceSHNwrcLtif
	7GexuCAPlfSPahX7NWAUSvNbEFVr/K3mUW/3ULwQ8waQom/8LRX+edP/HoMV5cEA/MkQ+urT8I8xA
	yVY/NO+0fOV60qNVumwnsYoHVDE3pZP91bdHtLEwIZFvLEb4AXyxou6/mdujajHf/GoDX4pa3rpKx
	PItaDD2X9k284pxDN1DtvFiYRYoY4Np8bKN4bwnAqTDs5oeEyoM3a2eDdhhEzs2o8yh91SCVizyFA
	irwxtvQO8NbjxBKg7DMOTgeYxAthH3L1WM7Q==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Fri, 03 Jul 2026 18:46:28 +0200
Subject: [PATCH v2] leds: is31fl319x: modernize registration
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-led-modern-v2-1-d07dd0d6ec6f@kemnade.info>
X-B4-Tracking: v=1; b=H4sIAGPnR2oC/22NQQ7CIBBFr9LMWgxg06or72G6wM5gRy0YqETTc
 HdL3bp8yfvvzxApMEU4VjMEShzZuwX0poJ+MO5KgnFh0FI3spVaPAjF6JGCE1jrllAqZfc7WAb
 PQJbfa+zc/Ti+Ljfqp1IoxsBx8uGzviVVvL/hpIQSpjZW08EYbOTpTqMzSFt21kOXc/4CMl4F8
 7kAAAA=
X-Change-ID: 20260702-led-modern-d427ed011f83
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, hns@goldelico.com, 
 linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4976; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=P7Jgz9bR3PqXxOoEs7Z4oOcuduhG0uOu6PRaaeUTmqA=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDFnuz3NP7ePnk9fb0Pbgs8oJrkxzvVSp5usuv2bcKn6kp
 zhZtPBuRykLgxgXg6yYIssvawW3TyrPcoOnRtjDzGFlAhnCwMUpABPxtmNkOKk9Z/NahpAZYi3m
 T6Z6ftXnuWN94yY/e+TyiJ1nuYNVZzH809Fqrrqddn+ZDqfhxcd8bB8igk+c8N977LejRKGb2bw
 qJgA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kemnade.info,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kemnade.info:s=20220719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:linux-leds@vger.kernel.org,m:hns@goldelico.com,m:linux-kernel@vger.kernel.org,m:andreas@kemnade.info,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[andreas@kemnade.info,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-8928-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@kemnade.info,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kemnade.info:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69F86704688

Use _ext version to have properties parsed to avoid needing to parse
them in the driver itself. More modern properties are recognized and
the leds can be referenced via phandle.
Due to the maximum current mechanics, leds are not registered right
in the first iteration over the nodes.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v2:
- put node free action after cdef is initialized (Sashiko)
- Link to v1: https://patch.msgid.link/20260702-led-modern-v1-1-a4af2e9aad60@kemnade.info

To: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/leds/leds-is31fl319x.c | 59 +++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index 80f38dba0fba..a912adf2c7d3 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -98,7 +98,7 @@ struct is31fl319x_chip {
 		struct is31fl319x_chip  *chip;
 		struct led_classdev     cdev;
 		u32                     max_microamp;
-		bool                    configured;
+		struct fwnode_handle *fwnode;
 	} leds[IS31FL319X_MAX_LEDS];
 };
 
@@ -363,31 +363,17 @@ static const struct of_device_id of_is31fl319x_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_is31fl319x_match);
 
-static int is31fl319x_parse_child_fw(const struct device *dev,
-				     const struct fwnode_handle *child,
-				     struct is31fl319x_led *led,
-				     struct is31fl319x_chip *is31)
+static void is31_free_fwnode(void *data)
 {
-	struct led_classdev *cdev = &led->cdev;
-	int ret;
-
-	if (fwnode_property_read_string(child, "label", &cdev->name))
-		cdev->name = fwnode_get_name(child);
+	struct is31fl319x_chip *is31 = data;
+	int i;
 
-	ret = fwnode_property_read_string(child, "linux,default-trigger", &cdev->default_trigger);
-	if (ret < 0 && ret != -EINVAL) /* is optional */
-		return ret;
+	for (i = 0; i < is31->cdef->num_leds; i++) {
+		if (is31->leds[i].fwnode)
+			fwnode_handle_put(is31->leds[i].fwnode);
 
-	led->max_microamp = is31->cdef->current_default;
-	ret = fwnode_property_read_u32(child, "led-max-microamp", &led->max_microamp);
-	if (!ret) {
-		if (led->max_microamp < is31->cdef->current_min)
-			return -EINVAL;	/* not supported */
-		led->max_microamp = min(led->max_microamp,
-					is31->cdef->current_max);
+		is31->leds[i].fwnode = NULL;
 	}
-
-	return 0;
 }
 
 static int is31fl319x_parse_fw(struct device *dev, struct is31fl319x_chip *is31)
@@ -403,6 +389,10 @@ static int is31fl319x_parse_fw(struct device *dev, struct is31fl319x_chip *is31)
 
 	is31->cdef = device_get_match_data(dev);
 
+	ret = devm_add_action_or_reset(dev, is31_free_fwnode, is31);
+	if (ret)
+		return ret;
+
 	count = 0;
 	device_for_each_child_node_scoped(dev, child)
 		count++;
@@ -427,14 +417,20 @@ static int is31fl319x_parse_fw(struct device *dev, struct is31fl319x_chip *is31)
 
 		led = &is31->leds[reg - 1];
 
-		if (led->configured)
+		if (led->fwnode)
 			return dev_err_probe(dev, -EINVAL, "led %u is already configured\n", reg);
 
-		ret = is31fl319x_parse_child_fw(dev, child, led, is31);
-		if (ret)
-			return dev_err_probe(dev, ret, "led %u DT parsing failed\n", reg);
+		led->max_microamp = is31->cdef->current_default;
+		ret = fwnode_property_read_u32(child, "led-max-microamp", &led->max_microamp);
+		if (!ret) {
+			if (led->max_microamp < is31->cdef->current_min)
+				return dev_err_probe(dev, -EINVAL, "invalid maximum corrunt\n");
+
+			led->max_microamp = min(led->max_microamp,
+						is31->cdef->current_max);
+		}
 
-		led->configured = true;
+		led->fwnode = fwnode_handle_get(child);
 	}
 
 	is31->audio_gain_db = 0;
@@ -531,7 +527,7 @@ static int is31fl319x_probe(struct i2c_client *client)
 	 */
 	aggregated_led_microamp = is31->cdef->current_max;
 	for (i = 0; i < is31->cdef->num_leds; i++)
-		if (is31->leds[i].configured &&
+		if (is31->leds[i].fwnode &&
 		    is31->leds[i].max_microamp < aggregated_led_microamp)
 			aggregated_led_microamp = is31->leds[i].max_microamp;
 
@@ -545,14 +541,17 @@ static int is31fl319x_probe(struct i2c_client *client)
 
 	for (i = 0; i < is31->cdef->num_leds; i++) {
 		struct is31fl319x_led *led = &is31->leds[i];
+		struct led_init_data init_data = {};
 
-		if (!led->configured)
+		if (!led->fwnode)
 			continue;
 
+		init_data.fwnode = led->fwnode;
+
 		led->chip = is31;
 		led->cdev.brightness_set_blocking = is31->cdef->brightness_set;
 
-		err = devm_led_classdev_register(&client->dev, &led->cdev);
+		err = devm_led_classdev_register_ext(&client->dev, &led->cdev, &init_data);
 		if (err < 0)
 			return err;
 	}

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260702-led-modern-d427ed011f83

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>


