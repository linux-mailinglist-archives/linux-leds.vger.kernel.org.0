Return-Path: <linux-leds+bounces-8188-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKBZFBvjCmo29AQAu9opvQ
	(envelope-from <linux-leds+bounces-8188-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 11:59:55 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1C956A32F
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 11:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5A4E63003364
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 09:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C433E7BD3;
	Mon, 18 May 2026 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnpOGEPK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973CC381AF0
	for <linux-leds@vger.kernel.org>; Mon, 18 May 2026 09:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779098386; cv=none; b=dRCjYecwkXWPW3A1D5eReT9fCWimAqojiV4FRUMssUSbxYRf0K4rI82IpxUACsb++BQYbfNXqySp5zFP32gdom6kgvCCqmgDX51PnCvNQxN+K/9ZVpmHCppTx/7rwzhAPagX0BARj/EbU0is6YM8jDqhQiAXS0KszQVdo+SEv18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779098386; c=relaxed/simple;
	bh=koUYT6oIlVScY5gU1jYmUWg4Yx2wOTmwaIkewSUV9Xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dhvzu+YCdTW24c0iW3TVYolLDYctkCRA/8wszAOylEF2+UyavS59nrVClFjfXe2cRM6YXKiDNNDIGJ2RXicG71Y7YHp6n4/oh9qBMFMUTFpWbS5XHmdh4XZT9hk3DWbN3dtz+P5atBr5S4AFJLqIVT6NdBZVjuaqf+pROooCdZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnpOGEPK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so14882675e9.2
        for <linux-leds@vger.kernel.org>; Mon, 18 May 2026 02:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779098378; x=1779703178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KxfiEeXfPA610rf7xZkCD098z5IwIx3WZRfJqYAw7I=;
        b=lnpOGEPK56jItIMBUvdurhM6p0zjyK5GuQa8hMSF4qhkz8RUmKKBno0BL1Vb0HTQpJ
         6mgeXS1b0f06LCRNJpL0pv7g15MKS8pedEnBa+4NraHQpKQ5DGHxR0vPsrhLs3lEGAGt
         KBHkgrN/OuaWcAn1p+6XKWFhcMt4rOYoJvEWW690NbENJheKmaKPyy4zxB0Wwdm57Vv3
         38AqMrk/cQVp8SR90L9Ko1vi7A573jDAxoDGoWmPpwP4zbtS7po8GirEM217JRj57VQh
         PhQYbBApY2km8EUzyZ8MK5ZpYWSJWJwO7Cvb5ldb4mxHBOiayjmDKTOnd5udIqIhyma6
         2+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779098378; x=1779703178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3KxfiEeXfPA610rf7xZkCD098z5IwIx3WZRfJqYAw7I=;
        b=jYX4/izn8LpGUcJFF9cyxX1OUUqs/pH029qK9Zs4e1wzW/L1RpSlh1+dEbYLtJQ176
         z9+m5YU24mWuZUkUOJf2GhMUfT+dn8IZiz9o84Maismd35OgnOJ6HIU5WHoDFrkPmPs1
         gvT3fOwx4WPvVjLhqe9yO8x+reC4HeDiWfyBatW0T5YVid6DHCRyy2QaCOVqESLR4hcO
         834k6SbfbnDL74Nw9YlxDd4h3AZQPo4jQnFUH537E2HcrLu/y6T35Y3MXK/0o27TMRCu
         yQ/OtpOcjTTvBFLLvxqmEerB+iI34zg+bdkNqbrnCgWP2Ohvu11R9XF3hCC9azkWxU06
         v9cQ==
X-Forwarded-Encrypted: i=1; AFNElJ+80Bv42BHIqVvCbnYKtEPSowcwgxUBe96bWV9ocnNDxTXL+KEmPFWv+r1RsVm/GKvBap2I8idvMAL8@vger.kernel.org
X-Gm-Message-State: AOJu0YxOMCiDPez2sqSSI0Yxz1SCZXV2FxgcW6dCGe7GC0oJaQS2oMu5
	GT398L0x5VW6N9nE07iI0pJIhd9gPIKs5M2RDxuTk1HHima05MVC7Xbv
X-Gm-Gg: Acq92OFXslfhtJVqUmAAV5hvGCzb0A+DR8ozyzMadpRvRh9RAlUT11hk62GC+M59Hm6
	eHifvuf2ugykvazvDcsJqd0RFHwMSX3gp8eAiUoQysjcnZz1MrLOHww7/lh9DtehH7YN1HuHqkx
	I4Swa1GFNmRxPbh573Wh+5IjWGG9rgWqbzCbo2SnYlV6kY+w65RJk2yXSmbDYf7DZcNxgZ9L/Hm
	6iKEAQ7njA7qSTMoLpFA99wJmlorEInbxZo9ue+8jBaYT7lqoIDVm2bC2P2jaMo78LwDiNMgllX
	0gzhRpULx0o9jcR0U6O+OziCy9hcRbsPEkBvEVf/0EeyUQm9PT3QT1JZHbKysO2JjopHifleiyq
	8Ykb0VelGZOijupJh2HZlUaXKu8PgGI3B62+r29pIfKwcUg+IIkUY84wFRpR550RJimLf+7IXt4
	X7smEhzRXmfwEk
X-Received: by 2002:a05:600c:a4f:b0:48f:e230:c3f9 with SMTP id 5b1f17b1804b1-48fe661df4dmr202769455e9.31.1779098378265;
        Mon, 18 May 2026 02:59:38 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm102995005e9.7.2026.05.18.02.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:59:37 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v7 3/7] input: serio: Add driver for ASUS Transformer dock keyboard and touchpad
