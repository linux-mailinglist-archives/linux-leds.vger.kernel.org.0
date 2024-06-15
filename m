Return-Path: <linux-leds+bounces-1930-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CBB909A57
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 01:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 527CC1C21001
	for <lists+linux-leds@lfdr.de>; Sat, 15 Jun 2024 23:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347A5502B9;
	Sat, 15 Jun 2024 23:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diNIff+G"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CD4B66C;
	Sat, 15 Jun 2024 23:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493173; cv=none; b=G5CHXmgrfQzl7yv2LmlMwo1aj2ydm4VfCqKlhbbtS8FmL7EQANbsib7LQJ3fov75Khunps09V7XED623NREL/2SPYRmWdN+wtCUu5moDICyhg0Myl2QuX0ZGf+5Sd6U9cR/ftTsc3cWYiG/4IFo09mUiuQ+aTW73/ftw779jHzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493173; c=relaxed/simple;
	bh=+0jRfh0al6xmBbc+sLbb94STb6aFBRP89mYFNujZ1cc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YWnSkwr6CW8eWXMcJoIvWGAXfhIvbl9cQRhizDfUA9zSHP0WCC2B/6YuFcwHtDR3R5nkRnChfjmJwFATAma5Ml0J9KmD7dw9EdibCXBAD0KDIApkZwzlJA/OjM15DHIAVTo8aombY3RjEcHrLOYho2swJqD6sbM507pC0hdHWi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diNIff+G; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-356c4e926a3so3199212f8f.1;
        Sat, 15 Jun 2024 16:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718493170; x=1719097970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lJPyPQZ+h8KdueQvjE+c+09iodSfIACQKSXss/4n9cs=;
        b=diNIff+Gh4qGHp61nFVeIs96/3YbTDSDBEWCBdDVQnPQok7GaqNX7S7UNDZ+wF/eoe
         pdtpFevFEQBjJcEDuOZ+r4GkYPN9eTKInooCbXt2XA50/zCtHqAMBXyIJLqYywbv00Tz
         qYmpLlJtFR5vyKKUoZYjWlYxJiUBKeJ3XQAIR6Au6VsxrpONitT2tWWpnDF0vgxuXyym
         EMM43j2ka+eusHd5NGxRNojYphbfm2psX0Wtzr9BpLPaAXtTPyus9IvRS0pCh8MfTUTa
         +P9RvPpf5SB13ZLhppK/MCaXZh15yuVfaA1qvN0F8+Bm6ANagwsRRasMHHxMdnisvcAT
         Zeow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718493170; x=1719097970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJPyPQZ+h8KdueQvjE+c+09iodSfIACQKSXss/4n9cs=;
        b=TTkl6Pe6cSNTrIPhxqX8GQE/dbcywltdgBCpXEr1mImTH2YiXpYG50nfuN7EifajQx
         dDw4+1eUm+Mq1rw/CPEZvc7aacF6nB+xoHjDyIBC6N/qCSj7UZi7xgjgUta/mvpol97r
         vlAFO0FP56YbLhp0p76AOYRf+KRBTJd6m22wMpt68iHg7uUbus0MaFJ/Md0MrmTqgUdL
         XOHpu1sPSEktk1D/S2M3iXEygC/5VW9bMw/x178L4zREbQiCeltI7FoPYHzM+7hHgG4C
         r2qbvvkIZHR++zoOV2xq7CyNmi5kO6l65ZwjZBLR9k1C169UQVKeCfq47x9ZwTwLNTa2
         evTw==
X-Forwarded-Encrypted: i=1; AJvYcCVFkv+LXiHpy+BwppwaDN7n4uLQfPtusIzXJ26Z7rdg+ywQsG2x4g7reYRbcSSAYuz+q1FX9hsPH5vKmKpPAPoEFK/t013Cl5eb3keXWTlmDbUcB/4UhmPYE6XBnP1HWKg/67Rype5caXz4H3rg/fuh9Q2fW+d1mwQju4R38MasKwCt2Nw=
X-Gm-Message-State: AOJu0YxCoz376ujHkzRrJoUG8kHx7R1Dzx1sw0J094QotBg9NEnz05hG
	N27/rJbZlRBnVHZ+7juM9uHNbM8Oi6BNgOIGj8M9BtFvxm9rKgF1
