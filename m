Return-Path: <linux-leds+bounces-5294-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 245DDB33481
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 05:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8B631B21B87
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 03:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8D323B63C;
	Mon, 25 Aug 2025 03:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrPa+fuC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31611F63D9;
	Mon, 25 Aug 2025 03:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756092762; cv=none; b=El9lndv8w03Z5wlfNZ+dtq0rXT0BwNCs/kTafJIQnuxJ8z4d7NrKtGdYVZEAL8xnlmMBtMPbSUjQbjii2uSFTC/i6ixW9ujvMV5opZcZwDi6FGV6i037O0mHoH1PuHARM+7IFEY9sOiiPnRgA25qUkS8dQD1aRzqqzcz34g1cjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756092762; c=relaxed/simple;
	bh=Ac0sEpUvxN8aaquBhcGL5qwhRQypUlZw4nTYaW4AKCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gS8HqXJFYhleitImNKI7CRAd+GRI9xa9GnMLam/QTS2TjLjmBg3Utb/+wsOhqeLc3Vz2NUvnT4prS2q3gPLeWfN/1S5t3wO+l8CRqfAHK19P97Mlb+7U/6wR4KBLHs7ds+5fgztucmmqCPR6UYTHHQnZvceB1SVhYCploJhPQEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrPa+fuC; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-70d9eb2e976so21462086d6.0;
        Sun, 24 Aug 2025 20:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756092760; x=1756697560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xVNoVscAr/aghST5ZL4s6mpApFhKH1pgno/Q/v4m4rM=;
        b=ZrPa+fuCMvqan4V8fYOk3vonrBL7fRcAEWQeaDRs+H2CYoYjGSW9UovvH9QHkTvSFX
         oha7jFb7l5TVW0CR1Uxl58DkViU861uXPlrXZofh47nsiKEweq0Kp1hneT7eaFKoPAMT
         UK0yomRpXO4f5oLyBJBseOyM0VK0uNFFaKrLGuiB38c71W/nqfvfsx4e2x8kctqF1lh7
         KlEAzbBsm59crRZWRotVRIcZC/UlmEesRdpZ9gLVhKM4OBPStfvTHUjqsaVY1sSiPz2g
         1B8nTMxoXABkbmw5uOSAugsFanKF/LaEmw+DqWi7XanDCKBAq2dCGBWZ0zvdYQxhT+eH
         eUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756092760; x=1756697560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xVNoVscAr/aghST5ZL4s6mpApFhKH1pgno/Q/v4m4rM=;
        b=kXQ85KfVg9I/SBjDFD7EuDFkPNsU2F1HxSYD4ZsV0X2dSUeIVEN+kiERgjcZtgwM/+
         5aAB2iBmelrdkbat3ru5knp8CLxDWlFO9RLOpS4i8KWjK4MbY4FZ0B9Rxt8xqtAad0xA
         u79zi1gEOVgi1RQXD1uc07velLKdHNUYC38vvhZOyyB/smLeoo2+bbyE2HY3DD5uXT1u
         MEFfQsqJLGU8u3D6Mu8YnrSdTGqi9XNQ6ea+UnWWfP6ry+fCuePFdiYoQQNzkYbqKHcU
         fGStZIN8LFtIaCdl9boMs4JK+RcGMvzvwn/AAHyKMjXctUgsNrgBl1gp/9EeP4Ie9doG
         DfOg==
X-Forwarded-Encrypted: i=1; AJvYcCU0Qdfq4pLO13CuWG9TA42NilNNF4VbuaKPes1gOD8ShZI8X+hRt/7pd26UHEUDZeropRBR42nkzkzb@vger.kernel.org, AJvYcCVCBGgqAsMLvxuOJiSotZnlGoJ8SP+DHP/4/1Tr8nMBggbYVspFoutZds4eWOhxhn21Gn6RFM/wOHo1iw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx9HdqudKABcYrdJVwS645KKDYg+XGzZ9FguWtYACLAFBtqPJd
	wGJkW63xQ4b/ogB1tU/jM3brrTmDz82F9Zp+XJQWfH8l/ksiuw6vQ2Gr
