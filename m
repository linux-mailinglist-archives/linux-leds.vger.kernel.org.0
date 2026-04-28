Return-Path: <linux-leds+bounces-7877-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KbGCnKg8GkRWQEAu9opvQ
	(envelope-from <linux-leds+bounces-7877-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 13:56:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF624845E4
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 13:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A96C1301AB80
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 11:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C6F3B27D1;
	Tue, 28 Apr 2026 11:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rG4v3/aU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E73C3AEF4A
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 11:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376384; cv=none; b=OMu+cSTR2Uvcxez3bpjAxk78JOT5aL8ZQt8XzbBlpR7KI3MZBeodm+aE4rCxWLkX/k6fe+Q0gCSVoGv+t8tILticQ8fioG7B0zFy1d/9nb5gLLvXq4yJJ+q8W8k8AypFDiaCHn7/zQgXzGrYVPGpWXEZsv1PKJcKSpgSgVjvrdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376384; c=relaxed/simple;
	bh=ChWMw65YeqyD9gfaeuIOb4XlYPRZm/Y8ECdjzkRmwoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jw6fZRKrf8H8KJ7PIWnLD372g3zVEPs5SQeJ22CMtEyopNjuveOuyX5AhlpRIUXhntSgfWyR960WOBuY5ByAq4m3h4HotInbDy4ebmdZguluYzOUiVJHiWT/xSdcSRrSlTzzYWleuEZlsoDIMQvLFEDI4mIQ/5e5119HAZCpEfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rG4v3/aU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so193012395e9.2
        for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 04:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376381; x=1777981181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p4Fqk/R7geVowzIprCM3rErGlNesJ0AlVjHBY7TpeaE=;
        b=rG4v3/aUIXvGwPYBlUYjxlU5o4Dns+P1LGRe33Y+ufEftu3TjqbsaGig9hy1dDvn68
         XgsvZWoTpP+g7HUyDRSnNee7063RNlZpqo1CyZEFOTkSnlTI4qFAutQftKCgRhGOXYXq
         aSBeqw6HNz2dA4HM48dEhdfx0QZTOy/D+1bkRXsqYtG3ED+iPJiiZW4rOMBNHuORs/0Q
         XfVo6jKfhE8XlnM/vcgoU3BaER77NeRBO0FZa14ipPaXt/nJzjHxxXpq6mgJ7FCsSNLZ
         RCv/OB9tRhaZulMBiN3LnfNfB3U7SgKgu9TRf/hnyyMcG1T5YwiOudB4DtGdzbbCZUXg
         XdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376381; x=1777981181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4Fqk/R7geVowzIprCM3rErGlNesJ0AlVjHBY7TpeaE=;
        b=Je7J3HZANkjCpBwK9XGmBhAsBIu/C7sYzpetQTWTOPbtq7WY1AfU9Ki+vq8TxTrghP
         QieXWs2iboEylpxGcrViIz6/Zvc0dyP40mhjtfqNdVtji3hs7tpYoJIA0vit3Af/PUR/
         oPChpS3L9plLsDvu4waIecqm1phLTDvFJ8q5RmelUB0IDN/ij0VDyjZ3Bcx2LJoLZXKO
         1/0vdgRoSWnD0tZPwydtJG6bnwR6wHnfmZdAggRlYfxYWWSEdIiPuiGjyvYCIuX2D2Qj
         nwuDpnl6YIX7ZdA2sYP3+45j2ScdGYfR9p0HZFyeOhE5/hHroYBZMY3YMkmNn6DoW3MJ
         IaRA==
X-Gm-Message-State: AOJu0YxMLr/01L1m0MOwGmFCofXyoosHnVLh5QaYFCQ7d3GOvIREpoK6
	XhbN/1RC6wL2d93imnDYAb/bfa4GjPAPBaAfsBzfYIGfBIsrYtyfkN8n
X-Gm-Gg: AeBDiesa2bM+tBBnX1BblEDIJbR3NfdSH90aQJlzPWslmxjMW1Xi2/4d3vo+bsptsis
	hjk4HWdkVeNzHsdAb1Br5Zr5HBWa8G6SmEWvPUtJhenNPG12CAK0Cd5WSwQeX/KX1UsChcB5s7+
	hqF5nZKRGxlLe0WgPRPwPsyi+0gbTZwYmRZcvJ5TwDQHmUYSGVtDFlPd06vUE9zDQFKKTeX8XhQ
	vJhm7UHlGX10+PWZUBaFtT9Psppw5UXZN+PLuaCgw4NlxOw5kk5Ou/pX9lPycz+VFVvRbhEYwkt
	Guvm8KThiSdk6kUkBzA/sDY7Wk4R5s/ZgO7ARagLahFOD15+kBoXS/H9GCFk8i/85h7MY/zD/Z8
	OUSwwcSqHfumDt3gXq0JwbB3jiVt4dTcYdlyC4PFvjyLvzWkxIxpy/sTZNeZ02YcKD413H2kFtA
	iCzQgtWtVa6nitTIr/T32RvdE=
X-Received: by 2002:a05:600c:3b15:b0:487:1108:48af with SMTP id 5b1f17b1804b1-48a77ae5412mr47540115e9.4.1777376380816;
        Tue, 28 Apr 2026 04:39:40 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77aeb223sm43541125e9.3.2026.04.28.04.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:39:39 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v4 0/5] media: lm3560: convert to use OF bindings
Date: Tue, 28 Apr 2026 14:39:17 +0300
Message-ID: <20260428113923.112920-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7CF624845E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-7877-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
Remove platform data and switch to OF device tree bindings.

---
Changes in v4:
- fixed current being off by 10 in schema
- label property from schema replaced with modern equivalents
- lm3560_init_device moved before subdev registration
- v4l2_device_unregister_subdev > v4l2_async_unregister_subdev
- added subdevice cleanup if second led registration fails
- added check if "reg" property exists for LED nodes
- added missing fwnode_handle_put if device loop fails
- added bitmap to monitor configured LED id
- added pm_ptr() macro for PM operations pointer

Changes in v3:
- added note regarding lm3559 in the schema commit
- lm3560 power on/off functions converted to be part of PM,
  dropped redundant wrappers

Changes in v2:
- vendor properties swapped with generic LED properties
- added mutex lock usage optimization
- power supply and enable gpio commits squashed into PM
  configuration since they are both required in making
  proper on/off sequence.
---

Svyatoslav Ryhel (5):
  dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
  media: i2c: lm3560: Fix v4l2 subdev registration
  media: i2c: lm3560: Optimize mutex lock usage
  media: i2c: lm3560: Convert to use OF bindings
  media: i2c: lm3560: Add support for PM features

 .../devicetree/bindings/leds/ti,lm3560.yaml   | 133 +++++++++
 drivers/media/i2c/lm3560.c                    | 273 ++++++++++++++----
 include/media/i2c/lm3560.h                    |  15 -
 3 files changed, 354 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml

-- 
2.51.0


