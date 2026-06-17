Return-Path: <linux-leds+bounces-8620-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jBPpLDtUMmqxygUAu9opvQ
	(envelope-from <linux-leds+bounces-8620-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:00:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C365697572
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:00:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lIfxnH7i;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8620-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8620-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F5B3302516E
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 08:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13433CC32D;
	Wed, 17 Jun 2026 08:00:47 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DCA3CC7C5
	for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 08:00:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683247; cv=none; b=ZPs13kx4FVBcDEjUtM06ITh62qBavphM8+D7PEoJGhgRkySjwwwzN5u3MCDSTzzoFye1LsCTB8I5BMdw4LOhPU6DcnYtJpjKF7mHIpXk+MKkEcwOb1tN2GiJsH0yl/eO4PA0GXpkL+hS/i5K9Mra91ik102bFrRYYenCT0pIQDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683247; c=relaxed/simple;
	bh=R4AtVbQ6oyC+Ag1oLv+Kj+iSS/rVvY9CmVauAm7kD2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K/DYhoDMjwSi1liQCGv9gt7t0l116B3Z2dDFAwS1eH3Ea6rWUn8pHVgogKQGM10x9rHyMZ6SaBSUH3s7TfI1W5DjLwQdhsjtWznaq74a8s2Wt9oFLcy8fY/g07eEmvU+6ThJ36okNQ2gpQZhRCRWy4mHFEbVm9h1xSejZY/imAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIfxnH7i; arc=none smtp.client-ip=209.85.218.48
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c069d7646b2so8133766b.2
        for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 01:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781683242; x=1782288042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kcUO9XWzTg2IsD2mVUzEQjeXErkVrXuEkYwVMwsj2Z0=;
        b=lIfxnH7iD18zPNxrG8f0e7cOOCn+nSdxcjxtXJYLConi3l752C1QaiAUFdclvH8bnO
         oGzUD3Q6u+5Wqoz1BNc2sq+NSUvtby5TT7bppAxqGYiHVDFaBw5q1ysaWdfYz05NOYEX
         oxo1uo+SjJ9ZORLOVa4POqDIyU+MZ9A8KA86mLR6grGyB96QW7ZdItO4ylKBZl4efvwj
         n17hgw/NTfDUYJ9/CT2HhrfCh3dLv8Q0uPqS6EEePSagyQubcQyQNJ0fPRDYpAIObbv8
         Gg6pMu1hGhuKl9OUDXYhFYnS9N1rHtvGMnQwRIIjqw9zGLi/JbLMJY+pfENZcp3HHFGV
         IJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683242; x=1782288042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcUO9XWzTg2IsD2mVUzEQjeXErkVrXuEkYwVMwsj2Z0=;
        b=Ww37Mv1fDlDZCZfngmlrc7QqZFX+n8IKhEyLvP3hAjpFD2Ac2LYAjOieYVAPnzQVBI
         7t9qqkc3/lhkHF43nbJoUnN5+0KduwCURmXMR1W66U55lMZaE+u+H99B7iFUMYj/39W/
         JyLWeCV1EPHlHfBt9rTqLpnQhuXIWl8HE7IUG+KK+1VWmydeIm3d93oxc4W+8GXKzx3K
         ej+EF+kUdsz9aKhje0Y0uXRIYszWBtHLzaBKXzzcs2ydKPBrqXijRmTKoksSoXZYZ8Y7
         wocEwIeI/5AzdFFFpHS4WHvFYIxBP+mVdMIp+nCqpMuokmdb1U+CuiNw2xkhQyu/XsoL
         x+aQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AqqNSM8PHXLi1nj/iyS9s4fr1P7xTA7qKUzSud54bnYScOTmGymJw88uqOgmEk8X05L3wuJltpNTB@vger.kernel.org
X-Gm-Message-State: AOJu0YwrTPB8pu45iTxFz3x2qlQypv3dL/WgQCaKvqx+vDTJxt/5Ro46
	en28qewZ2XqY6iW+dIOP5qbJPjJmlfNjZEeZVngxDCClzB5cdUcr+hq4
X-Gm-Gg: Acq92OHDsk9NCwdMDXyiwXxSQdUv0anCzRTKXnWfc9GKydvL8vc4KwjwFP1HvNniivo
	eS5fldRpSW52Hw9k91ZNoGkqFu0YzLbT1LBTkc52/IzWjdH/bfhOY2QCJYegAuC4cxxNjEHE8lY
	ZnwJ/tVPcE0Q0CIXttvc2F9p4aJbd5LwVAdhhT2tIGJTv5PMBHcCi1rEHTKoFt9Wkk8sv3DU/9S
	XRi6hbl7sQ6gBOR+QkxSLw0SAlR6jdxk9gKJJfSnYxcibQQnEGbaf8++/cfGnUa4Ruo+/ohcJ5g
	zMxji/PfK8b/wQtC7cPQOyKnfVZqlGQY5Lsgw5U5iNnucUrmoE9rHYgVMVbnhN9NYSy1vpsUOY+
	KefNcgWGbY9AJv+0o3SP70i3DkblojxO4hlqIxkKUae3AtaG39qcsh9BtcvAkqhtaAwPEiTU1j/
	URuw==
X-Received: by 2002:a17:907:6090:b0:bed:e2e8:d8c3 with SMTP id a640c23a62f3a-c05a2e40c2dmr185800566b.22.1781683241134;
        Wed, 17 Jun 2026 01:00:41 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb058fa59sm755339766b.0.2026.06.17.01.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:00:40 -0700 (PDT)
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
Subject: [PATCH v5 00/14] mfd: lm3533: convert to OF bindings, improve support
Date: Wed, 17 Jun 2026 11:00:17 +0300
Message-ID: <20260617080031.99156-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8620-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:clamor95@gmail.com,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C365697572

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

Changes in v4:

- fixed regmap_update_bits val and mask swap in lm3533_als_set_int_mode
- fixed als->irq check in store_thresh_either_en
- removed clamping of r_select in als driver
- added use_of_reg and of_reg for backlight and leds registration
- added intermediate step in asigning props.brightness
- fixed HVLED/LVLED configuration overwriting
- added bounds check for num_leds in leds and backlight driver
- switched to regmap_clean/set/assign/test_bits helpers where appropriate
- dropped extern from header function declartions
- switched lm3533 pointer in cell structures to regmap
- sysfs_create_group > device_add_group
- changes in backlight sysfs were expanded to all properties

Changes in v5:

- aligned driver helpers to use u32
- child nodes parsing linked with 'else if' to ensure there is one call per node
- removed redundant pwm var init for leds
- fixed regmap_test_bits return check
- fixed leds and backlight counting handling
- iterator variables made scoped
- lm3533_als_setup() set to exit after mode set if m0de is pwm
---

Svyatoslav Ryhel (14):
  dt-bindings: leds: Document TI LM3533 LED controller
  mfd: lm3533: Remove driver specific regmap wrappers
  mfd: lm3533: Remove extern from shared functions in the header
  mfd: lm3533: Pass only regmap and light sensor presence to child
    devices
  iio: light: lm3533-als: Remove redundant pdata helpers
  mfd: lm3533-core: Remove redundant pdata helpers
  mfd: lm3533: Use dev_groups in struct device_driver
  mfd: lm3533: Convert to use OF bindings
  mfd: lm3533: Add support for VIN power supply
  mfd: lm3533: Set DMA mask
  video: backlight: lm3533_bl: Improve logic of sysfs functions
  video: backlight: lm3533_bl: Set initial mapping mode from DT
  video: backlight: lm3533_bl: Implement backlight_scale property
  video: leds: backlight: lm3533: Support getting LED sources from DT

 .../leds/backlight/ti,lm3533-backlight.yaml   |  69 ++++
 .../bindings/leds/ti,lm3533-leds.yaml         |  67 ++++
 .../devicetree/bindings/leds/ti,lm3533.yaml   | 169 ++++++++
 drivers/iio/light/lm3533-als.c                | 180 ++++-----
 drivers/leds/leds-lm3533.c                    | 184 ++++++---
 drivers/mfd/lm3533-core.c                     | 375 +++++++-----------
 drivers/mfd/lm3533-ctrlbank.c                 |  33 +-
 drivers/video/backlight/lm3533_bl.c           | 232 ++++++-----
 include/linux/mfd/lm3533.h                    |  75 +---
 9 files changed, 821 insertions(+), 563 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533.yaml

-- 
2.53.0