X-Google-Smtp-Source: AGHT+IH745QAS0j/8qPksK8QlS1/hgEnHiC2B2m1n1ZlSOGQGexx7tqFqU2eSTWN/GNgiYSiSdcHVQ==
X-Received: by 2002:adf:e70f:0:b0:35f:1e3b:3f37 with SMTP id ffacd0b85a97d-3607a75cadbmr3384310f8f.32.1718493169501;
        Sat, 15 Jun 2024 16:12:49 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3607509355dsm8145532f8f.13.2024.06.15.16.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 16:12:49 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v5 00/20] leds: leds-lp55xx: overhaul driver
Date: Sun, 16 Jun 2024 01:11:30 +0200
Message-ID: <20240615231152.28201-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This long series is (as requested) a big overhaul of the lp55xx based
LED driver.

As notice for these kind of LED chip there was the bad habit of copy
the old driver and just modify it enough to make it work with the new
model. Till v4 I was also doing the same by following the pattern and
the code format of previous driver.

Since Lee didn't like this, here is the BIG series that generalize
pretty much anything in the 4 model currently supported.

Indeed, although the LED chip have fundamental difference (page
support), things can be generalized and produce slimmer drivers by
putting everything in the lp55xx-common shared module.

This result in the new model lp5569 being very small with only the
selftest portion to be custom.

Lee also wasn't clear by the meaning of ENGINE in these LED driver,
so here some simple explaination. This is very common on these TI LED
chip. The ENGINE (there are always 3) is just some kind of processor
that execute a program (precompiled code ASM like) loaded in the SRAM.
Sysfs is used to load the pattern, and to start and stop the engine.

These pattern can do all kind of complex thing with LEDs. Old LED chip
had 32bytes of space for the pattern but newer one (like lp5569) have
pages and if correctly configured can have massive pattern.
These pattern can do all kind of magic like loops that make the LED
pulse, change color and all kind of stuff.

(For Lee, sorry if you will have to repeat some review that I might
 have missed in the lp5569 driver)

Changes v5:
- Big generalization patch
- Rework lp5569 driver with new generalized functions
- Drop all copyright header in lp5569 as the driver got reworked
  entirely and it's not based on previous one anymore.
Changes v4:
- Fix reported buffer overflow due to a copypaste error
- Add comments to describe fw size logic
Changes v3:
- Add ACK tag to DT patch
- Enlarge and support program size up to 128bytes
Changes v2:
- Add ACK tag to DT patch
- Fix compilation error with target that doesn't
  include bitfield.h

Christian Marangi (20):
  dt-bindings: leds-lp55xx: limit pwr-sel property to ti,lp8501
  dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
  leds: leds-lp55xx: generalize stop_all_engine OP
  leds: leds-lp55xx: generalize probe/remove functions
  leds: leds-lp55xx: generalize load_engine function
  leds: leds-lp55xx: generalize load_engine_and_select_page function
  leds: leds-lp55xx: generalize run_engine function
  leds: leds-lp55xx: generalize update_program_memory function
  leds: leds-lp55xx: generalize firmware_loaded function
  leds: leds-lp55xx: generalize led_brightness function
  leds: leds-lp55xx: generalize multicolor_brightness function
  leds: leds-lp55xx: generalize set_led_current function
  leds: leds-lp55xx: generalize turn_off_channels function
  leds: leds-lp55xx: generalize stop_engine function
  leds: leds-lp55xx: generalize sysfs engine_load and engine_mode
  leds: leds-lp55xx: generalize sysfs engine_leds
  leds: leds-lp55xx: generalize sysfs master_fader
  leds: leds-lp55xx: support ENGINE program up to 128 bytes
  leds: leds-lp55xx: drop deprecated defines
  leds: leds-lp5569: Add support for Texas Instruments LP5569

 .../devicetree/bindings/leds/leds-lp55xx.yaml |  11 +
 drivers/leds/Kconfig                          |  16 +-
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-lp5521.c                    | 405 +---------
 drivers/leds/leds-lp5523.c                    | 728 ++----------------
 drivers/leds/leds-lp5562.c                    | 261 +------
 drivers/leds/leds-lp5569.c                    | 542 +++++++++++++
 drivers/leds/leds-lp55xx-common.c             | 728 +++++++++++++++++-
 drivers/leds/leds-lp55xx-common.h             | 133 +++-
 drivers/leds/leds-lp8501.c                    | 313 +-------
 10 files changed, 1521 insertions(+), 1617 deletions(-)
 create mode 100644 drivers/leds/leds-lp5569.c

-- 
2.43.0


