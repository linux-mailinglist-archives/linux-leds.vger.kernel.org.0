Return-Path: <linux-leds+bounces-8730-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FDrrJ0vlPGoDuAgAu9opvQ
	(envelope-from <linux-leds+bounces-8730-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:22:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FA06C3B8C
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:22:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LbH+fc0m;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8730-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8730-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C661B3081EFE
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 08:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6EBC374A17;
	Thu, 25 Jun 2026 08:18:25 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CBB37F8C4
	for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 08:18:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375505; cv=none; b=FCUwvG7y5g6Tl7/Hn8VCn/pseZibwheBRnHUAGwzpZI6nhQmgZyDu/iJk0H95mgv5XkBJr8O+VQOSM6U51XwBcQs9o8bn45vQMStIWO1/7j/qD12+ocROPHDMxXOur0Tw8hw/rAq4yF0iUeLkFCsbAxY2M14rDR2pI52om6P3Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375505; c=relaxed/simple;
	bh=u2OLiahfl07CNATXuFabWWh9FHbJAKKwBhG0BfZL37o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=maI4ipyXiaASCosglThxZzX+Gn9cv7I4pZcBNiEfyABXdVks9/W80DYSpAO6YFsRLqEAOC0LRtQtYyMGr4p2ijL3aHVk4I6TkTvt44BeqpkPDJNiPBVFx9sar5pkmPRcQDzSczw6gqKP28SC+KD8UoiXNYaiZZzMJjnmUHzgvpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbH+fc0m; arc=none smtp.client-ip=209.85.167.52
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa61e3d3f3so1926950e87.0
        for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 01:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782375502; x=1782980302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YOOkfLDGxoFwS+H8nJxSYqxjZdBzyZuCgc0/2jHIOOo=;
        b=LbH+fc0mUpm2TnQ6mUFpSYq6mgq50Ar0kFsB5G02S9I+VZwPhXDUUKufv4iDkq/Jfs
         ybC44cwB9IzR48YxW7RzntLyAVaDeL1dwkssQjj91CYGK77OsfG9TUYHxvrbhnPhjd0X
         F8jxJkfGaJZBb91vpDx8icNjXVkLv+QYgMxqD897mtAlvxdO7hc69yG9ohflcVqja87m
         bIWIT1kAaH2wwvVK8VavuLszhzyXUcQcgv9+On9N5Q9kFedoXBARsX4ggE0mXz8IYDUC
         GNYOAy5xQ+ha2OdUUhgMHuf3JfclJPHjywRqJn5XcjWB87uvyR0EtFcme8Ks7mGCnBde
         jJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375502; x=1782980302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOOkfLDGxoFwS+H8nJxSYqxjZdBzyZuCgc0/2jHIOOo=;
        b=osBk4YWqCsuvKVkpOSwTF2EOydC21rnO3FZshnnYdd5O21wQeGIAhMazJo878LxXpU
         ybV0mETRP0OGBnKB5q8evAIH5TilNgSeQy+szbUmwvAalbrq9/4JfPsxEy6nCyqUngzR
         KGvIgukaiB92rV1jkmoOQgKvhO4k1amf3XeA8hO/I/KU5tApFNq/czrcKn7l1cEilbtF
         r17rIlKjpoLhRugdDsUt8gM2Lm70nAELOtoponGpfkCuBHMDbOiVAHwTFfzlQm0RUnoA
         xbTotRlZP2e7l4ZJOP/2PP8CGG1zcv2KJg9VRuHSguCj4oCebN0997Z65a63zcGKzkpl
         4j1g==
X-Forwarded-Encrypted: i=1; AHgh+RqkPAATdEPyu2rHKJifal1YCi/Vkp092lhzTxD6vUm34QJb1Ua39BF8LQPY8h3jqxKDuNlQj+t8QDvu@vger.kernel.org
X-Gm-Message-State: AOJu0YwT8Ea9IaqSgjjNgIauffu2rVJSETVULVMDdWx/oTRIVEgjwlRi
	ndoY/6qZTOzgir/vUkFUInNFXwPfXS+AHhRhKwiB6jSQ2evzI1dkaPsZ
X-Gm-Gg: AfdE7cmUxE8toRjIhzSzVCMD9zRzj0dW68zgUwhg73JQD543Pb9nuaOpRcWKevqE5Ef
	qmvcqTZRUOWk5ckfy7JOYSm2Y4qzCPHnaE4RDeCJ6w4AkmcO+PiRQsmfPgrcN4GAV3V2D4aq03Y
	HZOqO5BRDD2k6kvqHkvpRP006hkySC+81p4EVsPG809eO2m/Ywlq7PVLRqV9LoiccQ3aur5xShZ
	v8Mw57jDvGy/A8rKi+TdLpdq0Xm24AGCOmD3nBdMkHrEbX7vhuuvpqr040FQd9RsuQQreoT0D0x
	rDn7xk5UeTyOneN/6Fe4Py5P1YoxYwJRd4zOxb/QeCvEdIoBg8ziCBxLK1wv5XcyL4AFDaunTEt
	JC3nq/ojz4/5aTrfUoLtf7dbtFZXWldFyWT4Gej28pBbxzmFtVs1UbPfvlPi9kWKe6mmsT6M/NH
	KqgHijZzkgWkQuhHGCsdzwdzGTCxUv3DlFJ2SMVUsZwKH1
X-Received: by 2002:a05:6512:660a:b0:5ae:9fab:df10 with SMTP id 2adb3069b0e04-5aea1f63f68mr385519e87.32.1782375501911;
        Thu, 25 Jun 2026 01:18:21 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a268sm2464601e87.38.2026.06.25.01.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:18:21 -0700 (PDT)
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
Subject: [PATCH v6 0/6 RESEND] mfd: cpcap: convert documentation to schema and add Mot board support
Date: Thu, 25 Jun 2026 11:18:06 +0300
Message-ID: <20260625081812.33474-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-8730-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:clamor95@gmail.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23FA06C3B8C

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


