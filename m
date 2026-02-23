Return-Path: <linux-leds+bounces-6992-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA4ELxb2m2lI+QMAu9opvQ
	(envelope-from <linux-leds+bounces-6992-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 07:39:18 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 641BA172320
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 07:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B3AA0300D366
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 06:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC320346ADC;
	Mon, 23 Feb 2026 06:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3jCFIm2"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40473EBF3C
	for <linux-leds@vger.kernel.org>; Mon, 23 Feb 2026 06:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771828752; cv=none; b=g3HcG0kuTMP57ZfLHrhraZ5vYNTxy8Aj9r+QDw+gkak5kV8rlmJrBTVUjVn3cRWE0cqWvaut+GKBi3zEtAXqGS3ODqDJ8NzTrH2ND+Ie5449zz0GXcb4Ny3gL7YtsXm4tzrSUPMQMo2BYhKLRc02BelBDPSqp2NT605YQLHUmOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771828752; c=relaxed/simple;
	bh=k0UhZSHIQfO0HDHJkw8IbSbfZ311DvIpeYJjb/2LtU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F52CqYUZ8TYgDa4kZIfrtWNXTi02S2LYdWdilTtpODzB0xUOO/iaQZxCh3/iECC1zPo3LqT52QTASJuL/fAVZstCwl6Xg6n7yRzrxWmBbJLlrLGzS6gim39/1gY0Ny2y6nrBmgWuKs0tGcffD0VT8iEtYHBCmPkcAH1nYGp8SPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3jCFIm2; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-59e0d5c446cso4556252e87.0
        for <linux-leds@vger.kernel.org>; Sun, 22 Feb 2026 22:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771828749; x=1772433549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=64fXO+/BrfVHyK+e3Z6d/GgzvitBotdXgadt/CHztxw=;
        b=K3jCFIm2sdlm98uGCBMvNRCOWKfKmqXYCK5A0vc80EwRE+kf5fD27VWr6GKy3OzihO
         tV+oRwBSuxcln0g7tbJTkGHcdjV7y6FsDfMsR5LQcrdICyCENJTCIGOIFRkq/yfdveYi
         IjL3Y0l+vDyLtLdqLnZmGZUGzJ0Kmfc7XNBt3b3uoZI0P3cDSOkTcQzngmejfTmcfgSO
         Azfrd9PfX5prYGuB5JWi2SH9i5vtb9IbeHXJU34e9kvBpuLNmoUZMHiZaZPofId83lkY
         Wajz4HJlfkH5Y3LNlCMykqKHfwSnB8eCnfqv9Qpg9TZUCqtksvWDWDi0Ociqj7c7/egw
         rLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771828749; x=1772433549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64fXO+/BrfVHyK+e3Z6d/GgzvitBotdXgadt/CHztxw=;
        b=PV4x5AVS0QOFaPfBYkJDCup6mEHCa7ncUM3rAdOU+BBjo8FOXnzDTNh/ce8ZBf6XMv
         k+ljYqX0J1+/esI7Lao/iJqSPtrUnBoIaUe3MPLo/wP3dMJd6Nc2Nw15Wn1dBHkMIu1F
         nRkSytNOGafgdKC2FV/1WT3HuSVVXN8NHeH34BBp2TYVPqyAfJEmpRpXjEZKeAV3LVE/
         mjr9U21CImhvPUQ+CY/5DD7oJ7tzlJGuAjVoQMh0sJMkqG6e4zZGJWYBOwOnTi2cohj2
         VB3tl8ygzqmRBX/fluYUKuJVUePH3IX1/JHc2aGRJhngNrQu97g1eKRXTXu4iUroR++d
         ug8A==
X-Forwarded-Encrypted: i=1; AJvYcCXQkqZ5RqNGikMxiRJSsmodpSD5U7iMXOqrTdBdubsOeUx25RROh14xaOvBxjMaJBohZv/10rYsmZbg@vger.kernel.org
X-Gm-Message-State: AOJu0YztF8NuYG73aU6k9hT3x5Wl3XoXhVwDilLLVv/dEdKsILiSUlZC
	T6/2f1B6hQb6JGXxd6BcZ0PlN3zI9yWh8RX2amTcVQUR/PUomiTrb4Tu
X-Gm-Gg: AZuq6aKjQ/VEIBx4eSqbl5QlO451hgyqFnFmT1wV/QR/SbqE8ExVAH9GjvZ1qLcM1dr
	Al3MXeRUUvKVTdQjgV6Sz47MIVZneW35k9O8IpTUSWMk0rtO68v9l0vBeOyy1iNuAkRq03DNkga
	X6sZgo8hxULs0N+zE+pjVEblCwr0VX0zB+f11zd5nSKF91/V6IMHQLE1maPNzRGXYMUADy7cg75
	u1FE6aSSKnXpN2kd/kfsyeLxfWO5Z+V/0nIy1nWkRvUc/sH7nmxL4mNiioNCELk5EhjUD8eTt27
	S4yDPyVpWcZhu8Zy/esGS7IV2r6zgRBhfdFFpzjipbBykb2O7EDqFJbISczXyQRurptr4BfyXHp
	AavrdS3zXwGoM11OYb/83Ct3sm3B3KlF5XCV8A6A0twhcRaF+SPKBJX4rKbwU0XxVZZKyPa40LP
	4XgWx8wFgmccuy
X-Received: by 2002:ac2:5b91:0:b0:5a0:ee0b:c257 with SMTP id 2adb3069b0e04-5a0ee0bc325mr1650088e87.10.1771828748858;
        Sun, 22 Feb 2026 22:39:08 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb13abbsm1369626e87.23.2026.02.22.22.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:39:08 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v3 0/9] mfd: cpcap: convert documentation to schema and add Mot board support
