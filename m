Return-Path: <linux-leds+bounces-7830-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rMYNLVEa62lTIgAAu9opvQ
	(envelope-from <linux-leds+bounces-7830-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 09:22:57 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDF545AA44
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 09:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63BF43006B16
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 07:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4773636E48E;
	Fri, 24 Apr 2026 07:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bm7tURmI"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C1A35A385
	for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2026 07:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777015372; cv=none; b=H9DqJLAQmUdX9D/IZb62uci4c3bJBondskl0XWD+VEbRunjvWbRc0TIT+JLg94bIMXxD0tNJgprP3CVAhzbiEYD9v18ffxPw8/NVv1v3A6/bZkTYfPGwE5eHT6MMXeVrb4+NpxjWSz8Hr5Yp75c0g0srdowX1Qoxu0eyLz+nyWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777015372; c=relaxed/simple;
	bh=LGgBuPl13OVCqY6MyycN+/CmKgvRl/RP9kAEoA1MlxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gj7fE+UPL/Aa4stnuBF2TU+IShNGCwpAggRGMAV+kC3+SDfPjsV0E6hxVltQj7KX5VtMgjT8A6UULXgnAdxcXa6EXblRixHPbFe2xoghcl5MGgnjV0cdCgtn7L+34dQnOLFcob6F3smm/1vYl0YUveucngFo2hog0x7l312qCew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bm7tURmI; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso6569295e87.3
        for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2026 00:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777015369; x=1777620169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hTQRz/Y/73N4N7zfobml6VuwnylLNpcaq2f4fU14Mdk=;
        b=Bm7tURmI9YwYmJIF4TJ+BX+QeVrvXQ7yMqwqeCh7Vhs3SO/AOFpCsGgUWLFLxVk0UM
         br0pJNhlRH3GTyGWjvvsQTTDR4azRgvFosiQJaBCpIWKOlvYL48wZEBfO7K/krR9vwTg
         vajxqXhPEQATW+rxWojHu+F5Ezl5qX1fzJQSLCuzXJTR82QDFdJ/Ks+i8OIWNsyMlsMa
         /dbktNb6rjii4z4yZY7GL6IiJD743HiUu/Fl/zTQZE5qdScUqXVfXn4Moqu8LQI/FCRY
         o1808CqS194iXwkBAXsuclBvL2zf5i6FnwkCYwFBXbqWRhYz/qajEpeIzB+PBJ9IWRe0
         AHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777015369; x=1777620169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTQRz/Y/73N4N7zfobml6VuwnylLNpcaq2f4fU14Mdk=;
        b=HzO0jt/6aE5FcE7FpPj2z4pnLKbe7vc0tCAqm/jL4l4pHm7q0jEdj9hf9behzjOV4W
         DT5FANgWxQg8JZggrdsV/YQmSA7U9AfwW+GPzIKO0KbYMOMxHxjOhXf5o+cNvfL5wCtr
         Ocj1s6+T88QSELWeL3jXO7MUp1btANpo+M+IUc/c0AVrZjaFGNZoG0U5qF8EwC6atkC4
         J52sgO231kALS2QNtBLo5Gr8nZMGXCnzU1rokAzhKhYGGNS3k6n/mbBXkhPYnOXKPeP6
         a6yEjm0D4Vmz03HErnGskbXX6+IiBeeRb0r/FCIvZqj+752U5PHG4RcxM+xm6/UVEOAX
         xsuA==
X-Gm-Message-State: AOJu0YzTNhTsCP1g9Gy0/0joNy4xi8PWfLVP9GDE6tTQNrO2cjzIXYzU
	3d/oesPKKghO6i8R0W2FIyBtm8rHqgyP6MV2F+0G/7viNlmWobsLrMkc
X-Gm-Gg: AeBDieseUCvxoDx3GpRrIymQghJ4vTjQ6lIrYFCsdpjUirln6x/fXxrU23ZZlGHOs7U
	nF5wMOpkBKR9Dnlts8MTHv6e8m28rUlK4fAJS5AGBI6WenQd+C2mn3ZgsXYt/vFNybTlBhLt1BY
	hw0gDwmOYjUCFScvi/dILNpqpJ1Di+50mcUUvT/uMaKDHRvF68NNMv63i3HNXWNpffkOogTuhnR
	/OUxUqaUyU7fykqjE0++af8lXjI/NaVxt9KAUSX0xkGvNyJqJPGfM6/qvCbdd6WibF9z4d+jMUR
	+PpoMBfqTi63OxDjgoyq+UxMpKvaP0ibaIoy3y2jX67hjbSB7pstcDLlnmiAdDunu31OkzsRHkv
	QWqV4KbgX6VPKUckWExteVyg6zESlSBlmmDIPltpw6T1DKR0+QAVtvjGcArg8ancYEc/YC+kt8T
	xafRX12YAEhLZB0gOQ1UbLoH80dpSI3Xby6Q==
X-Received: by 2002:a05:6512:33d6:b0:5a2:c05c:1141 with SMTP id 2adb3069b0e04-5a4172b749emr10164473e87.4.1777015368566;
        Fri, 24 Apr 2026 00:22:48 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41a238563sm5612550e87.55.2026.04.24.00.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 00:22:48 -0700 (PDT)
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
Subject: [PATCH v3 0/5] media: lm3560: convert to use OF bindings
Date: Fri, 24 Apr 2026 10:22:25 +0300
Message-ID: <20260424072230.90354-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EEDF545AA44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7830-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
Remove platform data and switch to OF device tree bindings.

---
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

 .../devicetree/bindings/leds/ti,lm3560.yaml   | 131 +++++++++
 drivers/media/i2c/lm3560.c                    | 250 ++++++++++++++----
 include/media/i2c/lm3560.h                    |  15 --
 3 files changed, 328 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml

-- 
2.51.0


