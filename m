Return-Path: <linux-leds+bounces-8271-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBqGC2W+DmrXBwYAu9opvQ
	(envelope-from <linux-leds+bounces-8271-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 10:12:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 825AA5A0D16
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 10:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96705305650D
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 08:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A4C3A1E72;
	Thu, 21 May 2026 08:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vtvf0w5/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FD439EB7C
	for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 08:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350886; cv=none; b=m+IoBwzu/E1vNqAXeVeiGvMZ7soZlwz88U6W4eONr0CYEPARPVJZFV+sq4lVODzbp9txTtAPDsAB0LduZi8gMC8xGqvKNletOrPQCr33bxta1mPh5O2Ho9xpPaz3Sz2h804JTfLYfH8OUX9QqPRKjeTse8+aEAB5BF2L18ev2tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350886; c=relaxed/simple;
	bh=YBbY9olX8HOO1A5gzOhDFsNSnz9cTCkzfdmYMvhCaEU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=obT3KHnDuhAwyyYoaqnt48erh/sUeaNUPSymmy/KyQO5yo0KSVvEA7Fopur6Glfgbk+zArO9DKZkcEZrDbbWiSPB2k1PmLHelhE+fxocUaVuYPDDukTvWCYtrax5XuVlK6pWXwCK4VeIIuHAIJfUVV/ngD2qzcwXuuv2/1Xe+so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vtvf0w5/; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d73422431so4038916f8f.2
        for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 01:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779350883; x=1779955683; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VsyjDgwHHARWnP4+ZoDcZHojZF27pffHLJUGeT8qjE0=;
        b=vtvf0w5/gfVzvGxU87mOct5DgMViF25aL3wLPhijBGJJ/W9bCmoXXgxTvNxH7aSqzc
         dmFlF92FiZPROfe9ftMQs4KIW8IwhiQrCoBtns8AW1Q2xEpVrC4Xw0sv/NvW1Ud+EAcu
         TORBZ8b+WOUHSDsZNMfNDYWFAIfunWoBPEJUa0Kt3bnuTdV0epANndjiSdcVtfw7aA1o
         rWSpnly5OtTs+zVqtpn6c82Gj7h7jXFIgi/YreVOMvXxlnUG7HWvao8phx7HQFqGEPUi
         tfzraJyahI801X1NyG1HWtqRCsA3Hx71zMGnax2RzV5GTJwDBxVLrCuzlS8VJMSMh8GA
         saxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350883; x=1779955683;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsyjDgwHHARWnP4+ZoDcZHojZF27pffHLJUGeT8qjE0=;
        b=exa1fzE1HCejJJ4k1rujibn8EfWLWttYOuN8wOwEzEBxESwBzh1nSX+v4chUU0lC2W
         amymwUULTn8Y+8vcCqjim/nwzB1YQ9RXWsdILvKjnGXchpijpKWdeB20peMne891z2hT
         jy417gJB++k6YzwhehQpr8GOEVQquEuDlFg453bOr2FHFqxF6cRdACyPahHTm4aBn1r7
         uXl4yR1XjcePStMXieu1pqnyzXpXFYcDi/KDY8RPy9ERXzMDuxXMif9Qs5WZXtPMCidQ
         55UEpuqj7RDiaxH2CXFDXl0lpJ/cm/3OTjGfB4yvr628ke+JD/zQkiOElsAuIeaEnG/V
         wPuA==
X-Forwarded-Encrypted: i=1; AFNElJ86xaGD1XZdNJgwkIZXdqZRtjfozLIqCJ62QbNO4ob6s5RNdyjlnyMl2GcsPaXGrQkUhCnYjEAVZp6l@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5H5+vpXLB0+k3nvbTUnTg7lfxD2sBiqReizHcoy3S0moa8sSV
	+efKIvowtJcQkbWOjjkOM8Ozw3C4Zg9EIWsnbThhAxtHX0OVnmjewRaFIqs+bWRreIs=
X-Gm-Gg: Acq92OFgzZViLzwy6wsWT//u2ZqLLQbjVyuv/tslfkUxW/lKvlCSO+dfK+WMKfpE+jJ
	hX37/GgD6TmjZe/SiUZp7Trn5CdNEtFzeJ6V4QJ7U7Y67T4bo9cAMqYiZn6FHI+Idtoq2Uy0ukZ
	OxT7v5vFt1HPSpY8AjBlrTk6ELxvLssA3YJFzoGzq4e6LLufs8G++y7svHDeLIg+YjIsFWQ8g8M
	5ayFYozgqJYOCu5sJJqI0oIf1DrFGbpidrsMCxw6/NqnMY3kXuEQsYFnR03EYyOUmFETB/qJSTK
	nViIfzB/FyNMPz7h34o637BSDdUqoTnVWi30d3z/+z/0u//0LPoylCRAefj41G3P8Plp40o3WxR
	eAHewh9Xe6fzQV5f8NDuCN4Yd96gq6OV+vCf4IpgRahkT5IhdDc75CDRGXb3+ncIYGkrzBZd90z
	1HcFO3WQVkc1rGH1nB9juy8y0nXpa6RWy07tdmw+IHk/0vAuex1lh0WlQ=
X-Received: by 2002:a05:6000:986:b0:441:1e41:194 with SMTP id ffacd0b85a97d-45ea38cbe46mr2942980f8f.17.1779350883499;
        Thu, 21 May 2026 01:08:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa92ca4esm814369f8f.22.2026.05.21.01.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:08:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/2] backlight: Add SY7758 6-channel High Efficiency LED
 Driver support