X-Gm-Gg: ASbGncsKjNUhMV0qodqJoCwOiwH5xAHKHAtFqAK3xGP/lOazE8YNS/QKB85Ex8fFFph
	wDgo8v7WEDdWc1Ps4CxjcxFcARAs8qJwsUFZJew2+wEibjNLSUc4vsNKQZjo04vayAh0GuK4mJX
	swfo1sGePau7MpGpRbjqupBb/x3RQkju1V+wxGmelFTJJj/teeBtosQkfHW61DDXXOO0hjWEjop
	LJzXnfzMR47M6OCpWrsHyuHBQ3L7zCs7qEuz1wrGpiSliXGfddkyoRCTJhSjTMKEBBAvza+7Q3S
	6lmickwT1mhp7nQb098OitR95PaCclHtV9NJPNcUiY7tboWAxoqkGp6MR3aOztEULDkpsUHdexO
	LZhfhOor6T+7exdsLSS0jmW8QLOgkuB2sV5p8P2YqvlzzSbdow44kEVOiP1q0m8U4FuZW
X-Google-Smtp-Source: AGHT+IH2VxDyuDmvyBrLK3xsLelX6JFILcsTYJBiarOl6eDXgs9n53vKTpbirdxnyKu3aMDGJin5lw==
X-Received: by 2002:ad4:4eae:0:b0:707:808:edea with SMTP id 6a1803df08f44-70d9722b6d6mr120569326d6.1.1756092759313;
        Sun, 24 Aug 2025 20:32:39 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70dc5649acesm2656036d6.74.2025.08.24.20.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 20:32:38 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 0/6] auxdisplay: Add TM16xx 7-segment LED matrix display controllers driver
Date: Sun, 24 Aug 2025 23:32:26 -0400
Message-ID: <20250825033237.60143-1-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds mainline kernel support for TM16xx family LED matrix
controllers and compatible chips, widely used in auxiliary displays on TV
boxes and embedded devices.

Many consumer devices, particularly TV boxes, use auxiliary displays based
on TM16xx controllers to show status information such as time, network
connectivity and system state. Currently, there is no mainline kernel
support for these displays, forcing users to rely on out-of-tree drivers
or userspace solutions that access hardware interfaces directly.

This driver provides unified TM16xx support through the LED subsystem with
both I2C and SPI communication protocols. It integrates with the LED class
framework, enabling control via standard sysfs interfaces and LED triggers,
while supporting keypad input when hardware connections are available.

The driver supports multiple controller families from various vendors:
- Titan Micro Electronics: TM1618, TM1620, TM1628, TM1638, TM1650
- Fuda Hisi Microelectronics: FD620, FD628, FD650, FD655, FD6551
- i-Core Electronics: AiP650, AiP1618, AiP1628
- Princeton Technology: PT6964
- Winrise Technology: HBS658

Key features:
- 7-segment display support with flexible digit/segment mapping
- Individual LED icon control through LED class devices
- Optional keypad scanning with configurable key mapping
- Device tree configuration for board-specific wiring layouts
- LED trigger integration for automatic system event indication
- I2C and SPI protocol support depending on controller interface

Device tree bindings describe board-specific display wiring since
controllers are layout-agnostic. The bindings use separate 'digits' and
'leds' containers with specific addressing schemes to accommodate the
hardware's grid/segment matrix organization.

Note: This driver is placed in drivers/auxdisplay rather than drivers/leds
based on previous maintainer guidance. LED maintainer Pavel Machek
recommended auxdisplay for TM1628-based display drivers:
https://lore.kernel.org/linux-devicetree/20200226130300.GB2800@duo.ucw.cz/

Tested on multiple ARM TV boxes (H96 Max, Magicsee N5, Tanix TX3 Mini,
Tanix TX6, X92, X96 Max) across different SoC platforms (Rockchip, Amlogic,
Allwinner) in both I2C and SPI configurations.

Dependencies:
- CONFIG_NEW_LEDS, CONFIG_LEDS_CLASS (required)
- CONFIG_INPUT, CONFIG_INPUT_MATRIXKMAP (for keypad support)
- CONFIG_I2C or CONFIG_SPI (depending on hardware interface)

Optional LED trigger modules for advanced functionality:
- CONFIG_LEDS_TRIGGER_TIMER for blinking elements.
- CONFIG_LEDS_TRIGGER_NETDEV for network activity indication.
- CONFIG_USB_LEDS_TRIGGER_USBPORT for USB activity indication.

