Return-Path: <linux-leds+bounces-8510-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 57LfBeWoI2rzwQEAu9opvQ
	(envelope-from <linux-leds+bounces-8510-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 06:58:13 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E72864C659
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 06:58:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="sSfs//8t";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8510-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8510-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B11ED3020107
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jun 2026 04:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551632FE05B;
	Sat,  6 Jun 2026 04:58:07 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C062F8EB2
	for <linux-leds@vger.kernel.org>; Sat,  6 Jun 2026 04:58:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780721887; cv=none; b=gbZDeOzbLeKPs9Ck+zy57ZFYwO8YNHAdolrbVYxoLoemEngKNbzCbikfBOZIqM6oLbRWjnnOlyzFva+8V33JEj5ccRotlaWkgXhUWSjIMKLSMOmUxYBFNbNv3EpjipNMBmI3HFCmI4aYm8c9Uiw+Y9vaRlLTiEkgtcsK6niIh8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780721887; c=relaxed/simple;
	bh=sChSctaNk/iJ7rMo4OneEoqRj9NRpGu5gBeih5JX6Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lb+rzEFTjVBAAnWhTTeosiFfHGoERTHvJSebIKoZbKcLfiUojL+XaDq8WDn0GJlnxnuNsvJePU11Ewx7SLRYsbxkfOFXnCES//V4nVeQIME/KQqngQpcRnAGSWgtqkl7YA/4JiwTcUi5QRsb8k4myEYVltiDDHTvarY8k99TI08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSfs//8t; arc=none smtp.client-ip=209.85.208.46
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68cec9f4c6cso3750192a12.0
        for <linux-leds@vger.kernel.org>; Fri, 05 Jun 2026 21:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780721884; x=1781326684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ijiDIJoRq4DW5gmq2cKgL9VuesBVH2zWjg+vtHwI5sw=;
        b=sSfs//8t7+hi4vevAcVnNjxy1AQom4JuITz2efSHK9eMjRSjnhpigeGBbwFOXFrODK
         Z/GiP+EFP3SMYvbl4RrWp2DnpUEOX0iMA5Q/A2irlBbF9bhlwDPTzhgHtcuqUHU8s+82
         mkv1VTrkmYfkGhYaxh9vnrs4JLVn/LsLDpnUd7r/6F4PIaRIyKXQfh2mkrPhtDJnAKAk
         nTbRKpBufwY78nqOkIVVvt2hNHNMKNJBXqN0r7tKtMRW5LIRcH+8ojfBz7eKgb/OP7X8
         ODt15qnp7y9J9fLIctqWHekiPiqRPH2rcCdxN7sd4EFopcLlVydJPXxJ42T5rVSnDS72
         IrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780721884; x=1781326684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijiDIJoRq4DW5gmq2cKgL9VuesBVH2zWjg+vtHwI5sw=;
        b=mHHFhU73fqiEYF+GyoWdCaQF+DRzuo1YIepLQvJ9+yOj6h7uCnPitCs5D7N/H313Gf
         TF/UCrscbwNQRLJT/P433z1Nk6ZY86ADiY7PECkY081q4q/pFlL7hB/jdV2js38omxOD
         kK3MNIAkBgLci06JWrpOqkQGvOsgncK/ZNq6mtsQbl5W3X69XPEieG73npuMFXtzbZvc
         p4+iLeoXFJnSjcA2hjkGw0u3ZSxjRHCtvrFEh6cbUDgWmITmMd9mNJ14AJnsME8Y0oVJ
         TJaRGzj3AEpr0Yh17isP1kGArCCrP7x1LIQdoUDmTEyk6qdFObxCfzcsLZ3UJS9pfJaT
         CMaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bPivNCPbQYvwcTbqFVTes7INbsmt2e0Tdln1lIhXWDrJCEWfbGwrQfkTt/jHpJLjXfLTbnRJwu8IA@vger.kernel.org
X-Gm-Message-State: AOJu0YzV0wBzn6ASD51xYxv6Zlc4mspFbLMfOL+1bS4/6SKzTthmDOTn
	/4kT5qSJGAqF/UwgeohUWFDWg9l940EpT8vKM5Q1udOnvkwB9eBD3Yrf
X-Gm-Gg: Acq92OFirTXE9MSwfDw3dvQ4t4FY5etvKpuIDba2pysnjRszGPVldM+/FaWkUjC2H4G
	vZra48oPCGvRf9zNaK+UX28742KKy4/gV3T1Zf4S6LhpxGEwhs1w60f7MNmc/INg+V7s1vVyQnh
	dsrsf6QNTMSGUebJZVPFU7oCVB0szTOzcQy3pWObjptAqnJ4YYn/e3Q3Va0y0RnWGp0NyvIAELX
	mXqUXtGlbpGWALcOZPDqkpe+9Ne4MVSpJi/V6WFgQjwWtQoSG9H+KUTkkTPN6CqoLwGxlWinz7Z
	nwsNL8CDnXW/wyXHXEjeMNHJYbv9709kXBB+Pt/S7TUD7pintW1I+9bcJr2jvDHx82vsudSq7gl
	0z4NGAIgbQpa3SjAhbAExpbKrDv3jbSgMJj9CGR45vEeWlHvhEUQ8yuIV8bTqYMvppguswoUwpF
	mDwFbGjxGRnDhz7iiTVOwPKy2iUW+OHwoljQ==
X-Received: by 2002:a17:906:8a79:b0:bee:bcf6:6a23 with SMTP id a640c23a62f3a-bf3749d7f03mr231807166b.43.1780721883699;
        Fri, 05 Jun 2026 21:58:03 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm570597166b.32.2026.06.05.21.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:58:01 -0700 (PDT)
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
Subject: [PATCH v4 00/14] mfd: lm3533: convert to OF bindings, improve support
Date: Sat,  6 Jun 2026 07:57:24 +0300
Message-ID: <20260606045738.21050-1-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8510-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E72864C659

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
---

Svyatoslav Ryhel (14):
  dt-bindings: leds: Document TI LM3533 LED controller
  mfd: lm3533: Remove driver specific regmap wrappers
  mfd: lm3533: Remove extern from shared functions in the header
  mfd: lm3533: Pass only regmap and light sensor presence to child
    devices
  iio: light: lm3533-als: Remove redundant pdata helpers
  mfd: lm3533-core: Remove redundant pdata helpers
  mfd: lm3533: Switch sysfs_create_group() to device_add_group()
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
 drivers/iio/light/lm3533-als.c                | 179 ++++-----
 drivers/leds/leds-lm3533.c                    | 181 ++++++---
 drivers/mfd/lm3533-core.c                     | 365 +++++++-----------
 drivers/mfd/lm3533-ctrlbank.c                 |  27 +-
 drivers/video/backlight/lm3533_bl.c           | 223 ++++++-----
 include/linux/mfd/lm3533.h                    |  75 +---
 9 files changed, 806 insertions(+), 549 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533.yaml

-- 
2.53.0


