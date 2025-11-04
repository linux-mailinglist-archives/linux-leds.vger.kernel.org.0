Return-Path: <linux-leds+bounces-5980-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D71C318A5
	for <lists+linux-leds@lfdr.de>; Tue, 04 Nov 2025 15:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6FD0F4F7983
	for <lists+linux-leds@lfdr.de>; Tue,  4 Nov 2025 14:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFA0226D00;
	Tue,  4 Nov 2025 14:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DpTH4fdi"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBD426F29F;
	Tue,  4 Nov 2025 14:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762266670; cv=none; b=lWQEdCQ3588Sck9UZy/mNKIYdMSsu71umR2jX/p9FHOfL6M9rGtu9ulrU3R7fYZSe6/YhLL3QFSWfBlOjOpwfvSkILpwph0VWco9f7UOaNAuw7c+6fP66uB8RNy+J3UggqNihuqXUdwa/JtA4wua13I/hd0JI243ZNKBU5l+NgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762266670; c=relaxed/simple;
	bh=/kdKWEYgOEa0rB3Iuuglv71no7mf6j97Cig2+x9T+B4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=npJVxAzOUi8jcSd1sei+AtqtONd4eq1Nvd48VKZVRl5l3m8iyyZ6z1J5jM5KOp8AxAp0eaJD6ZrpCmfgUngsPakUVfeh/qXAJtopfl3SBazbZnpXdtzkyJ/fBjvs7394WM+7n9UtUcJ/5qeB48AS8tXk8eYu3Apd8Ct+Z7V1QRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DpTH4fdi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DC2CC116B1;
	Tue,  4 Nov 2025 14:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1762266669; bh=/kdKWEYgOEa0rB3Iuuglv71no7mf6j97Cig2+x9T+B4=;
	h=From:Subject:Date:To:Cc:From;
	b=DpTH4fdi3nv71Gk4FB5nzIcBwdsLFO9hKJHz7zWcuDxLc6+Zf5ZV7cWQATKZCVeP8
	 +JW95S07qdBChkBW5nLB6rQsRpkANJkqNiqqpyBuZ8C4yYvr2FuhN5xRQnnGedjU6P
	 OdqFjaKCUkz69swf+ai4+PIRnv1CYUKY6zYluD/g=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949A0CCFA06;
	Tue,  4 Nov 2025 14:31:09 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Subject: [PATCH v8 0/8] Add strobe duration and strobe output enable v4l2
 ctrl
Date: Tue, 04 Nov 2025 15:30:51 +0100
Message-Id: <20251104-ov9282-flash-strobe-v8-0-b91dfef1c65a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABsOCmkC/33Oy27CMBAF0F9BXtfIM37FrPofVReOH8USEGoHi
 wrx7zVhERSlXd7RnTNzIyXkFArZbW4kh5pKGk4tdG8b4vb29BVo8i0TZCgZZ5wO1WCHNB5s2dM
 y5qEP1DrVe8ac8UGRtnnOIabrpH58PnMO35eGj88h6W0J1A3HYxp3m6q20NHsBHmU96mMQ/6ZP
 qowtf89XoEyyqKX2oJUorfvh3S6XLc+1Mmr+GKAWDewGSC8ttgBF+iXBp8NgWbd4M1AYNIF0MZ
 IXBpiNiTT64ZohsYejXHQa2eWhpwNBX8YshlGK/RWC8+UXBpqNjSodUM9DC4ioA0xcr409GwYB
 uuGboaXnZdWGWGjezXu9/svxG3EbnsCAAA=
X-Change-ID: 20250303-ov9282-flash-strobe-ac6bd00c9de6
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.15-dev-509f5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762266668; l=4585;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=/kdKWEYgOEa0rB3Iuuglv71no7mf6j97Cig2+x9T+B4=;
 b=Y6K/eNkCRS3B2mkeyzDitGHJBnoHXPATLdECblo2ekE/fPDcwq15MClTrzq2IdD5k3N79dzGJ
 GgoppjMCqMLBrbvjxWtv9Y+0IQiWOtEj5pvOA8ncBkyqMSmvobVXJ7w
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

This series adds two new v4l2 controls:
- V4L2_CID_FLASH_DURATION: "Strobe duration": This control enables
  setting a desired flash/strobe length/duration in µs.
- V4L2_CID_FLASH_STROBE_OE: "Strobe output enable": This
  control enables the hardware strobe output signal of a v4l2 device.

