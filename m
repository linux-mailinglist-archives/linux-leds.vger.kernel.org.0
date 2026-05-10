Return-Path: <linux-leds+bounces-8065-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gRDiBzRnAGq1IgEAu9opvQ
	(envelope-from <linux-leds+bounces-8065-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 13:08:36 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A66F4503B3D
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 13:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C0D23001FED
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 11:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4889237DE9E;
	Sun, 10 May 2026 11:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwL/I45x"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD55B367F5E
	for <linux-leds@vger.kernel.org>; Sun, 10 May 2026 11:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778411313; cv=none; b=ZgxNXExoF6frSuIOyL+OmQ8h7F1OeCYLB5+A4bWR8KYz0KCfBR/mtHWCULRxsv0ilakiaRxSc+Rn4WRMVAQh8pjyiPkdGH4XeVq4QDgQ2giacRS34OxXE1BORiJzIZLLsojh7uyAIm1o+ggDlyNw6TNQ0QYf4SHtJA4cncHZuOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778411313; c=relaxed/simple;
	bh=VZr/KgDt/hGxG6GZ4EDdLnrAIFerfJ7PgEKpMx+t91E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b1j3vZQt+VwcPE9kbAtDUOEb7nt5NzKhoUBhygC7aYkHQRpzMQ8AMWD909/dPDmVsSVcITJuFMDYHjq8mHyzQKGStK/d81VapfILVNCcrzidEebhZMwAfqum1xvl6VeK7DTM2i8klWABgg8QJ5JXOJVH/MzToiFpdNPzBHywneo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwL/I45x; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8f9568e074so526560066b.0
        for <linux-leds@vger.kernel.org>; Sun, 10 May 2026 04:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778411310; x=1779016110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w7VsOIce7RBjPGjcbUBZuNu1NQetW/4tiS7UIOUx/bI=;
        b=BwL/I45xrnylbMqje1bY0+ecBHS2i5T6II4g3p6x4SZpptZPt+nVNYhzfHK/36i2n6
         SzuZQGyctdMCvxKzuISXL0tZ8V3+e4C9x0eEQ9hNfyACkkyBjn/exrp5kCFti5eUG3Cp
         KftpP95gAb/SKaXLrdXgJk0ZCD6p2aADJFWkgW7dHKQtjUKcFQXkE6hv1rawZcDsLHpl
         2+M1urt3dFs4U9HdEhYtyPRXQL1pysQBahEVJ6F0OEgGC8RHA1U6FzF0Xwkn0Dtz4Q05
         jjBvhpFFSca6cXG7mlfyQJMPVwLtSaFj1We2WZE2ROIvG/7za6csN4Yrn4NfS7gcDkvR
         Ablg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778411310; x=1779016110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7VsOIce7RBjPGjcbUBZuNu1NQetW/4tiS7UIOUx/bI=;
        b=lf87QuZP0nyzFqntZv57CwQocfg6ZA3+0huLRgTUFfri6hb6B7Whi2pIFJfKBeGuPy
         mwi5t2Qk1Cp8OGYyTCD/WjcOLBj3EnH2wesI3nVkX1tvUhwbXpR+cKcPvvn/cPAhDdR+
         8U8JcNaeM6tbMZTyaHm9+3HqYem2No4dReSeADylLvo2eDZDcwxyMhppQrDhPGxtpEHO
         2Hg0U7aW05dhXEPZfMoo42GZSBA3jYRR7tyjaiUHu1wTG02FUCZc9Dd2ai3bK/JJJ3rj
         X+paw/90S76U1K72jiNoft5d3P68vQrm06P0GcYu9RQV2HnTq83zEuHuE4/9dVn3ZWno
         kyag==
X-Forwarded-Encrypted: i=1; AFNElJ/XNk7wM20WBdwHlZqo8zBNT3p8ps/5xOhvWQfWNccaGrxLWUT+MzYkqt+9VkGWHTDnwKleFEnEm0xs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8EBuEqpSEE/4QYV6q1K25D7zdvZLIV9bi+oxJZO37yM1s2Uvv
	B4KjHuptyBHJO8357Red7RMjU7EQjtDVnCUR5rrMg9vd85a9sxHRBdUB
X-Gm-Gg: Acq92OHs4vsAUHxI3OeJxqViWVdeFAeSYMoI69gFGKuM6E0fAJgPlZbtsbR22qyohF9
	ZPtVZQrbJZ8j+h8ThCEFEMCQStU+WPm3ZSbC8d8sJ+fKhMOda2oc/j4BIZmHeIMo2WU/IpyKghB
	K2JCRIKymOX7Wp6Tbq/eMwEUUA+dYu+iE5GqUsnEbpPG8TcTdyPfE1ccZLRwyyvCmnsq2yPGK+Z
	Iu4xt7TbsE/1Hi7roueQkvbQ/EHY4lJiiLnESq3p7/VNP5DphOlZs1lpVO/wmDJIlWeru9ZGtpM
	S93TSnmJ+CW+jPmw1v0mZwtjSdsAakgrV3L/WEDJOGo7dQBslPMKg/VL0PRHAo4kywA4aLi/U/T
	z2OYTez212VZycuo8U5MY8pfjk5a0Tdd4eWBJvOZuzD3a4I0Vw8lmgh9vyHL9w44ZhM9zvhXcJE
	rXsqMJ/4koIwoieDd6kpI3GZw=
X-Received: by 2002:a17:906:f58e:b0:bce:e7ac:3682 with SMTP id a640c23a62f3a-bcee7ac45c8mr61385966b.33.1778411309862;
        Sun, 10 May 2026 04:08:29 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bce7a3fcb57sm68146866b.60.2026.05.10.04.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 04:08:29 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v5 0/6] mfd: cpcap: convert documentation to schema and add Mot board support
Date: Sun, 10 May 2026 14:07:58 +0300
Message-ID: <20260510110804.33045-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A66F4503B3D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8065-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.975];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
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

Changes in v4:
- dropped regulator patches (applied)

Changes in v5:
- switched to MFD_CELL_* macros
- switched to use determinator of model
- switched to spi_get_device_match_data
---

Svyatoslav Ryhel (6):
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
 .../bindings/mfd/motorola,cpcap.yaml          | 419 ++++++++++++++++++
 .../bindings/mfd/motorola-cpcap.txt           |  78 ----
 drivers/mfd/motorola-cpcap.c                  | 172 ++++---
 include/linux/mfd/motorola-cpcap.h            |   7 +
 8 files changed, 611 insertions(+), 188 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt

-- 
2.51.0


