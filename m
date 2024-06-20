Return-Path: <linux-leds+bounces-2076-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7B69114D9
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 23:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 840FF1F239BA
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 21:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C568248B;
	Thu, 20 Jun 2024 21:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVtejsEA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0377711C;
	Thu, 20 Jun 2024 21:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919697; cv=none; b=pOB8/Pd2A06X2KOAfOKPuTYtgRsppNNCUQNqUWKi3t20jEZ+KD0jmeVu4bs/eMIsPwL4yKKApvKc9rRf3/duY5ZXa2v54xCXX2oW/6AUUFqNq+0pTxw3Pmj0myZ1sbPWHUV+l27pmjAAM+85/1mjvJhlqywqjdG62dhtIkNnGpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919697; c=relaxed/simple;
	bh=vbAkHPyxQJKvrZOpd0V6g/xS2jek6xR7ZCrWT2d2z2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ErYGhsdfTO/Z/ZOD7O/+AX+sY+9EVAMVUAL/YgnJ4WCIo6LPOfP4CKowkkZ1uRWYNVJa+xHWZhXPvxSnan+tUGMymTaA41N6JtjUMEeplqKMA/onJJD+inX+B+0eGnV8ljYhYLnqC6y8wqoQVO87tJOR0a78rcyeJlsORlxrtCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVtejsEA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42172ed3597so8484725e9.0;
        Thu, 20 Jun 2024 14:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718919694; x=1719524494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7lsrrw77oxpiIkWcss0CP9IPfmUQTvp1O3LL2rk/XGQ=;
        b=YVtejsEAgOO2jWbso+yh/lWjMvgFSmXrFZG01qrgBt2OUCus72dvS9te/Kpe86eBU3
         hZrq0oWbdK20WN6D8pk0+D/1tPd4WunoJ3LTew9X5B/Ldc7XY12oJ0ChjZrUHNUjA3tO
         YZ3HmX7oRY/EnsG4NQS/O9MZHUWoV1RlFfDRy20ox1Nz1/pL19ub9U1N6xbhox8f4e6r
         5P10xF9SiHiM3DKzcIsZbbOTwnUZ9Owp3dDl5u4dkgYpd2Gpm4MqLDqo/hWU/G9dqyMq
         /rgbdRdHvT+RpNSOdjjKOLqUAcmFlOrjziElky/+nEv/Owo01IgOwCkGSpHFh/XtYUMx
         H9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919694; x=1719524494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lsrrw77oxpiIkWcss0CP9IPfmUQTvp1O3LL2rk/XGQ=;
        b=e/HWGZPx3ZOc05gYzWj/X483DVhl7slB0l5b1Md6e0lyIo0l94e8kUcnG2ngflyWy7
         hDKW6n4zESdtaJHq9thWXC45p5+axnv1gRNtO+sHl2pkXUeAdD2OWEoHV8qMxNtG2pzr
         1QiwhPSD/zyJX3fD0lcsw83IiQbAwpOjf3Tk3CTYDImFk9OQx7GFpCYLGGe6YAzs8EWk
         nCcwzwXqFmGWS420Km9S8Oiz52ENzPdkKbYjtSwH93AFN5F/FBELW+zYfR2Q4kgVoQtN
         l6GLmsVUJnHTMMFTMW8C2FP5oiQBy9i0m9Ly81PJKnXnlNTURfkyP+bhqKguwM9ZolFx
         y0pw==
X-Forwarded-Encrypted: i=1; AJvYcCUXOJUYi37eUu+GLdmNE+lrwLkKzZRI/TOut6X6xWbh2JegEU5nrmcbRtWz2gj5YvHEVrba4IU9XIdh/Ky5Z5FOsF5vmlvbAw5uO8hfpoLgn2zpukk0HXB7dfAZAQrRLqDLNtu9BRaUTasjjj4NJPbg9iAbinE0pexcH3E2VfJpZGTdBIY=
X-Gm-Message-State: AOJu0YwjBA0Isgw3YLImFvI09IVtyLZW2jtAM0zWzarebn/32J+8tPGr
	T3xMcW7SgZc60H7NEhsHqiztNIqRZwI5r/C9Eo7Dmk2TRnw7EEKRPDL8oQ==
X-Google-Smtp-Source: AGHT+IExNYfgD0NQCIlp8a2ElvIm67e6OhmMMfWX1lbDwM8oYXeHQJdCcakaUWHsRZXj7OXtwWlLLw==
X-Received: by 2002:a05:600c:3587:b0:421:661d:89d6 with SMTP id 5b1f17b1804b1-42474d34551mr68935215e9.14.1718919693565;
        Thu, 20 Jun 2024 14:41:33 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366383f68acsm48866f8f.2.2024.06.20.14.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:41:32 -0700 (PDT)
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
Subject: [PATCH v7 00/20] leds: leds-lp55xx: overhaul driver
Date: Thu, 20 Jun 2024 23:03:16 +0200
Message-ID: <20240620210401.22053-1-ansuelsmth@gmail.com>
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


