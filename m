Return-Path: <linux-leds+bounces-3183-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2119B4B70
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 14:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A4241F2430F
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 13:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9E020694B;
	Tue, 29 Oct 2024 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2dPrr6B"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93537205132;
	Tue, 29 Oct 2024 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210197; cv=none; b=LdSE1qGXS6VLBWVxedCb3gSe7Bi3FN6dYm5ggEAH3fSgRovw2Ud6P/dnokUqqgaYHmFOBaDBC6MZJ88P26mFpDyecPRO/3XnU+9AcQHAVBmLQGIcEUrhKVJ+ZdUL/sYyKRTtGLoszvKIokGHompI5TactJmVo+8yu6gjZilqjgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210197; c=relaxed/simple;
	bh=eeBYr2p6za6laSDrNMtl6LIf0+fxsP9YIvYI/u+rMD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q6sdqxOevBDu60VLVQfoJyr1F80OFmcyxj2gTOozbMSv0T9MKSGxbcijQMHKRZe5JhDJ9p8UuNF4C+kfVKOdOIklr7jdsT07XkTEWV3+7vAdsn6O9IOD0Aluaemszu2zZbLednlW9p2onDSs6xvnePSTn7dfDYj8DqD4mGX/NUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2dPrr6B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A1DC4CEE3;
	Tue, 29 Oct 2024 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730210197;
	bh=eeBYr2p6za6laSDrNMtl6LIf0+fxsP9YIvYI/u+rMD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V2dPrr6Bd7IRwtx7KbkorcqeoUjbVYrce9hzZ1n6HB0zI4YsqU4itZeItfWRyErts
	 F1TFEJpOIUalukZwD+mODV0yGLeHNofxra60I0oWA6fTSrcbo/Yb3jc0iCWcffuKJ5
	 iU0dt8I2AsOP+vFBc4X/fsnV5TC8p4cczlRBVX/2svJRPILyo19HrijtQRfs72t8ki
	 84bfWqIhS9hwWKl2qYNTQQFFQrmuiwRe/SQQqZZdLWZFq9EnNX0RXm86TajzF26KTB
	 3pmUyyzN3KCP6vrPPbC4ZsZPn2DXWpkGbiE4O/gc2wjy0W4a/JrPZyJNKI5Xugyppc
	 bD4NDrALSQpSA==
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
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v4 01/12] turris-omnia-mcu-interface.h: Move command execution function to global header
Date: Tue, 29 Oct 2024 14:56:10 +0100
Message-ID: <20241029135621.12546-2-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241029135621.12546-1-kabel@kernel.org>
References: <20241029135621.12546-1-kabel@kernel.org>
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
 include/linux/turris-omnia-mcu-interface.h    | 136 +++++++++++++++++-
 3 files changed, 136 insertions(+), 131 deletions(-)

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
index 57ef5d350043..b36f9626e660 100644
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
-#include <linux/unaligned.h>
 
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
index 2da8cbeb158a..7f24cc682780 100644
--- a/include/linux/turris-omnia-mcu-interface.h
+++ b/include/linux/turris-omnia-mcu-interface.h
@@ -9,7 +9,10 @@
 #define __TURRIS_OMNIA_MCU_INTERFACE_H
 
 #include <linux/bitfield.h>
-#include <linux/bits.h>
+#include <linux/bitops.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+#include <asm/byteorder.h>
 
 enum omnia_commands_e {
 	OMNIA_CMD_GET_STATUS_WORD		= 0x01, /* slave sends status word back */
@@ -246,4 +249,135 @@ enum omnia_cmd_usb_ovc_prot_e {
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
2.45.2


