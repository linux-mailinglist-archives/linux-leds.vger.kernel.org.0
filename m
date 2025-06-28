Return-Path: <linux-leds+bounces-4908-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9323EAEC8A2
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 18:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BD923A52C5
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 16:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402FA1C8630;
	Sat, 28 Jun 2025 16:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5ErJL22"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D0A1DFCB;
	Sat, 28 Jun 2025 16:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751127535; cv=none; b=E+h59pvnILCV7H+vHnOG3/2xcaQuR3gI7AbKFd5mweKu6xge9Nr2JrkVHPl/jwU0r80whHdNqN704gPxnfuak5BM2P1ko3LvA93U70Flgoiectd2GXuq1p83AcEbSRzENhp81HB047BI7pJMm5e5umVWapRUJYtnv1WC0b+UbaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751127535; c=relaxed/simple;
	bh=JyqYQn058ulnVRzRSQFDjebG98r2PEGwzzOV6MZOR+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GgV/YJR1S6mr6PF9hEqXOESCzMmk2IFy+rvsW5wTjqEzXv3+zAhV8M0SWYLJ6UlZKrs9g9YQ1VUFDPjR2hp0nuEsx6zDokpivW2BkBL3z9X3vNAa6ctCBQjoDKPHvF07EmbtbIEctFgeW1pmaev3K8OL4qcYotIxo96XONHwEI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5ErJL22; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d44e3a0169so33138085a.0;
        Sat, 28 Jun 2025 09:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751127532; x=1751732332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hoDWjObtBuyHoHSuTJOYnR341txLjfdZGnwqbJ9pMIQ=;
        b=P5ErJL22kyip/dO5qC7BktnHA0nXN4NhtzbccyPci0dii+KZM/OGfQTlDCSKH1lmqr
         ZQbV3NkfxBaAhux81cWM4OB0eScUS0JoFrYdWngpl2710kEg/Aklo6Be31/zNjyhgZF4
         kzlB47vCxKbvoBGtbO0hWblMAm46IBOzAY6Nhv99A7x0vlhMZxKMwU9zbSBcqBDwhgRV
         wOf1d9olEF+Zoe34FQXNWI1D+ux6soGBFjkQmm07fKKfGorGvetMnfYEGsfk798+c8Oj
         mroKP8hXl9XpXrZUC6laCcMqUF4zuDAuvabtCndBTPPmNWEPJYwn7GdICNe74htjdTZ2
         J12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751127532; x=1751732332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hoDWjObtBuyHoHSuTJOYnR341txLjfdZGnwqbJ9pMIQ=;
        b=V64pco9pfEkWhk/+BZzOcy2TwXH91UJc6ctJXM7t2xycHzuHSkB/VEztwRU2VVOHQZ
         x/L8SMKRI6k5oBKd+kXh17pfqc9sCgnQbCXR1UAtwiiBJssm5404/xloBFKdACz7Eqck
         IlFpEENAt4Q04UjWqazVyIaFYiX52O31Y1uuo1bTFnMvpBFBWlx2d8W9M8FS0uHpby2Q
         YrjNCz8qO2UsGkX9oDJsn0uEF+LlwdwCx3xRb9T+bdjaDiIE+R8Rd4CDvq1/GgoMjoBx
         Wg4WjrkeT3YUe3yTbcZWQa4cggvHm6Y0M4Gwb73lYRuY0EBtkundNIElPN1200bQ6CHY
         Vqzg==
X-Forwarded-Encrypted: i=1; AJvYcCVGfaIf3XK78O75LX8sfgSXBQtpqli7OlcTqjjBuBAxYyZpIMLRQSCl+cwJYYI19UxZNVmc7UHw84pq@vger.kernel.org, AJvYcCVrU15LblBy2c9CEcXBIybdQqI/r2KXf/iiUh/gspfWefCCIacsAZscBuMSodHaWtD2AMQ7HGXtNbg7OA==@vger.kernel.org, AJvYcCXQVihIR69/5UIS5xEW+D499DjXR9SaB8tjuqYZWLWio/QIw6PAV5aDf1t8obExT3luODgxF+sXdrSlYXDR@vger.kernel.org
X-Gm-Message-State: AOJu0YyoH4o4k2KsLNXHw1IURVX305TsmgVFRn5L6hZj+JJOsRvSl8xd
	cGUXD8Fg+LAmQuD2WE6ka0W9aqkki1f4L6s9Lxt/9GcqPGmjCMHuGzDX
X-Gm-Gg: ASbGnctrOyZBoXTvWmboEshGwhwrPRv3oqc4hde5v7u0UlwMueKSmbralNd+cgbBB3K
	GEKSDRYJKhWmrylgo51JFsDDXqWc0CRPRPDb5isfge0rui3Izz7QLWJAUKlWV8wvZY4TXPGXD5G
	A+hXjaFD+zmRln+pzKVeEYlw/7633746MqYjgH12t5PEKRNwLVNcvajfQWg37b2iEHSX6l8ySv7
	H7Oq3yUOCf4n/9peLvgmHFF/GgsMAc4bCwuJCZUIPNNWyoW9OJ9JdOOVzAEohkxQNAuqZu94WtR
	XP7D5RP19vuMap7e4GmNb84IZ5PkfUY9Z3OG0wLkZyzHPwpSlsfwBgjhdJKBnX3QkiAROU+sydP
	JJ0TS8NbriHzaTzJihCNkcllB5eUktQxm
X-Google-Smtp-Source: AGHT+IGTY2pvG5ol2Cbj152OnsbN8xF0jI4x3OzNRTcHC5bddrKrg+nqTSbvNLkrDomfgr7f7lD2xA==
X-Received: by 2002:a05:620a:2949:b0:7d3:e868:a684 with SMTP id af79cd13be357-7d443a0d4e6mr1040309885a.51.1751127532261;
        Sat, 28 Jun 2025 09:18:52 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d4432371d0sm309257185a.102.2025.06.28.09.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:18:51 -0700 (PDT)
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
Subject: [PATCH 0/8] auxdisplay: Add TM16xx and compatible LED display controllers driver
Date: Sat, 28 Jun 2025 12:18:37 -0400
Message-ID: <20250628161850.38865-1-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
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
- tm16xx,digits: Array defining which controller grids drive digit displays.
- tm16xx,segment-mapping: Mapping of 7-segment display elements to controller outputs.
- tm16xx,transposed: Flag for displays with swapped grid/segment orientation.
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

Andreas Färber (2):
  dt-bindings: vendor-prefixes: Add Fuda Hisi Microelectronics
  dt-bindings: vendor-prefixes: Add Titan Micro Electronics

Jean-François Lessard (6):
  dt-bindings: vendor-prefixes: Add Princeton Technology Corp
  dt-bindings: vendor-prefixes: Add Winrise Technology
  dt-bindings: vendor-prefixes: Add Wuxi i-Core Electronics
  dt-bindings: auxdisplay: add Titan Micro Electronics TM16XX
  auxdisplay: Add support for Titanmec TM16xx 7 segment display
    controller
  MAINTAINERS: Add entry for TM16xx driver

 .../bindings/auxdisplay/tm16xx.yaml           |  153 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   10 +
 MAINTAINERS                                   |    6 +
 drivers/auxdisplay/Kconfig                    |   18 +
 drivers/auxdisplay/Makefile                   |    1 +
 drivers/auxdisplay/tm16xx.c                   | 1305 +++++++++++++++++
 6 files changed, 1493 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/tm16xx.yaml
 create mode 100644 drivers/auxdisplay/tm16xx.c

-- 
2.43.0


