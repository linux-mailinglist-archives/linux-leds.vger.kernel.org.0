Return-Path: <linux-leds+bounces-2562-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AACFB9687AE
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 14:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB23D1C218AD
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 12:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944B619E998;
	Mon,  2 Sep 2024 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVJ6KQU+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7074A19E991
	for <linux-leds@vger.kernel.org>; Mon,  2 Sep 2024 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725280874; cv=none; b=itOl89l8IUxQ0k0PFORAhELZWQ/2kLaeRmkfXCVUIH6a/3TBMsrY+Dyxgt3SZaLJcoRRgc8v8kns70s25bPufwEZAAgYutjnPuLc1LK7TCEK8OpXkRr0fNk0GExZw2vUUwZd1m7evtA9lz4y8N16Wh3avQalBEjEXo3sMMNuZVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725280874; c=relaxed/simple;
	bh=LGlbCKVOmIJwH0zlTYzZgAvT4zf+IZH9aosAqMtBae8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EG8K69hKxFc82u/TrnmJ0hTO7Kt1wBNJ2uKu6JyIpwlnd+cqDI3766JqUPOSojc70ES/eKCFrAtZJEfV3i/sUKU1O7IMw9/7ju5PY2UCrtkm3/GnaATctOkXMu52XEEU9WZFt1qnqnmLXRqf4FHnsCiCUxnb5a59gfR8zIyBdA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVJ6KQU+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B197C4CECB;
	Mon,  2 Sep 2024 12:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725280874;
	bh=LGlbCKVOmIJwH0zlTYzZgAvT4zf+IZH9aosAqMtBae8=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=OVJ6KQU+S9YVw5F8pqYvIKJZ0aBOK1pLY9kcH6CuyGDUXbd+zwKZZTepCMS550WsZ
	 uNUBgf0uQ/bTMM83Fa0VK0rO+g2zAFJ+DvgBoO8ACab5gh/C/ce7wdbS+ShruYu+I4
	 IbHDaSJAj3HwZxPpF988/0BhBtjdWRa5nTtZKahr4/dAOZmhHkBqaFrnXj7asUELD5
	 G9fDOA0n0LV6UpyxYOOPZRAIG4+yo+vWiwQ5p3swRdLAjTHIT83DEP/xc4ZUv96J1W
	 VF818x2dEh5DOR0G3RPFEFz/5nyEkVg7uxfcJVUlRQfRrVHE7TGI3IlN+ZT04AHL90
	 Qm8Ec6TAuEwNg==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds 1/8] turris-omnia-mcu-interface.h: Move command execution function to global header
