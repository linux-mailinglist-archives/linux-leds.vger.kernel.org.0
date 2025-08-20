Return-Path: <linux-leds+bounces-5259-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1D7B2E251
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 18:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D77D162E0B
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 16:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD07322A1C;
	Wed, 20 Aug 2025 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQ1aBebN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1305C88;
	Wed, 20 Aug 2025 16:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755707484; cv=none; b=DmCFpduayo6V3e3SeXn7/FD3HD4qS96D+DodfocRpZx36vuHLVKQch42bQxriiyhDCcMb5EOzTK+o84kGH1Rke/rJ86AbBIQT0Bs/Dw/3mmRRoz1yaliNMBPAlfFxoQ9bbTLtBwEBjhc9A3hrHO743NcrynARz00TLa0A+IxUdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755707484; c=relaxed/simple;
	bh=gJb2XhKnfcbdkyWDG9kP9TG0CFDrIENMXz1dusyFwGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VNA2afGhvFIl1iIUYErsVq7EFvLxbrh0UhWUR2AbzEeXuzAM7xXwYXK5CVpNFjm3w973aXZ3JBvfvD7B7NubMD7TQK0H2/XA3Vf5wgCdFIobUtSF1mZVdcUaslmSllrijSNhtn+TMCUkOuu5DpeO3d8VtNTcM6O/Sv4C3XGa1pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQ1aBebN; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7e87061d120so638770585a.2;
        Wed, 20 Aug 2025 09:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755707482; x=1756312282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9VwOzcGpev9O4AUvBo7Gko8mXyOGyU6qQKEM1bQNfQE=;
        b=gQ1aBebNs0LTbzf/Kuun4bZCL/s/2omVCWy3FBx9k9AeELnIAKJSDDQD7mmXZ3tMpp
         VSe8hbR9WsDQ9aUbaO/tNIF+PfZOE13owtr+GtugydbuCZoKkVjs5RRuiod4Md4bHFwI
         G6WvRsNgxqkRI8wA4AIzR9Sd3YRPC7/IkAvA6bD0fcX31Q8FwP7y2VebDr6ZDaw7ICAH
         pURAhBoj0HKcmLW7+WCcE4PxVKbMpwth7YwMeW1hCj8AcbL0/pWnXzOgZbHWi9BSJza8
         AbbBjn09O0eXW1xWCKBLfbAUGFf6Gzd7ACP00AKKnaSpFYYDSBxflOH2Pz4ZVSe/hiD9
         ewPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755707482; x=1756312282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VwOzcGpev9O4AUvBo7Gko8mXyOGyU6qQKEM1bQNfQE=;
        b=hEZYTeajONPgQ4oHyR2yJLSUhcuKUfgouxz2fWCV/W3KirR6mppx/d3UKKVyWXXi4Q
         tH6KUL9DnNU4WpgwVYtK8SdI5bFn6PuKnc0fKJo8lDBO3Wls8ekhHDIGZVxPX2LBk+YM
         34pqL18oJ3ShVQN7f0btGVJkDf2VnI0ksuhunp16E/7qDyPMZhxqNz3+XegtSdPiIaFC
         0uEGswYxvweM3aW9QgBgzH/ShfHs1xCJCbJip8RYQnviwGN46UKjRIBIPCFUBCe6aoOA
         C1ES0p6PeCOK1HcCuFtj6vXdeSYWM3eeMn2RC4WVl+V5aHY+RzPxCWe3kSudOlX9V8y6
         1Hig==
X-Forwarded-Encrypted: i=1; AJvYcCUGbY85+CJVZ1mapvJ0QsAShLJ//XSGpGnjz+c5+WKj6uvg6iz//QJzTiOLTJM57DYM6aIbQ3F0tepY@vger.kernel.org, AJvYcCUeMu/9ZFSb7sjIkW8erw25t9qodKXFjtCp1e3jT07s9QrKq5XpLgHjMs81gQIGaaDmoamBrK3T27glsjfj@vger.kernel.org, AJvYcCWVLEFCkQ6HqvPD5Fl6x60x7bbGIj8xskyer5Qf1PCx+Xkd/mj+SHGgwFj05Xr00U2aBgswPP5+9bSrUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe4qRG1VU874Zr1s3u/iFe3wfIjRJ/KN0gzliPQ5jyCkUgWM+A
	W6IezXSxwLljIsxtQv5rUAKCmoAUekBQqINd4bEXEyfPuTvUpbQ0i3/M