User space utilities available at:
https://github.com/jefflessard/tm16xx-display

v4:
- Split MAINTAINERS patch into each specific patch
- Document ABI of sysfs driver attributes
- Remove kernel-doc of obvious Linux core driver model APIs
- dt-bindings: Drop obvious comments that schema tells by itself
- dt-bindings: Gather canonical compatible strings in a single enum
- dt-bindings: Clarify top-level logical led DT node name/label property
- dt:bindings: Replace refs to input properties with allOf
- Split driver patch and code file for better reviewability
- Refactor into separate i2c and spi glue driver modules
- Drop driver name macro constant in favor of explicit string literals
- Revise to use bit shifts for values and GENMASK/BIT for bit positions
- Format TM16XX_CTRL_BRIGHTNESS on one line
- Drop default_value module param in favor of Kconfig compile time option
- Fix for_each_key name and expressions
- Replace manual mutex locking with scoped_guard
- Move scancode declaration to avoid mix with code
- Remove unnecessary ret initialization
- Remove ENOMEM error message
- Replace probe error messages by dev_err_probe
- Remove keypad failed probe cleanup to avoid devm anti-pattern confusion
- Switch to non-devm led registration to avoid anti-pattern confusion
- Replace u16 in favor of unsigned int for controller data

v3:
- Update vendor prefixes with documented rationale, in a single patch,
  per maintainer feedback
- Refine device tree bindings per maintainer feedback:
  * Update compatible string ordering and fallback logic
  * Improve YAML descriptions for clarity and 80-column wrapping
  * Replace digit-specific properties with clearer digits container node
  * Add required constraints for properties in container nodes
  * Clarify addressing schemes for LED icons and digits
  * Fix conditional SPI properties handling
  * Document rationale for spi-3wire property
  * Expand DT examples to cover typical and transposed display layouts
- Code reformat from clang-format to kernel style per maintainer feedback
- Fix conditional CONFIG_I2C/_SPI compilation issues per kernel test robot
- Add keypad scanning with configurable keymap (new feature)
- Add support for TM1638 controller extending hardware compatibility
- Add support for default and maximum brightness properties
- Fix multi-instance device handling and add optional label property
- Allocate DMA-safe SPI buffer for hardware compatibility
- Enhance error handling with comprehensive kernel-doc documentation
- Remove sysfs runtime reconfiguration, enforce device tree-only

v2:
- Fix duplicate label in dt-bindings examples
- Rename device tree property prefixes to use titanmec vendor prefix

Jean-François Lessard (6):
  dt-bindings: vendor-prefixes: Add fdhisi, titanmec, princeton,
    winrise, wxicore
  dt-bindings: auxdisplay: add Titan Micro Electronics TM16xx
  auxdisplay: Add TM16xx 7-segment LED matrix display controllers driver
  auxdisplay: TM16xx: Add keypad support for scanning matrix keys
  auxdisplay: TM16xx: Add support for I2C-based controllers
  auxdisplay: TM16xx: Add support for SPI-based controllers

 .../ABI/testing/sysfs-class-leds-tm16xx       |  57 ++
 .../bindings/auxdisplay/titanmec,tm16xx.yaml  | 477 ++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  10 +
 MAINTAINERS                                   |  11 +
 drivers/auxdisplay/Kconfig                    |  43 +-
 drivers/auxdisplay/Makefile                   |   5 +
 drivers/auxdisplay/tm16xx.h                   | 204 ++++++
 drivers/auxdisplay/tm16xx_core.c              | 622 ++++++++++++++++++
 drivers/auxdisplay/tm16xx_i2c.c               | 332 ++++++++++
 drivers/auxdisplay/tm16xx_keypad.c            | 208 ++++++
 drivers/auxdisplay/tm16xx_spi.c               | 398 +++++++++++
 11 files changed, 2366 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-leds-tm16xx
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
 create mode 100644 drivers/auxdisplay/tm16xx.h
 create mode 100644 drivers/auxdisplay/tm16xx_core.c
 create mode 100644 drivers/auxdisplay/tm16xx_i2c.c
 create mode 100644 drivers/auxdisplay/tm16xx_keypad.c
 create mode 100644 drivers/auxdisplay/tm16xx_spi.c

-- 
2.43.0