Date: Mon,  2 Sep 2024 14:40:57 +0200
Message-ID: <20240902124104.14297-2-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240902124104.14297-1-kabel@kernel.org>
References: <20240902124104.14297-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the command execution functions from the turris-omnia-mcu platform
driver private header to the global turris-omnia-mcu-interface.h header,
so that they can be used by the LED driver.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../platform/cznic/turris-omnia-mcu-base.c    |   1 +
 drivers/platform/cznic/turris-omnia-mcu.h     | 130 -----------------
 include/linux/turris-omnia-mcu-interface.h    | 135 ++++++++++++++++++
 3 files changed, 136 insertions(+), 130 deletions(-)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index 58f9afae2867..bb871226e357 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -52,6 +52,7 @@ int omnia_cmd_write_read(const struct i2c_client *client,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(omnia_cmd_write_read);
 
 static int omnia_get_version_hash(struct omnia_mcu *mcu, bool bootloader,
 				  char version[static OMNIA_FW_VERSION_HEX_LEN])
diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform/cznic/turris-omnia-mcu.h
index fed0d357fea3..b36f9626e660 100644
--- a/drivers/platform/cznic/turris-omnia-mcu.h
+++ b/drivers/platform/cznic/turris-omnia-mcu.h
@@ -8,7 +8,6 @@
 #ifndef __TURRIS_OMNIA_MCU_H
 #define __TURRIS_OMNIA_MCU_H
 
-#include <linux/bitops.h>
 #include <linux/completion.h>
 #include <linux/gpio/driver.h>
 #include <linux/hw_random.h>
@@ -17,8 +16,6 @@
 #include <linux/types.h>
 #include <linux/watchdog.h>
 #include <linux/workqueue.h>
-#include <asm/byteorder.h>
-#include <asm/unaligned.h>
 
 struct i2c_client;
 struct rtc_device;
@@ -63,133 +60,6 @@ struct omnia_mcu {
 #endif
 };
 
-int omnia_cmd_write_read(const struct i2c_client *client,
-			 void *cmd, unsigned int cmd_len,
-			 void *reply, unsigned int reply_len);
-
-static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
-				  unsigned int len)
-{
-	return omnia_cmd_write_read(client, cmd, len, NULL, 0);
-}
-
-static inline int omnia_cmd_write_u8(const struct i2c_client *client, u8 cmd,
-				     u8 val)
-{
-	u8 buf[2] = { cmd, val };
-
-	return omnia_cmd_write(client, buf, sizeof(buf));
-}
-
-static inline int omnia_cmd_write_u16(const struct i2c_client *client, u8 cmd,
-				      u16 val)
-{
-	u8 buf[3];
-
-	buf[0] = cmd;
-	put_unaligned_le16(val, &buf[1]);
-
-	return omnia_cmd_write(client, buf, sizeof(buf));
-}
-
-static inline int omnia_cmd_write_u32(const struct i2c_client *client, u8 cmd,
-				      u32 val)
-{
-	u8 buf[5];
-
-	buf[0] = cmd;
-	put_unaligned_le32(val, &buf[1]);
-
-	return omnia_cmd_write(client, buf, sizeof(buf));
-}
-
-static inline int omnia_cmd_read(const struct i2c_client *client, u8 cmd,
-				 void *reply, unsigned int len)
-{
-	return omnia_cmd_write_read(client, &cmd, 1, reply, len);
-}
-
-static inline unsigned int
-omnia_compute_reply_length(unsigned long mask, bool interleaved,
-			   unsigned int offset)
-{
-	if (!mask)
-		return 0;
-
-	return ((__fls(mask) >> 3) << interleaved) + 1 + offset;
-}
-
-/* Returns 0 on success */
-static inline int omnia_cmd_read_bits(const struct i2c_client *client, u8 cmd,
-				      unsigned long bits, unsigned long *dst)
-{
-	__le32 reply;
-	int err;
-
-	if (!bits) {
-		*dst = 0;
-		return 0;
-	}
-
-	err = omnia_cmd_read(client, cmd, &reply,
-			     omnia_compute_reply_length(bits, false, 0));
-	if (err)
-		return err;
-
-	*dst = le32_to_cpu(reply) & bits;
-
-	return 0;
-}
-
-static inline int omnia_cmd_read_bit(const struct i2c_client *client, u8 cmd,
-				     unsigned long bit)
-{
-	unsigned long reply;
-	int err;
-
-	err = omnia_cmd_read_bits(client, cmd, bit, &reply);
-	if (err)
-		return err;
-
-	return !!reply;
-}
-
-static inline int omnia_cmd_read_u32(const struct i2c_client *client, u8 cmd,
-				     u32 *dst)
-{
-	__le32 reply;
-	int err;
-
-	err = omnia_cmd_read(client, cmd, &reply, sizeof(reply));
-	if (err)
-		return err;
-
-	*dst = le32_to_cpu(reply);
-
-	return 0;
-}
-
-static inline int omnia_cmd_read_u16(const struct i2c_client *client, u8 cmd,
-				     u16 *dst)
-{
-	__le16 reply;
-	int err;
-
-	err = omnia_cmd_read(client, cmd, &reply, sizeof(reply));
-	if (err)
-		return err;
-
-	*dst = le16_to_cpu(reply);
-
-	return 0;
-}
-
-static inline int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd,
-				    u8 *reply)
-{
-	return omnia_cmd_read(client, cmd, reply, sizeof(*reply));
-}
-
 #ifdef CONFIG_TURRIS_OMNIA_MCU_GPIO
 extern const u8 omnia_int_to_gpio_idx[32];
 extern const struct attribute_group omnia_mcu_gpio_group;
