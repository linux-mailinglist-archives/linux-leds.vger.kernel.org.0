Return-Path: <linux-leds+bounces-5361-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CFAB3FD6A
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 13:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA0713B42DA
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 11:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41E02F83DB;
	Tue,  2 Sep 2025 11:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="Alr6+FDd";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="jbcK8FXp"
X-Original-To: linux-leds@vger.kernel.org
Received: from a7-20.smtp-out.eu-west-1.amazonses.com (a7-20.smtp-out.eu-west-1.amazonses.com [54.240.7.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8082765C5;
	Tue,  2 Sep 2025 11:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756811457; cv=none; b=tEa6jZ+UU03fOpP7UDY6w4YDvUraxVNi/SSYX6VcbLloNhy7vyfw5BZh4jP8jws6muflCE1Kt9hkG/QAfij4ScX3M8ldPP5ETTb1LBLND47oF3WErlWZskfUDtLVJAxt7/ejj9O9G/v7WRmoXqqfezv2AiFlg9U/Y2iWU9pSHw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756811457; c=relaxed/simple;
	bh=lArrC/hs56jwcuKi4kjb1YEQHhEtBnLClaL0na720tQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:Cc; b=ajAFu8D9VmX0M+wuKqh1jg+Gx23Aeyey6/LYK+lypn5gs+2pha2iaGrFpzeIbUg9/YK9mvg+5ByoiM18MXD/ZUc49FMQLt7hZsTgPs7Wv0jfEl9iIjfRQ5KF3eOuV4mOHAMf7OeDl8LiN3lxL52Vh8PjqiPz0VZKqtjC5q+wgMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=eu-west-1.amazonses.com; dkim=pass (1024-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=Alr6+FDd; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=jbcK8FXp; arc=none smtp.client-ip=54.240.7.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-west-1.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=vuvznkywrn6u4jb2ozie3fqz3nbg6pps; d=vinarskis.com; t=1756811453;
	h=From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc;
	bh=lArrC/hs56jwcuKi4kjb1YEQHhEtBnLClaL0na720tQ=;
	b=Alr6+FDdboPVMCVIZNU4DWzjBGMMForXEx8OtdLI6xNWC9AAZ81QKH//wWu8W5fA
	G4+3HSpE5lyjxfSimgFaEBpCiZflpfvKuSBqLP5nMHrFxPmOFRcp1511bN1R1mTGy57
	so+kAfnGADw4zIuYpnhfdMLRtP9bMygRAMvWtjvQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1756811453;
	h=From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:Feedback-ID;
	bh=lArrC/hs56jwcuKi4kjb1YEQHhEtBnLClaL0na720tQ=;
	b=jbcK8FXp0cUema687S1lAvNUZcTOGhf3r+k4HbQYq5AG4KO+T7BN2Im1zWIWAiLQ
	pyWOY+gPJLsw9EYLrdVJtQJ5jiq2WNJPV9ifyebTCy49eeqfm6Rlqqkq7HX2zdqQYS3
	NWkFOe+4vZwDn93/yRyl0dGnTz6H28bFNT6gGL7g=
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Tue, 2 Sep 2025 11:10:53 +0000
Subject: [PATCH 2/2] leds: led-class: Add devicetree support to led_get()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <010201990a1f6559-9e836a40-f534-4535-bd59-5e967d80559a-000000@eu-west-1.amazonses.com>
References: <20250902-leds-v1-0-4a31e125276b@vinarskis.com>
In-Reply-To: <20250902-leds-v1-0-4a31e125276b@vinarskis.com>
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Aleksandrs Vinarskis <alex@vinarskis.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3265; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=b8EKyX6+Ug2XxN1dZG3Mhkscrfw7FzBZa2E3JMSK27E=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBnbLmy57v5ucvDXDb80Q0V6W1tsihdbTIvVf7zx32tmr
 Zy9Gy9ndJSyMIhxMciKKbJ0//ma1rVo7lqG6xrfYOawMoEMYeDiFICJuG1mZLj6YseJQ8oHm8S+
 KT3zV/p5zerX7o13fcTu71z18eabfa9kGP6XvjMSe/B40vRNBkzS86QkP8rv2LXf/tRqJ4fXa0K
 7ZheyAQA=
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
Feedback-ID: ::1.eu-west-1.dmE2JeRFSagpgiG6D+fa+YE0PH7S+b7tab7/4kfDOU8=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.7.20

From: Hans de Goede <hansg@kernel.org>

Turn of_led_get() into a more generic __of_led_get() helper function,
which can lookup LEDs in devicetree by either name or index.

And use this new helper to add devicetree support to the generic
(non devicetree specific) [devm_]led_get() function.

This uses the standard devicetree pattern of adding a -names string array
to map names to the indexes for an array of resources.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Lee Jones <lee@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 drivers/leds/led-class.c | 38 +++++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 15633fbf3c166aa4f521774d245f6399a642bced..6f2ef4fa556b44ed3bf69dff556ae16fd2b7652b 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -248,19 +248,18 @@ static const struct class leds_class = {
 	.pm = &leds_class_dev_pm_ops,
 };
 
-/**
- * of_led_get() - request a LED device via the LED framework
- * @np: device node to get the LED device from
- * @index: the index of the LED
- *
- * Returns the LED device parsed from the phandle specified in the "leds"
- * property of a device tree node or a negative error-code on failure.
- */
-static struct led_classdev *of_led_get(struct device_node *np, int index)
+static struct led_classdev *__of_led_get(struct device_node *np, int index,
+					 const char *name)
 {
 	struct device *led_dev;
 	struct device_node *led_node;
 
+	/*
+	 * For named LEDs, first look up the name in the "led-names" property.
+	 * If it cannot be found, then of_parse_phandle() will propagate the error.
+	 */
+	if (name)
+		index = of_property_match_string(np, "led-names", name);
 	led_node = of_parse_phandle(np, "leds", index);
 	if (!led_node)
 		return ERR_PTR(-ENOENT);
@@ -271,6 +270,20 @@ static struct led_classdev *of_led_get(struct device_node *np, int index)
 	return led_module_get(led_dev);
 }
 
+/**
+ * of_led_get() - request a LED device via the LED framework
+ * @np: device node to get the LED device from
+ * @index: the index of the LED
+ *
+ * Returns the LED device parsed from the phandle specified in the "leds"
+ * property of a device tree node or a negative error-code on failure.
+ */
+struct led_classdev *of_led_get(struct device_node *np, int index)
+{
+	return __of_led_get(np, index, NULL);
+}
+EXPORT_SYMBOL_GPL(of_led_get);
+
 /**
  * led_put() - release a LED device
  * @led_cdev: LED device
@@ -342,9 +355,16 @@ EXPORT_SYMBOL_GPL(devm_of_led_get);
 struct led_classdev *led_get(struct device *dev, char *con_id)
 {
 	struct led_lookup_data *lookup;
+	struct led_classdev *led_cdev;
 	const char *provider = NULL;
 	struct device *led_dev;
 
+	if (dev->of_node) {
+		led_cdev = __of_led_get(dev->of_node, -1, con_id);
+		if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
+			return led_cdev;
+	}
+
 	mutex_lock(&leds_lookup_lock);
 	list_for_each_entry(lookup, &leds_lookup_list, list) {
 		if (!strcmp(lookup->dev_id, dev_name(dev)) &&

-- 
2.48.1


