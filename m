Return-Path: <linux-leds+bounces-4920-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29519AECCB1
	for <lists+linux-leds@lfdr.de>; Sun, 29 Jun 2025 15:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AEAC18947A5
	for <lists+linux-leds@lfdr.de>; Sun, 29 Jun 2025 13:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8D422488B;
	Sun, 29 Jun 2025 13:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3YrMbkM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1738022370F;
	Sun, 29 Jun 2025 13:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202008; cv=none; b=R9fYg6FYaAJSBGLhE5mX2erI80mWDzVlMh9fyoP9umSXIBymvQv34cdiTpMoaNUukd2U1QzLDyDptmuFBsH6i0vE9C8/hR2f8zK0uhU0WdPFlu4cVucQLXyJEk1H3xdm3yDjcJZx36uJnnXn8w1IBuaj9bNLg4P+s+JriC2MefI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202008; c=relaxed/simple;
	bh=K+WEFJjjIWvHspQTmC84LVv6AkmYWMvLRVPGaxC35mA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ugFVcp5YhiAO+eVi1CB9HsHCio4oifPXAsIBui8EJCk4pg3hVKXyAYpEc5jh0FXrkklDRq7YkycsWPfzhJpyjP15MGxLBpsHkMvc6dpScxxBGgHyQkBwYoR6HydbO/V6Dz0eMQ4xOQRUiISFuKg9/MankxbhzBK2OPoYtNxPnAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3YrMbkM; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a58f79d6e9so51249111cf.2;
        Sun, 29 Jun 2025 06:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751202006; x=1751806806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVmynuRCoUKul3boZbYZPMM1R7E70lXz34Kw3eLlkLw=;
        b=E3YrMbkMiRaDdYBXGIDlFLJ7ABu4ss3GwFk9chVMwWfviMF4vHe7chPDOBcS08d7Xt
         GfWg0QHE7o8Yn8RkDKsslLAB+dMu2Gt1h/NTIk5p1jHKHn/W2vrb8jCvPH49utMjNNXO
         F2UZHFZOQjkVlppjjTCoOfVYeRV1Pks3kPdhbgfG+G9khsnvFyJgpIr9q6VdEaPICcHx
         oJER1wWkyuztqpV5U3Jcrxi3p3GD86ypr7BAtjulwYnRDI2HJV9YVF8P5KjvINA3CYfx
         O7l9mh9nj/VMv614iF9xWkEfzSHumTGa6eMv9mZKU7boQ7PJX7LDY06O/hnAtqGigMRj
         Twag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751202006; x=1751806806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVmynuRCoUKul3boZbYZPMM1R7E70lXz34Kw3eLlkLw=;
        b=TFLdBoQeeDEmCk9lsFEukt41aacbV22O89QYSegS2M2UcospgDKBK1ngjF4DVbLVuy
         JUGdvi6ysf6MSiS7BgIoddLO2cedhkE7Il+Xk+qzuKXA7erJoBl7WFlCmGN9IfoZSWBS
         W8PS+X+qqOxWmQiTbSaDDAlL1CICm1XvB9hb/15a446+SajR7o7+FFzUXgcYo+3ePTDF
         n0Wzj5Scdnnvlp9rfd9DPiS1Sn2mAO0/mu3U/gu7JmUpH9HmudwqDoLN4LefJ721f/Vr
         lovTti9aHCU+jvtZ8xHWiQBaFpnvx+omdTjT6upasyR3tk6+kF6oAE/gE/Fg1EH/KNV2
         2Mcw==
X-Forwarded-Encrypted: i=1; AJvYcCUNun44zuLUJfFoZyWgkxHb3Ev4y1KM6axI7SDzTMnbw8gpM+Jqi4XFZTFd8cTR2lKgK2Sb5CsBxnpI@vger.kernel.org, AJvYcCUsYTta0dx+hsHuDvFK1KQPjjZDN3iSdAoLJm7MJXpju6UF0Jujf9gJUUNupiGNVXkDKsgkwGtESFUtZm7e@vger.kernel.org, AJvYcCVZlR1tY9sJrhdrrSQj7aOLkMsUZUzbNjJVGgwIWFL/7sXAbpPifT8CNCPlfSj/Z3jnlmSXz+gx6/vMCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8nqqBIqWlocCzGEm6VvVUMA7O7Z2yWzTE5KPUL+iD1jLPZfbu
	bgE3ahBVLapoRwHpx4wNFNwKld0zRMqa1kDCEnMhsAvjg/dnWxvJlJ9x
X-Gm-Gg: ASbGnctsqMM/Cy6UJdgKESnxnJ7wGUPHBrTdGRsNoiCi2RS+R6IsusoYCwWxLcdE9oN
	Yyp94OFQL677LxEqrGMBAI4lkJMV3RUaxzEViL7q4qmrOcMyzWSj+NOspRLuDDvXFq04Tf77HH/
	c2OMFawwjYflVCT4g/Oc3rwZz4UAyctn3S9Vcsi8TizSM3hJHCyabYTzZPCYaubvocyiB8/9aJt
	Pd4UP1sS8a4lzbUd4zEPwjWJahoeNrjaKh8G59Os5EJJ7nqql8pe9K6BeCJz8PLJysp/46etEY7
	bx4f9S8jsiIlvkFLug42lpxPzNhJlr2zKusntjvFmtMwa7z/VNOt/UvmXGBa2smEn1Fh9g3ouhV
	zuqYDPCgup3lJc4ybVbEQ9mlISDIH2jrw