Date: Mon, 23 Feb 2026 08:38:49 +0200
Message-ID: <20260223063858.12208-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6992-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 641BA172320
X-Rspamd-Action: no action

The initial goal was only to add support for the CPCAP used in the Mot
Tegra20 board; however, since the documentation was already partially
converted, I decided to complete the conversion to schema too.

The CPCAP regulator, leds, rtc, pwrbutton and core files were converted
from TXT to YAML while preserving the original structure. Mot board
compatibility was added to the regulator and core schema. Since these
were one-line patches, they were not separated into dedicated commits;
however, the commit message notes this for both cases.

Finally, the CPCAP MFD was slightly refactored to improve support for
multiple subcell compositions.

---
Changes in v2:
- fixed code style
- rtc conversion was picked, so patch dropped
- added audio ports description into mfd schema
- splitted schema conversion and compatible addition
- minor style improvements and typo fixes

Changes in v3:
- added regulator node names list into pattern
- filled spi_device_id with driver data
- ADC patches were picked, so changes dropped
---

Svyatoslav Ryhel (9):
  dt-bindings: regulator: cpcap-regulator: convert to DT schema
  dt-bindings: regulator: cpcap-regulator: document Mot regulator
  regulator: cpcap-regulator: add support for Mot regulators
  dt-bindings: leds: leds-cpcap: convert to DT schema
  dt-bindings: input: cpcap-pwrbutton: convert to DT schema
  dt-bindings: mfd: motorola-cpcap: convert to DT schema
  dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
  mfd: motorola-cpcap: diverge configuration per-board
  mfd: motorola-cpcap: add support for Mot CPCAP composition

 .../bindings/input/cpcap-pwrbutton.txt        |  20 -
 .../input/motorola,cpcap-pwrbutton.yaml       |  32 ++
 .../devicetree/bindings/leds/leds-cpcap.txt   |  29 --
 .../bindings/leds/motorola,cpcap-leds.yaml    |  42 ++
 .../bindings/mfd/motorola,cpcap.yaml          | 416 ++++++++++++++++++
 .../bindings/mfd/motorola-cpcap.txt           |  78 ----
 .../bindings/regulator/cpcap-regulator.txt    |  35 --
 .../regulator/motorola,cpcap-regulator.yaml   |  47 ++
 drivers/mfd/motorola-cpcap.c                  | 151 ++++++-
 drivers/regulator/cpcap-regulator.c           | 105 +++++
 10 files changed, 775 insertions(+), 180 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml

-- 
2.51.0


