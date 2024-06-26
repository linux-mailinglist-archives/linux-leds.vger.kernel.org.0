Return-Path: <linux-leds+bounces-2127-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E41918672
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AA90281BBC
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7CF18E756;
	Wed, 26 Jun 2024 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJSTkKPz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228ED7173C;
	Wed, 26 Jun 2024 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417633; cv=none; b=glJBiNY/qMe32dBCYNV+kf+A+otHcR6A4Pm/iDdjFgyL6Ze9UrpUy4i+rCyuzyF8ggymbq4IQDEdUUPG5iGLghRd76X9S2kvRWsM48gPCGCqxZdwVuJzVgKOTKBD8ju4A+UAo9ZWgu5BdRI3qsXyrT073Wjhnh/v1gm8qQMJgh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417633; c=relaxed/simple;
	bh=zA3dF2PHL9qrsink+IGH+TJb0DiAWXMCVT6vadtTozQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HS+pZZ3JDVeFGlXUO5a+t/dqqKHCfrjO+2XI96UW0AVb75kh9XQquvMLESyYrozH1L/Nv2/QttiwsDIYhEuMPfYj9nDfhuvwVJUE0beBFnxGg0y/8HVgG19g2HI7aaEqRBXhVhTs687hHGctF6uV8siqyrp4oIysBb/dX6ww4vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJSTkKPz; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52cd8897c73so5848343e87.2;
        Wed, 26 Jun 2024 09:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417630; x=1720022430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UUr0hsnVdUZQR4NG5Z+hPzjpfEp6LQwKrE2P4nzghLA=;
        b=DJSTkKPz4gJTFXT9xiSOnjqXhnlPO6uunHgfqpyY/cQ16nnIclA8JnZF8jfwyy4y1Z
         TAPoOU06WLNes9UwZqQ5m8Vnir05I9V8NtUdrNLdBGMf9mioJ0xlOnUMngWZxJ6ItU4/
         4t/XvMCIw69l4QeHNAJtybvrN/Ca4afdFN/POUHiw/jGnOVOgQDwxp++l+bG0zqae+DX
         gnUOgKAmVto6jdQTl2HgTBv+wWSOKGCFV+Vbx68NbGVveVF0Nr4XBiWP9U9ztIZLvEU8
         M/pQmsKq4s1zZkDCkSWM/4KoUp/zdiceKDXYzPGHjQNizaSw/bThaNfOFs5wau1XDYMe
         eiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417630; x=1720022430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUr0hsnVdUZQR4NG5Z+hPzjpfEp6LQwKrE2P4nzghLA=;
        b=ry2M8PIY2aKQxrbf2v4qH2e5Xqsr4/uwhENXp4Lm2sJAvbKfHQL+P7mDhasuuNhkBD
         Sf5fbRgmeZbj9ZTMLID96qbkr3JwjUrmYNO4oTvbxmxOnkEYEU8ujidT15FFTSTMuXBp
         yUklIg27md4trUQfGq0f0jBctevZTNkSs47t62uC7d4oKwdPg4xhMO7F6+dRuoJe+ws5
         BBp8mTJAsxIArA2HpYR5BwkNeqcR/TfNUtT8H8RaLBP0t70P1MRAFUV6O34gFUaKKgvO
         CjYKY27Ca9nDl2VPyn/XINXeV5/8f68pFQG+5QOkUIV4gwWzJsSTLPYUrB5OpNPMOiVo
         kXiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNd2y8QpTDPLxgU+SwanStz921vssX0OebW07xFo5O2WesnD3CVCvT9b5IFUlHo2oqV+y/AW8ewCzuZBb7zqx0Y2vnVWCY1bCA/AJDnAUJgKsQ8Bl7cr588LOatJxN1AEJrgfQpIs2osQXFAL8ncXSj+iqlGLs8tDBEd6ggyjfJhzNh30=
X-Gm-Message-State: AOJu0Yyy0LgBYhLr2gMxKOkM7YD0s774yEbamQBnpjWmrREi5vdHcCZF
	TBM3uB2p3ahTNW5eEFk9+Wz4gpO/cqFAH92YYsrfT9TOuHW8rs8qSYKx+A==
X-Google-Smtp-Source: AGHT+IEp8zyPKXDbZH5bO5cTsGNX6/X+RDU76LaL6o1ZFshhd/DaIBpr7WaAgiK2tNRkAx8JCeEmoQ==
X-Received: by 2002:a05:6512:281:b0:52c:e10b:cb36 with SMTP id 2adb3069b0e04-52ce183add6mr6655985e87.33.1719417630099;
        Wed, 26 Jun 2024 09:00:30 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm16180589f8f.39.2024.06.26.09.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:00:29 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v8 00/20] leds: leds-lp55xx: overhaul driver
Date: Wed, 26 Jun 2024 18:00:05 +0200
Message-ID: <20240626160027.19703-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
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

Changes v8:
- Rebase on top of for-leds-next (assuming the 3 commit got dropped)
Changes v7:
- Add Suggested-by tag
- Fix checkpatch error for complex macro (rework define)
- Add missing values for fader conversion
- Align some function with redundant new line
- Capitalize every commit title
Changes v6:
- Fix compilation warning for ret unused in read_poll_timeout
  (no idea why this is flagged only on some particular arch...)
- Fix missing bitfield.h in lp55x-common.c (again it seems this
  header gets included in the flow if the arch use them or not...)
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
  dt-bindings: leds-lp55xx: Limit pwr-sel property to ti,lp8501
  dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
  leds: leds-lp55xx: Generalize stop_all_engine OP
  leds: leds-lp55xx: Generalize probe/remove functions
  leds: leds-lp55xx: Generalize load_engine function
  leds: leds-lp55xx: Generalize load_engine_and_select_page function
  leds: leds-lp55xx: Generalize run_engine function
  leds: leds-lp55xx: Generalize update_program_memory function
  leds: leds-lp55xx: Generalize firmware_loaded function
  leds: leds-lp55xx: Generalize led_brightness function
  leds: leds-lp55xx: Generalize multicolor_brightness function
  leds: leds-lp55xx: Generalize set_led_current function
  leds: leds-lp55xx: Generalize turn_off_channels function
  leds: leds-lp55xx: Generalize stop_engine function
  leds: leds-lp55xx: Generalize sysfs engine_load and engine_mode
  leds: leds-lp55xx: Generalize sysfs engine_leds
  leds: leds-lp55xx: Generalize sysfs master_fader
  leds: leds-lp55xx: Support ENGINE program up to 128 bytes
  leds: leds-lp55xx: Drop deprecated defines
  leds: leds-lp5569: Add support for Texas Instruments LP5569

 .../devicetree/bindings/leds/leds-lp55xx.yaml |  11 +
 drivers/leds/Kconfig                          |  16 +-
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-lp5521.c                    | 405 +---------
 drivers/leds/leds-lp5523.c                    | 734 ++---------------
 drivers/leds/leds-lp5562.c                    | 261 +-----
 drivers/leds/leds-lp5569.c                    | 544 +++++++++++++
 drivers/leds/leds-lp55xx-common.c             | 743 +++++++++++++++++-
 drivers/leds/leds-lp55xx-common.h             | 163 ++--
 drivers/leds/leds-lp8501.c                    | 313 +-------
 10 files changed, 1540 insertions(+), 1651 deletions(-)
 create mode 100644 drivers/leds/leds-lp5569.c

-- 
2.45.1