As a first user of these new controls add basic flash/strobe support
for ov9282 sensors using their "hardware strobe output". The duration
calculation is only interpolated from various measurements, as no
documentation was found.

Further flash/strobe-related controls as well as a migration to v4l2-cci
helpers for ov9282 will likely be implemented in future series.

All register addresses/values are based on the OV9281 datasheet v1.53
(january 2019). This series was tested using an ov9281 VisionComponents
camera module.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
Changes in v8:
- Minor styling changes across the set
- Add missing error handling for ov9282 strobe_frame_span writing
- Rename V4L2_CID_FLASH_HW_STROBE_SIGNAL to V4L2_CID_FLASH_STROBE_OE
- Drop 02/10: FLASH_DURATION handling in v4l2-flash
- Drop 08/10: strobe_source in ov9282
- Link to v7: https://lore.kernel.org/r/20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev

Changes in v7:
- Improved v4l2 uAPI documentation (thanks Sakari)
- Link to v6: https://lore.kernel.org/r/20250716-ov9282-flash-strobe-v6-0-934f12aeff33@linux.dev

Changes in v6:
- Fix "Alignment should match open parenthesis" by Media-CI bot in v4l2-flash-led-class.c
- Fix "format string contains non-ascii character (µ)" by Media-CI bot in ov9282.c
- Introduce new V4L2_CID_FLASH_HW_STROBE_SIGNAL control (as suggested by Sakari)
- Implement V4L2_CID_FLASH_HW_STROBE_SIGNAL instead of
  V4L2_CID_FLASH_LED_MODE in ov9282.c (as suggested by Sakari)
- Drop "media: v4l2-flash: fix flash_timeout comment" as this was
  applied (thanks Lee)
- Link to v5: https://lore.kernel.org/r/20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev

Changes in v5:
- Improve try_ctrl for flash_duration by using DIV_ROUND_UP() and abs() (thanks Sakari)
- Drop "leds: flash: Add support for flash/strobe duration" as this was applied upstream
- Add "media: i2c: ov9282: dynamic flash_duration maximum" (thanks Sakari)
- Link to v4: https://lore.kernel.org/r/20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev

Changes in v4:
- Fix FLASH_DURATION implementation in v4l2-flash-led-class.c by adding a
  missing brace and enum entry (thanks Sakari)
- Fix format of multiline comment in ov9282.c (thanks Sakari)
- Add missing NULL check in ov9282.c (thanks Sakari)
- Adapt nr_of_controls_hint for v4l2 handler in ov9282.c (thanks Sakari)
- Add patch for implementing try_ctrl for strobe_duration (thanks Sakari)
- Link to v3: https://lore.kernel.org/r/20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev

Changes in v3:
- create separate patch for leds driver changes (thanks Lee)
- Link to v2: https://lore.kernel.org/r/20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev

Changes in v2:
- remove not needed controls in struct ov9282 (thanks Dave)
- Fix commit message of 3/3 regarding framerate get/set (thanks Dave)
- Add V4L2_CID_FLASH_STROBE_SOURCE impementation to ov9282
- Add new V4L2_CID_FLASH_DURATION control (as suggested by Laurent)
- Use FLASH_DURATION instead of FLASH_TIMEOUT for ov9282
- Link to v1: https://lore.kernel.org/r/20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev

---
Richard Leitner (8):
      media: v4l: ctrls: add a control for flash/strobe duration
      media: v4l: ctrls: add a control for enabling strobe output
      Documentation: uAPI: media: add V4L2_CID_FLASH_{DURATION,STROBE_OE}
      media: i2c: ov9282: add output enable register definitions
      media: i2c: ov9282: add strobe output enable v4l2 control
      media: i2c: ov9282: add strobe_duration v4l2 control
      media: i2c: ov9282: implement try_ctrl for strobe_duration
      media: i2c: ov9282: dynamic flash_duration maximum

 .../userspace-api/media/v4l/ext-ctrls-flash.rst    |  42 ++++++
 drivers/media/i2c/ov9282.c                         | 165 ++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |   3 +
 include/uapi/linux/v4l2-controls.h                 |   2 +
 4 files changed, 206 insertions(+), 6 deletions(-)
---
base-commit: 2f112b1c25da9f5346c2261ed35c5b1e0b906471
change-id: 20250303-ov9282-flash-strobe-ac6bd00c9de6

Best regards,
--  
Richard Leitner <richard.leitner@linux.dev>