Date: Mon, 18 May 2026 12:59:03 +0300
Message-ID: <20260518095907.36158-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260518095907.36158-1-clamor95@gmail.com>
References: <20260518095907.36158-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1F1C956A32F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8188-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qmqm.pl:email]
X-Rspamd-Action: no action

From: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Add input driver for ASUS Transformer dock keyboard and touchpad.

Some keys in ASUS Dock report keycodes that don't make sense according to
their position, this patch modifies the incoming data that is sent to
serio to send proper scancodes.

Co-developed-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/input/serio/Kconfig                   |  15 ++
 drivers/input/serio/Makefile                  |   1 +
 drivers/input/serio/asus-transformer-ec-kbc.c | 157 ++++++++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 drivers/input/serio/asus-transformer-ec-kbc.c

diff --git a/drivers/input/serio/Kconfig b/drivers/input/serio/Kconfig
index 5f15a6462056..fad29b950309 100644
--- a/drivers/input/serio/Kconfig
+++ b/drivers/input/serio/Kconfig
@@ -84,6 +84,21 @@ config SERIO_RPCKBD
 	  To compile this driver as a module, choose M here: the
 	  module will be called rpckbd.
 
+config SERIO_ASUS_TRANSFORMER_EC
+	tristate "Asus Transformer's Dock keyboard and touchpad controller"
+	depends on MFD_ASUS_TRANSFORMER_EC
+	help
+	  Say Y here if you want to use the keyboard and/or touchpad on
+	  Asus Transformed's Mobile Dock.
+
+	  For keyboard support you also need atkbd driver.
+
+	  For touchpad support you also need psmouse driver with Elantech
+	  touchpad option enabled.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called asus-transformer-ec-kbc.
+
 config SERIO_AMBAKMI
 	tristate "AMBA KMI keyboard controller"
 	depends on ARM_AMBA
diff --git a/drivers/input/serio/Makefile b/drivers/input/serio/Makefile
index 8ab98f4aa28d..fedc37ee102b 100644
--- a/drivers/input/serio/Makefile
+++ b/drivers/input/serio/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_SERIO_SERPORT)	+= serport.o
 obj-$(CONFIG_SERIO_RPCKBD)	+= rpckbd.o
 obj-$(CONFIG_SERIO_SA1111)	+= sa1111ps2.o
 obj-$(CONFIG_SERIO_AMBAKMI)	+= ambakmi.o
+obj-$(CONFIG_SERIO_ASUS_TRANSFORMER_EC)	+= asus-transformer-ec-kbc.o
 obj-$(CONFIG_SERIO_Q40KBD)	+= q40kbd.o
 obj-$(CONFIG_SERIO_GSCPS2)	+= gscps2.o
 obj-$(CONFIG_HP_SDC)		+= hp_sdc.o
