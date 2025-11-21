Return-Path: <linux-leds+bounces-6272-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDB0C7A6A4
	for <lists+linux-leds@lfdr.de>; Fri, 21 Nov 2025 16:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1FEF135CF87
	for <lists+linux-leds@lfdr.de>; Fri, 21 Nov 2025 14:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AF82C21C2;
	Fri, 21 Nov 2025 14:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2UcHlMA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA2F2C0F8C
	for <linux-leds@vger.kernel.org>; Fri, 21 Nov 2025 14:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737158; cv=none; b=PZvjAmUUEYRQC/Wy80EKigYdgrRgHkzcKtBQxnmJG63khAb/0q5WfZ0svFw4SPoBWRk7u7I33hy+lwmPfiT/IHWRx1t1cLR/0ILp+G0aO1BEuSjaQVaSNiJJS+ptMdTpMMH0n4NN2a3xT9RFdG3bNqKP2a1CX6kew53CrOm0EXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737158; c=relaxed/simple;
	bh=AEPPC2/OB+EufDF/AubUdHCaH/c6DPuCqPKXn50gnxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UwjGxsL0worM8QNnHdMKbVTxv3N9FX6dTkl2CwiZFJNTxDyhemL8+KUIVQLvPA+fXxPKMAe5Lw6BALi9FVOcwmUFGK7ZeI6p9vzyg7llZkA3+omWLyU7vb+aYLA0G37B5IUeCTybTSYjbFsB1t8LUfq/hy2B9pPSqGhFa3Hgsbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2UcHlMA; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4edf1be4434so16415471cf.1
        for <linux-leds@vger.kernel.org>; Fri, 21 Nov 2025 06:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763737154; x=1764341954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A1g5hDcJOSC1qjJJxGkJ4PFPBcBAfI5Ur0GFlw7nurs=;
        b=h2UcHlMAPogYShd5Lf1bVowZSc6k7jwkUCiePNBxah09lba/HzOo3kGQ8i54iUDln3
         LNxkXsSEDy1+9eUqML2yQ+grU5BL08bHBF7wkLZBRN6my/lR7Bx/S5Fx/QAQUS6Q4gsA
         2d1mQbRqwwYCpkqtC8i4MYQ4kO0jaUlYhYIjHoO44qIZiqdJQJNZ3oxSBpUm4zWz2yjB
         OzzjE/a1F00fB//FAn+7IFc1cLR0uPIgu2Eh8WDAle8j6s/s5NsER6NiVWpyx6p6Tgki
         cKvx6JatNn0ZEwhL7RXbCm3cDu9+RbUWupa7uk+N67wINdZcIMB1LA5uhepPGf/JnAoq
         swJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763737154; x=1764341954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1g5hDcJOSC1qjJJxGkJ4PFPBcBAfI5Ur0GFlw7nurs=;
        b=uJUU/SRNKWb4ciCHMnotxFLIhgak1Ljm5sf0xeYAKEmm0iqyscmvvOj1RTkeEYC1fm
         4kWNMgDeuovefSWM7MF/4WHowrp/deb3Z3+BcCFVXoF5raJgGyUPKnou/mlEsf4+plds
         iPQ9D/rELNMZsG0nR1uBnWcqF9fxF8eWM5l3ryQ6yrNjL7Q4LMD28Q9AIq5pIJPO8vN/
         t6BNkGw3sCwc4YW6VHUxZhjw+dFaLlpsMuKcdVQ9yu3WQdbitUsog6wXgSlWiwwMcZLt
         aQWgCurN8CQgXiPGpJDLPrP7XXJUJWcVDpOeCWs0GlAwxW66OnZOC5cEmn9h/nASLOkq
         8pBw==
X-Forwarded-Encrypted: i=1; AJvYcCWlCn4GCw9+VfH+PooLRtYEG2X9XLmmtX2TTNGQ1L4dIqTzqDjw1uUWifJvro/4xM0CtI4GsKp1mx8+@vger.kernel.org
X-Gm-Message-State: AOJu0YzWd5DIvkeFhJaNMXnnrDjVbO0LW+55qRM00msH5vfpYfhGePzj
	h4d8PXtsTDvgL7dCiLVHXcNR2aP7VHAwggbP4FCCf/ELStbyzNDy42dS
