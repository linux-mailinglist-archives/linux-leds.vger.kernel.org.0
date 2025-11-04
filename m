Return-Path: <linux-leds+bounces-5978-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F35C3189C
	for <lists+linux-leds@lfdr.de>; Tue, 04 Nov 2025 15:34:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 16E264F6FB6
	for <lists+linux-leds@lfdr.de>; Tue,  4 Nov 2025 14:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520EE1624C5;
	Tue,  4 Nov 2025 14:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Xdxaex0Y"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB1B223DCF;
	Tue,  4 Nov 2025 14:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762266670; cv=none; b=AuxYvcVhPh6b+BT1buWoYsxI5Ry4NSPbvuRualHR6/DAtb7E142rcaBs1LCwaoGkUC6q9b6PnGPvhxPwpX8C8CGsqa03sPKs4/av0uR1hkpn4ablr6dMaDDH5SDwuxbbx3ruXkBcI8ssVA/Ocilrz5TuMj3SHXenGJ1dCYi6sGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762266670; c=relaxed/simple;
	bh=UANwLOgcj9WwONW3K+0Sy55FYPHJ20LKps0TM9A7gAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lo5jc8QvOwIRXTlzRlJnap9GX11dmns2zOxmyAsL74MXN4OsnWIvoCCUWbdtUtZURi6e6yzn6POnpo8invpr7BMQC2+/hETwI0G4FY4r9DMPGhAGYhA5ssyqCMWb/5vzcgR7xczqk0dwgznw4NrQu+NVtHgoEJXffUYQaMM4+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Xdxaex0Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4C5CC4CEF7;
	Tue,  4 Nov 2025 14:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1762266669; bh=UANwLOgcj9WwONW3K+0Sy55FYPHJ20LKps0TM9A7gAM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Xdxaex0Y+uyeCbHG2DJpeH8p6/R29LRJeM0/5ur/G+2RcAgh7ZrQwE3jNaUKdN2Mq
	 hsthooNdaUwfFSCgqmdA9tcQHZDK6tZ8erMDE7ht4TimvC0bgfywCvfOIv4XRk+HRN
	 S9Un+vneKHnXCzQA73MDmrxVhJw8a17aVsiaRuoo=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43B3CCF9E3;
	Tue,  4 Nov 2025 14:31:09 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 04 Nov 2025 15:30:52 +0100
Subject: [PATCH v8 1/8] media: v4l: ctrls: add a control for flash/strobe
 duration
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-ov9282-flash-strobe-v8-1-b91dfef1c65a@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762266668; l=1820;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=UANwLOgcj9WwONW3K+0Sy55FYPHJ20LKps0TM9A7gAM=;
 b=RdU6KiIoLWrm9x31+vdY74YcAAIGkKWQ7InHoJrFG+E/ThxZYIojLc+6qdz16VJ4X2SjxcIaI
 IVO4oDL872GB9SnkzD1h4mFYzecp4mbHW6ae2MGZvWq7i9cYvfHepA1
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add a V4L2_CID_FLASH_DURATION control to set the duration of a
flash/strobe pulse. This controls the length of the flash/strobe pulse
output by device (typically a camera sensor) and connected to the flash
controller. This is different to the V4L2_CID_FLASH_TIMEOUT control,
which is implemented by the flash controller and defines a limit after
which the flash is "forcefully" turned off again.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 1 +
 include/uapi/linux/v4l2-controls.h        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index ad41f65374e23..4848423205ff7 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1135,6 +1135,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_FLASH_FAULT:		return "Faults";
 	case V4L2_CID_FLASH_CHARGE:		return "Charge";
 	case V4L2_CID_FLASH_READY:		return "Ready to Strobe";
+	case V4L2_CID_FLASH_DURATION:		return "Strobe Duration";
 
 	/* JPEG encoder controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 2d30107e047ee..9830833b48a52 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1186,6 +1186,7 @@ enum v4l2_flash_strobe_source {
 
 #define V4L2_CID_FLASH_CHARGE			(V4L2_CID_FLASH_CLASS_BASE + 11)
 #define V4L2_CID_FLASH_READY			(V4L2_CID_FLASH_CLASS_BASE + 12)
+#define V4L2_CID_FLASH_DURATION			(V4L2_CID_FLASH_CLASS_BASE + 13)
 
 
 /* JPEG-class control IDs */

-- 
2.47.3



