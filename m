Return-Path: <linux-leds+bounces-8722-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E5W7FMHjPGpmtwgAu9opvQ
	(envelope-from <linux-leds+bounces-8722-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:16:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 963926C39B3
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:16:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eq+tDkf7;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8722-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8722-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69F7D300614D
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 08:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B446E3093D3;
	Thu, 25 Jun 2026 08:15:58 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397D22C1595
	for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 08:15:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375358; cv=none; b=LqUsQ/xzZ/uxUpmFTu9T2BOZOsskMUJzwm/To3nfDp2L+6ZXUpvRBiiTvBAbVNCCv+Uv+GY5EMNLE1HUy+yVOMijdsxFZ8jQFSbQ77FBoX9h/kI/Q1XGrv821AY9Rb27PFwwTFJ0DVkcOaNestW0RvIxY24Nck5MkDeWEh23Tfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375358; c=relaxed/simple;
	bh=xGd6NGwZIKu6bwxgG9+VFyp81S1AlTved33dLwV5kz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A10KMxtNujXLMP8mrcObNYo0axmY7nN9cSZMj3AMb6OYDZxtMePKn2iuFvcvx7+M6TQHy+tK0ApUpT2zPqOzsWJ2Krsi+rdCG/R2xXDegoTNKwcmLY0mEIMVobTrKD/cjfK0r9wdeYbuV8OyH06zTSk2TDLjYeugti3DuMCrhSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eq+tDkf7; arc=none smtp.client-ip=209.85.208.176
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3997a448ecbso19807051fa.0
        for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 01:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782375355; x=1782980155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gg0fXFMFgIBOcyFcTi6Gl524W+rUCg7wosxNG5EPRuE=;
        b=eq+tDkf7DwxeeWNyexOwEP0T0LLDdl9yq/JHQ2+Ua0VhlEDiyvmq69mDVsdWxF+HIv
         EbYVXbVj69vnyzxhYn1d1uiPb1WhoedmHIfkgQSozSxcPx0at8TbO0+2yvQN0HAMLMs8
         Lt1sctrYJIo+xcGsEZ29pDpvCYjs4NvEpJkse87KY6/JMt7DtDyLPuAg95bryY33KJJn
         RszSKd9uh6jULkVyBYOUCmSW8EOPeuiU6Et9itmonW52OFZt1t/EY8efzWY+jf7HpJ7h
         NQIVxiWCAMXLG+hxetu5JuWWoAxLkDNRP/nC8lSN+/28+CvMpKVQP20hE7BqIRqPy+Bg
         CAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375355; x=1782980155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gg0fXFMFgIBOcyFcTi6Gl524W+rUCg7wosxNG5EPRuE=;
        b=tGOUNsxBqhIUxAXCgCfe+GyLZu/u02Jn0VqyHGY94Jsu7XThdndG6Oi7CNCJ5tOvjS
         yaarEB6n0rpq4YF/vlTvkZe+IG37YNKEcaCfooKWkD5ZkccZ1VuJ3XL54dl51FE2NMWD
         Ps71LSB5Pc2cKE5p1npSRSsSrF5YqZ9EYsugtWJL0qRpKj21TCS7UZzYHQ6kXROcuL8n
         G0K/dkLsOmqUbRmKB00toqSJ/GHwNF3gnDwia9ZbdO/JQnwbz4I5FJQkMTtvDwa13UB/
         a9/FcHwCi0SODNw4jwyhH0xaPWuknQTWGGSSaJ7fST5FAesISckDa64VEnhyLKoqUfb5
         l4Vg==
X-Forwarded-Encrypted: i=1; AHgh+RrQ75dmm2CIm+i4FKx5EQ+XOghpqY7+jzEMN4xScMyeOhYE8atA6tMoBnNiDzvHTWtKRsS6BCQeWIsb@vger.kernel.org
X-Gm-Message-State: AOJu0YwUrpHkJc3QYI9kE2+lMiSHycdJyVL5zMGJMlbqkXhKgdvu+cxR
	ZZGlB1G7xYufLNQTLpp8ZJFMjvp7hYNjDuI4fY5c2uTxOdvhzNRNcFxa
X-Gm-Gg: AfdE7cmFL2pjWZzo3QmakoGE4u+5Ji+YOMhaZmiyqgN0aviVfW3zFf7YN7+d60vcP45
	bfJEib7ep0/9Tgra/BJEAMsYvddzFrqrxwDqVDh97ef16X78g7enER5TzlVWtTuarRp+Puz5d6g
	Bp+AjNzSrWT8FH7lUVxoeHqssMlhbW8chUI3a/c9yzOuqzcfWB821hxvYH5IV9n60Gjk0cnnBlS
	04I2mHw5o3cfS157jJ19zYJef5haYL8Atxi4mLPLitNmF7eFxQ6nH0WiOMswitbU8mvNJUmg6fr
	00aEtfhVHDmwdYizqfXErhqeiHi/2ng9XrIA/SyWZRW1VTk5IFYRiQLoSdHXMgpGbUSELIxNvCc
	xzY/fiK1vcFkNi9+F/sMuVF7fsmdN20dLsy5RqomMIFQuH0UC7ci8QXMRewrMb9wC01Aog3zFXm
	jZn/KA2PqA7XUTbnusSWfjK6IIdMuglFUp1w==
X-Received: by 2002:a05:6512:2c86:b0:5ae:a348:1292 with SMTP id 2adb3069b0e04-5aea34815d2mr246101e87.38.1782375355080;
        Thu, 25 Jun 2026 01:15:55 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999afce64dsm39162221fa.14.2026.06.25.01.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:15:54 -0700 (PDT)
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
Subject: [PATCH v9 0/7] mfd: Add support for Asus Transformer embedded controller
Date: Thu, 25 Jun 2026 11:15:22 +0300
Message-ID: <20260625081529.22447-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8722-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.torokhov@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:sre@kernel.org,m:clamor95@gmail.com,m:ion@agorria.com,m:mirq-linux@rere.qmqm.pl,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 963926C39B3

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

Changes in v8:
- added MODULE_ALIAS
- renamed DOCKRAM_* to ASUSEC_*
- ec-keys: input_handler moved into private structure
- ec-leds: added brightness_get
- ec-mdf:  fixed i2c_smbus_* return checks ()
	   improved model storing
- ec-batt: added status check of devm_kasprintf

Changes in v9:
- fixed i2c_smbus_read_i2c_block_data return check
- blocking_notifier_chain_register moved before serio registration
- adjusted get_unaligned_le16 bounds check
- unsigned long long > u64
- iterator vars made scoped
- removed "magic" values from ec-mfd
- simplified logging, detect split into detect and init
- improved error logs formatting
- adjusted handler in media keys to connect strictly to dock keyboard
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
 .../input/keyboard/asus-transformer-ec-keys.c | 314 ++++++++++
 drivers/input/serio/Kconfig                   |  15 +
 drivers/input/serio/Makefile                  |   1 +
 drivers/input/serio/asus-transformer-ec-kbc.c | 168 ++++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-asus-transformer-ec.c       | 125 ++++
 drivers/mfd/Kconfig                           |  16 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/asus-transformer-ec.c             | 549 ++++++++++++++++++
 drivers/power/supply/Kconfig                  |  22 +
 drivers/power/supply/Makefile                 |   2 +
 .../supply/asus-transformer-ec-battery.c      | 289 +++++++++
 .../supply/asus-transformer-ec-charger.c      | 208 +++++++
 include/linux/mfd/asus-transformer-ec.h       |  92 +++
 18 files changed, 1944 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
 create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
 create mode 100644 drivers/input/serio/asus-transformer-ec-kbc.c
 create mode 100644 drivers/leds/leds-asus-transformer-ec.c
 create mode 100644 drivers/mfd/asus-transformer-ec.c
 create mode 100644 drivers/power/supply/asus-transformer-ec-battery.c
 create mode 100644 drivers/power/supply/asus-transformer-ec-charger.c
 create mode 100644 include/linux/mfd/asus-transformer-ec.h

-- 
2.53.0


