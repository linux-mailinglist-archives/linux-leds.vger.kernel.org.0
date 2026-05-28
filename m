Return-Path: <linux-leds+bounces-8337-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD1lBZfUF2qOSAgAu9opvQ
	(envelope-from <linux-leds+bounces-8337-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 07:37:27 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E21B5ECE70
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 07:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42175313D841
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 05:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BFFB31F9BA;
	Thu, 28 May 2026 05:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6VkT+s4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46340171B1
	for <linux-leds@vger.kernel.org>; Thu, 28 May 2026 05:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779946352; cv=none; b=JeOhodXGAGwGZNcPQRUszZ+J3Ts2ZAH9pXmCIfKVgC/H1TlYJDBKdQEYrsJmykiv9RoWjjarNZ8BqsHvNq5meyvNAINdixa4i7OMQrcBdkfAhJxCS38qQTNEKXh/MYXE/OQ/tuQtPwoFGH95WKXohcb6/iZJEGQE9aK7LWtrVAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779946352; c=relaxed/simple;
	bh=clNVtbBfViwKLpG9zmkSUgXMyGZnR+a/g79EpBF+4us=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ezVEVmkaMiz1c63NGS98PF7APqs55DCn/OY0gQJYWUiNyliUeDNJi7xWH/uN6nMDoyQwb85tLcSnDJFEs2Tdv9AxSZFJUOMjma9rh0QtqJu6vCNgoLoE8I45zmldaj3wKWNXH00UCKLF+eibsu2bAwrDilav9xsMmvF7yKD2iKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6VkT+s4; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bd8d0e4e341so1778839566b.0
        for <linux-leds@vger.kernel.org>; Wed, 27 May 2026 22:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779946349; x=1780551149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uNrRcVw+e7yAa5bCgioJSE1tWr6W5F6AeUGiymutBGA=;
        b=S6VkT+s4l1ummC6oJfUbk5TpYcCSrESxn0p30cNrsMOeL13oUu4fXPUNfm0Nyuc6PB
         OmR15ON4PuNbFJnQNeNUoj/W9sLJg6ST1n1ZUfwea676yqZM9tPS55ww3EKlJeM63l7N
         nnBzaJXemYw6gbF/IGHf/S8nrjogKhow0gNRPLjOJpbegEDit6Fp1H3ef9ugrCQ/HSG7
         d0BpJ/ptQ1dYG7aNXOoXpZsRxIVdlnjIU+/BcyQONZOzLB0nTc0uAIPvpN9Lio/VXhL+
         3uRBCMY+BcBieUbEXEJVuHyB2bmkNNkh7ynyzN1naSa4IgV09DWaqo6pS/dwRVj9+SAW
         d1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779946349; x=1780551149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNrRcVw+e7yAa5bCgioJSE1tWr6W5F6AeUGiymutBGA=;
        b=KXOcq+hPROE4mIUQx78/8OSZ68SHvp5dh/Mlp3v9YIK1Iq049jwz3uv2teTtm1aN9m
         ckdmSOk1AvTALEK/csZvhUhD1kot+KcgNpT98fW0cFosjrn528X35V6/Bri5Re3ihKwb
         rMzIVkspC/fvbmUcb7tz/ZeT5flSckbVgYW8xoymX4BxjnHxLtWoVloLssgcyfFc1dvC
         xyB98rA90E2p/AwBC51F66ZBcfzofw0QTLK9m1qdDjCO7PB2g9gWF0VM5AY5woScGj10
         0xdtcPp4Aiss5nhkdHBA0MNPksvXjK3W2oYTZKhOz2FEc6mGoW7jRojIAko746RoM4+e
         F9sw==
X-Forwarded-Encrypted: i=1; AFNElJ+jJZ69xFJj72ON0gg/nqpqhnPPf3YAQeOzoox9wtBCtozMrylq6JJWM1iQQHEOGnXNX/RZa4OOBNtR@vger.kernel.org
X-Gm-Message-State: AOJu0YwijZ0kbCnAYGbiqPHYTR+wRnDgzWj8JJvID8U7bdmg5rvnLaRS
	cx05XXq7Ot+Qxmu9k3JfAwqZ6fetOfV5Prj7aIDTsgBtaBXQNf+QOyyOoBWeEA==
X-Gm-Gg: Acq92OHLXiUxkOiLDLrY5iYn2EGIy+6TZkty/gs7gPbkLP5ZBuHdBZcX+Z1Ao1CLXON
	t7pwCkllRD6ryXbK8vZwNYNGrXs0LcH24+WEC4aSoZGEUrsqbCy61x53pvbEDvECHPY4r2/i/I2
	kCFPNep80nnPpBUNGl0l9VpfbAZbmm81UrUO1NREBZdbR8nJV/kxIxdXjdUefz/KulAuESGlYHf
	BS9rL7wt05XdtbZbOurLeFWhYtp5+thsN67IrHgkifC5n9QbTbGEBhJlCm8Guk9o6k6EhaefHdJ
	N2auOdWTc//QZwO6ITzpn5mlNG4fQHc0ym14O1V2Cc8VapuK9/UKgwrGmZI2t1flXJSLzycDIuu
	uIYMsCfIc+yO9DPOrWzQp/ukSdSYUmkG6IVyfPsPe7gPbQyg4WT2/W4uzrgTRXfEH80BY5X6g7v
	Nk7J/ybd1Z2AsISGHdIf6MfZ4=
X-Received: by 2002:a17:907:1dee:b0:bda:5265:423 with SMTP id a640c23a62f3a-bdd269b7370mr1175915966b.44.1779946348345;
        Wed, 27 May 2026 22:32:28 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5eca616sm693427966b.30.2026.05.27.22.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 22:32:26 -0700 (PDT)
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
Subject: [PATCH v8 0/7] mfd: Add support for Asus Transformer embedded controller
Date: Thu, 28 May 2026 08:31:56 +0300
Message-ID: <20260528053203.9339-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
	TAGGED_FROM(0.00)[bounces-8337-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6E21B5ECE70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 .../input/keyboard/asus-transformer-ec-keys.c | 286 +++++++++
 drivers/input/serio/Kconfig                   |  15 +
 drivers/input/serio/Makefile                  |   1 +
 drivers/input/serio/asus-transformer-ec-kbc.c | 158 +++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-asus-transformer-ec.c       | 125 ++++
 drivers/mfd/Kconfig                           |  16 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/asus-transformer-ec.c             | 542 ++++++++++++++++++
 drivers/power/supply/Kconfig                  |  22 +
 drivers/power/supply/Makefile                 |   2 +
 .../supply/asus-transformer-ec-battery.c      | 289 ++++++++++
 .../supply/asus-transformer-ec-charger.c      | 208 +++++++
 include/linux/mfd/asus-transformer-ec.h       |  92 +++
 18 files changed, 1899 insertions(+)
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