diff --git a/drivers/input/serio/asus-transformer-ec-kbc.c b/drivers/input/serio/asus-transformer-ec-kbc.c
new file mode 100644
index 000000000000..c9707c7fbede
--- /dev/null
+++ b/drivers/input/serio/asus-transformer-ec-kbc.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/i8042.h>
+#include <linux/mfd/asus-transformer-ec.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/serio.h>
+
+struct asus_ec_kbc_data {
+	struct notifier_block nb;
+	struct asusec_core *ec;
+	struct i2c_client *parent;
+	struct serio *sdev[2];
+};
+
+static int asus_ec_kbc_notify(struct notifier_block *nb,
+			      unsigned long action, void *data_)
+{
+	struct asus_ec_kbc_data *priv = container_of(nb, struct asus_ec_kbc_data, nb);
+	unsigned int port_idx, n;
+	u8 *data = data_;
+
+	if (action & (ASUSEC_SMI_MASK | ASUSEC_SCI_MASK))
+		return NOTIFY_DONE;
+	else if (action & ASUSEC_AUX_MASK)
+		port_idx = 1;
+	else if (action & (ASUSEC_KBC_MASK | ASUSEC_KEY_MASK))
+		port_idx = 0;
+	else
+		return NOTIFY_DONE;
+
+	/*
+	 * The data[0] is the length of the packet including itself. It has to
+	 * be at least 2 bytes (length + 1 data byte) and must not exceed
+	 * the EC buffer size.
+	 */
+	if (data[0] < 2 || data[0] > DOCKRAM_ENTRY_BUFSIZE)
+		return NOTIFY_BAD;
+
+	n = data[0] - 1;
+	data += 2;
+
+	if (port_idx == 0) {
+		/*
+		 * Remap keyboard key codes to match AT layout:
+		 * SEARCH: RIGHT-META [E0 27] -> LEFT-ALT   [11]
+		 * MENU:   COMPOSE    [E0 2F] -> RIGHT-META [E0 27]
+		 */
+		if ((n == 2 || (n == 3 && data[1] == 0xF0)) && data[0] == 0xE0) {
+			u8 *keycode = &data[n - 1];
+
+			switch (*keycode) {
+			case 0x27:
+				*keycode = 0x11;
+				++data;
+				--n;
+				break;
+			case 0x2F:
+				*keycode = 0x27;
+				break;
+			}
+		}
+	}
+
+	while (n--)
+		serio_interrupt(priv->sdev[port_idx], *data++, 0);
+
+	return NOTIFY_OK;
+}
+
+static int asus_ec_serio_write(struct serio *port, unsigned char data)
+{
+	struct asus_ec_kbc_data *priv = port->port_data;
+
+	return i2c_smbus_write_word_data(priv->parent, ASUSEC_WRITE_BUF,
+					 (data << 8) | port->id.extra);
+}
+
+static void asus_ec_serio_remove(void *data)
+{
+	serio_unregister_port(data);
+}
+
+static int asus_ec_register_serio(struct platform_device *pdev, int idx,
+				  const char *name, int cmd)
+{
+	struct asus_ec_kbc_data *priv = platform_get_drvdata(pdev);
+	struct i2c_client *parent = priv->parent;
+	struct serio *port = kzalloc_obj(*port);
+
+	if (!port)
+		return -ENOMEM;
+
+	priv->sdev[idx] = port;
+	port->dev.parent = &pdev->dev;
+	port->id.type = SERIO_8042;
+	port->id.extra = cmd & 0xFF;
+	port->write = asus_ec_serio_write;
+	port->port_data = (void *)priv;
+	snprintf(port->name, sizeof(port->name), "%s %s",
+		 priv->ec->model, name);
+	snprintf(port->phys, sizeof(port->phys), "i2c-%u-%04x/serio%d",
+		 i2c_adapter_id(parent->adapter), parent->addr, idx);
+
+	serio_register_port(port);
+
+	return devm_add_action_or_reset(&pdev->dev, asus_ec_serio_remove, port);
+}
+
+static int asus_ec_kbc_probe(struct platform_device *pdev)
+{
+	struct asusec_core *ec = dev_get_drvdata(pdev->dev.parent);
+	struct asus_ec_kbc_data *priv;
+	int error;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->ec = ec;
+	priv->parent = to_i2c_client(pdev->dev.parent);
+
+	error = asus_ec_register_serio(pdev, 0, "Keyboard", 0);
+	if (error)
+		return error;
+
+	error = asus_ec_register_serio(pdev, 1, "Touchpad", I8042_CMD_AUX_SEND);
+	if (error)
+		return error;
+
+	priv->nb.notifier_call = asus_ec_kbc_notify;
+
+	return blocking_notifier_chain_register(&ec->notify_list, &priv->nb);
+}
+
+static void asus_ec_kbc_remove(struct platform_device *pdev)
+{
+	struct asus_ec_kbc_data *priv = platform_get_drvdata(pdev);
+	struct asusec_core *ec = priv->ec;
+
+	blocking_notifier_chain_unregister(&ec->notify_list, &priv->nb);
+}
+
+static struct platform_driver asus_ec_kbc_driver = {
+	.driver.name = "asus-transformer-ec-kbc",
+	.probe = asus_ec_kbc_probe,
+	.remove = asus_ec_kbc_remove,
+};
+module_platform_driver(asus_ec_kbc_driver);
+
+MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
+MODULE_DESCRIPTION("ASUS Transformer's Dock keyboard and touchpad controller driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0


