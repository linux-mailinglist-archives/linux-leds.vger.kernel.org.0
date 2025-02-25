Return-Path: <linux-leds+bounces-4075-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7D9A4479D
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2025 18:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5429C3BFE35
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2025 17:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D6018DB10;
	Tue, 25 Feb 2025 17:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wsa7kM0S"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8421547E3;
	Tue, 25 Feb 2025 17:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740503170; cv=none; b=N0dPaiGV7PMj8CeN8vLfidaOlbPn4NMqKZ2EWYDRELzzmqIsmkCCVF37dpj7kGyP1G2CHbh0XRQdkFvgRFQuDCZnvE6gFgyI8mW5YkbWbEcchalfGTNClwcmWhSyux4srBSis4OzvPcXKR+cv2Yyj7IRAeF3hH4Msyp8LRxv5y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740503170; c=relaxed/simple;
	bh=bpxL3B7mFZ8T1gpT6geSdExB3J0o22Gfa+Yiler7EOM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l2yWN61gwWvHDfpl3uJnkBBmLnz9Sl2TCGsaugMOOjLMSO5rkyitGc5O0ALotYLhT4ydhoqTc/FyV7LevJQMeHvAVUPBDQmb9beahpYo7kgSlIko/6QCPZsk3AbRFVvRx2QApAQ5Q10avQ4pOG/8n3xLIHBwEEraZDxmsteaJZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wsa7kM0S; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2211cd4463cso120229245ad.2;
        Tue, 25 Feb 2025 09:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740503168; x=1741107968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bpxL3B7mFZ8T1gpT6geSdExB3J0o22Gfa+Yiler7EOM=;
        b=Wsa7kM0SXVUPlaFyrl+1M2gSWxE+93VurzC4Xsqp65qIdnIbRtir8bMo6qrrY/6bkH
         g0nagPF21ynsi4rdJIvpp5e/2BSOCS5UNpNHzTGaus+FkXKttQRjIdtR595dmC5EkUGb
         F1Iyc5lDoUww0X6zej77/7jDLmOWg0E79ynExy7t55K7tgtyaXWbCnqme3asUxTwV0FT
         QT8Nh1yS9y86djDqlhWovOVXKslRbmeuMJ/ya3mALAHdotBEoJgP9F3tHKAnPIc/rLNK
         4RXnPgmHjdvS2Iamh2HI0/qST1klhXVK6TcLVvyu3eRBX3ewJY0yFRgzGRGcEReKGC50
         laZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740503168; x=1741107968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpxL3B7mFZ8T1gpT6geSdExB3J0o22Gfa+Yiler7EOM=;
        b=bg2iV5TP//KY5ldHi70SHaGJJpQivHjvGaQwdUIHiRAfIB7N89VBZR5WSjizcFmKlk
         I0CsaeL+USnkYQYvJGMY70nAOQ3QYjgr9+2Aa+K48ClIvElik8rfJtI3x3aRQ0CBqrfR
         sFMR623niwxbj5ZD8wbdHEn0ky6u6zYk4KIpvDlHRl4vMaq6UYtGRtMTeVskHlVPQ4oM
         YP5FUTKD03GCxzZiAg1cdfC/ZIhOagvpEY8c1cD6noTPEddpQ/3fA1+urGV4gynXYkeL
         oIdbaGfESkBYztoB5cHmQrHn64NWEjitBApbSgUsqxC5MSbT4Z2L9VArvoP9ukKVhhUV
         SQzw==
X-Forwarded-Encrypted: i=1; AJvYcCVq64IE5YKDfabjtlDFrVIpEYfhku/xgI5MhawnRsW8LTy5MiWNAj0jA8c/XrUqoLOR6vOk8dmSJIDRNw==@vger.kernel.org, AJvYcCWsK4mMomVnyHmaD8GCwrf74SuZWEI8t8YIObH1uz7iFKeEEdn8YEwBl5CwtLLOBE7GLwextYlS75l2ilw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+vdkLmpPTXIN6wRS9kQ01eoC5QQMxm077u8cSN2FyFhWo+YlJ
	nwbHoDfWIIoHSMomQ979cZTLUPwOMtErC32Fa+Ugg39Avf+tTiP5qyBbbSId
X-Gm-Gg: ASbGncsC5YlwToS/3aa+lFXDDjjUY+MY59Chleq2BroWFQadvYX94xn/HfOnqjY8kbm
	SJkepr5aZK6cJo7iM5y/QNU9PQKhdZzICqmseIFOQt9r36WFONXFPwLsVj0lw5CN2b5l1+v3B5u
	vk0uE9hDqh315gRdctqehwmEiSM1NzKzqTy01t5gBOunZZfDOc1/NeICS1KG9CFssQoJ9nyPA/p
	xkkQSAe/4Qch+jx2dnAq3ysuft0jTDEPdhElN/g9t48lYo3k0HKbAP5kXFSrtzhAa9bZMfZ1o6N
	q8dQ1sssVlWGuXBDmfm/hDOJ7nIJMHUOXijqzkI1Kd+z1DE=
X-Google-Smtp-Source: AGHT+IFv9YuL/fzfRISpsvngTs+AOHJv036o9wJ92ZFpW3rksechl/oac0mMWei93fa2C8ODk7J6Xg==
X-Received: by 2002:a05:6a00:8c3:b0:730:94e5:1ea2 with SMTP id d2e1a72fcca58-734790a2709mr5892899b3a.4.1740503168229;
        Tue, 25 Feb 2025 09:06:08 -0800 (PST)
Received: from DESKTOP-P76LG1N.localdomain ([14.162.192.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6abb63sm1759887b3a.9.2025.02.25.09.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:06:07 -0800 (PST)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@kernel.org,
	lee@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v1 0/2] leds: add new LED driver for TI LP5812
Date: Wed, 26 Feb 2025 00:05:59 +0700
Message-Id: <20250225170601.21334-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nam Tran <trannamatk@gmail.com>
To: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

This patch series adds support for the Texas Instruments LP5812 LED driver.
Patch 1 adds the Device Tree (DT) bindings documentation.
Patch 2 introduces the core driver implementation.

The LP5812 is an I2C-controlled LED driver capable of driving up to 4 LEDs with independent brightness control and pattern programming.
This driver provides support through the Linux LED framework and includes device tree bindings for proper integration.

This driver has been tested on Raspberry Pi 4 B using kernel version 6.14.0.

I kindly request feedback from the community to ensure that this driver adheres to the Linux LED subsystem standards.

Thank you for your consideration.

Best regards,
Nam

---

Changes in v2:
- Renamed DT bindings file from `leds-lp5812.yaml` to `ti,lp5812.yaml`.
- Added LP5812 device tree node to `bcm2711-rpi-4b.dts` for Raspberry Pi 4B.
- Updated core driver implementation to fix build errors in kernel version 6.14.0-rc4. (The v1 patch was only compatible with kernel version 6.1.93)

Signed-off-by: Nam Tran <trannamatk@gmail.com>