X-Gm-Gg: ASbGncv4Z9OKdsfkyZ/AH5pUAOSn0gZiZ/b5s02vUHw3YvzJjiP33ZehioTxDGEGYsJ
	w8m8g2x8lloPKFmbHlwZV1rUn7Pcl5+5yUC/mzU7a0nnWSnGB5n0+az0DNfqK5vuoV5o7wpsQOU
	cdV/+5fSIYB+AmIzAie0usfS67mX+QQzg4gi4LSi6LLRpVjlv3ztHGOSj0mOz6Mcvtv+weUvFKl
	lZR700F10f8Gt+YSPODzseJFRXyUyR7LN14VXF9/G2uW29ZuMbwaCb/g1aPIJPV+ViqgtIJsnld
	dnOzL9YI21hACMMnJlcIIVQvMeOEeFJD9BmVKWkR2KJRaj4RMgDD7lhZ/qXUkSuIDUUMpw+rSfx
	DGULWgpDepPpiBK02X7T+WbHwevURfKL6xZJxs4ceSNv82Pfy5lGqg/6E7wRBTapM4KG4p0BAWK
	YiUyCobmnmHoCEdcxdDlxXJQ5EG7c17h8UXvUkhbFhxcOZeotUo3w61bf0
X-Google-Smtp-Source: AGHT+IFP8ya+Er0C8RuiSOkCyYLALm/nejOQiyK9TwIBTMNVGMIBgNLU/F3gxda3wpr0r5uy+x1mYw==
X-Received: by 2002:a05:622a:1ba4:b0:4ee:49b8:fb82 with SMTP id d75a77b69052e-4ee58914e86mr34017431cf.60.1763737153483;
        Fri, 21 Nov 2025 06:59:13 -0800 (PST)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48e66f28sm36596381cf.26.2025.11.21.06.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 06:59:13 -0800 (PST)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v6 0/7] auxdisplay: Add TM16xx 7-segment LED matrix display controllers driver
Date: Fri, 21 Nov 2025 09:59:00 -0500
Message-ID: <20251121145911.176033-1-jefflessard3@gmail.com>
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

Tested on multiple ARM TV boxes (H96 Max, Magicsee N5, Tanix TX3 Mini,
Tanix TX6, X92, X96 Max) across different SoC platforms (Rockchip, Amlogic,
Allwinner) in both I2C and SPI configurations.

User space utilities available at:
https://github.com/jefflessard/tm16xx-display

Dependencies:
- linedisp_attach()/_detach() infrastructure introduced in patch series:
 "auxdisplay: linedisp: support attribute attachment to auxdisplay devices"
- fwnode_for_each_available_child_node_scoped() from patch series:
 "device property: Add scoped fwnode child node iterators"

Note: This driver is placed in drivers/auxdisplay rather than drivers/leds
based on previous maintainer guidance. LED maintainer Pavel Machek
recommended auxdisplay for TM1628-based display drivers:
https://lore.kernel.org/linux-devicetree/20200226130300.GB2800@duo.ucw.cz/

Regmap Evaluation:
TM16xx controllers use command-based 2-wire/3-wire protocols that share
sufficient commonalities with I2C/SPI to leverage their subsystems, but
are not fully compliant with standard register-based access patterns:
- TM1650 example: 0x48 is a control command while 0x4F is a keyscan
  command. These appear as adjacent I2C "addresses" but are distinct
  commands with different data directions and payloads, not read/write
  pairs of the same register.
- TM1628 example: Initialization requires coordinated sequences followed
  by indexed data writes. Single regmap read/write calls cannot express
  these multi-step transactions and timing constraints.
- Protocol requirements: I2C read operations require I2C_M_NO_RD_ACK flags;
  SPI write-then-read operations require mandatory inter-transfer delays
  and CS assertion across phases.

While regmap provides valuable synchronization, debugfs, and abstraction
benefits, standard I2C/SPI regmap buses cannot handle these requirements.

Custom regmap implementation is technically possible via IO accessors, but
demands complex command routing logic and only partially supports paging.
It would essentially recreate the existing controller functions while
forcing them into register semantics they don't naturally fit.

The current explicit I2C/SPI approach directly expresses the hardware's
actual command structure and maintains proper controller abstraction.

