Return-Path: <linux-leds+bounces-1960-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA52F90A00F
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 23:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29B4CB205CF
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 21:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3B46CDB1;
	Sun, 16 Jun 2024 21:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLLbKHus"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5DD2B2CF;
	Sun, 16 Jun 2024 21:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718574950; cv=none; b=TxasCi/b18h2ruqHhKU8j56E8JSLWxH/XVeeqciNeAIfDrmJ/EjeLHDkPObcw2jz0Aa6qyvfd6vteTRw/b7vUXLjXTDuVp+6peEiW8fVwBJnyp+ZWNMVk7kdxD2sddoZGvlovA3XMdjdcKxJHiL0sChhl7xho/zYnS+06DrL/pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718574950; c=relaxed/simple;
	bh=Qe2zDpaC0X9RuvbwJKxMNS8MaVjz29kmd6fEm+lqW1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LSBryJieV2sBe142BO7MPq77Ls/H40tLl6rQPOIBLYTYa9gnunRhXA23cYyhZ95izs9xG9yFZ89uNi0kU/sOYbcLAU2Qth/24ko0Xuraen13ykDTFKYO0Vm/uvZDSJXOAL4wtEfWVUf1dV9j/2C8owkln3329mA76p0oKRECNOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLLbKHus; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-36087277246so1117865f8f.3;
        Sun, 16 Jun 2024 14:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718574947; x=1719179747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=63S5qsObKr+Jg43OR+tj2RDQ4rfD755QMAJSfXPWTFY=;
        b=fLLbKHust68TT22IWZi5AIwS9GWuovduoavuBz021uqGMF1sczm2ecfFO5w432vP+J
         QlEyofFJ59DzA939IF9HdigXsk4WgCaLlslq82ccdH/v8/F3qx+pSwVg+zzdDf7dgymu
         OxQLcRHQ2EpPEbtFZeW0l3ZghLGaaKwv81OZPkVA3XgXgBGHkQ/OasKzRfMwwPQ9Spfj
         TKNelMrJFXyW4dZ8TFRGX3ucpwOzofIN56VPdnn/+gs/YpsM7OgTvcTG4HFPHUgTMy7+
         zpY3CURsT1BOd8f3J3KW900ifHMCZW5dXs5wfQrFJ+l6IQ6KX4UXhl9qMUTdh5f0xafO
         K8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718574947; x=1719179747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=63S5qsObKr+Jg43OR+tj2RDQ4rfD755QMAJSfXPWTFY=;
        b=BbywtOGFG5lSBbXsRG9ZKZ6q1h3ekHf9FilpLJo81D+Er8pqQkVOwMzgI6oC7Og5mc
         XZgmI+AbPo1rvRrHX/6fsVxDyZkQfiqhGfkGEwtZQ9LLT1Apu7klHduyLOTAVna+CAnT
         2+3i9a1T2EKVy4+NyxHJdvhWfoae9xQdCJd/olCEBR1wW3h622qx14FzPdjhNotmZ1aR
         TrfjWqk1uPC4dhZJ3G1ZbCBClUdaWRZMiV4Z8oIpOJpjOJpC3jGxi6Qo/83y59unjNlp
         Ag49Oie6XQs3pRQYh1z91vuiOE5gAAuIy1CnlUIBwENIhDzQGzDhagQf8/KcA4+cS6w+
         YdaA==
X-Forwarded-Encrypted: i=1; AJvYcCUaDDj3ZWNP1kTeR9Ng0NsUA0pCxbBxeJeJTZcEScTv1N3XhnAmFzAcqYoV2a+2pUBkidfVep0zUL2pAavKs/XmlKnR4DFT59mJhP4qxtpAOjADvBItsPrStFpUU0XtlxVeJqwXbg/RcPm4Wi3a4cxgUtZD5eTd4UKbzptuHn/FRRiEViQ=
X-Gm-Message-State: AOJu0YyVfPUXgDUWvVpyF6sKBITATKls6PqGNbwD6oD1LTz7gSQIrdn2
	H0X/rDdc369qnLpYVzduGfwn9tiUthDhS/Ss9o9U68y9gx4R20tL
X-Google-Smtp-Source: AGHT+IGXbzt+Lte8v35L3/zL4ZM3n7/WNGd2rHyQ+GXhFmThXFui07O+7RWtGUTYsKf594bDhLVAAg==
X-Received: by 2002:adf:f887:0:b0:35f:2683:6adf with SMTP id ffacd0b85a97d-3607a7e2037mr6234192f8f.44.1718574947176;
        Sun, 16 Jun 2024 14:55:47 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b74sm10362879f8f.107.2024.06.16.14.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 14:55:46 -0700 (PDT)
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
Subject: [PATCH v6 00/20] leds: leds-lp55xx: overhaul driver
Date: Sun, 16 Jun 2024 23:51:59 +0200
Message-ID: <20240616215226.2112-1-ansuelsmth@gmail.com>
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
 drivers/leds/leds-lp5523.c                    | 728 ++---------------
 drivers/leds/leds-lp5562.c                    | 261 +------
 drivers/leds/leds-lp5569.c                    | 542 +++++++++++++
 drivers/leds/leds-lp55xx-common.c             | 730 +++++++++++++++++-
 drivers/leds/leds-lp55xx-common.h             | 133 +++-
 drivers/leds/leds-lp8501.c                    | 313 +-------
 10 files changed, 1523 insertions(+), 1617 deletions(-)
 create mode 100644 drivers/leds/leds-lp5569.c

-- 
2.43.0


