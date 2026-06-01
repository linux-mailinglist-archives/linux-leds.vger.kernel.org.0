Return-Path: <linux-leds+bounces-8405-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MRyLLelHWoqcwkAu9opvQ
	(envelope-from <linux-leds+bounces-8405-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:31:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 159A6621C01
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1781630AEA4B
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2026 15:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18BE3DCD9F;
	Mon,  1 Jun 2026 15:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOdIHSAB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953543DB639
	for <linux-leds@vger.kernel.org>; Mon,  1 Jun 2026 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327145; cv=none; b=OW+abtXbDjGA2PHSsn69VuI/xcxQiuvcVodTAtukdV3FOjXFYKkTzh0voGuXrlWGzglSk8v2sxAJVoToqBa9PvE7pGX9eFQ4qI0rEIxCHDZOwvBk7HzHZtQkf63TxFo7QVFEy2QBafiI/dljX7yw+F6PCiVeVr8GCU+kk0i3LO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327145; c=relaxed/simple;
	bh=PXFHvGio0optY61LEkjNkEzijVZnDLT+o2ExZZLbhKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fq1DEAgWxBODOvxOSbj2dWirKorLxWH6qz90s+3xTr8PRnQYjmbdaltsG4jg8VzzU4ZCr/cClaAxNo6owq71Kxr09S6HFlgemABYvV2MEegFgmQ3emWcEBmGYgR6H6ztQNIKR1GWCpdsBSkZjGBMCyZoG+hd2ZxceAHYpFJT6NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOdIHSAB; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso1306469f8f.0
        for <linux-leds@vger.kernel.org>; Mon, 01 Jun 2026 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327138; x=1780931938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qzN96GbcZUpB13Q9YtY/dmYRB6hgHD9CiDUD5v/xjEA=;
        b=HOdIHSABzfgWx6LFlNNUcprEOfEGGWvwEf4bQdcaQigLgiL4AE1dDrvfzsMI1ed0IB
         G29wE7pR7JSzZCLREquNbb3y1+aH8mZcNT8LO89DUCsAPONz644LJALPjjNZAipEtPwM
         p5q30ifdTIOrR7SBnleaEsxQeivIgezhMbvK7LDJTZONnwx8oHMICipOlpZb6KvX+GDb
         mHhWJ7aY1l5MfaetMcUxviJZSrxIE59a6numTNH18UaaOee5MDeDaYYq3B8H71xyc3gh
         nOITYDLRSi1hYlYQqHsikJ+Q2pk/CIeReTXpCOmehQO33F4XLcZ0ZrnhQ0La0lZfTnqp
         kL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327138; x=1780931938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzN96GbcZUpB13Q9YtY/dmYRB6hgHD9CiDUD5v/xjEA=;
        b=Zv0HKrt5YThDmXh1QxXkjsgoDGDMLeHocNGIKNWjb0hOEp+3qVNQBI15e/2rw32fcc
         7b2V21fu6i/BDfotkWS2xBcf470bNR9+7+qHncJy0+G8r8gfacP8ziLF3PhGA73/wZc2
         4lpG/VnoE1Zi064LRTnwYdLJE3F5BFEgbs2W2Hjuy9hUIKGAomzqj/Xk27kmN/Jw2UGW
         m+1H7Tf2+eptIspizKsFMIU20MjPlHEosvSP3d1++ATr3jCZyEMU9eiQbWXG/SD0HZT1
         01DAnMsZ4Cw2O42jee/JR4pDd1nX9ICwqpBE5EcKIIRfnNa90Lhsb2wRI3DRgRaCnN3c
         J4Ig==
X-Forwarded-Encrypted: i=1; AFNElJ+yME2iufdS2PmiWYT9V88gINqrUjJ0yRe6AQ3L7DIlh6753pEFMN6mqln4dpjrYa9S2lsOoib7PH2A@vger.kernel.org
X-Gm-Message-State: AOJu0YwkLHiZSvbYOlTYL/illpXQTWnbhjwY0UvHxu0F0Rpm0aue7Zdq
	Hi3Hh4FOSumYYWrSlbB3ZkpVSZOAPwQXX+hbPVtrLEhyvEjXSmZhgYy9
X-Gm-Gg: Acq92OFYWCvxfq9W0TNfbt/egniP2Jek8h6tpmusM4hQ2zTQ7KCT9Bu2/4b0AT6C4qf
	wKGrT7C88Lf+0CAoQzrnUtD6yOgstA4yJYn/FHEPFYzcLr1tZkHYWIQ6tRMRUgrkibhojrwtUAN
	E7pOWCibwT2Y6Y2yo2Gt0qAPhtjPIHS3maySwrqkJnNgpjqhWMutt7HCD5uUVRMEXYlfCq9K/QL
	TM3pykRQx60oU/DWwuhV9CW3x6ueCO37ELGj0M/UUaujSPYk6sVhrv47+X/n56u4qj4la9EUkne
	kD3QeUkC4pvsqFYdR/lV0HZ+mDnIysStPV8dVEp38mx1W8yctQM7XP79biBelKnEp1mLRFdDocS
	ftEBllYY0juIxhvYRnuOv0paNIiK26tNfseCkGDq722N22ZOaqWrN1O5b4Zl9KnsNaVNfmfBTc+
	Bk0n+0EiGzAc/MCeb6Jqs87LE=
X-Received: by 2002:a5d:59ca:0:b0:45e:f46d:fa95 with SMTP id ffacd0b85a97d-45ef6a8c8f7mr19705747f8f.0.1780327137736;
        Mon, 01 Jun 2026 08:18:57 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm25753103f8f.18.2026.06.01.08.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:18:57 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 00/11] mfd: lm3533: convert to OF bindings, improve support
