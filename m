Return-Path: <linux-leds+bounces-7936-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAPMN/Xw9WmVQgIAu9opvQ
	(envelope-from <linux-leds+bounces-7936-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 02 May 2026 14:41:25 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8BA4B1EE8
	for <lists+linux-leds@lfdr.de>; Sat, 02 May 2026 14:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29E153007CAC
	for <lists+linux-leds@lfdr.de>; Sat,  2 May 2026 12:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60DD36CDE0;
	Sat,  2 May 2026 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="szC/F6aa"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6F036C59A
	for <linux-leds@vger.kernel.org>; Sat,  2 May 2026 12:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777725677; cv=none; b=okWqo3Nh2Fm93RJNc676+24EM93F4e/Qf4JmFi/zGb3KI8bs7WpPgF0+ipp/VQl6W2NOSrf9qnEQEvY2iSlss6O2Wt80saXUwno49wWETYvoTLS4fjQ1xOMrb/Ac88PdaZ73thvS4gfH+44YymtFn9db5n9BiMUO5Mej3zugwQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777725677; c=relaxed/simple;
	bh=bzK7TuhI7iXeChjCRE/yKbFe3uEBIwi8ReixnO3VzD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zllg1beNapfBeCWJgV0rloQWBITs64MHuzES0Na1yUrsUac4tWbvqNnITJ8XeLYxs8K+Kjs1Qu9DiQrcoQgK5TMkozNSKuabDCRhl14dQMbghsY24q2I+29hqfVK/o6ZQLIxhPeiPD3zwetXUG+2yzej209920kdd9RQ8UoyO+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=szC/F6aa; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6794b8699b8so3509434a12.1
        for <linux-leds@vger.kernel.org>; Sat, 02 May 2026 05:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777725674; x=1778330474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBPNRk7v8mm7QEjJvKG3bZ2ji7O0ntCyzGjvZOc47Jg=;
        b=szC/F6aaQSGgS0XWpir9o5lO6cfT0oCt/xvdG5zbZfgRpZRZRei1DER181TJBgW3kZ
         HG2LQMX5Wh0nqXLmesIugpj+EaiV8Z8LkjgHgMonkEl+f8c84+dc8A+K4WNaaNPfFTPz
         2z5bnoHs8lDj0Xpg7hKi9GpAYaypNrUNNiNZ8oIwv6M2l8icQTeM9XGorcwjHzVL85n0
         S5W1N77C0pkKYzK6FUHO092IDvVSJw4AyT6aFFkq3GGXHkOD1RaPEgOX8vXNoxSE4QGy
         fx4oq0Vb1MVgIAs9zLRBMUobAs5IcXvdDRiyKiXAqsQSi2oTpViCsOKceO0LYYPD1xgR
         T7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777725674; x=1778330474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBPNRk7v8mm7QEjJvKG3bZ2ji7O0ntCyzGjvZOc47Jg=;
        b=Qe2jrVTHuLzyIHppimgJD0w+9JfZ1FRdjqkZofjjN5q5IBi3zsdfBNP8GquP68TTd0
         610V317JTf3CvI8WNqnLWdXWOa3A9yKwqyeSa8ZrWKIoVQ7sT01Vdtk1zw3BjMAPZRRr
         QH84WnoimBvgAc6Nu8dVAWpABlndVBZZ2qNEMEYSyOyRU45US+mT6wFIRa/aLHO0ZvFg
         IJQxdP+bY1JG+LXcIRsSSz8XTqJ4q0I171Eny5W1aTCrG9Bu2LdcOyuODB07qnzX73Zd
         tI6+XSHfkn2UwHnIfluRmJsVeQbWg3LW6AaDD5hKVn/IIHNqIQM/hy5POvR8SmBsTYpm
         9yBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/31kIvDmlANnn9//UREhKa6quBWE52TOU5KLmXFCfKzUK1I8gUCv10NZyx4/ZPigJ+k0tqoU/2+NYV@vger.kernel.org
X-Gm-Message-State: AOJu0YwlbA6qA4pILYkjrWsqztq/5hftYgowIBD+QTekXnhZjQ8WxHli
	dD8AXA0WQwNcPLy35dJAU2FDjNHbWOhInDvBVRYx2e7Fc/FWxX3xsBDX
X-Gm-Gg: AeBDiespiIljE0TyY1v5RPQEGLamnllnl6QCkErl+Yy+jGlglrbF9t5khHd27kQijuh
	367XTorRsbjBSJEkduTR97WCAshH+TnQgAUvBcy1BKZJcZ/yaVSYfcmU5zLw0w0NIXgcC94iFDT
	0CjqcsaPGCVxgk9ktPU4o9AoqYx5CD+4lCMbhhlAlPR2fCeWCvU+roPFb6f2InVm7liUwbgA7Wa
	GK/+zq/+KIFclhpqfX67kLYmGxYwQsaCd+hAyrivUf+huBvfnij3c8FeIdhHo0w/crePw13kDyQ
	uR5C3zoiZvcPLlo45m8iPlsKxOMZi9giwJxc48fMAf9tv8Xtq96BC2NUdZRV4PS1z0vzGdAZ25f
	nVGGOY04ycmsvyGua9uO3ptUhsV6Kn+khgCsQFjVlLTHJC8e/vsWewCIix5guAwNLJdyen2u8Fo
	xpWHBg8yDTYaBalLt4uR5IS7M=
X-Received: by 2002:a05:6402:1209:b0:665:3d68:c46c with SMTP id 4fb4d7f45d1cf-67c1ada368fmr865771a12.14.1777725674231;
        Sat, 02 May 2026 05:41:14 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b85e281cdsm1649649a12.3.2026.05.02.05.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 05:41:13 -0700 (PDT)
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
Subject: [PATCH v6 0/7] mfd: Add support for Asus Transformer embedded controller
Date: Sat,  2 May 2026 15:40:48 +0300
Message-ID: <20260502124055.22475-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4C8BA4B1EE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7936-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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

 .../asus,tf201-ec-pad.yaml                    | 119 +++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 .../input/keyboard/asus-transformer-ec-keys.c | 272 +++++++
 drivers/input/serio/Kconfig                   |  15 +
 drivers/input/serio/Makefile                  |   1 +
 drivers/input/serio/asus-transformer-ec-kbc.c | 147 ++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-asus-transformer-ec.c       |  79 ++
 drivers/mfd/Kconfig                           |  14 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/asus-transformer-ec.c             | 762 ++++++++++++++++++
 drivers/power/supply/Kconfig                  |  22 +
 drivers/power/supply/Makefile                 |   2 +
 .../supply/asus-transformer-ec-battery.c      | 272 +++++++
 .../supply/asus-transformer-ec-charger.c      | 193 +++++
 include/linux/mfd/asus-transformer-ec.h       | 162 ++++
 18 files changed, 2084 insertions(+)
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


