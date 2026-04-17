Return-Path: <linux-leds+bounces-7744-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IINSHn7e4WklzQAAu9opvQ
	(envelope-from <linux-leds+bounces-7744-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 09:17:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C92E1417D00
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 09:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0E9831B248F
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 07:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995BD33B6E8;
	Fri, 17 Apr 2026 07:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SI7P61jl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C572D22541C
	for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 07:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409896; cv=none; b=pV322IULfHyZ6bXCUuCXq65ghQOoNwmocIiaPiwxWzJXjNYZ2YMWUNuQKN2c8YvRXTZl/vIS5zSepbppRpJGNCYt1zyw2SiY4b9PDDDRW5cKYJfrAgJ445zRtpmKFppCxWGnIsFB/18cZk3hBRXSHPKDlNFvVERtTdMhJn08fwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409896; c=relaxed/simple;
	bh=qsbXpuOcVi9cj56MTeK+/eFhyj6nGZutYjLNfesMxp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aBT26u3E0tz4NE/j7S0ehOo+5hhrKf8L/ggX7kKH3TF2RerBU/FZKwN98R6+td8+72MOOISohaBk6CgCSUqiZ9egQ0oOAWK0D56hf3TIgy2e9EIps0CRQ4JHSt9H2/vaHeBbFSoP4n5CDgnwdpj5qjb5vx7hkokXM6/OrFa58hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SI7P61jl; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so390114e87.1
        for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 00:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776409891; x=1777014691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YjBeGkQBcP1nglY4BuR0wBXskpEgo4GmwzySCtgIaXA=;
        b=SI7P61jllGAXMO46ful3G4Ix/gf728v4Nayw2VzCVpmeyoioMt5EFAtwtsCM4ww+wD
         y2S/Qb+43gwMCRS3X++egMpG8jvIL80/upD9iVT/uZbRcCvTK0anHzbHeW9uZKoXH/mZ
         eWiz0GuC968OxqdmV4+B6mhqQ2owgzCR5T+ndhiCtztXL7domQd+4c7qjmASTJwEDR+w
         o28OpUKUGB0Ur5kl/JQtydW6L861i6t9BUxXj7jHZ2xGsLK4yb/Xf27vXAQdkR6gXFxe
         wsAxdEwndX22Q2V5iKASPzXowQED5mlX1EH12HgFWOm/fIfN9qQ3/6hLksvnEoiCiMEf
         KHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409891; x=1777014691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjBeGkQBcP1nglY4BuR0wBXskpEgo4GmwzySCtgIaXA=;
        b=NdWok57LXm7JJVan5osJdlu4r0Zcpl16tYHCSdR4BnJaObteo120X0Bn31E41h6bQI
         LAkuuvlgjZjMrpqKCS4XAOfLYZME+IaUD1mKR5G88gV8yqP/ZnEkJtoDAeEuJwfbKB0i
         C00HYGVuPdtsYRXdiR2fB910vk76d3DMXRRTfSiGaoMTpGH7AwCo3yvqSvpJj89u+RLP
         kYmWCr6NF9s14SGnPv03zADHNfKdmkJKL9uArInYgjOkqSFQoXj035t3a/r08Qh8/oWA
         uwnKsk8ArFT/l9lLnBZCmORuMVUc8tSgdHlZ7Q09KXJUy+geWakmabejQ16DeoLfXWvW
         gMWg==
X-Forwarded-Encrypted: i=1; AFNElJ8FbLr20dnlrh2QFwsrk+R3q+JaGZYkWrMvptOo/dvK1KoXv87bOrgzjm9g8m3T3bcq8NKxuuu6K/aA@vger.kernel.org
X-Gm-Message-State: AOJu0YzJVoTeErYwmVPeolpmyY5RF8qPv0FfSDU+chiill4BvT85rwjQ
	cqNDPtMeM8LlyxZLQlXuEFMK70iU/PZesbiC5jmT0fCVAyYViuf31IgiHyT/mLXh
X-Gm-Gg: AeBDievdSRQj+VoBG7vQlosvEImM2vQzZG4yX/0UEru3Fu3NjiQ5GytiOMgRqylhehE
	qW5nUUmGuhvnGFCjXyAimwr/G8R7Rw0JJl6EldknQs5O2Dyg1eisL3JOIQf8GvfC2/YDtoonwdc
	dQTDnSWwI6Gr3B3k5tBhwmzsNiCd9qMnavTvVzl3t+PhVT2Jf943N/8azLY+DcSA+PcF6rNkN5u
	WIZdipSiE+uKoMfFSTrW3w5QN+aFl8hrEmUUDrWA4m9yUse0wF1e+PM0Hb1MV3AMpwP75B0b2XG
	eK7HMeBdkUfBa5NTyr8RkbQpU9323Z6tBfLXfUw2f6jwfKeI3NAlkVdhLQq8B2swTOIukwuuAtx
	9Mmezt8YXGhgxC7D9USlPnotOhOPll3FAeo9tcZv1hsH3zH6n1VD+2fanRRLBPciyfc3e1Xp/gZ
	eAVFCc4ZpnUf9wYj9HKH05mAU=
X-Received: by 2002:a05:6512:3d27:b0:5a2:b219:3eb3 with SMTP id 2adb3069b0e04-5a417308f0bmr463637e87.41.1776409890856;
        Fri, 17 Apr 2026 00:11:30 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc240sm162772e87.23.2026.04.17.00.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:11:30 -0700 (PDT)
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
Subject: [PATCH v4 0/6] mfd: cpcap: convert documentation to schema and add Mot board support
Date: Fri, 17 Apr 2026 10:11:00 +0300
Message-ID: <20260417071106.21984-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7744-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C92E1417D00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 .../bindings/mfd/motorola,cpcap.yaml          | 416 ++++++++++++++++++
 .../bindings/mfd/motorola-cpcap.txt           |  78 ----
 drivers/mfd/motorola-cpcap.c                  | 151 ++++++-
 7 files changed, 623 insertions(+), 145 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt

-- 
2.51.0


