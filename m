Return-Path: <linux-leds+bounces-8238-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCXDAGooDmpq6gUAu9opvQ
	(envelope-from <linux-leds+bounces-8238-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 23:32:26 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4AC59AFE1
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 23:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FCC233CE01D
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 18:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34213D88FC;
	Wed, 20 May 2026 18:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzNk9hke"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD1B3D1CC6
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 18:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779301398; cv=none; b=O+UAHfXOBKD2g0hD9RhzNe66Fk3smBKc+CSw+iM4pRThqNvfRQBip6+LfLh5oa5nmdh7skLYdHmMxyM8YHcABhvcbluxA2admjrDqM74/BSor6QYL+lDV5jne3FCnak7VBRm7M6kvSa6RbmDq+fNs1iih0ohwcWcnJc8qWyYDKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779301398; c=relaxed/simple;
	bh=u2OLiahfl07CNATXuFabWWh9FHbJAKKwBhG0BfZL37o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bh3UNj7FY+zzT8YLd1N14i/2snHTSQ0HE5qxYzPZHcyuEzYVDdJEalKQjk+tZ5UacaLdTr8Ge8Na/pyQH+wlgCq7R1AAY2ZzgqoktJBk5/7u0Lf/M9Apk9WXjmPo2lwNWzWWA1PlNs997T8rf9Dc/j1MHgTbalJTTwATh66DYxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzNk9hke; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso4859894f8f.2
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 11:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779301395; x=1779906195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YOOkfLDGxoFwS+H8nJxSYqxjZdBzyZuCgc0/2jHIOOo=;
        b=DzNk9hkeA5tH0IcOuG4LNn2Pt1H0Baagmyfj2myXoEdVJb2uimWH2UhtK5DFJ18l6R
         ZTrq93rHGKC9SSzsnDKzepy4pQ2XDUZufdlmHO+dWswFqHTvKbN4QbfZ0m9fayvUVyiM
         rMC+LtlKNPVPDW4oQV7aEbyuA7CRxehWcmlzhD/ZZrDRWbZiofpj+CYM4qg8yEf1sOG7
         GK1IcoPIhyTQbtsCZ05fYuKYuD+yeBgLl4lBMUmfSqPORgm4rnAs1peUog0OACwvYzO/
         ZmcgbGwX9cysd2hcKbfYXz+k8IHruYhjZavmIaOLo86hMvylXAaVvge8VK5fRm4dPp7a
         9qkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779301395; x=1779906195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOOkfLDGxoFwS+H8nJxSYqxjZdBzyZuCgc0/2jHIOOo=;
        b=UH3ZrYAnUJtKiysobkfzK9rtRNf+bDIpMHkv93fVH1zOMAzgHWPqakUM2hSYyVKQaI
         Nm/mAsYJJ7STqcLLWKzX/FrdxW5vRJxBoyqOusXxCsPeGrpzpcpa1o++AbMi9+JB8xpi
         Qle0Gw558QhbHt46Hm3FIxjvhAPBz5TzT4lEYdTN6VB5z+zC0N+K0R2/eNBBPC42Vc7h
         TCrBS6ekdgF3XeTNObmWi6SWbQMliXpWd6yBCHD3N3Tu8hgNTU+EBkEi9/uKZM66owAx
         m6m9UPIUQ5hD1g4Hqgn4sZsc16hSbpIEyGx6wZT/mrjYWOrF5oPBuU5gSEAJRMQ6ePyE
         9uHA==
X-Forwarded-Encrypted: i=1; AFNElJ9zjvHncmAGuspLO8w+S6urhBMjAkhTVC+Wxhm8Q9bvRNg1GWUFTnq9Hv5QVtuRE44OCXKQvRW2StcX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8lGos3FmdPn0ZkbLxAOgK5NuHCEYYcIa1+mQ/xVxGkVPXBjpO
	HG2vAMYPJCh9o94NpYfe/KUGdzWex82kjgDxOZ4MzvxDdOYIKn4/PH4B
X-Gm-Gg: Acq92OHgv5/4Gmjy8cP5amipouz7Oq7Q/c4nxOQv+FNM43ao4kkHvrAf9Gc55RXVIEl
	huGZiEppfEv0JvHLYuJHDOAOlDeA0aFPDFs58a+jWdG8pkavg1gUrZjC7wJAkyWqWPDOZHu+Pw7
	6BIDe7s4opfrDWuxHMtX+liCwF/R5twluoWWFzRL2AvQENjx8PpFkymvD+LLvTcV88hzPf1LAgL
	9zElPUvg5LIYr5R+phF60fhsOOmgwcUZg7IndcRpz03oq3JtokS79ISB/ZDJ3xmrPwyzBgSFEpM
	TBaoX5cFD8ggfg+Qol9UBmTbrf7pyQCUu2+FHyPGxVAYcvF/Et8FkcE8IU9aLmKKhKci0iEZV44
	Mza2TMSxxM7Lypqhr6Vpbnz0dCApUEf23xTZJszUc9uxCWtp2M5Z6vHP+D9FE47YEjWJa4xHg6k
	17+MvZLB/z53VMilQvk90ddtQ=
X-Received: by 2002:a05:6000:2f83:b0:43b:3d02:7806 with SMTP id ffacd0b85a97d-45e5c58ed80mr42266150f8f.28.1779301395198;
        Wed, 20 May 2026 11:23:15 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3b18fsm51297739f8f.11.2026.05.20.11.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 11:23:14 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v6 0/6] mfd: cpcap: convert documentation to schema and add Mot board support
Date: Wed, 20 May 2026 21:21:18 +0300
Message-ID: <20260520182124.117863-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8238-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5C4AC59AFE1
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

Changes in v5:
- switched to MFD_CELL_* macros
- switched to use determinator of model
- switched to spi_get_device_match_data

Changes in v6:
- removed address-cells and size-cells from main node
- changed macros formatting and OF matches
- factored out common devices and made device addition staged
- dropped cpcap->variant check for 0
- EINVAL > ENODEV in variant checking switch
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
 .../bindings/mfd/motorola,cpcap.yaml          | 408 ++++++++++++++++++
 .../bindings/mfd/motorola-cpcap.txt           |  78 ----
 drivers/mfd/motorola-cpcap.c                  | 143 +++---
 include/linux/mfd/motorola-cpcap.h            |   7 +
 8 files changed, 571 insertions(+), 188 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt

-- 
2.51.0


