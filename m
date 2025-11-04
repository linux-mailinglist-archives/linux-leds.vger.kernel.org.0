Return-Path: <linux-leds+bounces-5986-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB726C318C6
	for <lists+linux-leds@lfdr.de>; Tue, 04 Nov 2025 15:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C11D1895FE0
	for <lists+linux-leds@lfdr.de>; Tue,  4 Nov 2025 14:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0AF7330310;
	Tue,  4 Nov 2025 14:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KOE2hsL5"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721D71F5834;
	Tue,  4 Nov 2025 14:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762266670; cv=none; b=I1U0lSNQK2KCkE7flPPFa4fcWsjDi6KyO7eGda5ci0KH1X8E6ps1FQF6hgD+FNZRnrZow6bvjSUyzrTvpPqp9MW1ckVfkawNs8E6g9kmKpXmcX1gcfruCowffI2C3VcgwdoQaDMTGpvFW5ge7HBPCU2EszKWkAhorQmJXdmd4mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762266670; c=relaxed/simple;
	bh=ygvVtpR0X7zyUAS2i7/ot2H6udVXFUOAiwzQzpah+74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PS+athx1EhNHwX4XdCBIphmCoV589eU3svacO8cVU0xwzh/5yTJ3D331ceylm0YLWX4QEF0TdNmCcFx8qU2LtKJszurBv3mBCjkN4/6z7m+yf0b714QGdt/jAkxVVyr5MgC0aw57QRRFBC/clydA4xS4ZhhQHKGfNUgPUdMtNhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KOE2hsL5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7CA7C2BC9E;
	Tue,  4 Nov 2025 14:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1762266670; bh=ygvVtpR0X7zyUAS2i7/ot2H6udVXFUOAiwzQzpah+74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KOE2hsL55CldfypIFm1DDzuvk7JpaNWUtqRYjBg1iZOgV1xxugzm67OD5WUzAEHaB
	 vM8+7fuwj9aFHq95nMxFiQBX3Vk7TQ2AfHGgoCslkmLgcNXPocZ1jiIVBbthEKF6rI
	 MVLwxxWtPkfNibS+di6/4vmaKqDBTAXrmBwj0UAo=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2B0CCFA11;
	Tue,  4 Nov 2025 14:31:09 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 04 Nov 2025 15:30:56 +0100
Subject: [PATCH v8 5/8] media: i2c: ov9282: add strobe output enable v4l2
 control
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-ov9282-flash-strobe-v8-5-b91dfef1c65a@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762266668; l=2317;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=ygvVtpR0X7zyUAS2i7/ot2H6udVXFUOAiwzQzpah+74=;
 b=2lKKro4Mp1MRIVyvv4qfQlagPCVxxBkaLHpR/bd2+ibsiSBtjjkHvxJbLlEX14UXgXx+aSqD5
 /ClvY3u/MGkD8k1hocX/oN9jUPRsqpVNzOsfxFq1zcXmKHOshqxnHJF
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add V4L2_CID_FLASH_STROBE_OE enable/disable support using the
"strobe output enable" feature of the sensor.

All values are based on the OV9281 datasheet v1.53 (january 2019) and
tested using an ov9281 VisionComponents module.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index e67cff6c30ffa..6afce803a049d 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -670,6 +670,23 @@ static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
 				current_val);
 }
 
+static int ov9282_set_ctrl_flash_strobe_oe(struct ov9282 *ov9282, bool enable)
+{
+	u32 current_val;
+	int ret;
+
+	ret = ov9282_read_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, &current_val);
+	if (ret)
+		return ret;
+
+	if (enable)
+		current_val |= OV9282_OUTPUT_ENABLE6_STROBE;
+	else
+		current_val &= ~OV9282_OUTPUT_ENABLE6_STROBE;
+
+	return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, current_val);
+}
+
 /**
  * ov9282_set_ctrl() - Set subdevice control
  * @ctrl: pointer to v4l2_ctrl structure
@@ -736,6 +753,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
 				       (ctrl->val + ov9282->cur_mode->width) >> 1);
 		break;
+	case V4L2_CID_FLASH_STROBE_OE:
+		ret = ov9282_set_ctrl_flash_strobe_oe(ov9282, ctrl->val);
+		break;
 	default:
 		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
 		ret = -EINVAL;
@@ -1325,7 +1345,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	u32 lpfr;
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
 	if (ret)
 		return ret;
 
@@ -1390,6 +1410,10 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 						OV9282_TIMING_HTS_MAX - mode->width,
 						1, hblank_min);
 
+	/* Flash/Strobe controls */
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
+			  V4L2_CID_FLASH_STROBE_OE, 0, 1, 1, 0);
+
 	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
 	if (!ret) {
 		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */

-- 
2.47.3



