Return-Path: <linux-leds+bounces-5981-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ECED9C318A8
	for <lists+linux-leds@lfdr.de>; Tue, 04 Nov 2025 15:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8F4274F7797
	for <lists+linux-leds@lfdr.de>; Tue,  4 Nov 2025 14:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885FA32F760;
	Tue,  4 Nov 2025 14:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SniPzikz"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503EE32D425;
	Tue,  4 Nov 2025 14:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762266670; cv=none; b=VsGs0QTZTTZs9nSSnwfKRZWndUaitCUPJEEjViWNbnTfvDvzGNA/UaHhnuoG8w/r1cHouRQziFKM49kHrQnuc7gFu1KS7k6336JPii35VY4KxZ5uGnFganeWQk5ajFKDP3SgpC2VElsHKfvnoQJbuErfnFk/bxrVsJQorMU2Uro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762266670; c=relaxed/simple;
	bh=yRfk/k98fKVjF+oHG+UiWlyx+HP+Q2RBdionlRvUcH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oRGgZzcgjpIDrHNcf7hczsS6H7ocyuxNXjAjf6haUDbxbI1BQBiH2EhpsQvTNhsCHRf/LF6J7E1+ElJlIh+WbfByaUiryLqTYGyBXTKMlROl9eJfigGpyqxspDDGWmRHH238jUCbb1e0bzEfy3sFe6vfc4FT0muq+5sFwAT73bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SniPzikz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE9E7C19422;
	Tue,  4 Nov 2025 14:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1762266669; bh=yRfk/k98fKVjF+oHG+UiWlyx+HP+Q2RBdionlRvUcH8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SniPzikzToANHY29mEWPVJ6f4XZ3SAbtXqChDp8XQmeYnCnc+KtLQGqq9SnpN4Ag9
	 pvy2uEyrkJbtz93W/hAGHvyOlDQHEn8zqtFg6+GdEcL8OrLq9JX7I3jGm2jRpmWwVb
	 vfN6UPsMTUdYV+ewGTolAvCrbkfmK9wfn7X18Arw=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D31CCFA0C;
	Tue,  4 Nov 2025 14:31:09 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 04 Nov 2025 15:30:54 +0100
Subject: [PATCH v8 3/8] Documentation: uAPI: media: add
 V4L2_CID_FLASH_{DURATION,STROBE_OE}
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251104-ov9282-flash-strobe-v8-3-b91dfef1c65a@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762266668; l=3445;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=yRfk/k98fKVjF+oHG+UiWlyx+HP+Q2RBdionlRvUcH8=;
 b=GJcS1zOTAfUQDNL8sTQ05a762z0wJSCOEo3EKCVw1+2AXMurRIkXsoHISjb6lRztmlRpo+gWL
 dQXNWXXwbJqADPLodjoheroalLedw/i35YenXbOKENZdwSSPJhjqKao
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add the new strobe duration and hardware strobe output enable to v4l
uAPI documentation. Additionally add labels for cross-referencing v4l
controls.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 .../userspace-api/media/v4l/ext-ctrls-flash.rst    | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
index d22c5efb806a1..7cf0d33e79ff0 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
@@ -57,6 +57,8 @@ Flash Control IDs
 ``V4L2_CID_FLASH_CLASS (class)``
     The FLASH class descriptor.
 
+.. _v4l2-cid-flash-led-mode:
+
 ``V4L2_CID_FLASH_LED_MODE (menu)``
     Defines the mode of the flash LED, the high-power white LED attached
     to the flash controller. Setting this control may not be possible in
@@ -80,6 +82,8 @@ Flash Control IDs
 
 
 
+.. _v4l2-cid-flash-strobe-source:
+
 ``V4L2_CID_FLASH_STROBE_SOURCE (menu)``
     Defines the source of the flash LED strobe.
 
@@ -96,6 +100,12 @@ Flash Control IDs
       - The flash strobe is triggered by an external source. Typically
 	this is a sensor, which makes it possible to synchronise the
 	flash strobe start to exposure start.
+        This method of controlling flash LED strobe has two additional
+        prerequisites: the strobe source's :ref:`strobe output
+        <v4l2-cid-flash-strobe-oe>` must be enabled (if available)
+        and the flash controller's :ref:`flash LED mode
+        <v4l2-cid-flash-led-mode>` must be set to
+        ``V4L2_FLASH_LED_MODE_FLASH``.
 
 
 
@@ -186,3 +196,35 @@ Flash Control IDs
     charged before strobing. LED flashes often require a cooldown period
     after strobe during which another strobe will not be possible. This
     is a read-only control.
+
+.. _v4l2-cid-flash-duration:
+
+``V4L2_CID_FLASH_DURATION (integer)``
+    Duration of the flash strobe pulse generated by the strobe source, when
+    using external strobe. This control shall be implemented by the device
+    generating the hardware flash strobe signal, typically a camera sensor,
+    connected to a flash controller.
+
+    The flash controllers :ref:`strobe source <v4l2-cid-flash-strobe-source>`
+    must be configured to ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL`` for this
+    mode of operation. For more details please also take a look at the
+    documentation there.
+
+    The unit should be microseconds (µs) if possible.
+
+.. _v4l2-cid-flash-strobe-oe:
+
+``V4L2_CID_FLASH_STROBE_OE (boolean)``
+    Enables the output of a hardware strobe signal from the strobe source,
+    when using external strobe. This control shall be implemented by the device
+    generating the hardware flash strobe signal, typically a camera sensor,
+    connected to a flash controller.
+
+    Provided the signal generating device driver supports it, the length of the
+    strobe signal can be configured by adjusting its
+    :ref:`flash duration <v4l2-cid-flash-duration>`.
+
+    The flash controllers :ref:`strobe source <v4l2-cid-flash-strobe-source>`
+    must be configured to ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL`` for this
+    mode of operation. For more details please also take a look at the
+    documentation there.

-- 
2.47.3



