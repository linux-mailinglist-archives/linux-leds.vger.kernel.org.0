Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACED1D55B4
	for <lists+linux-leds@lfdr.de>; Sun, 13 Oct 2019 12:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbfJMKyf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 13 Oct 2019 06:54:35 -0400
Received: from mout.gmx.net ([212.227.17.22]:37591 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728620AbfJMKye (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 13 Oct 2019 06:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1570964044;
        bh=P1UgswCUcghz6yIDHCpeyknx90qBZRzXKgVlFd7eCdQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=Hazt7CS8w6v7l3PeNig4oBTVsQl+5I8ySOkCGte5W+gEnNzpCKMkb1dShKpoGAKCW
         ns+js783PPeaES6CUDQ9WCawQ0osxmfnZ8mBk6U/lfw3/mDQO82KaMD3qK769L0gZo
         91NtoEYrT08hXbMtIdcQ/9vNHbFYU+YsUxvJYeTU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.112]) by mail.gmx.com
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M1Hdq-1iLGCc1IeQ-002km6; Sun, 13 Oct 2019 12:54:04 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] ARM: dts: bcm2837-rpi-cm3: Avoid leds-gpio probing issue
Date:   Sun, 13 Oct 2019 12:53:23 +0200
Message-Id: <1570964003-20227-1-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:rD0/Aj9OsYtuwDKTD1Asm7wvmhiAAdzSvgHj2hhtz4zJHwfn8gY
 eQEqPkZg4HhyshXGfuuE5EO6kpFG5C4oBy5q6gGSXfR06cp5r4eBApjjJYja0GR98v1WSqm
 zBGi0NiTAm8qgOCOzqYBTvYUEz8qdiuQIfxv+idJ1wtdVdVipSxYyMxrdwkMZ8hp64ZNZT/
 nQGx5ZFIng+B30yOE2ZsA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uxI6S7LwlPs=:mmtcYysXtk12sBd4sSpTyK
 sH5Rac4tKDW3Jjzp9lXc5qGXFOnZ2xOoiS9WZTl1M7FvGTAzqg9WyHtVz3dQ6PyRRmGE6Aqzg
 Wvj4VYE/Bxvppf3Cn1Qsa+zrguD5TbN310rcuNu8pBTSGwKuY/R+DB/H2mwc4jU8paWIeZOPF
 AQ2fGoHT95vD5FLUgfe1/TqSxSdqxxW+1lGuJfoCHAjAtLpWbpG8QLjWCTq0O20lFJuT+XqYG
 u5pJhG/S8d8spGPGacajBXARG9vfWjGHDJ8X0lBmuHJytInQI62IjDuQCJJONFqRfkJQb6Dj3
 /p+4V1qwetdvUICCy2bZGwJOezGuhGFNwOelsZ5REg/x9huRfxDm8CWC0wdhFnAYO06xSwLEG
 adIp3E1m8P9p7HV0FgKixZPI1Tw4rJi/uK2B+SLS6oXF8kHQ2EdpuS7WDVH7rK7bqHi/WVKCH
 KZMkfKZnjgh4pAxK6Gp7Du2xrwL4yL22fg3jQAq9lu06QGU+taBKLRGP5FQksadz5hmKM9TIM
 aSAG6buNXs2vnwUdZyYwwzfJRP/vsKBBbA0F75mtn4W7wiKzKg73EUfNSln1+Zg5TJ7mowVEz
 k4dkVA7/wR8RcP2ZN7RZdB2EqWRWDp4VMIx/ok9rgzBzW0HWBvBdh/P4oICIoD+BK/sr6a9HZ
 2LvvcfcFOVi48EeSWuM8R0RDcxCEl9i9SHIIgz6EjWiZz9GgnCYX4lOK6F7Xw+3o7+0Jg8Y7z
 79B8WjdSNYAZsSFLJm/8X8jONQNmWPaL6K3fbv7Ai2r9pqmD/k0b1lftYXWU5wmwcpBvp+WUC
 sbxo+5vAWGbJFKb+vPUPW2GDNqt59yfnBOf9gYT0eME7WARqv9T/pSFH41X6FLUBAksdjE1ZU
 q9qs2nW1fkGwbgEVLS7UwVJ3sqUnB6dWjq6WRYmVyf+siRSu1yz0CI3dVz0u37IWEwxip3yUr
 hqOkrsDCWQIUPTCpbkYI7NiEdztz3W51QygBPrewVwdCZLa+/8Z7+goJzZndlyw1hCJkdmA2c
 jzk39CEEoSI//yOFlSc5ZBGMIKqup3laJoepfcsq3GoAnh70xl0I5RTkSVbRswd/AV/C7ItAb
 YocSC3OqsqusQfWqgvhBeNKw++ksuAecLIFGZCmkzUk/OZ/PZ2HVcnIGPeEba/WE4opnAEjPD
 NJ0J/Sen2FyL/1fp0VOx88AmhYlkbMx+StHX7JrPHbOf/zlAjCTZY+CKGISyQLBrM8YxpRJFf
 KfKYVNWqP7TQmkSIN5ybCminYG6OcGq0itehPDQ==
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

bcm2835-rpi.dtsi defines the behavior of the ACT LED, which is available
on all Raspberry Pi boards. But there is no driver for this particual
GPIO on CM3 in mainline yet, so this node was left incomplete without
the actual GPIO definition. Since commit 025bf37725f1 ("gpio: Fix return
value mismatch of function gpiod_get_from_of_node()") this causing probe
issues of the leds-gpio driver for users of the CM3 dtsi file.

  leds-gpio: probe of leds failed with error -2

Until we have the necessary GPIO driver hide the ACT node for CM3
to avoid this.

Reported-by: Fredrik Yhlen <fredrik.yhlen@endian.se>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Fixes: a54fe8a6cf66 ("ARM: dts: add Raspberry Pi Compute Module 3 and IO b=
oard")
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
=2D--
 arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

Hi,

i'm not sure the behavior change in leds-gpio was intended.

Regards
Stefan

diff --git a/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi b/arch/arm/boot/dts/bc=
m2837-rpi-cm3.dtsi
index 7c3cb7e..925cb37 100644
=2D-- a/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi
+++ b/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi
@@ -9,6 +9,14 @@
 		reg =3D <0 0x40000000>;
 	};

+	leds {
+		/*
+		 * Since there is no upstream GPIO driver yet,
+		 * remove the incomplete node.
+		 */
+		/delete-node/ act;
+	};
+
 	reg_3v3: fixed-regulator {
 		compatible =3D "regulator-fixed";
 		regulator-name =3D "3V3";
=2D-
2.7.4