Date: Thu, 21 May 2026 10:07:59 +0200
Message-Id: <20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-0-73c732615e4a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF+9DmoC/5XPTW7CMBAF4Ksgrzto/Jc4rLgH6sJxJuC2xJEdo
 kYod8eGBa26ocsnPX1v5soSRU+J7TZXFmn2yYchB/W2Ye5khyOB73JmAkWFShiYwugdpLOpNIJ
 d7EABxuA+aYIkIC11rQ1INJyo7jkJzTI1Rur9933m8P7I6dJ+kJuKXRonn6YQl/sdMy+9f07OH
 BDQWduR7rtWiv2XH2wM2xCPrGzO4ocq8UVVZLV8o7BS2FHzR5VPVfPmRVVmlZzhjWpbZ4z+pa7
 regMKkgi0lwEAAA==
X-Change-ID: 20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-3081ee7f1e25
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=YBbY9olX8HOO1A5gzOhDFsNSnz9cTCkzfdmYMvhCaEU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDr1hWipqu60COySXeKJkvQ84kMBCE8ACnzZjFmO1
 /Hq8EZWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCag69YQAKCRB33NvayMhJ0ZjWD/
 9BwlD5o2k2ZD7qroIiXcIjLh8l8FZAoFYMbaKdF3Vd7NWdusguE90ZJxJKFwOyOL0iPMkWWJTlUDDA
 JKAe5eAna2ZGiBfiCSKPl6cpOZk4Wzd3mAl6+7JHZVD3a/UMcQdu9feCLToqexyKZy/URYNMbLTtRB
 8gT5djk5NoHSiGVBxKdRmCb9Y/EMrjNxKSc+b1lTi9YJIm9UVfrjivmGPDnFSoJJBQV9uIXF7L4J/I
 kQn4YCf0XfTyNiXQKE+H3cvxQa+WuUf6Ippe2oq2WAXzhJ6XIQHrrP5Z+Ucua2H5wNsA4V8UGEO+vK
 K6u1Zpht5sNSX3qBrAC17W3LJcWwDD8ceZbJ483a8qSjH5Qc4y5Kop5+nt2IX9bJRq73jYudP6iR3G
 Lpy7FwIMgPYKbVuoD5esixrkbq84JoMQyhCKAIxIcMIOJyM6pLhH5If6OzYRq4TVJOAp5EmsIN0e0d
 5F/UTpN8cpG7sQAX4wySw/2m/2rgcPGKsxbbdJhn03emVEawhmKDbb79oLWaebgSQZBPDxiQX+pZ+x
 jsF6rv+tlEGiwCkEhpZWZy2MNSpaVdbwZ4kk8P+ZDF5tTBQEWrG/O211f8J7Mxwb4SNLtjsPJiCOdT
 l+6kr5icWtjgphddWAeEXo1cMcH6myhstUuXrUAeLZCF6cb3F1R0mVc5VkYw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8271-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,outlook.com,linaro.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim,msgid.link:url]
X-Rspamd-Queue-Id: 825AA5A0D16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement support for the Silergy SY7758 6-channel High Efficiency LED Driver
used for backlight brightness control in the Ayaneo Pocket S2 dual-DSI panel.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Fixed Kconfig typo
- Remove again unused macros
- Added delay.h include
- Link to v3: https://patch.msgid.link/20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-0-ec8194bbc885@linaro.org

Changes in v3:
- Dropped unused macros
- Added second autho entry to match header and commit message
- Move my signof at the end
- Switched to flseep()
- Link to v2: https://patch.msgid.link/20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-0-308140640de9@linaro.org

Changes in v2:
- Fixed bindings subject and removed "|"
- Added review tag
- Added higher delay before reading ID from HW (100us was too short)
- Removed probe defer if i2c read fails
- Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-0-0caade5fdb32@linaro.org

---
KancyJoe (1):
      backlight: Add SY7758 6-channel High Efficiency LED Driver support

Neil Armstrong (1):
      dt-bindings: leds: backlight: document the SY7758 6-channel High Efficiency LED Driver

 .../bindings/leds/backlight/silergy,sy7758.yaml    |  53 +++++
 drivers/video/backlight/Kconfig                    |   8 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/sy7758.c                   | 259 +++++++++++++++++++++
 4 files changed, 321 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-3081ee7f1e25

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


