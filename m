Return-Path: <linux-leds+bounces-4516-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E30A9750A
	for <lists+linux-leds@lfdr.de>; Tue, 22 Apr 2025 21:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7C7E1B60CCC
	for <lists+linux-leds@lfdr.de>; Tue, 22 Apr 2025 19:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2591EDA26;
	Tue, 22 Apr 2025 19:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEZaziCU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50F128382;
	Tue, 22 Apr 2025 19:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745348512; cv=none; b=YXuvvdZUBAFM8frBMsJzEwEM3343bzAx62V+Bj3hIABxU05mNgTh3MAxkwTXP46WSvbwFgFdHmE/Fy4l+l+3bNnCKTlYlZD8iPEec0SjANb3w3f3L3so3YkWamObIYcH5DLQVCl65gXxeRCT1B7J9PhV7gf9wNTNVscnFep2t7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745348512; c=relaxed/simple;
	bh=LI4Hzejgi24J6FdE1mZQGYJIsZB7x1POuD/9fjiRzBs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=sm1H2ZGFYSZT4EJn6jYozfOWFRwx+t3KsH47cW2ulrgZwEqD+lVfkysitZ9ccMLwjHmEbVtCl1vmDUbCLr7oBrSujLSAY168BIBHsemXfacgmIOIxvdsEWg/cdvK1TrSOSSwsg+9q6kv40UbQeoeAg4sT9gq/JZX4alEUigfbj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEZaziCU; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7376e311086so7738970b3a.3;
        Tue, 22 Apr 2025 12:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745348510; x=1745953310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w+s9K/w6f+kyqYGShZ0iHpPHRP+jGZCR3Dz9K3/qWCY=;
        b=SEZaziCUS1SiSK+lRM50i4yP/IerVz2kQrlH7lGtZJYEkhr0Ya3yycwDs5CgAxkIsl
         hnidQRbw99Ivx8+TPehyX+66TQ2i5LMkElW8Gd/KJIz+kL6yZtGbIUftyNNwPw5OJAHN
         WSHn74wwvgqa0xmMhwTHbmBB5vPabSrB2jb1SikuUHo1rT6FcBlIFDaE+vjFCkO8lNRU
         d6dkXUcjFjXNj50TJ91VbIbAB/JlfE26ysF2UmU8Be6s2tNlFUW6LddrUA+7gdWCC/I7
         oVPW1BdPQlXGTBAkIDsid8Wj56je3Y2hmcOdozz0Y+zop2x5icuTbw/+RnfXaJvjd+xp
         7Pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745348510; x=1745953310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+s9K/w6f+kyqYGShZ0iHpPHRP+jGZCR3Dz9K3/qWCY=;
        b=qy2kE2nlzC/E5z188tSU2TYthXuiwLIGzxLWlQ3hLggrS1abXA9IHd5yBvx9Ha4lEm
         s37/XlegeyCVQU3S0kjKrIOA/P0/czsE/OlnF+ROu0TejA7svMPYdIBj5uS65itd2J5a
         uIRoGZisb6wnYwtKgO2EdEmhnwjX3JDBqlqFEzHcTQjnJPj+xYW/8tlV7HTi3a7Pli+Q
         84EoQvHIkqQAAsTI7OshcxCkcxkOpUxNIHiEUHJyklv0OpXL9BkhJV38lyTQOs3cdzhH
         hycjC/iAkJCkMUb1A95t+G5h4a4AF7rHwfpVKqoJzoRIQbUtICzNdtnMPiQdxyaEuidm
         Bfug==
X-Forwarded-Encrypted: i=1; AJvYcCVo+QVNForsX0xziNBGMsj3oT3oVFjfSYKx6YSnzJHDO8WLRb7MrwM0Q2SABNKaveysCvYF3wtqsigXwA==@vger.kernel.org, AJvYcCVyMSeHONomwRGWe/coB4lnQbhwU6G1JPrqEyZvegji+3/NJjsMpu8YwvmZhEtkEaq4T2BJ/hjsNVbJKQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjYaKj7oBMsqxuhKTZo6ZuHGkW5lUMp6fQuKg+BCEnGIs2J5/1
	4vs5NnZP+/M3MimWCzJXEbzrcLAJZjbYUZW0NA1BZ+zr6J9qWIT0
X-Gm-Gg: ASbGncs8k/BdK30Jh5CtrSGP1jgvgwGdLEGTVPUjJ9PQS3iUFVM1FUKIfsDtrsSWIfQ
	XNTy2Elu0fXnTcDiroLmQ+HgjnKUEMlMj15xQJr9O5jKAtot57Qx7oThe1w3vgkKFTElaZgV0iB
	jqFkOjPGliYIzUKna00nntxo56bwcmWdGNyE4hengAi7ZTXoAS3o+xQVcJswrrLtcr/9hrMlFyu
	Bx7bmYFLh+oodByM2r4qofBCHgRSvgtPGTbGRsmNiv+00AFfoWIHCosI+Ayr12k/N6L//JbuJnb
	zjPKWgFzlCr/VrOvYem1ekrFOz/EZYwzlab1E1vCBuGvCbRA6n69/g==
X-Google-Smtp-Source: AGHT+IGcQo5SQ/Tavbspb1pZGYL5W0rm39zUDpCRKK/9JWjuDmMF++KZXmfTvRQUZnEVfD64lV2m1A==
X-Received: by 2002:a05:6a00:18a5:b0:736:ab21:8a69 with SMTP id d2e1a72fcca58-73dc119aef1mr22976562b3a.0.1745348510106;
        Tue, 22 Apr 2025 12:01:50 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa574fasm9287684b3a.99.2025.04.22.12.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:01:49 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@kernel.org,
	lee@kernel.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v7 0/5] leds: add new LED driver for TI LP5812
Date: Wed, 23 Apr 2025 02:01:16 +0700
Message-Id: <20250422190121.46839-1-trannamatk@gmail.com>
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
Changes in v7:
- Mark `chip_leds_map` as const.
- Use consistent `ret` initialization.
- Simplify the function `set_mix_sel_led()`.
- Refactor `dev_config_show()` and `led_auto_animation_show()` to avoid temp buffer, malloc/free.
- Simplify the code and ensure consistent use of mutex lock/unlock in show/store functions.
- Remove `total_leds` and `total_aeu`.
- Link to v6: https://lore.kernel.org/linux-leds/20250419184333.56617-1-trannamatk@gmail.com/

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
 drivers/leds/leds-lp5812.c                    | 2736 +++++++++++++++++
 drivers/leds/leds-lp5812.h                    |  348 +++
 9 files changed, 3392 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
 create mode 100644 Documentation/leds/leds-lp5812.rst
 create mode 100644 drivers/leds/leds-lp5812.c
 create mode 100644 drivers/leds/leds-lp5812.h


base-commit: a33b5a08cbbdd7aadff95f40cbb45ab86841679e
-- 
2.25.1