Changes in v6:
- core: Reduce indent level of fwnode children parsing
- core: Comment brightness properties handling
- core: Document concurrency model and non-devm resource management
- core: Remove apply label property comment
- core: Remove dev_err_probe for mutex init
- core: remove '0' from led_init_data initialization
- core: Merge tm16xx_display_value loops with embedded conditional
- core: Document flush_status error handling to flush operations
- core: Change scoped_guard to guard() in flush operations
- core: Return early on flush operations
- core: Format to single line within 100 char limit
- core: Drop tm16xx_probe/_remove kernel-doc
- core: Use %true/%false formatting in kernel-doc
- i2c: Consolidate FD655/FD6551 CMD_CTRL definitions
- all: Ensure RCS declarations
- all: Change EXPORT_SYMBOL_NS to _GPL
- all: Add missing header includes
- header: Add forward declaration for struct device
- header: Remove const qualifiers from controller fields
- Kconfig: Expand help text to ~3 lines minimum
- Kconfig: Add COMPILE_TEST for compile test coverage
- dt-bindings: Change units to hex pattern
- dt-bindings: Add led node description

Changes in v5:
- dt-bindings: set $ref: /schemas/leds/common.yaml# at the node level
- dt-bindings: add constraints to max_/default_brightness properties
- dt-bindings: clarify digit positions are numbered left-to-right
- dt-bindings: reorder the schema sections to 'dependencies',
              'required', 'allOf'
- dt-bindings: leds: add default-brightness to leds/common.yaml
- core: rename prfx to prefix in TM16XX_CTRL_BRIGHTNESS macro
- core: drop i2c/spi client union in favor of to_i2c_client/to_spi_device
- core: rename controller grids/segments to avoid 7-seg confusion
- core: remove tm16xx_digit_segment and simplify tm16xx_digit structs
- core: drop tm16xx sysfs attributes in favor of line-display library
- core: rename tm16xx_parse_dt to tm16xx_parse_fwnode
- core: replace manual child count with fwnode_get_child_node_count
- core: use __free(fwnode_handle) instead of fwnode_handle_put
- core: remove of.h include and duplicated logic of main led label
- core: use devm_ variant of mutex_init
- core: drop kernel-doc for well-established meaning functions
- i2c/spi: remove redundant NULL initializers
- i2c/spi: remove CONFIG_OF preprocessor conditions
- i2c/spi: drop usage of of_match_ptr
- i2c/spi: fix CONFIG_I2C=m, CONFIG_SPI=y, CONFIG_TM16XX=y edge case
           reported by kernel test robot (late v3 feedback)
- all: rely on explicit rather than transitive includes
- all: review signed types usage consistency
- all: use 'if (ret)' where there is no positive return
- all: apply relaxed line wrap, allowing over 80 column width
- all: remove info and debug messages
- all: update copyright year to 2025

Changes in v4:
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

Changes in v3:
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

Changes in v2:
- Fix duplicate label in dt-bindings examples
- Rename device tree property prefixes to use titanmec vendor prefix

Jean-François Lessard (7):
  dt-bindings: vendor-prefixes: Add fdhisi, titanmec, princeton,
    winrise, wxicore
  dt-bindings: leds: add default-brightness property to common.yaml
  dt-bindings: auxdisplay: add Titan Micro Electronics TM16xx
  auxdisplay: Add TM16xx 7-segment LED matrix display controllers driver
  auxdisplay: TM16xx: Add keypad support for scanning matrix keys
  auxdisplay: TM16xx: Add support for I2C-based controllers
  auxdisplay: TM16xx: Add support for SPI-based controllers

 .../bindings/auxdisplay/titanmec,tm16xx.yaml  | 465 +++++++++++++++++
 .../devicetree/bindings/leds/common.yaml      |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  10 +
 MAINTAINERS                                   |  10 +
 drivers/auxdisplay/Kconfig                    |  53 ++
 drivers/auxdisplay/Makefile                   |   5 +
 drivers/auxdisplay/tm16xx.h                   | 200 +++++++
 drivers/auxdisplay/tm16xx_core.c              | 488 ++++++++++++++++++
 drivers/auxdisplay/tm16xx_i2c.c               | 333 ++++++++++++
 drivers/auxdisplay/tm16xx_keypad.c            | 192 +++++++
 drivers/auxdisplay/tm16xx_spi.c               | 398 ++++++++++++++
 11 files changed, 2160 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
 create mode 100644 drivers/auxdisplay/tm16xx.h
 create mode 100644 drivers/auxdisplay/tm16xx_core.c
 create mode 100644 drivers/auxdisplay/tm16xx_i2c.c
 create mode 100644 drivers/auxdisplay/tm16xx_keypad.c
 create mode 100644 drivers/auxdisplay/tm16xx_spi.c

-- 
2.43.0


