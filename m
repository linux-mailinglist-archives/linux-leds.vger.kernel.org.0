Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C25C3DF270
	for <lists+linux-leds@lfdr.de>; Tue,  3 Aug 2021 18:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233421AbhHCQ1R (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Aug 2021 12:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233408AbhHCQ1R (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Aug 2021 12:27:17 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A0FC061757;
        Tue,  3 Aug 2021 09:27:05 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2804:14c:1a9:2434:b693:c9:5cb6:b688])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nfraprado)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E52D11F423A5;
        Tue,  3 Aug 2021 17:26:57 +0100 (BST)
From:   =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, ~lkcamp/patches@lists.sr.ht,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>,
        kernel@collabora.com
Subject: [PATCH v3 0/5] Add support for QCOM SPMI Flash LEDs
Date:   Tue,  3 Aug 2021 13:26:36 -0300
Message-Id: <20210803162641.1525980-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

this patch series adds support for Qualcomm's SPMI Flash LEDs present in the
PM8941 PMIC. It is used as part of MSM8974 based devices, like the Nexus 5
(hammerhead), as a camera flash or as a lantern when in torch mode.

The driver code is based on the parts of the QPNP LEDs driver from downstream
[1] that handled the flash LED.

This hardware doesn't have any publicly available documentation, so all my
knowledge about its behavior came from reading the downstream driver code and
from inspecting the SPMI registers used for the LED operations. I have collected
my findings at [2].

Bjorn, Jacek and Pavel, big thanks for your review in v2. I didn't answer the
emails but I believe I addressed all of the feedback you gave me. Sorry for the
long delay, I'll try to actually answer the feedback this time, and in a timely
manner too.

The changes in this v3 are too many to list, but the biggest ones were:
- The two LEDs can now be operated independently even when in torch mode
- The flashes can now strobe consecutive times without needing to manually
  disable them between strobes
- Implemented strobe_get()
- Moved dt parsing to a separate function
- Split multiplexed torch/flash on/off and torch/flash regulator on/off
  functions
- Removed configurations from the dt-binding that didn't have any visible
  impact, instead hardcoding them inside the driver
- Moved LED dt nodes configuration to hammerhead dts
- Set current on brightness callback and timeout on timeout callback, instead of
  setting everything every time when strobing/turning torch on

Fault detection and V4L2 flash wrapper support are still missing but, as others
have pointed out before, they can be implemented later if desired.

Thanks,
Nícolas

v2: https://lore.kernel.org/linux-arm-msm/20210126140240.1517044-1-nfraprado@protonmail.com/
v1 RFC: https://lore.kernel.org/linux-arm-msm/20201106165737.1029106-1-nfraprado@protonmail.com/

[1] https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/drivers/leds/leds-qpnp.c
[2] https://gitlab.collabora.com/nfraprado/linux/-/wikis/PM8941-Flash-LEDs

Nícolas F. R. A. Prado (5):
  dt-bindings: leds: Add binding for qcom-spmi-flash
  leds: Add driver for QCOM SPMI Flash LEDs
  ARM: qcom_defconfig: Enable QCOM SPMI Flash LEDs
  ARM: dts: qcom: pm8941: Add nodes for QCOM SPMI Flash LEDs
  ARM: dts: qcom: msm8974-hammerhead: Enable and configure flash LED
    node

 .../bindings/leds/leds-qcom-spmi-flash.yaml   |   93 ++
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    |   20 +
 arch/arm/boot/dts/qcom-pm8941.dtsi            |   25 +
 arch/arm/configs/qcom_defconfig               |    2 +
 drivers/leds/flash/Kconfig                    |    8 +
 drivers/leds/flash/Makefile                   |    1 +
 drivers/leds/flash/leds-qcom-spmi-flash.c     | 1251 +++++++++++++++++
 7 files changed, 1400 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml
 create mode 100644 drivers/leds/flash/leds-qcom-spmi-flash.c

-- 
2.32.0