diff --git a/include/linux/turris-omnia-mcu-interface.h b/include/linux/turris-omnia-mcu-interface.h
index 2da8cbeb158a..eab67b81f310 100644
--- a/include/linux/turris-omnia-mcu-interface.h
+++ b/include/linux/turris-omnia-mcu-interface.h
@@ -9,7 +9,11 @@
 #define __TURRIS_OMNIA_MCU_INTERFACE_H
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/bits.h>
+#include <linux/types.h>
+#include <asm/byteorder.h>
+#include <asm/unaligned.h>
 
 enum omnia_commands_e {
 	OMNIA_CMD_GET_STATUS_WORD		= 0x01, /* slave sends status word back */
@@ -246,4 +250,135 @@ enum omnia_cmd_usb_ovc_prot_e {
 	OMNIA_CMD_xET_USB_OVC_PROT_ENABLE	= BIT(4),
 };
 
+/* Command execution functions */
+
+struct i2c_client;
+
+int omnia_cmd_write_read(const struct i2c_client *client,
+			 void *cmd, unsigned int cmd_len,
+			 void *reply, unsigned int reply_len);
+
+static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
+				  unsigned int len)
+{
+	return omnia_cmd_write_read(client, cmd, len, NULL, 0);
+}
+
+static inline int omnia_cmd_write_u8(const struct i2c_client *client, u8 cmd,
+				     u8 val)
+{
+	u8 buf[2] = { cmd, val };
+
+	return omnia_cmd_write(client, buf, sizeof(buf));
+}
+
+static inline int omnia_cmd_write_u16(const struct i2c_client *client, u8 cmd,
+				      u16 val)
+{
+	u8 buf[3];
+
+	buf[0] = cmd;
+	put_unaligned_le16(val, &buf[1]);
+
+	return omnia_cmd_write(client, buf, sizeof(buf));
+}
+
+static inline int omnia_cmd_write_u32(const struct i2c_client *client, u8 cmd,
+				      u32 val)
+{
+	u8 buf[5];
+
+	buf[0] = cmd;
+	put_unaligned_le32(val, &buf[1]);
+
+	return omnia_cmd_write(client, buf, sizeof(buf));
+}
+
+static inline int omnia_cmd_read(const struct i2c_client *client, u8 cmd,
+				 void *reply, unsigned int len)
+{
+	return omnia_cmd_write_read(client, &cmd, 1, reply, len);
+}
+
+static inline unsigned int
+omnia_compute_reply_length(unsigned long mask, bool interleaved,
+			   unsigned int offset)
+{
+	if (!mask)
+		return 0;
+
+	return ((__fls(mask) >> 3) << interleaved) + 1 + offset;
+}
+
+/* Returns 0 on success */
+static inline int omnia_cmd_read_bits(const struct i2c_client *client, u8 cmd,
+				      unsigned long bits, unsigned long *dst)
+{
+	__le32 reply;
+	int err;
+
+	if (!bits) {
+		*dst = 0;
+		return 0;
+	}
+
+	err = omnia_cmd_read(client, cmd, &reply,
+			     omnia_compute_reply_length(bits, false, 0));
+	if (err)
+		return err;
+
+	*dst = le32_to_cpu(reply) & bits;
+
+	return 0;
+}
+
+static inline int omnia_cmd_read_bit(const struct i2c_client *client, u8 cmd,
+				     unsigned long bit)
+{
+	unsigned long reply;
+	int err;
+
+	err = omnia_cmd_read_bits(client, cmd, bit, &reply);
+	if (err)
+		return err;
+
+	return !!reply;
+}
+
+static inline int omnia_cmd_read_u32(const struct i2c_client *client, u8 cmd,
+				     u32 *dst)
+{
+	__le32 reply;
+	int err;
+
+	err = omnia_cmd_read(client, cmd, &reply, sizeof(reply));
+	if (err)
+		return err;
+
+	*dst = le32_to_cpu(reply);
+
+	return 0;
+}
+
+static inline int omnia_cmd_read_u16(const struct i2c_client *client, u8 cmd,
+				     u16 *dst)
+{
+	__le16 reply;
+	int err;
+
+	err = omnia_cmd_read(client, cmd, &reply, sizeof(reply));
+	if (err)
+		return err;
+
+	*dst = le16_to_cpu(reply);
+
+	return 0;
+}
+
+static inline int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd,
+				    u8 *reply)
+{
+	return omnia_cmd_read(client, cmd, reply, sizeof(*reply));
+}
+
 #endif /* __TURRIS_OMNIA_MCU_INTERFACE_H */
-- 
2.44.2


