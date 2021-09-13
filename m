Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1787C409CF5
	for <lists+linux-leds@lfdr.de>; Mon, 13 Sep 2021 21:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242263AbhIMT3f (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Sep 2021 15:29:35 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:40686 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241848AbhIMT3e (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Sep 2021 15:29:34 -0400
Received: by mail-ot1-f54.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so14871688otq.7;
        Mon, 13 Sep 2021 12:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g+Q2qhVPQ7t2dWkHiAQZbqwf5gFYdZacySJXFNnEnrg=;
        b=hgcU/39cL8nasIheHfvohl3WR5g0ZzrhE3GpyQgX3ixzyp7u1uyQtnmPxdFpCtGjro
         DbpYcyPDQGVULJFJ1xlSvsY9Bv46Gffp9LNncaq4kKqC7p88R3iYQ/1Mb2kmbhk4RApo
         /Cfy0EXsweiIkPEZvaomujgVxgoi+ZCGNUt7TG7EuGh5zgc5gKiLrXMxyvLXhi4YJrpk
         hNunzb14Vi+6vMJ8JJxrxBNFyn0S4PzwD5Plpt/8wZzLzrOvtHPo34/fxfQubS0Nj8ZX
         0mQVbQP8Vp4nSL4dLdRZAFD2sa83+PunJZvwgazxcaZ4WdjT8ydnmOs1Ey++kffol4KQ
         hhAQ==
X-Gm-Message-State: AOAM531OQkTpb4hlNuQY5R9VYtA10GeCLL5sLC6gbPhW6EwA8AmxPctB
        IePf6Hf3/hKEaOZJy1pUOw==
X-Google-Smtp-Source: ABdhPJxPkAR3Bxh1Ev21crujx07CiRZnZvdkVQ7u2FyfOauoqvueRDEfAPRY/2dg38mxF7DLleoA3g==
X-Received: by 2002:a05:6830:31a5:: with SMTP id q5mr11038625ots.253.1631561298042;
        Mon, 13 Sep 2021 12:28:18 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id m24sm1907838oie.50.2021.09.13.12.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 12:28:17 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v2 0/8] Arm boards syscon 'unit_address_format' clean-ups
Date:   Mon, 13 Sep 2021 14:28:08 -0500
Message-Id: <20210913192816.1225025-1-robh@kernel.org>
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
 .../bindings/leds/register-bit-led.yaml       | 95 +++++++++++++++++++
 arch/arm/boot/dts/arm-realview-eb.dtsi        | 42 +++++---
 arch/arm/boot/dts/arm-realview-pb1176.dts     | 42 +++++---
 arch/arm/boot/dts/arm-realview-pb11mp.dts     | 48 +++++++---
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
 18 files changed, 316 insertions(+), 185 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/register-bit-led.txt
 create mode 100644 Documentation/devicetree/bindings/leds/register-bit-led.yaml

-- 
2.30.2

