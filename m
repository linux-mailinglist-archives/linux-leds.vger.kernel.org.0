Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F7F2E6874
	for <lists+linux-leds@lfdr.de>; Mon, 28 Dec 2020 17:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729589AbgL1QhO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Dec 2020 11:37:14 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:43641 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634203AbgL1Qfv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 28 Dec 2020 11:35:51 -0500
Received: from methusalix.internal.home.lespocky.de ([92.117.54.172]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MhFpq-1kOjYv2tNq-00eJLS; Mon, 28 Dec 2020 17:32:59 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1ktvS2-0002GJ-5N; Mon, 28 Dec 2020 17:32:55 +0100
Received: (nullmailer pid 32604 invoked by uid 2001);
        Mon, 28 Dec 2020 16:32:53 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        Alexander Dahl <post@lespocky.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org
Subject: [PATCH v9 0/4] leds: pwm: Make automatic labels work
Date:   Mon, 28 Dec 2020 17:32:13 +0100
Message-Id: <20201228163217.32520-1-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scan-Signature: e9056562e10c809dee3344e50e145a1f
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:ztIxjkZXmzA4zIV1xgFd+DY20dZqEQMIRVMHSPYRMW3VFcqIiZw
 n9f6GRjs+5QUaQjm5RvcphCke18ZeRqeibmGi/uiyzWXTS3qJGNYbEJTzYwZZyL2xi/5G5X
 pk07IfD1zPx2OQ/t6ey+RPliD/dYCy/vL/hJgUMbQpEKtWbAii+kSAMSx2pEizt+uTt6Qug
 59hx5SzeZ4RSpArkPg95g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RQlq3c2RuHM=:OfzQvvbw4nmVmbV7Hct3WL
 kvLq1UK438l/NeFTcb9L1gMen7sj2Isbqok1YD9HEv6/3VMu5HBYcwLm0pVbKrjRIRdlUhnyz
 0uccCuUAJiOJU0sNmXI7NxnJypmSoCuvWw7zIy7fMctiYakM/rROpU2DqN4JQtMwWg+kSJZQX
 rsnx+iIRuDLY0GClkUhhZS4Jk4dCzXlpCIMdOnRyjbGONzPjp5nm+IGGoOneMutjYUYDg0v+s
 NWby0pvE0EZl8f2z8JNZpAuep5fJ8oqHWmW59sCOTyCq354LoLuSLZu1NzUJYj+IRy4SIX0K4
 fP+1t/FNaHhAFSphWcp36/4dAO4JzsqEPZDgWXttXZCukJqfDQd8oavxpSLvY+Zssh8v1N3Rn
 D7GVGANRiNTlmphvMDw6PkO7wIVTr6/ihboppxpBQtUB1YZU6ol8ISg+m0Wrdd6yVkYN807cK
 s2wYjuyqUQ==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hei hei,

these are the not yet taken patches from a series which originally fixed
a minor issue in the leds pwm driver, then migrated the leds pwm dts
docs to yaml (by request), and then fixed all the dts files triggering
warnings on those new bindings.  The remaining four patches now only fix
dts warnings, the base fix and the yaml conversion is already merged to
master.

Series changelog below …

Greets
Alex

v9:
- rebased series on v5.11-rc1
- removed already applied patches
- added some more Acked-by

v8:
- rebased series on recent pavel/for-next (post v5.10-rc1)
- removed already applied patches
- added Acked-by on patch 1/5
- updated patch 3/5 based on comments by Ahmad Fatoum

v7:
- rebased series on recent pavel/for-next
- split up arm dts patch by arm sub arch (suggested by Krzysztof Kozlowski)
- added multiple Reviewed-by tags
- slightly reworded commit messages (suggested by Krzysztof Kozlowski)
- added actual dtbs_check warnings to commit messages
- added Russell King to Cc for binding conversion patch (because license)

v6:
- rebased series on recent pavel/for-next
- added Reviewed-by from Marek to patch 1
- patch 2 from v5 was picked by Pavel and is already in his for-next
  branch
- previous patch 3/3 (now 2/7) was reworked based on feedback by Rob
- added more dt patches fixing warnings after binding conversion to yaml

v5:
- replaced patch 1/3 by a new patch removing platform_data support for
  the leds-pwm driver
- little rewording of commit message in patch 2/3
- updated patch 3/3 based on feedback by Rob Herring
- added Marek Behún to Cc, because he also works on removing
  platform_data support
- rebased series on pavel/for-next

v4:
- added led-class patch handling fwnode passing differently (patch 1/3)
- adapted leds-pwm patch to new led-class (patch 2/3)
- contacted original author of leds-pwm dt binding on license issue
  (patch 3/3)

v3:
- series rebased on v5.9-rc4
- changed license of .yaml file to recommended one (patch 2/2)
- added Acked-by to both patches

v2:
- series rebased on v5.9-rc3
- added the dt-bindings update patch (2/2)

v1:
- based on v5.9-rc2
- backport on v5.4.59 tested and working

Cc: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-amlogic@lists.infradead.org


Alexander Dahl (4):
  dt-bindings: mfd: Fix schema warnings for pwm-leds
  ARM: dts: berlin: Fix schema warnings for pwm-leds
  ARM: dts: stm32: Fix schema warnings for pwm-leds
  arm64: dts: meson: Fix schema warnings for pwm-leds

 Documentation/devicetree/bindings/mfd/iqs62x.yaml   |  5 +++--
 arch/arm/boot/dts/berlin2cd-google-chromecast.dts   |  6 +++---
 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts           | 13 +++++++------
 .../boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts |  4 ++--
 .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts      |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts    |  8 ++++----
 6 files changed, 21 insertions(+), 19 deletions(-)


base-commit: 5c8fe583cce542aa0b84adc939ce85293de36e5e
-- 
2.20.1

