Return-Path: <linux-leds+bounces-4506-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F196DA94517
	for <lists+linux-leds@lfdr.de>; Sat, 19 Apr 2025 20:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20CB73AD7E2
	for <lists+linux-leds@lfdr.de>; Sat, 19 Apr 2025 18:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2A91DED54;
	Sat, 19 Apr 2025 18:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjnTq48V"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65041C84C7;
	Sat, 19 Apr 2025 18:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745088244; cv=none; b=s55ZZW+mHg0U8b8No8Ol3rQpMdV0GEgJiy0NAdyTTtsyJV7jzCwZgwN4ynfRYWg87n615B2o2qSjkCy9YVa955yxhaTE+cbPveUq4aA46o2aj+fwj5cbpbN73h6XvWisYNYHHLGKdJ4kZDowUP26qCnD1CSicqq/Y5WNcxtB+3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745088244; c=relaxed/simple;
	bh=xN9R9QHlggheOZhKFP5TaJueN4ygvkm+pTmL2UM3tzY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Lww0y+7kKsbm99kSAfSyPtXutTb1AbE/pIla9VAEspb89XGREw4zX4NapZo74wP7n63ig4x4MO4/WjttC9a72whBNPvfmZp5uLCHCVM73/p2uUZCSE/J/GR0qHDyhbu4cm2mvx6SfjdkAysUPdUE/JshFGlFYQ73l7wzFDKpbsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjnTq48V; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30384072398so2354928a91.0;
        Sat, 19 Apr 2025 11:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745088242; x=1745693042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ijbkwuJz3JBQMyLg3M9/k4WnhScokz0mU3Vgn1ijLyE=;
        b=TjnTq48VW2xLvuNJV1hEq0qT2Ok4KwMw/KPgDvui8kEJpAXgbQkD2+yf6G8+uz3gQ4
         D+8FZTHYwgX72O2g68Fd6UGYh7+K+wGmaM+/FLczixjFlshBFQyjNd0Dzr1DL7vl7I1D
         n+yb848eKxNM+OzPXDrXbw7pBXX/C/sdq0BWxdjJftWzztoE60N1fdEu4llLi85dnc1c
         NASXsygDRNzyGZq3tNky6gWSvxI0wQrbZLKfMfOe2NfzAmaDa7JoplfUQhd6X1Xzlbim
         8G7VNF8ux3TAMuBh2NEIGiXmLVDIB/fQ9vsdrV3Po8BrXzRoNcwikXQj1VtxzYIFuVL4
         9U5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745088242; x=1745693042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijbkwuJz3JBQMyLg3M9/k4WnhScokz0mU3Vgn1ijLyE=;
        b=FtoHoa7jQ0iPxc/Cpo6e2MFeHdF7ID36WwIJMUyGSRHe6eGGFS+6/7cVrLOPrbEq/f
         U6FitQIRvt4UmbFe8B2ruQHWXfRSTEFWecibmb+yodbqNQdzVNP5fC+OTaZU9FYAidt5
         1VVaULqgulsY8zsMwFOpyUH8lZupK5i401IYm5RKTfAOVXPZRxAwAFYOsbItKt0axSo3
         1B4svoofbQ8KTQ2/Q67I2y7SLRDyUyS/AI/o33HtjWQw36MjHLW50OrrjLy5vXyS30w1
         eenzHFMFQSmTAwCUbFTmZL9tjlQlniekh7r4cYA9hZahVNGbBfPL5C5aB+SVyDlHKklX
         yjsg==
X-Forwarded-Encrypted: i=1; AJvYcCV1J84FDvnhdxJhzNs6ICZWCZ4TqGwWiH5lJG/yxdNX/5uNxd/kU+a4UXflVSzPrxJ0MnTEVPygYXV7BIE=@vger.kernel.org, AJvYcCW2oZ5K7r/fbUjNgqOEAA5sfAUuSVZjgo+UwjD8OrWmz59tFKf+4lDB4s6iA/XQ8dGa5dyMpT31yBhR5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc7AjCjLrcU9NzbF8fqBig7UlQTL6CZgXUFA1NAU5YVCgmu083
	n2tRMgfwxTaRc5Q4pnpC8d4gW0t/a5x9CzvDjbTxV+f0vdCV9Ay9
