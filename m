Return-Path: <linux-leds+bounces-3498-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E72189E7728
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 18:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1D8116877E
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 17:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E9622068F;
	Fri,  6 Dec 2024 17:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mj1oHgD8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BB9220682;
	Fri,  6 Dec 2024 17:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733506087; cv=none; b=PooR24++k9cvd1viqdERlXyJ8TI3+LRUucK0KUX+we4nhyouF6sdLAkUhkOyyHrovJE2nFEGwKFfZkrAuVP4nGgnzUPAdissxQmwCRP0psmTmPldZdZEbeXzLkPl0Sj42xW9StN84hbPu9NXJYtckYRK+YDj2L/XXOkP0cPM0QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733506087; c=relaxed/simple;
	bh=HlaaRQW87AgnjRT+Y5IQ8DR+U13+RaTnBT1HpwvABQc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=kqQ/JJvDrVwgsRmlQY46jahsz6jlzdrRri6sitel0QRbUtHKDDtIW5Dx3RouOsIRm3jGWUQt5vf3t2g/GWvXn/rNaJhZvJpo/IqUP1pyXAaruhNgTyOZHSF31W/n0XLOAJ8AmnUeCTtN0ODoTjrpMLBZE/5wBN+rBd7PryotVfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mj1oHgD8; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-725c86bbae7so427630b3a.3;
        Fri, 06 Dec 2024 09:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733506085; x=1734110885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4y2ki+6zul3gbLgcnSK/uoLUEGgMXT8pqStVpvvXP2k=;
        b=mj1oHgD8pevLLYyET3hDYin3W3aTJ65MKzi19S/6orgaWjamY4/w/4GkNytlRc6CUp
         nB6FnySjx4yDH9+ebnwLy0CwcU5cZnvVa8f2HAVfQB85FoAG9xJs4wLRZPowrbILx/XF
         NHmDrd60mGbxLlGPaRBam3yGmn+NkbSZk00yUaiZV6rKhBjWcp3GlfzvjVqak3+urHRu
         cMIYgU4DzL+WkZAyde0KSP5eVy04DfqYoN35+MLOJDzdtdQxzdyptTTJbAp6wQ2NpRl5
         W7ij+WL3Bb4gMS21sPNMWcCgadE+4s1bAJwlMYwx7EyabOF40toj/26loKWtQl/LFRaZ
         b8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733506085; x=1734110885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4y2ki+6zul3gbLgcnSK/uoLUEGgMXT8pqStVpvvXP2k=;
        b=bHU4xnnGJ19CAI7XMWUyscesNLy74rfeMXR0fWIk5yUcanNso/OiWJSTqBwgwhiy3S
         F+jKz3eYCxjSrDFnYN11C/toMwb/8rLcvwomvD5SOVCBGUqs6PnK4E2Sy6Cm4pLcTjnw
         +3zLiCV7p99NJjtiRQdP+RQRbvi0iIOM0nrtay8qedVVNV4AiD0AD3P7knGcDvQ1MiRt
         wDMwI+BY4Gl9sn1A0BjvGDh31krl8D7mynNKCGo/hoLZCjxVmasfJwlJa9Hhv59MGkYc
         h9UnWDouJRLn2DPGA91sj9LbA1EOOEBpWci+VGeWDEjyTusS+VN2gsHatj/GaeCLKQGU
         6VwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5rf6T82hmPEjNT/sCtWwt6ycLcBGUL7rDgN47tVxsJoWGc2uOaYv1JaTX9VU05Rmxe5qk9TdlhvPMkQ==@vger.kernel.org, AJvYcCUgPKsh8eJVVuOfOkPZHWRVscsiu58MvWopcG/YeP3g7INKym6Fh9Z+1m7KDdwa87kP/1wMTBSeY1Qz@vger.kernel.org, AJvYcCWHL/DFEdgQ9smtjZcPuM92/Vf+VlC0W+UDlNb5Ok7feX8ssKlFALxvHtCeb7TyX0oKf8bIPTczoHWBKdQ=@vger.kernel.org, AJvYcCXikRpVXoEW9oEMNx3CrqiT7EsJ7ThJ7V7RjKcNQkHFQfNejFMTEUCkF2s4Qxpr5wqaEddd199uuYtLoITN@vger.kernel.org
X-Gm-Message-State: AOJu0YwsUMyx7EMTuQdhVGkwqh3P7WR5CSno/reUgfVjEyLW2qgVOkVQ
	hE09/w1VazYrQcVkyYyHP16BP5utatFqn+X0VcMks9FYvxf6GIPp
X-Gm-Gg: ASbGncvqnFLohZJNsnmK1qy6oIT+wDsVeaW0O1ERS6EHCmM9PFsY6odhAldRUxLe/rE
	hZXXslq6nOhFP2M+IZJdrS+Gfm8q/ABWAk2nehrvUftTMNNlk+3ebQB8wd6gGEUiePf0k0X/p9a
	qTWtgXhjeNLWFJfPR1FP3khX4aZCTsoC8J7FCGfukiQcRgO+mHABi/ga3v5pK1R1HsS4sMxn8p1
	TNAYvQ8IS/nBKtOaoU5/oNDKQhrFv05UmZmhaeic2yFQZsH28QfC+qIR6yogDFOo14Z
X-Google-Smtp-Source: AGHT+IHXdwewDIPQOXtv1iEJ1h+wD3M9qyi9bwIoqyxS6+rfSqoJNur+gfxUq0L2I9fps7PZzh+XJQ==
X-Received: by 2002:a05:6a00:806:b0:725:90f9:daf9 with SMTP id d2e1a72fcca58-725b812aaabmr5813954b3a.15.1733506084740;
        Fri, 06 Dec 2024 09:28:04 -0800 (PST)
Received: from localhost.localdomain ([49.130.54.203])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725a2cc6950sm3204512b3a.173.2024.12.06.09.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:28:04 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Apple DWI backlight driver
Date: Sat,  7 Dec 2024 01:24:32 +0800
Message-ID: <20241206172735.4310-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches 1-2 backlight controllers are attached via this interface.
Though, to software using this interface, there is effectively only one
controller to worry about since the registers changes the brightness
setting on all controllers at the same time. This series adds a backlight
driver for backlight controllers connected this way.

Nick Chan
---
Nick Chan (3):
  dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI
    backlight
  backlight: dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  55 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/dwi_bl.c              | 123 ++++++++++++++++++
 5 files changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/dwi_bl.c


base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.47.1


