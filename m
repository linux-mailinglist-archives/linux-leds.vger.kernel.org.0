Return-Path: <linux-leds+bounces-8186-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF4FL+LjCmpr9AQAu9opvQ
	(envelope-from <linux-leds+bounces-8186-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 12:03:14 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CB256A477
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 12:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5C433036747
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 09:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1303E5589;
	Mon, 18 May 2026 09:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ua595WSi"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD1F38331C
	for <linux-leds@vger.kernel.org>; Mon, 18 May 2026 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779098379; cv=none; b=ZUOHEJ8z84553jKq1HBhkTo+OyLHPxNnB0uYUFsAwoiB5+/wSUzTmlqy4yjmjg9PbCd9xDBW6qp/dmf1SUOQ6yOZiuMMdYg1LF/d8dHzkGMPGYeQUvR6GRw3B23HE17h+gMRAw37n3yWUnAW0pNeB2jzUpAbqFSsJEma1fhd+ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779098379; c=relaxed/simple;
	bh=esAbANfm0QoNyiPBFvmZqDjUGYZ/B+s4N5Ry/JqlxMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uVxwpDh+j4g+/0km2Bb5XO4ixGaFgIBPv1wSPUFLmJoFqG4c2W/6ZVYhHQKq3zAnYytr0qmMuAoIKgktGpxS40Vf4KQaKqUXCoYEQ9a8Gg9LV1PnZ0MU126G8S/0B5199QR+UvF0jCBCrj8bcly/c7KoovG7+hPEqdDinbajICU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ua595WSi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso17006305e9.0
        for <linux-leds@vger.kernel.org>; Mon, 18 May 2026 02:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779098373; x=1779703173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DJIG7dSSUSCrB0X+7bTr2JvS66WVWYC1a7BqZhmjf3s=;
        b=Ua595WSi/9sKrcmYLS0uV64FJPYwuhnoBm8IL0ZaMRFy7jjVAKvywcNILXoUzqGy8K
         csju/G3DYTlT+5U3Xfp0Xa20RRq3hhayacoZPtuAIqlpahT4Jab5RiAvy0TioBoI6lR/
         GyDB24ihe8xLbelkNIJ6Y6Kw2BiSrIXQK9z17k5fHiQSL6ArTHFOfyf1Dcp+BA3dZL9V
         m1YJvZYHFQZyGLhZUri2q8Jhz/wFQoa7mE2xKFHsS7DV3nGWpByEtYCIi0lrOmFR4gec
         XSuciJNb/ZxCpK0nV2N2RTNHcyJ7GAacdWsC20mQ+lRhVezwhNJvfV7uynrBjWkGpemk
         xFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779098373; x=1779703173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJIG7dSSUSCrB0X+7bTr2JvS66WVWYC1a7BqZhmjf3s=;
        b=YLyim1HP28pNcintsrY8RY4Fqkw7NOHdaNs/1B7VtMVZUY54TvKhQsPeZyJoRpI0WR
         V6xDj3rH9Dcbzl1ALE4SAGg7JhKJ1rKX1wno6ler8tk8NBeZtwc6Ji350ZQJy5+SmNAq
         V9Big1dbToZSAroXRHbNlNjRP6NSquftbBP8iYSUFEiOeRZuOmeuLmpOJ6/hQhG+UFlc
         bwIGqL6fvuHXznTadlxzblLvyByWEJy0ivpcgFZKJM21PmS3INObmk9Pd/jfTBDaYwL7
         rYwImcEy8rdDsGdF9rNGY67I4JnYqbpgXzJBYFkQngjrqNcPtjle6WEXe54oIVN5T8rW
         RrJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3tN91ZHsL+wPpTST5JyinzZd8TRXNlaPTJsSN8cjnNQw1EMiQk3KlFirVtr26REuqXchR4LysD6oh@vger.kernel.org
X-Gm-Message-State: AOJu0YwQt4ablmZzAZcw/xmNVL7pxmTOoZp4KYlEJYX+LARz9UiCeYx7
	uvG7jI62b6MvRuQxqIN1aLMGrgfqywa2fe9Td14QUeUAKLc2sI3dJM5K
X-Gm-Gg: Acq92OGbpDoCzDE/iCT9Gfx8JdyB7vooYK6LYbbRMSN2gUh+uqBzTeJkyk/Uy2nmvPL
	wcSyhxkUF5c8bqVMYTWFWKDaM/b/hXS7LV5kNihDdg9AZhdFxcLLIFIVnyjBpzezyf6RDOe5mfb
	IDKXbCyvwddmrIFKG4aukIWjPbPvfD2xIUSIGXOhks9ydm5PqFY9mALWcmB2aceZ9dcgptoii+g
	pQukYxMEBuZegaRo+VtGERCMJhVy5LNx3VSLy0Oit6aEk81WCoVyTi80B3mJ3YWXmCUupFZyZ0Y
	h4TgBq/IE8CB1eXYgN+wXKFFCzEFMrv61euR/fJ3lmYWnVefykajKk4RnSmKY6+racvJhTA2jBg
	t3nTvdoEP1uP4aKtxMCqsH+k/gLZjUOLu69fbh1rfdKRKIpIj4TvosR1t0+mqiCYp2gY0K1IEQO
	GVL9+ofMJJ0apf7PeTRODeo94=
X-Received: by 2002:a05:600c:a01:b0:48a:76a3:2b9b with SMTP id 5b1f17b1804b1-48ff33460f5mr158732155e9.17.1779098373057;
        Mon, 18 May 2026 02:59:33 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm102995005e9.7.2026.05.18.02.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:59:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v7 0/7] mfd: Add support for Asus Transformer embedded controller