X-Gm-Gg: ASbGncvGz5gLrCntmh0w0Iv0RsNKllOYzTOrkqjnYFr/5ed6zOaUAvp09n5+Q4QOoVZ
	mV+PhvbFKcS8mR6NdEzKovUSr3qi5Kf8whbDIlys9rSBH1L01pksveuVpIN0uloCXSYiWHDQ+fS
	NXFeRYm1QFwJq8/KeUzb15n/QL4ZbdOOaJQBLgF3bbv1bAWP1g/3LklokLWNwhLI5KiacLH5WRO
	1gRM+95tZkLu8qf2idQHqgNuKSq2nlDgvLZ3iAbyxst+On7rQUcHRflZXNKjZjCLSlGk3IfBwKv
	YbkH4exJis+feut/sMxxDGfk9kDwBfvvLK0SKOy/LJgqqR5y5YM5
X-Google-Smtp-Source: AGHT+IErrjvrMdRDEriBQfqCq9LilN6m+1YPbXhICEem4Y7dsW+Gxc8R4w3pmLq8AZhFoW2onRBHnA==
X-Received: by 2002:a17:90b:498d:b0:2ff:4e90:3c55 with SMTP id 98e67ed59e1d1-3087bbaeb22mr9109796a91.27.1745088241850;
        Sat, 19 Apr 2025 11:44:01 -0700 (PDT)
Received: from localhost.localdomain ([123.17.0.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087e1149b1sm3383052a91.40.2025.04.19.11.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 11:44:01 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@kernel.org,
	lee@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v6 0/5] leds: add new LED driver for TI LP5812
Date: Sun, 20 Apr 2025 01:43:28 +0700
Message-Id: <20250419184333.56617-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series adds support for the TI/National Semiconductor LP5812
4x3 matrix RGB LED driver. The driver supports features such as autonomous
animation and time-cross-multiplexing (TCM) for dynamic LED effects.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
Changes in v6:
- Add `vcc-supply` property to describe the LP5812 power supply.
- Remove `chan-name` property and entire LED subnodes, as they are not needed.
- Update LP5812 LED driver node to Raspberry Pi 4 B Device Tree, based on updated binding.
- Link to v5: https://lore.kernel.org/linux-leds/20250414145742.35713-1-trannamatk@gmail.com/

Changes in v5:
- Rebase on v6.15-rc2
- Removed unused functions (lp5812_dump_regs, lp5812_update_bit).
- Address Krzysztof's review comments
- Link to v4: https://lore.kernel.org/linux-leds/20250405183246.198568-1-trannamatk@gmail.com/
---

Nam Tran (5):
  dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
  leds: add TI/National Semiconductor LP5812 LED Driver
  docs: ABI: Document LP5812 LED sysfs interfaces
  docs: leds: Document TI LP5812 LED driver
  arm64: dts: Add LP5812 LED node for Raspberry Pi 4 Model B

 .../ABI/testing/sysfs-bus-i2c-devices-lp5812  |  144 +
 .../devicetree/bindings/leds/ti,lp5812.yaml   |   46 +
 Documentation/leds/leds-lp5812.rst            |   79 +
 MAINTAINERS                                   |   12 +
 .../arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts |   10 +
 drivers/leds/Kconfig                          |   16 +
 drivers/leds/Makefile                         |    1 +
 drivers/leds/leds-lp5812.c                    | 2797 +++++++++++++++++
 drivers/leds/leds-lp5812.h                    |  350 +++
 9 files changed, 3455 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
 create mode 100644 Documentation/leds/leds-lp5812.rst
 create mode 100644 drivers/leds/leds-lp5812.c
 create mode 100644 drivers/leds/leds-lp5812.h


base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
-- 
2.25.1


