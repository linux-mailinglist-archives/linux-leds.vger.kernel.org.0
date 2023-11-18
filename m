Return-Path: <linux-leds+bounces-33-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E16F77EFFB0
	for <lists+linux-leds@lfdr.de>; Sat, 18 Nov 2023 13:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15BDC1C2093E
	for <lists+linux-leds@lfdr.de>; Sat, 18 Nov 2023 12:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BA912E40;
	Sat, 18 Nov 2023 12:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="SZAcbAsK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6A2D5;
	Sat, 18 Nov 2023 04:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700311391; x=1700916191; i=wahrenst@gmx.net;
	bh=uE3UgaMWX691oAfqe3827yIFDo67qS1ai4DImMS0WyQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=SZAcbAsKE95527j4cZy41RIF/9MVkwmU5zN2itUAkvJnKizu8ZF6Iu8U+DTZugfJ
	 FlBsPoI2Uphr5hLLC8PeAy/X24innpwOb/2kqMtCoL294M2PV/W3fWZNAEjG8x/Wl
	 usEzA8SwD9qtPK3W2mmRA0GO3qsErUCd61AjCDMcTFKM5CWuTyagmVw0kt8Fo4rNe
	 7VmHO7L7snm8EP9bjFwcwPRrqvr+hqzmqR92ybaIYGq9NI9U0VY1zv7lgp8sUVqGi
	 iuNioI+bw7c8D920E5tChNh4K9C7cAZtfiXVFehitPo34/Ms/2HieYUHcM2YHti2t
	 3nCIg+Blrvy9gwpbKg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRCOE-1qjUOA3q6e-00N6Vg; Sat, 18
 Nov 2023 13:43:11 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-leds@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 2/2] ARM: dts: bcm2711-rpi-400: Fix delete-node of led_act
Date: Sat, 18 Nov 2023 13:42:52 +0100
Message-Id: <20231118124252.14838-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231118124252.14838-1-wahrenst@gmx.net>
References: <20231118124252.14838-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tUqmj8fVqWa6a8fOCIKp6khTGQuGLFarRxUH2BHqKTL3thukt8s
 VvsH4PdKf+JtRufzia8ap+dVrpby8R+WGeBBlWgxRO3cP7+xmtdUZKY0l8rgiaqI4zyuxIX
 K/3B3ugJ49Jp9wArswTZPe5LwBE5PjNM/F/AoRQCmgmtHcCKxAR+tADHfgl/Xcs/YK2H8OS
 RpReDNBLc6d2iqcZStmBw==
UI-OutboundReport: notjunk:1;M01:P0:AiN5NzomRGw=;PbOc9bN2KdSP+tn+MysYfgRAFsb
 M8Qd4U4G2D0RJZdYteCs44gxio2zidBg6MTrBHH5uReupAr3xaCkhk8QykdJ3vha1Z1BJFAkI
 XNfCL/sJ5S79eIGy+RJpNeC6HZqj/FlhYHgZuVquoFf93gLg3jYS5ennq8S53O0g41O8MezqI
 0ZGcpoTKFYX+m7eWd/yv3yLlonUcgFcew4cU0pwcarOwKGSHiGI1bXFufGcTnRxhSG++jrn4/
 6GjXb1eDFRJLZjLUDCC0oGagSHz8FCXq0lEkmfAiTV1xMY1/xVRw6PjxUG2tsbNdQaoPKE6p6
 8IwzBPpg5xdnHWaAhyGrKB8LkPXrHAnzAIleceOh7eE3JH4fbbd9n3/RQ6Q43yAJ0c+bYiQqq
 yNV7z4l6MCZ/He8SDfj92sGr+jUKTAMC9FOczJI8oisjPpuNGiqvqOuP7X2yrvBoqjFFiZWKv
 d3euh4PuNv6CysIrDc8W59OtuYlSrcZLopZZ3Eejd5RYnz9P54Aq1FD7kwnsmrcSF6I3VElnc
 dC4YGKiLcbNMH94BsZZu2AqqJBY+0eaQvDfsbJBmam5hJTiNUbTFZak4/ue/dACbr1Ei5vCP0
 UG4RZ3pjs+tXvklS0IXakbd3P6y/DEDVTaTABazjAiB52v9X8jUUzmVJiei++XfwFW4519srY
 vID0hpvV1oGLfzVld+sPsb21fGcno8NFe40Q/N0IB0JzMPzfmNMSb4MrHpjFoJJCYS140GHir
 fHFLDZD6vb6KQDRvBmpywygAvU33HjcM2LxEp4Ea+yERC8V3pENKa/CNyCh0ymGf9iALpTcy/
 u2DQLjubohANI7uKejnm4W1eTbOelH8wh4E6Bvw1Jd4SRAQX4uZigDdTWGTBjmm5imVN0jreg
 4LbdR5NFysnxPU2yMQGllj8ae4iMJeVA6+Y0OhRZDmKXtoi6ResBwfeb/6yqS4RzwvEJ1yvtE
 YEW5Sg==

The LED ACT which is included from bcm2711-rpi-4-b doesn't exists
on the Raspberry Pi 400. So the bcm2711-rpi-400.dts tries to
use the delete-node directive in order to remove the complete
node. Unfortunately the usage get broken in commit 1156e3a78bcc
("ARM: dts: bcm283x: Move ACT LED into separate dtsi")
and now ACT and PWR LED using the same GPIO and this prevent
probing of led-gpios on Raspberry Pi 400:

    leds-gpio: probe of leds failed with error -16

So fix the delete-node directive.

Fixes: 1156e3a78bcc ("ARM: dts: bcm283x: Move ACT LED into separate dtsi")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dts | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dts b/arch/arm/boo=
t/dts/broadcom/bcm2711-rpi-400.dts
index 1ab8184302db..5a2869a18bd5 100644
=2D-- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dts
@@ -36,9 +36,7 @@ &led_pwr {
 	gpios =3D <&gpio 42 GPIO_ACTIVE_HIGH>;
 };

-&leds {
-	/delete-node/ led_act;
-};
+/delete-node/ &led_act;

 &pm {
 	/delete-property/ system-power-controller;
=2D-
2.34.1