X-Google-Smtp-Source: AGHT+IE/3brjX7yxclIrmWbxkpUjIQt8qdYLuN+1INlqRRBTxWp2u29+VyO1TAa6r4JrEXMQwsawkQ==
X-Received: by 2002:a05:6214:4348:b0:6fd:7577:cee9 with SMTP id 6a1803df08f44-70001c5337fmr160635236d6.2.1751202005823;
        Sun, 29 Jun 2025 06:00:05 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443201b67sm431628685a.61.2025.06.29.06.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 06:00:05 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Boris Gjenero <boris.gjenero@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Sabatino <paolo.sabatino@gmail.com>
Subject: [PATCH v2 0/8] auxdisplay: Add TM16xx and compatible LED display controllers driver
Date: Sun, 29 Jun 2025 08:59:50 -0400
Message-ID: <20250629130002.49842-2-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629130002.49842-1-jefflessard3@gmail.com>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series introduces a new auxiliary display driver for the TM16xx family of LED controllers and compatible chips, widely used in TV boxes and embedded devices.

Many consumer devices, particularly TV boxes, use auxiliary displays based on TM16xx LED controllers to show status information such as time, network connectivity, and system state. Currently, there is no mainline kernel support for these displays, forcing users to rely on out-of-tree drivers or userspace solutions that directly manipulate GPIO pins.

This driver provides a unified interface for TM16xx-based auxiliary displays through the Linux LED subsystem. It supports both I2C and SPI communication protocols and integrates with the existing LED class framework, allowing displays to be controlled via standard sysfs interfaces and LED triggers.

Upstreaming this driver will eliminate reliance on out-of-tree drivers and enable standardized auxiliary display support across devices using these controllers.

It is compatible with multiple LED controller families:
- Titan Micro Electronics: TM1618, TM1620, TM1628, TM1650
- FUDA HISI Microelectronics: FD620, FD628, FD650, FD655, FD6551
- i-Core Electronics: AiP650, AiP1618, AiP1628
- Princeton Technology: PT6964
- Winrise Technology: HBS658

Key features:
- Write-only display support: This initial submission implements display output functionality. Most devices do not wire key scanning lines for input, so key input is left for potential future extensions if needed.
- 7-segment display support: Full integration with kernel segment mapping helpers for driving standard 7-segment digit displays.
- Flexible display configuration: Device tree bindings allow board-specific configuration of digit grids, segment mappings, and matrix orientation to accommodate different PCB layouts and wiring designs.
- LED subsystem integration: Individual display elements (icons) are exposed as LED devices, enabling use of LED triggers for automatic control based on system events (network activity, USB connections, etc.).
- Dual protocol support: Supports both I2C and SPI communication, with the protocol selected based on device tree configuration.

The device tree bindings provide properties to describe board-specific wiring and display layout, as the controller itself is agnostic to the display configuration:
- titanmec,digits: Array defining which controller grids drive digit displays.
- titanmec,segment-mapping: Mapping of 7-segment display elements to controller outputs.
- titanmec,transposed: Flag for displays with swapped grid/segment orientation.
- Individual LED definitions for icons and status indicators.

Tested platforms:
- Multiple TV boxes with Amlogic, Rockchip and Allwinner SoCs.
- Various display configurations and controller variants.
- Both I2C and SPI communication modes.
- LED trigger integration for automatic status indication.

Dependencies:
- Requires CONFIG_NEW_LEDS=y and CONFIG_LEDS_CLASS=y

Optional LED trigger modules for advanced functionality:
- CONFIG_LEDS_TRIGGER_TIMER for blinking elements.
- CONFIG_LEDS_TRIGGER_NETDEV for network activity indication.
- CONFIG_USB_LEDS_TRIGGER_USBPORT for USB activity indication.

User space clients, including display-service and display-utils for testing and integration, are available at: https://github.com/jefflessard/tm16xx-display

v2:
- Fixed duplicate label in dt-bindings examples
- Renamed dt properties prefix to match titanmec vendor prefix

Andreas Färber (2):
  dt-bindings: vendor-prefixes: Add Fuda Hisi Microelectronics
  dt-bindings: vendor-prefixes: Add Titan Micro Electronics

Jean-François Lessard (6):
  dt-bindings: vendor-prefixes: Add Princeton Technology Corp
  dt-bindings: vendor-prefixes: Add Winrise Technology
  dt-bindings: vendor-prefixes: Add Wuxi i-Core Electronics
  dt-bindings: auxdisplay: add Titan Micro Electronics TM16XX
  auxdisplay: Add Titanmec TM16xx 7-segment display controllers driver
  MAINTAINERS: Add entry for TM16xx driver

 .../bindings/auxdisplay/titanmec,tm16xx.yaml  |  210 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   10 +
 MAINTAINERS                                   |    6 +
 drivers/auxdisplay/Kconfig                    |   18 +
 drivers/auxdisplay/Makefile                   |    1 +
 drivers/auxdisplay/tm16xx.c                   | 1305 +++++++++++++++++
 6 files changed, 1550 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
 create mode 100644 drivers/auxdisplay/tm16xx.c

-- 
2.43.0


