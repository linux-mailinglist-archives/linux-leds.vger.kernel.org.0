Return-Path: <linux-leds+bounces-7886-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHaCM37U8GkpZgEAu9opvQ
	(envelope-from <linux-leds+bounces-7886-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 17:38:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F334880BD
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 17:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B54BC3035A99
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 15:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7E23932D8;
	Tue, 28 Apr 2026 15:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtfWfNKP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9072A35A384
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390597; cv=none; b=PKwuOvam8zRGXz5J5nhCaCCLtnO+paZlzd2oHU8cuZGeHhwwXSKuAiRidEUi8wWxvHVId9Clvqw62skQv0Tf1emXpaZcey+KSMJt7cDlbM3FWpS2c8/yItUoSeRG2kYRV1RP6S5XubsgTRg1+p2L6FkK4+m4Xo79Y3GpmlQIX4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390597; c=relaxed/simple;
	bh=DS7IGgGnbIXdTV3Ckzjjp/VaA8K3sQmCMzuIXSeyGfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NLei3ysh99X+s7f1YITWhe+jkKttFJSkDFMEXgzrGLedLCCR9VFTh+/6SUhb2cEb8ACWVKRQzA3C8ONBGLD5jnQRHYMBZGWEkmQuqZwe1ljfE8No9NMwwYT6MTBTCD2GWOwBXAY1IDFUBACoAUa0vRiNxsw4FqXgq5SO2BkHNo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtfWfNKP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso79946655e9.1
        for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 08:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777390594; x=1777995394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ptl6Lh7lPIlpY98SxXugxOD9pHianxtP6o9VGnO134=;
        b=HtfWfNKP+FzEIYqUx0AKZvRh3pQbWZzYID3Fk6aRmF1ChVYFf650ZQF/myLrhUf3x4
         k2RiOmnG3G+1NiEn6gXaL+ILGh6IXxZJHhTth7NRHJMR68lH34tXhbG2KPT7UDZTGlw+
         PwpGBYPfr3/q2DLEe2f8D/kPuqbqZnuNa9gN+XdVtrZ87qMs8CVPvlMOdfesODx7Kgwq
         Nx0L+iMFbqOk4PUGo6JS0mXENafaMzVU8ngmN15368JbOHGPBuc6zkSS3scjOuMiwwpZ
         Xs514eCjJq3GLK+7SUwDFVBBrBEJaDb4sjeZAuM8IkiijZUuzktoitgVNnj+BQoIGgax
         d0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777390594; x=1777995394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ptl6Lh7lPIlpY98SxXugxOD9pHianxtP6o9VGnO134=;
        b=gxSpRnjStCppAYAS+Bn/A0FZiq+EBVuSP0pDtxPqYQluIziE9uCexG3dGPUr+ZZP0Y
         Xjerpmk65coKGpEPBkj4RE4nRAndhDMOxHfbOWkkyub817fuMJqlSwegg7ao6ZWW3WCf
         iY5TcKkI8gHcqQtih+v2HqZ7gmWTumVC4EvtjJjB1YYX4TQ6nneYc1SXM856ohfURC8H
         gF1wgxnF6BM2PnODrvnLXj3omP/L7aHN2XL1AHwKZlCjFaiR+3aTJObL2gYfc+ToI0Ak
         LuuSBTeJW+mou20eTZa7vYIctRU14qzaK1wano4U6pkt86UvAU8ik3T5CwecbqrFyOdB
         ViGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZlC9JiWen5iIJHRL+hXoloEwxqZX+w79CcUtKWEc5+8v+obw+lws1wnKxk2ea9GHY55xIONePBBkE@vger.kernel.org
X-Gm-Message-State: AOJu0YygLkIrcbZDAa7GfyoxD4pQzfkK/GH0FulvWKw2SDjuIqj4WzVr
	r+z/e1vgebNtJW3TEWrnTtUXHW+ww5bHsbsemXCH3ccWA2ubPUh5/sMN
X-Gm-Gg: AeBDieufj4MEbhnFrBjcIOay7erShaqO8d7zzLazSy39o11kheqQ0iIxGRYB2siBGl9
	yOrGzFq39q+jPADDVdMA6hg/Tnpc/PErR9PXgbxASzWgw+qn+eeKIXdDFtPUcl/39T6tpiHGaLI
	9Q0syO+TCn2hg6VoRa2kuNOoNegA05JEz6u3stpmBk+OFynLC/PkDORZYqnYN1XASWQB5t9uvCQ
	lMmAZ1ORUGBO/W+rkjlWJlQmTtPCzpvVRTadjFaTEalhLZaPHDHtjSwmDZgWYlAOKp0IFzGEAoa
	sN2hBK13wQ9A7yfZUH0VJMieaArmVK2YUTMFBqylfIb2mjeAzphxmA0VAAQW1pREviOJIgGBYOL
	U4L0sBR8erQdjXaXDMokmxKJUB0vD+9yaJhR/NeLNaPb9I8GdaTfHoq/gGTtPflA0HEOj3ezcUt
	rfQWQGgyDKwYD1HlwXSypNbFk=
X-Received: by 2002:a05:600c:c109:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-48a77b179ebmr44911195e9.19.1777390593844;
        Tue, 28 Apr 2026 08:36:33 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b56c2d0sm1358875e9.11.2026.04.28.08.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:36:33 -0700 (PDT)
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
Subject: [PATCH v4 0/6 RESEND] mfd: cpcap: convert documentation to schema and add Mot board support
Date: Tue, 28 Apr 2026 18:36:05 +0300
Message-ID: <20260428153611.142816-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 64F334880BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-7886-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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
 drivers/mfd/motorola-cpcap.c                  | 151 ++++++-
 7 files changed, 626 insertions(+), 145 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt

-- 
2.51.0


