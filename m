Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAAB405ECD
	for <lists+linux-leds@lfdr.de>; Thu,  9 Sep 2021 23:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346952AbhIIVcb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 17:32:31 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:37732 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345556AbhIIVca (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 17:32:30 -0400
Received: by mail-oi1-f170.google.com with SMTP id y128so4456049oie.4;
        Thu, 09 Sep 2021 14:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YvfLm3m8ccgAXfP1TlOkQLhdLxi0Xdr9HpUpgFIvUqY=;
        b=vHvhL9ADhsle151HTbTV65/xvinjYRvlifZ4/XD9XkFV8FHJ31ZlBsjvEHXwIrQtBg
         d7B1cJOZ7vgWGl8zXhUkPX9MhkqhQTahkLTDxxPRly41zWAEoNOtWmQUAhhDtab/bR6l
         UJBod6cbOsVbrsByohJDW8Zt+5Ub9AxtfRvXBSJt0kE9cvwXu0xw1M287BUDOdR2P7EB
         ElW5C40osN9Xa+E/OyPzoNmF+hGgkp4H5bqBNBft9fd0gZaRKBPnO7Ry2Y5bzsIg1Ie4
         2lYvfmL8kvWGpcHY9NhCDyuN3GX77z9uXyUXJnHobmdighsKBBBZo/fqhXGIJ41tZBSQ
         7PGg==
X-Gm-Message-State: AOAM532ArqP7/I87npxaCiBbvwG4rqW3g3OBkgEVrO3WeKeCnZzQhore
        G4qnLBSSStCm9JZgeb1irhvT/22yHw==
X-Google-Smtp-Source: ABdhPJxnMffdwn6AC3HD3EJlO6Fbfnx6kSrOQX+QsccugOVyXWazV4S0lTX05uUof7MgMoKU2Fj4vg==
X-Received: by 2002:a05:6808:13d3:: with SMTP id d19mr1564246oiw.178.1631223080501;
        Thu, 09 Sep 2021 14:31:20 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id m24sm694929oie.50.2021.09.09.14.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 14:31:19 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH 0/8] Arm boards syscon 'unit_address_format' clean-ups
Date:   Thu,  9 Sep 2021 16:31:10 -0500
Message-Id: <20210909213118.1087083-1-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This series addresses the last of the dtc 'unit_address_format'
warnings in the tree.

The remaining issue was dealing with the node names on 2 bindings for
Arm Ltd boards syscon child nodes: register-bit-led and Versatile ICST.
Both of these used an offset property for register address rather than
'reg' which is the preference nowadays. With a 'reg' property, then we
can have a proper node name and unit-address. This series adds support
for using 'reg' instead and updates the node names and unit-addresses.

The dts file changes have inter-dependencies, but the clock and led
changes can go via each subsystem.

Rob


Rob Herring (8):
  dt-bindings: leds: Convert register-bit-led binding to DT schema
  dt-bindings: leds: register-bit-led: Use 'reg' instead of 'offset'
  leds: syscon: Support 'reg' in addition to 'offset' for register
    address
  dt-bindings: clock: arm,syscon-icst: Use 'reg' instead of 'vco-offset'
    for VCO register address
  clk: versatile: clk-icst: Support 'reg' in addition to 'vco-offset'
    for register address
  ARM: dts: arm: Update register-bit-led nodes 'reg' and node names
  ARM: dts: arm: Update ICST clock nodes 'reg' and node names
  kbuild: Enable dtc 'unit_address_format' warning by default

 .../bindings/clock/arm,syscon-icst.yaml       |  5 +
 .../bindings/leds/register-bit-led.txt        | 94 ------------------
 .../bindings/leds/register-bit-led.yaml       | 97 +++++++++++++++++++
 arch/arm/boot/dts/arm-realview-eb.dtsi        | 42 +++++---
 arch/arm/boot/dts/arm-realview-pb1176.dts     | 42 +++++---
 arch/arm/boot/dts/arm-realview-pb11mp.dts     | 48 ++++++---
 arch/arm/boot/dts/arm-realview-pbx.dtsi       | 42 +++++---
 arch/arm/boot/dts/integrator.dtsi             | 23 +++--
 arch/arm/boot/dts/integratorap-im-pd1.dts     |  9 +-
 arch/arm/boot/dts/integratorap.dts            | 15 ++-
 arch/arm/boot/dts/integratorcp.dts            |  9 +-
 arch/arm/boot/dts/mps2.dtsi                   | 10 +-
 arch/arm/boot/dts/versatile-ab-ib2.dts        |  6 +-
 arch/arm/boot/dts/versatile-ab.dts            | 27 ++++--
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi | 27 ++++--
 drivers/clk/versatile/clk-icst.c              |  3 +-
 drivers/leds/leds-syscon.c                    |  3 +-
 scripts/Makefile.lib                          |  1 -
 18 files changed, 318 insertions(+), 185 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/register-bit-led.txt
 create mode 100644 Documentation/devicetree/bindings/leds/register-bit-led.yaml

-- 
2.30.2

