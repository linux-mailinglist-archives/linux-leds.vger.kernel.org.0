Return-Path: <linux-leds+bounces-6939-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDTmBqG6kGm8cgEAu9opvQ
	(envelope-from <linux-leds+bounces-6939-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 14 Feb 2026 19:10:41 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBCE13CB2A
	for <lists+linux-leds@lfdr.de>; Sat, 14 Feb 2026 19:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1898302BDDE
	for <lists+linux-leds@lfdr.de>; Sat, 14 Feb 2026 18:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F1430F818;
	Sat, 14 Feb 2026 18:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4oezl4x"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1641D2FCC06
	for <linux-leds@vger.kernel.org>; Sat, 14 Feb 2026 18:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771092621; cv=none; b=RRi3jN9rxBNiTnzz56EYUF61DJ2nVzgW7MfqrvhmDdMwQs/OrH/lw6p1AuoTp9rK6KN1QRWeFZM7ODT4keKphDfcYpZeFwAxeG/T8fdYb9IaA36KWoTUQa/AVnJtoDjTf+j2rTRSV92tqnfiTjRSN1V5B5kSpgeGkik1JMtdxT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771092621; c=relaxed/simple;
	bh=6X1C0wECNTPSp6EP/HcEzSJeSFFFyaHViLXEg8EpYB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jJSNyvTkQMjr7BtAj84cqlpz94hzbxv4zXhKwADX+1iOxNiuVyqIu4Fg7WjnMrKdUioq+rI89rPRrmralocz5MjlZ7ICfuQrSv/IFsVDadK8A0PKvEiZI11d/O5DfcXdtyet5VknHtTUieBZB2N2Y7DbSMpmPLzuTgvEcco3/7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4oezl4x; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8869cd7bb1so295293266b.1
        for <linux-leds@vger.kernel.org>; Sat, 14 Feb 2026 10:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771092617; x=1771697417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mBgwHHnAe4QujYI3JUVAZlk83RlrT0NjCZwVRWPSZIU=;
        b=e4oezl4xgeX9C9zB3AMRQw6UXQ3do5VNyag1xRW+k0Dx9siqFoPexugdQS1MMq+SDB
         cMTNjdyqV3Gowof96U4AqnEr/cC3mhCg0RfKkyDINuffdnRAFQwhhZNbYMeVkHCUmRcG
         E20dgM4QYuqAoJpm9cE4gevbqkx+csZeuGNsCKxJD7I4ggSEIaISh/Vy0lXy8+ehnae9
         rdHEALQeUOR2GQnfKRMfNxl6X2IHkBG5kGeIQBrJ7TKIcjkVE9/Ae7vWg+L6Y3W3Qio3
         l2lRUmCygBVyZWG0LWzsLhLgXhOVBlyUrr3cJl8TPH3bLkWRWZDUggfLJEiaa5cWfzQ/
         UIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771092617; x=1771697417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBgwHHnAe4QujYI3JUVAZlk83RlrT0NjCZwVRWPSZIU=;
        b=jwvE/6+LzOJFLbAf75jnQXu0CgLQM1nMeRMFSu4YGjrgVY2rru+IlkBF9QKL+jjxT8
         155Vi3PbRMGnmezTwZjJTYMKM3ETo/poTG9uPloSH1N2jjYTJH05TTde2Ch0S2IvITzL
         /QzfpXCihJMAR8tCbZRJh3txcJlKVD8zTGoaErK6nWH7N4/US/9M8L4/zgrlN+XgzRuz
         xobNCPHpCo6cT9o6nEDIRhZ0k2V8C+Jc9KpU6LXAAtUEJSV/jYpRpFzpumFCkMi56+a/
         2vKkEBWnJWwwIYU7F7oZxhQ65aBOkzd3M80bGrbAYVs2aYZh+fmhJuI5+saG2Of6yNuL
         OECw==
X-Forwarded-Encrypted: i=1; AJvYcCVAlLOUffkSZ3bVyhl2j75FwmwM9T7qSL6YKEeba596lwEE9Z9oihVkAn75b175SuWNpfUzZY7xDHwM@vger.kernel.org
X-Gm-Message-State: AOJu0YwCh+O9Xoz97gVRqcWllcYQY3dMapkzQdH206KYj7bfdPNZIdnG
	NKPtVn6NNSAbNGqnjqF/OY44JVDczJpDNgKPLi5K85pLy+4ggnPDYeeR
X-Gm-Gg: AZuq6aLSVakV31eMNltNS4sEuHiQAGGDPMyfury+gFAkZSsk6L7DeGz5eL6EGqWKXpY
	LaDKXXhJbuAxLRj0G3h5swS9gElqmERDcFtOmfMzRuoSGd2TMt8tuYMKFgB/bHWbwyckcUkiSwD
	nTRrRkfUpPYyUpg5j/pkjOG14PliAW4fsIKEeLUqcj/vQJ2M+fZDjoCFkXeTQ77bfl3WuOBsQsi
	m8HKrZE8ujk4oEQjgvl8xkpRN33px0S0JI4zNQfc1btPu73gwTZBMatftfeKA4bNjutW/2H07Oj
	0FHqyau9A1Y+Bl662xaywsymaIPhwE+eFVq+yhhiKbhj5Y6l3AoFHeC7aYk2FJnS5JV7CCpUBwO
	gSvVyG1qbBwSPZHnpcXPbmGP5pjM+s/AVrFmZ9z37lunbgcHCxpioDvPpB4taANfpQaCv0VWbe8
	+VwYfedKTTDdCF
X-Received: by 2002:a17:907:7ba0:b0:b8a:fd04:c789 with SMTP id a640c23a62f3a-b8fc3a358f8mr162694866b.22.1771092617220;
        Sat, 14 Feb 2026 10:10:17 -0800 (PST)
Received: from xeon ([188.163.112.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735e506sm88122066b.11.2026.02.14.10.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:10:16 -0800 (PST)
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
Subject: [PATCH v3 0/7] mfd: Add support for Asus Transformer embedded controller
Date: Sat, 14 Feb 2026 20:09:52 +0200
Message-ID: <20260214180959.30714-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-6939-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AEBCE13CB2A
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

 .../asus,transformer-ec.yaml                  |  98 +++
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
 drivers/mfd/asus-transformer-ec.c             | 763 ++++++++++++++++++
 drivers/power/supply/Kconfig                  |  22 +
 drivers/power/supply/Makefile                 |   2 +
 .../supply/asus-transformer-ec-battery.c      | 272 +++++++
 .../supply/asus-transformer-ec-charger.c      | 193 +++++
 include/linux/mfd/asus-transformer-ec.h       | 162 ++++
 18 files changed, 2064 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,transformer-ec.yaml
 create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
 create mode 100644 drivers/input/serio/asus-transformer-ec-kbc.c
 create mode 100644 drivers/leds/leds-asus-transformer-ec.c
 create mode 100644 drivers/mfd/asus-transformer-ec.c
 create mode 100644 drivers/power/supply/asus-transformer-ec-battery.c
 create mode 100644 drivers/power/supply/asus-transformer-ec-charger.c
 create mode 100644 include/linux/mfd/asus-transformer-ec.h

-- 
2.51.0


