Return-Path: <linux-leds+bounces-5982-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BD7C318C3
	for <lists+linux-leds@lfdr.de>; Tue, 04 Nov 2025 15:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A1921893E44
	for <lists+linux-leds@lfdr.de>; Tue,  4 Nov 2025 14:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEB632F76B;
	Tue,  4 Nov 2025 14:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mcbaK7ej"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504BE32D442;
	Tue,  4 Nov 2025 14:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762266670; cv=none; b=DR/R2D9ZaOvmeEYjvTBwA/f1zhIh6+VL5er7QD6y8yHZRNFNFLNpOF43sAjzOyuQ8iYhYfTMHy2Q/36VQTJSm5Fm+LKtgLCdEevEA3/UTWxtSuTf/8ELiqz6Ll+fWYWN4plYKqzDKtwLKQ0iQAqnPUBKr1XaLCjcJlZp/YeoDfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762266670; c=relaxed/simple;
	bh=VmrcdnXikQqKSpyLnki4cBWvMBCS/8zd9ZSCDjF2qaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BQ+QkWrXdsHh45Iz32fb1i/oAAtgsA6sl7XF0jfcdBU5ClaR1jG/wz7gI8lTYyXRDFzvmb6Bjqj71YoOXjypwSvwTCEk6kJM2LwsyeRJs7wpIvKMvgAPcZ2tt2mHsnCFklW3+sffeGgpbVP18P/zx5DABkRoQdzuT5hOrjOgsgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mcbaK7ej; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAD0CC2BC87;
	Tue,  4 Nov 2025 14:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1762266669; bh=VmrcdnXikQqKSpyLnki4cBWvMBCS/8zd9ZSCDjF2qaM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mcbaK7ejdbeUzPBkDvKVGhvbbyQrbyDinefnX0ij6QIzTO5uckDTOjREEcwT6oWjx
	 AAnhmBkMLZE17SQelQsTQUvkFXzXNetBYuE5Ye9GnHzYHQDTL5lVeiU7MrX21MoA7V
	 O57DV7SNjsFD5tzqU69zH3arTEuqWSkotlEPiEb8=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D108ACCFA0D;
	Tue,  4 Nov 2025 14:31:09 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 04 Nov 2025 15:30:55 +0100
Subject: [PATCH v8 4/8] media: i2c: ov9282: add output enable register
 definitions
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-ov9282-flash-strobe-v8-4-b91dfef1c65a@linux.dev>
References: <20251104-ov9282-flash-strobe-v8-0-b91dfef1c65a@linux.dev>
In-Reply-To: <20251104-ov9282-flash-strobe-v8-0-b91dfef1c65a@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.15-dev-509f5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762266668; l=2137;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=VmrcdnXikQqKSpyLnki4cBWvMBCS/8zd9ZSCDjF2qaM=;
 b=0Edk+G1ZNubAbU5S/V5QEpYmPN98tHeCdjnxzV35IhB/I+LXDtdy7hBndMwbnN0IBdclnPuzq
 gFuzUQIFpw8Akktol50b89muDblFU/z+fyOKEM+6Lt6BZXjWw/7VoiC
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add #define's for the output enable registers (0x3004, 0x3005, 0x3006),
also known as SC_CTRL_04, SC_CTRL_05, SC_CTRL_04. Use those register
definitions instead of the raw values in the `common_regs` struct.

All values are based on the OV9281 datasheet v1.53 (january 2019).

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index a9f6176e9729d..e67cff6c30ffa 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -37,6 +37,29 @@
 #define OV9282_REG_ID		0x300a
 #define OV9282_ID		0x9281
 
+/* Output enable registers */
+#define OV9282_REG_OUTPUT_ENABLE4	0x3004
+#define OV9282_OUTPUT_ENABLE4_GPIO2	BIT(1)
+#define OV9282_OUTPUT_ENABLE4_D9	BIT(0)
+
+#define OV9282_REG_OUTPUT_ENABLE5	0x3005
+#define OV9282_OUTPUT_ENABLE5_D8	BIT(7)
+#define OV9282_OUTPUT_ENABLE5_D7	BIT(6)
+#define OV9282_OUTPUT_ENABLE5_D6	BIT(5)
+#define OV9282_OUTPUT_ENABLE5_D5	BIT(4)
+#define OV9282_OUTPUT_ENABLE5_D4	BIT(3)
+#define OV9282_OUTPUT_ENABLE5_D3	BIT(2)
+#define OV9282_OUTPUT_ENABLE5_D2	BIT(1)
+#define OV9282_OUTPUT_ENABLE5_D1	BIT(0)
+
+#define OV9282_REG_OUTPUT_ENABLE6	0x3006
+#define OV9282_OUTPUT_ENABLE6_D0	BIT(7)
+#define OV9282_OUTPUT_ENABLE6_PCLK	BIT(6)
+#define OV9282_OUTPUT_ENABLE6_HREF	BIT(5)
+#define OV9282_OUTPUT_ENABLE6_STROBE	BIT(3)
+#define OV9282_OUTPUT_ENABLE6_ILPWM	BIT(2)
+#define OV9282_OUTPUT_ENABLE6_VSYNC	BIT(1)
+
 /* Exposure control */
 #define OV9282_REG_EXPOSURE	0x3500
 #define OV9282_EXPOSURE_MIN	1
@@ -213,9 +236,9 @@ static const struct ov9282_reg common_regs[] = {
 	{0x0302, 0x32},
 	{0x030e, 0x02},
 	{0x3001, 0x00},
-	{0x3004, 0x00},
-	{0x3005, 0x00},
-	{0x3006, 0x04},
+	{OV9282_REG_OUTPUT_ENABLE4, 0x00},
+	{OV9282_REG_OUTPUT_ENABLE5, 0x00},
+	{OV9282_REG_OUTPUT_ENABLE6, OV9282_OUTPUT_ENABLE6_ILPWM},
 	{0x3011, 0x0a},
 	{0x3013, 0x18},
 	{0x301c, 0xf0},

-- 
2.47.3



