Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1907E1423
	for <lists+linux-leds@lfdr.de>; Sun,  5 Nov 2023 16:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjKEPua (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 Nov 2023 10:50:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjKEPu3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 Nov 2023 10:50:29 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA497E0;
        Sun,  5 Nov 2023 07:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=s31663417; t=1699199406; x=1699804206; i=wahrenst@gmx.net;
        bh=T/ZwzeL/J9vx/YU4GSF8/MWxms/yiys6g8xIEPFOdZg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=ekvqwAmwH+UeW15r44be01HDY6UhwLu5TprSKuLu0YmXFlM/5i2aJOVOjYPsYU8R
         nm8YiWknml38Qez8G44myz411KlY+8I2jXGhL6ZOJf9u86NqvsxgM6JKRhQJo20bV
         MgFqJflYxMsifIDuk1uRY1cbCbiihnUakAdaXBA+2OT9dSM5h63qo9GYWfojkVMxd
         0BVmN1Vr7+uSIxarlci1IAym6ued+XE5AhE73FoiSru19O5xo7NVpu37QyoS1l8N/
         JWAo39RmXLURCwnpCTbiofCQTgO4sW4jErxxHQX9YdmCGxA8IJ7qZKfQGFNyadlyj
         OCpeORFzn8H2heJ8ug==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wGi-1r0lJS1PuW-003Lgm; Sun, 05
 Nov 2023 16:50:06 +0100
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-leds@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 0/2] ARM: dts: bcm2711-rpi-400: Fix delete-node of led_act
Date:   Sun,  5 Nov 2023 16:49:38 +0100
Message-Id: <20231105154940.97688-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nPk57frDAbAXpxz3sxLR4MY2e7EIv8OsNQc3iYrJdOFHaHP7RVe
 dHngzqKmvK1edDXIn+vsD2HeZaBbo0FX4Fywilg9SpeGm+RxOrsY1KA9BY/BrZ/FtuAJHGR
 AM6TlKSGmfo6CE24yj/bgfmQjrql1+EJfymivYJjxGmzkU6BH2kRwdWSZCYwjK/FpT6U9tn
 uziLl9qx8vLP7aaik6AOw==
UI-OutboundReport: notjunk:1;M01:P0:MU7uD95rWP0=;bmW74QmVBhLvOXNOE7rYY5MfxgP
 stI/EY+hcT22VXgKMAAwlTFlW+1CbWX939cP/vZSwxMqdLz5mAfnb6nGhlPjjoArmjUWa9WqW
 jaGWRWlt2xb7qrOsNjq0kRCKUMSo3HfASYqb2P/WTDG5PUXPnWVK8HkLUpzDBRchLhPH8aECh
 tXuN+4CvlENK+YT277Pqa0n4CVQKCzqzuJt85dre7ct95Nogne15Er+xNWzzU+PfjdzbrBSYh
 l60bPg80XNEpX37FOaw2KomtIEyqVrwxgme8lL9rAorfzOPc/0e0MMyJ9lV/fnEHrwVsg9BQu
 rFyOZiS1RMLHAvapGX8AMperMgC7M34z5ajTOQyobUUdF1+G3CnT5LsX9dTtYCccG7FW2tTgx
 dSa6182c0DcRd7hmyxIHUjJaf0v5/DVUkSi4m9IUa/8zk9ggREyjdMXhQbQfytepi/7tesGRE
 JWwucLHIXhS+XHH2gSF1+q8jO/uGscjeaWc6rqhDZmvOA8kBsx6ODA6xCWQo5vRzYe471XQTM
 RMn4Ne/1gpyG9CvRyG/zT/Cf94VHIeryDiUWsrFuH0FvAdlSFqVoqAcV4We5TTPUJWGjK8ssL
 13k+pvVcQy8ZIdIlkCFMO5ZWrhBtyKvgVAlWrAohD45ZsBztZp1/IX0gndeJoh259TuVDxZda
 iWvD7ZQrLpebHw9V6dJUODabuFpZ3L/mT4hImlJDsmoSTrMpF+wXy2fGOF9ZsyG1wsFja3Qce
 aHFkRstibnbuFCfTEvvAPGTEnT5R3X8PEyeCD+2dbab07yXL6eoqK1NFxl6N4bXmZ5/c0z33Y
 tJANIvtGp+lN6eSxPtEuH7soWhoS8mpWkAKALuFtQTTH4Syz4fd7Pb3ok5K7gjS/LF6q+TXae
 K8sv/m0g706EfQqwtaumbBJNHUReJsa3vXXmH+3zLzl/WPJJWbd4+C6Jvn84jn+JDdlayy/kj
 5e/3Qg==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This series fixes the probing of leds-gpio on the Raspberry Pi 400.
Also try to improve the error logging of leds-gpio.

Stefan Wahren (2):
  leds: gpio: Add kernel log if devm_fwnode_gpiod_get fails
  ARM: dts: bcm2711-rpi-400: Fix delete-node of led_act

 arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dts | 4 +---
 drivers/leds/leds-gpio.c                       | 2 ++
 2 files changed, 3 insertions(+), 3 deletions(-)

=2D-
2.34.1