Date: Mon,  1 Jun 2026 18:18:20 +0300
Message-ID: <20260601151831.76350-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8405-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 159A6621C01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert LM3533 to OF bindings, add missing VIN supply, add support for
setting mapping mode and LED sources based on device tree. 

---
Changes in v2:

schema
- maximum led sources for leds set to 4
- anyOf > oneOf in ALS
- improved ALS descriptions
- adjusted example
drivers
- dropped devm convertion of irq and mfd helpers
- all als configuration moved into lm3533_als_setup
- added regulator/consumer.h
- lm3533_bl_setup set before sysfs_create_group in backlight
- added check if LVLED is valid
- LM3533_REG_OUTPUT_CONF1 > LM3533_REG_OUTPUT_CONF2 for LVLED4 and LVLED5

Changes in v3:

- ohm -> ohms
- added default PWM mask to schema
- added commit removing driver regmap wrappers
- added commits which flatten pdata helpers
- adjusted check if als->irq > 0 since als->irq can be negative if error/missing
- added count for children defined in device tree and mfd_cell is allocated
  via devm_kcalloc to be able to contain all of them
- fixed backlight boundary check
- fixed count increased unconditionally
- dev_err returns node name instead of reg value
- LM3533_MAX_CURRENT_* defines moved to common header since they are used to clamp
  current values read from the tree
- mapping mode commit splitted into 2 (sysfs logic improvement > mode from DT)
- backlight mode configuration set before sysfs group is created
- fixed LVLED check on LEDs setup
- added check if HVLED is valid
- fixed wrong err_sysfs_remove goto in lm3533_bl
- added commit implementing backlight_scale property
---

Svyatoslav Ryhel (11):
  dt-bindings: leds: Document TI LM3533 LED controller
  mfd: lm3533: Remove driver specific regmap wrappers
  iio: light: lm3533-als: Remove redundant pdata helpers
  mfd: lm3533-core: Remove redundant pdata helpers
  mfd: lm3533: Convert to use OF bindings
  mfd: lm3533: Add support for VIN power supply
  mfd: lm3533: Set DMA mask
  video: backlight: lm3533_bl: Improve linear sysfs logic
  video: backlight: lm3533_bl: Set initial mapping mode from DT
  video: backlight: lm3533_bl: Implement backlight_scale property
  video: leds: backlight: lm3533: Support getting LED sources from DT

 .../leds/backlight/ti,lm3533-backlight.yaml   |  69 ++++
 .../bindings/leds/ti,lm3533-leds.yaml         |  67 ++++
 .../devicetree/bindings/leds/ti,lm3533.yaml   | 169 ++++++++
 drivers/iio/light/lm3533-als.c                | 159 ++++----
 drivers/leds/leds-lm3533.c                    | 142 +++++--
 drivers/mfd/lm3533-core.c                     | 361 +++++++-----------
 drivers/mfd/lm3533-ctrlbank.c                 |  27 +-
 drivers/video/backlight/lm3533_bl.c           | 153 ++++++--
 include/linux/mfd/lm3533.h                    |  62 +--
 9 files changed, 758 insertions(+), 451 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533.yaml

-- 
2.51.0


