Return-Path: <linux-leds+bounces-5984-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 060CDC3186C
	for <lists+linux-leds@lfdr.de>; Tue, 04 Nov 2025 15:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A388034A422
	for <lists+linux-leds@lfdr.de>; Tue,  4 Nov 2025 14:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AF532F77C;
	Tue,  4 Nov 2025 14:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Bzf2drQI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7224922A4D8;
	Tue,  4 Nov 2025 14:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762266670; cv=none; b=sNuJ3s6w8Am/eoeoQ5eZnkWPmKcFsdMfJvsJ7Hh1L3vrfY28acFx1LYA0PFnSbd3lh1OD0LSx1Pkzq1BMlMVpQQ68kD0vdz181F+BUC458Oy7537A35f169SZWa0DuGrYNBLTiIcIHw26m7c99dDyGhHzIz0KUJiCDVHrQIOfZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762266670; c=relaxed/simple;
	bh=jlqi2q+tTuXwGck80ZW2V1ed+JWeA2LUWlef2Ygh8QE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=acCK3b9M96SQ53XYbKuVS+kwcSK4o+JLB9JKrpAqPnpRuiHUT2Zyvmt7/yP9Kw89z4Y5Inf9Gnb3vABvF3JuxoJIVuYo9Z+8HNbihW6J1s+VpgvQf2OpfBVVLEOLGngCPqLON8+dq51Aoc68x5aqdbVM4tZimiQaAMiVlDxO5GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Bzf2drQI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F01CC19424;
	Tue,  4 Nov 2025 14:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1762266670; bh=jlqi2q+tTuXwGck80ZW2V1ed+JWeA2LUWlef2Ygh8QE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bzf2drQIDk3wwCeaREzyG2gThAcqn7bp5vOKd0FyhmxbkXH+O3NWOiWtvWthTaZbo
	 NxHNdpYEMGxTAusX6oosPg1cWyimzPiG54Ll/kXHJ5xKaz41Hfrvv19GiqfozvM83L
	 S93BrMfIrdinReYAoIjEEDqBfYAOfAXKtOxKOMYk=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F04CCFA04;
	Tue,  4 Nov 2025 14:31:10 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 04 Nov 2025 15:30:58 +0100
Subject: [PATCH v8 7/8] media: i2c: ov9282: implement try_ctrl for
 strobe_duration
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251104-ov9282-flash-strobe-v8-7-b91dfef1c65a@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762266668; l=3578;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=jlqi2q+tTuXwGck80ZW2V1ed+JWeA2LUWlef2Ygh8QE=;
 b=GJOrayd8RROomQ2ExqSQeVFO9XHgz0Z8LVc4MaiKAQyC2iJgEjwv0N9GdBqfm+JHDjHG3qz7H
 853xb3YBY6FDdSr1vUQnBZ5IvpSr5ERmq7HlsBAu59qR7e7yaS3mtCj
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

As the granularity of the hardware supported values is lower than the
control value, implement a try_ctrl() function for
V4L2_CID_FLASH_DURATION. This function calculates the nearest possible
µs strobe duration for the given value and returns it back to the
caller.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 55 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 26296dc1d1b95..7aa74feb3ee44 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -128,6 +128,8 @@
 #define OV9282_REG_MIN		0x00
 #define OV9282_REG_MAX		0xfffff
 
+#define OV9282_STROBE_SPAN_FACTOR	192
+
 static const char * const ov9282_supply_names[] = {
 	"avdd",		/* Analog power */
 	"dovdd",	/* Digital I/O power */
@@ -691,9 +693,8 @@ static int ov9282_set_ctrl_flash_strobe_oe(struct ov9282 *ov9282, bool enable)
 	return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, current_val);
 }
 
-static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
+static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
 {
-	int ret;
 	/*
 	 * Calculate "strobe_frame_span" increments from a given value (µs).
 	 * This is quite tricky as "The step width of shift and span is
@@ -703,7 +704,28 @@ static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
 	 * The formula below is interpolated from different modes/framerates
 	 * and should work quite well for most settings.
 	 */
-	u32 val = value * 192 / (ov9282->cur_mode->width + ov9282->hblank_ctrl->val);
+	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
+
+	return value * OV9282_STROBE_SPAN_FACTOR / frame_width;
+}
+
+static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
+{
+	/*
+	 * As the calculation in ov9282_us_to_flash_duration uses an integer
+	 * divison calculate in ns here to get more precision. Then check if
+	 * we need to compensate that divison by incrementing the µs result.
+	 */
+	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
+	u64 ns = value * 1000 * frame_width / OV9282_STROBE_SPAN_FACTOR;
+
+	return DIV_ROUND_UP(ns, 1000);
+}
+
+static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
+{
+	int ret;
+	u32 val = ov9282_us_to_flash_duration(ov9282, value);
 
 	ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN, 1,
 			       (val >> 24) & 0xff);
@@ -798,9 +820,36 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 	return ret;
 }
 
+static int ov9282_try_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ov9282 *ov9282 =
+		container_of_const(ctrl->handler, struct ov9282, ctrl_handler);
+
+	if (ctrl->id == V4L2_CID_FLASH_DURATION) {
+		u32 us = ctrl->val;
+		u32 fd = ov9282_us_to_flash_duration(ov9282, us);
+
+		/* get nearest strobe_duration value */
+		u32 us0 = ov9282_flash_duration_to_us(ov9282, fd);
+		u32 us1 = ov9282_flash_duration_to_us(ov9282, fd + 1);
+
+		if (abs(us1 - us) < abs(us - us0))
+			ctrl->val = us1;
+		else
+			ctrl->val = us0;
+
+		if (us != ctrl->val)
+			dev_dbg(ov9282->dev, "using next valid strobe_duration %u instead of %u\n",
+				ctrl->val, us);
+	}
+
+	return 0;
+}
+
 /* V4l2 subdevice control ops*/
 static const struct v4l2_ctrl_ops ov9282_ctrl_ops = {
 	.s_ctrl = ov9282_set_ctrl,
+	.try_ctrl = ov9282_try_ctrl,
 };
 
 /**

-- 
2.47.3