Date: Mon, 18 May 2026 12:59:00 +0300
Message-ID: <20260518095907.36158-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 61CB256A477
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8186-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add support for embedded controller used in Asus Transformers for
managing power and input functions.

---
Changes in v2:
- converted sysfs debug exports into debugfs
- added kernel-doc comments for exposed functions
- fixed minor typos and inconsistencies

Changes in v3:
- dropped DockRAM commits (both schema and driver)
- integrated DockRAM functionality directly into the controller driver
- EC schema moved to embedded controllers folder
- removed all cell descriptions from the schema
- removed all compatibles from the cell drivers
- adjusted naming conventions to better align with the ASUS Transformers
- defined EC variant sets to provide coverage for all known devices

Changes in v4:
- grouped known programming models of EC chronologically (both schema
  and driver)
- call debugfs init only if CONFIG_DEBUG_FS is enabled

Changes in v5:
- added asus,tf600t-ec-dock compatible to schema
- rebased on top of v7.0
- kzalloc > kzalloc_obj in keys and kbc

Changes in v6:
- removed asus_ec_handle_smi casting
- asus_dockram_access_ctl > asus_ec_get_ctl in control_reg_*
- fixed battery Kconfig description

Changes in v7:
- added status check of devm_kasprintf where missing
- devm_asus_ec_register_notifier dropped, added .remove where it was used
- removed cell_to_ec, asus_dockram_read, asus_dockram_write, asus_ec_* public API
  asus_ec_i2c_command, devm_asus_ec_register_notifier, asus_ec_read, asus_ec_write
- renamed asusec_info > asusec_core
- ec-kbc: added packed size check
	  ret > error
	  improved key remap logic
- ec-keys: improve formatting and comments 
	   ret > error
	   switched to dev_err_probe
- ec-leds: reworked to register both leds via loop
- ec-mfd: adjusted Kconfig description
	  fixed smbus operation sizes
	  fixed saving of EC fw model
	  adjusted IRQ flags
	  converted to use definer for set cell composition
	  added factory mode states enum and handling
	  defined some "magic" values
	  self > client, info > ec, ecreq > ecreq_gpio, priv > ddata
	  asus_ec_chip_data data > asus_ec_chip_info info
	  ec_data > ec_buf, ctl_data > ctl_buf
	  added and improved comments, added structure descriptions
	  asus_ec_magic_debug > asus_ec_susb_on_status
	  removed all dev_dbg and most of dev_info
	  pronts with model, fw behavior, factory and susb state preserved
	  switched to MFD_CELL_* macros
	  removed debugfs
- ec-battery: swithced to BIT macro
	      lock usage moved to asus_ec_battery_get_value
	      in asus_ec_battery_poll_work fixed possible rescheduling fail
	      in asus_ec_battery_poll_work fixed missing not charging
- ec-charger: POWER_SUPPLY_PROP_MODEL_NAME set as the first check
---

Michał Mirosław (6):
  mfd: Add driver for ASUS Transformer embedded controller
  input: serio: Add driver for ASUS Transformer dock keyboard and
    touchpad
  input: keyboard: Add driver for ASUS Transformer dock multimedia keys
  leds: Add driver for ASUS Transformer LEDs
  power: supply: Add driver for ASUS Transformer battery
  power: supply: Add charger driver for Asus Transformers

Svyatoslav Ryhel (1):
  dt-bindings: embedded-controller: document ASUS Transformer EC

 .../asus,tf201-ec-pad.yaml                    | 119 ++++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 .../input/keyboard/asus-transformer-ec-keys.c | 281 +++++++++
 drivers/input/serio/Kconfig                   |  15 +
 drivers/input/serio/Makefile                  |   1 +
 drivers/input/serio/asus-transformer-ec-kbc.c | 157 +++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-asus-transformer-ec.c       | 109 ++++
 drivers/mfd/Kconfig                           |  16 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/asus-transformer-ec.c             | 534 ++++++++++++++++++
 drivers/power/supply/Kconfig                  |  22 +
 drivers/power/supply/Makefile                 |   2 +
 .../supply/asus-transformer-ec-battery.c      | 286 ++++++++++
 .../supply/asus-transformer-ec-charger.c      | 207 +++++++
 include/linux/mfd/asus-transformer-ec.h       |  92 +++
 18 files changed, 1865 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
 create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
 create mode 100644 drivers/input/serio/asus-transformer-ec-kbc.c
 create mode 100644 drivers/leds/leds-asus-transformer-ec.c
 create mode 100644 drivers/mfd/asus-transformer-ec.c
 create mode 100644 drivers/power/supply/asus-transformer-ec-battery.c
 create mode 100644 drivers/power/supply/asus-transformer-ec-charger.c
 create mode 100644 include/linux/mfd/asus-transformer-ec.h

-- 
2.51.0