X-Gm-Gg: ASbGncslYYnzNFiQIdor0yurISRid0Dw89QjYyr5swnH4mQoOAP9eZIswYmWHIcJhJw
	NsMK7iR7+SDBKIU/l/iUYEZafGx98B6iVhRxQFJKiERBYyes1ryw1cm8Lhu0BO4m0v/jbGjdrEH
	tmpp30CK9P4CcDT/kCdALTvWTdDKmbM9GyTF4TeU/bnejC0lbQeIz1y16qwDA2YSNbz/f88nKps
	zVPmHpCdvkuPjes2qtRIwvuaktIK8ba6C2UzRdEI2pR0B10Zkiys5NrPuLeq3fkvnRLQ8arhccV
	4IKdguAF5sWhrRdkYNpbv/H5xQYykd3ZiEv9rVP7NBNwPI4IjYGWK9DGb1Pm5uEx9XknZweTW0V
	VSgRW36sBdTLTlvslxIFxm0+t+UXKYqtrvBAdLSjGNZAawq6ImZdyC7YRwCNSAMX7/RCE
X-Google-Smtp-Source: AGHT+IEFaOnI2pkqk0M7ebp62+GruH2nUHjVTHekPAtpgCDuzlSZdo68Wfr1Bx0sMP+mE3s6/ND/JA==
X-Received: by 2002:a05:620a:4406:b0:7e8:6cf0:725d with SMTP id af79cd13be357-7e9fca9718amr410707185a.30.1755707481839;
        Wed, 20 Aug 2025 09:31:21 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba9077520sm89373706d6.21.2025.08.20.09.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 09:31:21 -0700 (PDT)
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
	Paolo Sabatino <paolo.sabatino@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 0/4] auxdisplay: Add TM16xx 7-segment LED matrix display controllers driver
Date: Wed, 20 Aug 2025 12:31:13 -0400
Message-ID: <20250820163120.24997-1-jefflessard3@gmail.com>
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
controllers and compatible chips, widely used in auxiliary displays on TV boxes
and embedded devices.

Many consumer devices, particularly TV boxes, use auxiliary displays based on
TM16xx controllers to show status information such as time, network connectivity
and system state. Currently, there is no mainline kernel support for these
displays, forcing users to rely on out-of-tree drivers or userspace solutions
that access hardware interfaces directly.

This driver provides unified TM16xx support through the LED subsystem with both
I2C and SPI communication protocols. It integrates with the LED class
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

Device tree bindings describe board-specific display wiring since controllers are
layout-agnostic. The bindings use separate 'digits' and 'leds' containers with
specific addressing schemes to accommodate the hardware's grid/segment matrix
organization.

Note: This driver is placed in drivers/auxdisplay rather than drivers/leds based
on previous maintainer guidance. LED maintainer Pavel Machek recommended
auxdisplay for TM1628-based display drivers:
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

User space utilities available at: https://github.com/jefflessard/tm16xx-display

v3:
- Update vendor prefixes with documented rationale, in a single patch,
  per maintainer feedback
- Refine device tree bindings per maintainer feedback:
  * Update compatible string ordering and fallback logic
  * Improve YAML descriptions for clarity and maintain 80-column wrapping
  * Replace digit-specific properties with clearer digits container node
  * Add explicit constraints for reg and segments properties in container nodes
  * Clarify addressing schemes for icons (2-cell) and digits (1-cell + mapping)
  * Fix conditional SPI properties handling
  * Document rationale for spi-3wire property (required for supported SPI chips)
  * Expand DT examples to cover typical and transposed display layouts
- Code reformat from clang-format to kernel coding style per maintainer feedback
- Fix conditional CONFIG_I2C/CONFIG_SPI compilation issues per kernel test robot
- Add keypad scanning with configurable keymap (new feature)
- Add support for TM1638 controller extending hardware compatibility
- Add support for default and maximum brightness properties
- Fix multi-instance device handling and add optional label property
- Allocate DMA-safe SPI buffer for hardware compatibility
- Enhance error handling with comprehensive kernel-doc documentation
- Remove sysfs runtime reconfiguration, enforce device tree-only configuration

v2:
- Fix duplicate label in dt-bindings examples
- Rename device tree property prefixes to use titanmec vendor prefix

Jean-François Lessard (4):
  dt-bindings: vendor-prefixes: Add fdhisi, titanmec, princeton,
    winrise, wxicore
  dt-bindings: auxdisplay: add Titan Micro Electronics TM16xx
  auxdisplay: Add TM16xx 7-segment LED matrix display controllers driver
  MAINTAINERS: Add entry for TM16xx driver

 .../bindings/auxdisplay/titanmec,tm16xx.yaml  |  471 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   10 +
 MAINTAINERS                                   |    6 +
 drivers/auxdisplay/Kconfig                    |   20 +
 drivers/auxdisplay/Makefile                   |    1 +
 drivers/auxdisplay/tm16xx.c                   | 1781 +++++++++++++++++
 6 files changed, 2289 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
 create mode 100644 drivers/auxdisplay/tm16xx.c

-- 
2.43.0


