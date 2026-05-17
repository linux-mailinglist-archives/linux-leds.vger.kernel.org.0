Return-Path: <linux-leds+bounces-8159-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNA+ArBxCWpJaQQAu9opvQ
	(envelope-from <linux-leds+bounces-8159-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 09:43:44 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 673E455FB2E
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 09:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F1C0300D31B
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 07:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98B23115B8;
	Sun, 17 May 2026 07:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejglwb88"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0EC2C181
	for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 07:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779003813; cv=none; b=dPp7rkSv0svgieIzol9eDUuaxmitPRRLrwDT5a3/E89NqKFdTE5Gnr8LWTBOWTYQW5iy4YumutoAGTUY73POn4+6lbFRqMnKwq2DN7LGLkO8Iv5qvGVPiA0ve07rcbxQD8rzlts6pge9DkD5fD2lzG3Pmm4YIwY9xJuEoy3z0mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779003813; c=relaxed/simple;
	bh=Y+Ex24d/as2CHkwX1uEjCtuYJgz4R8M4AkquqzZdRGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RR4qNvHeKMGe25q5JxovTZmgSOdrVxu2rS5pfpbSSlCOqDjjEpzYEMYripgZPBMImIWN0GrxWp/r+60kO3EzJBaw76EDFWx4s0cNnfNwiJbyr8JcPnDULl9vRxyHfv1636fV6A3U4OgK7Q9dveJWOaGW2Afe4uE7Y9nQ48/WHJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejglwb88; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44e1860558fso561074f8f.0
        for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 00:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779003811; x=1779608611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kIN4QPzSpV0aaXXOpKphRYVC2gTnp619k6g01a8YFLQ=;
        b=ejglwb88a7xr+VNBcXRowPG20Fb4Ffj/yk9XWlHVovJLEvHQb2KNJh8mqIuBs5ZkA3
         MXbCNva6vdDuvZKqNbQ6CeWdbTWCQUbtRF93XyKlCKaTVvuhsZig468MInSZxUKnsuJk
         4hmEiCTmAOIREGGzoLyJye8ZH7Nv0/kDGEWQ3xijEJ5+IM7bC6uAi1ReXE2jen4R1AVg
         W9R+ukHqmBVixMrZkq5fmohIsW/gRWZFVdjm3jhLLEtUz/ASn0aHUiNpo8mlUzMNnBZx
         7XBgDCLQoR62JnYpvUG5nDFbtJf46W9AVqQfOQEXT+ZhBiL6akdYCjgCYlFSOV52Loh6
         rkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779003811; x=1779608611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIN4QPzSpV0aaXXOpKphRYVC2gTnp619k6g01a8YFLQ=;
        b=iYhDDbnfTTt2Je4+Ms99LOT6Z0t1qgxgOuzaDaQls0fl4QFgXCWVND57pY/JtVV3+2
         TbKj//pEew3oS4N9YVtjzjJs2N4M8dP6Zr4TZq7VEwkLlFJwwowZgTEbNYlJAHhxkwBh
         ezS0t5MiqAMELkdnUxC5l/GPBjLychzOGPmLUjfvuNQiFyR/rgl8nV9LcO4jqDXrwGF6
         6FvF7YUVfBewQQ973PsFi9ru5U+v7f79cMFHeso/dcDQtgp02ukco7JkMfpEmhxJAmIW
         cUviDeiOdzFcUc84y1A8RbyOt7+FGXTTIOntZ0O1DTDoEEYVmz9SDoRRCUTdBGQcVZxc
         dtKw==
X-Forwarded-Encrypted: i=1; AFNElJ+1K8Y3GSeCTKRCUDCf2UTT8yXSZ0+ugO2rL8s1gdni03tjZO3iXiavGGSKhzYdS+JsWF5stbx+TIqR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/1M8596vFp6+rIvJO5lM2c0PquRtVv4JBHnyYBd1VYz37XtRR
	fc9VAaZmXpjdRiMxYtMdUQm8wKFP5pXI4GTV/bgGeDXn2Ulcq048JJZu
X-Gm-Gg: Acq92OHningJH14QFxmdWUq2momC0CyKs2Arf0j0ZX4WSuQBVersvnUZ7MuwzV5IKjh
	8aCYUDSWOQeXblV+dT0bMo6py38BrHUFxqG+FGCLw47yBx5K/WMnGW2euenT/43vSUk3zHxBIPp
	kUU7CJ5moZWqh/eg1GMaFKQ4G61I787VgNm7Dp1QRt/Q1aq/xamC9tKxA6859JIM37knL9ungng
	lm6qqZf2LbD7u17xIu1c14XUwoIfXo1ErWAKOY1Ph9FWC72WaPllrGp/XWVmHkDZ6TlyCdbOfTs
	3whLAU4XrQ4NV6LC/sOD2zl78D+VsaWErTcSn7ak6zJhHZBirsPso3n1UbVwD9XczHY/8eTSO0N
	9uDJpoET/o8Anzdc2s3QxBj+OoRIMPHmoItPgWF1mtOpuqtNzcfpah+liEwnvaseNMQQ69hU7wK
	1JQaI2Mo7n89cL
X-Received: by 2002:a05:6000:2302:b0:44f:c886:89b4 with SMTP id ffacd0b85a97d-45e5c589d83mr15861004f8f.15.1779003810524;
        Sun, 17 May 2026 00:43:30 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe248dsm27512864f8f.30.2026.05.17.00.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 00:43:28 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v1 0/6] mfd: lm3533: convert to OF bindings, improve support
Date: Sun, 17 May 2026 10:43:00 +0300
Message-ID: <20260517074306.30937-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 673E455FB2E
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-8159-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Convert LM3533 to OF bindings, add missing VIN supply, add support for
setting mapping mode and LED sources based on device tree. 

Svyatoslav Ryhel (6):
  dt-bindings: leds: Document TI LM3533 LED controller
  mfd: lm3533: Convert to use OF bindings
  mfd: lm3533: Add support for VIN power supply
  mfd: lm3533: set DMA mask
  video: backlight: lm3533_bl: Set initial mapping mode from DT
  video: leds: backlight: lm3533: Support getting LED sources from DT

 .../leds/backlight/ti,lm3533-backlight.yaml   |  68 +++++
 .../bindings/leds/ti,lm3533-leds.yaml         |  66 ++++
 .../devicetree/bindings/leds/ti,lm3533.yaml   | 190 ++++++++++++
 drivers/iio/light/lm3533-als.c                | 123 +++-----
 drivers/leds/leds-lm3533.c                    | 117 ++++++--
 drivers/mfd/lm3533-core.c                     | 281 +++++++-----------
 drivers/video/backlight/lm3533_bl.c           | 123 ++++++--
 include/linux/mfd/lm3533.h                    |  52 +---
 8 files changed, 660 insertions(+), 360 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533.yaml

-- 
2.51.0


