Return-Path: <linux-leds+bounces-6305-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF8CC82F12
	for <lists+linux-leds@lfdr.de>; Tue, 25 Nov 2025 01:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86CF13A5B8B
	for <lists+linux-leds@lfdr.de>; Tue, 25 Nov 2025 00:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3781DD9AD;
	Tue, 25 Nov 2025 00:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="Ngv7eXnW"
X-Original-To: linux-leds@vger.kernel.org
Received: from sonic305-22.consmr.mail.ne1.yahoo.com (sonic305-22.consmr.mail.ne1.yahoo.com [66.163.185.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005491A3172
	for <linux-leds@vger.kernel.org>; Tue, 25 Nov 2025 00:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.185.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764030822; cv=none; b=ijU6bV3RznDRVoMiEEKWg7mOFMEPJfW7F3j50OCljL3slcBE/Nq0FQDn4FwVwZBfSUj0OFFbF79qCrir3cWOM3SLXbP/Mxff5LGo6mCVivf3nttXK6jGQHIV9m0QFQyhA05DqBBcO+X7Q3o5nhpPaXoUSHswfcwvaPUNq+4Uz0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764030822; c=relaxed/simple;
	bh=vYgnP6pGSMZ5x/1GhWQyKLoWg4iyP0Fg+jNXGO2DKzk=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type:
	 References; b=O0y16FPMdI73wbZ2bDtiXsz1ou+GgK25qd2tTSAGTQosANko3t4Mx2Sm6lviTGePVMq4Zq5jHcoI0ixnRg0jyu2bZBp+ba4sM3mdwVHBNpMcnOMFn5z/lzGpas8UsVjqbCpw85UeHXHYIOMXDvobJ7ZmaRt/i3bDiRotJaDKMOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=Ngv7eXnW; arc=none smtp.client-ip=66.163.185.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1764030806; bh=vYgnP6pGSMZ5x/1GhWQyKLoWg4iyP0Fg+jNXGO2DKzk=; h=Date:From:To:Cc:Subject:References:From:Subject:Reply-To; b=Ngv7eXnWa3yLd7LlGN1N519HlRIH4nEZMiPPrRa9OXaIGVBMEQKP8hIDqmXN2v75mccRiiWOnufMoSpv5Tc3qd8iWBCqBC7R2YMQSXe9HEaNmjXfJuMlyVG92wBvKUbv+fZDrrR0bAJeWpa6cwQda75xkhEyLJHC4SXvNSVrNHCJHvFH5mJV+EykmjhG9NhLKn7rZ78P4ppEA275dMrRlwlGIrj31ZWlqC9gozW531LcakMVlzJzC2h0ODHO+TAYR1aaKIdNwL/1t53GLyq/n/AbmQaXchEtllbqNmFeC9u+k+q1c/ZVRaIP2aDGMZGjCoXl/6MVdj1Ln5KU8tH0KQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1764030806; bh=OgtUk55QGuYSaEwNoHgM38rTU1PWvYWc16ULvwFi2Ql=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=Ol+qfajQkJ/OzWnf5OhFuFf7t6EckZxhPNKvQa6WiZxmAMq4nhvszQzM2XbxJrHhXAVK8flapGhuBQxYzDMjJNNElSq3jG46RswzwSGF6zTjgoYeg+zzPpwFNy/O95CEABlQu4PJ7Y4arZWv7Yg4t+5zsjN17qSevJK4+04O4LlfGBM1NsiqRS4gT6YNOJidX3gLpLoXp7LwE9+i3vJbsw+zYrLVkUxQlnEIV5unPGxPaSKpwDujSP1yp5Yv3h3cbMtEdlwOrJ7BxqmejaxyWk/B121K/2PVFvpe5+e4fAQ5ewmhcsyBFT2N+8WUZrHY9q92U+2hR4KLFGYKcLM2ow==
X-YMail-OSG: EJL17hkVM1neJbrCmQO7bbDqa_7TuGvaHNUgvO7jaspJ205K4ly85nJ61q6VGMW
 kQq0_K.sAlG3c_MOJIhoeNWJQjSxLpkKT4WJnIVly0wZ57DmwtzaJw67bCQ3PUtqNOIDh52ABB3N
 NZatrvA7ph7VKX_YIXwelk8FfO7FqjMzN15MGluANFq1MSctGJOGq6XAeXBzQ9NGVQ_jbW1XAmCk
 wMxZB1z7I.wPukak3WCOBAm2tOblHBz0yhr0qcd30bYsnBfoO5CVBVpDj64jeq.SBS4c9cSaRoTp
 mLfiUvN0vIibLpDHagSUm8itmyyc0BHeShkSNvPomZRzktyDBUH0QPXfnLj5azt3jgsi7Ldfnkom
 NsyY1X6KFe1LrXqiwXQ315OAfTOBn0ftnscy9YN.QSpCMAa6nHVvk6r3ORzjGqOgJXFM89t_Zn77
 QzsBWwI5dvueHL6M.5HJVq4hJkxlVpQgIf6HYkKcXuVPa3EtT6yAOIIkVTMfEcP1eQLzNTDCjred
 KcsWQqFpEfU6R78USZhtJcOlVrB6aSEPuBy_0hVqtQme2A36P2r_YQXFm.4jszk.6APbpSflyrLN
 g5LHxNuGdq2oWBAkOcEgZPsOnfpdw91IpLuZWsaSNFo8UrIgeKrhXewOsnn2yfeg9gFyqbQ3Aeq2
 Jy5WP5hKvvGqN9xSOF3dLY2TkaEn1Za0_J3wTCFVEOd4aUqSIP22e9yn3ns.cg8X2Zm57_wXM231
 l3nw6UNkC5RP1ZLbcDRjnP3Lv_ihw7Z5JRRwmAo4_oxxeFk3Uc_Y9UVXwOg19oqDFNVKCuFDm1lZ
 z68DdhaqKKMjv0eXMsrg2hzsAXge5an4n2PwYG4zRy4RC9iJ14ho0M_tLKqxpL_psgEtvpEQ3l1W
 aM52ANdu3MabztVsiKzvlO0d.VmCxR4SabCjpquHqru9CUky8X1FmlhuW.b0M2M0l_Mn.F9nfVTe
 t.Ol8V8_wffk5s2awxKiRM9G9VLsY3wlLNfix5hN3Ls8JNfYIvt5cm_EvczvaUweBi0pFJjOV987
 8olHfN9R0jRV1f3TIW6OZGMJeO8wnwfik5c7YcpiZ84I_kTZ7EpRrST2SxlFUNg2OmqYhgnwvKId
 YvGPSUY_TW0zoKspICvfhpF.k4wX3_f0bj3hwkRIvm6xlmN03Kdvl3VjROlhwwoY.jPJbNSq7CT.
 GOmzZ6CGz.GJ67Q6snSKhFuC97c4CXb6zNgoKOS7FMA3qe.yleyyfMmT8QbttEa4hAOMvn6JRa.u
 PMAaYOOrSculZ8KwODYOzFPtIf2BTu319oEd.pOl_8pWSobwBkY.EqbSa8XmfRK93qMPv9l2CdEh
 kPPrzOwN0gvf3MTWsV5.f3CW9ES4Jz.NwJQfplPHs.dYQ44r4JS3zNlAVhEiqXhY4qBdc866n9FQ
 LYBpMyIp9azdcZpDrKvwcVJMIV9ENgL_TK8cFBvTek1Sd5qoO2rNi3LWioRPznX3u4u5bk7TeXkA
 B5MK2xQlpp64Xiu8G4N0GpjvWBbU8Nz5YqIMore6fVDPsnAogpc1WIi2mkMPsnt2uVp1XcpmY1ty
 ABReGhB3eehm5jcuixxMg_S9rwfL7Ho2UyuZrJZznape7Xq9E5NKp7GLBvJ0cZ7vJwkQFbbIQsja
 xMQQ8QwAQCyioS3BKNySgoxVrOsowta.wahhBZbavKNcWLfzEaP8ff10Gs5QYVRnMV9Ib_HU5npi
 6.M_EZ1T6wLAtJxsmnMiiJwbD9X_9NG8bOp_Cxb_JxOo.QdSrBObh7vl2NYuqsOTsvWZmNtlst9Q
 NzuFwsmyBG5WZe2SZZrLIbqV5vcTQCWm.e6JIXgq9e43b4jnNBeSfvxmNxHV4vlrJWiPEG4Cmfal
 LybDaKJOY2Zi5ij8SQ3Ry6uvL7AwHb06a0XiTMKv20d2Qe4Yo3TFTze7MSH8WZhf.cCAaSplw1DF
 fB7Us7wKojX65G.HPdQQg7.Ti8zib1KuGga0QdAfALVtyTsLf.Sgh6353mNYtP7Z5_ReJWweV_41
 gEN1oFHLnsRxmCsAFd6x5FteJsQqu9jc5Iq__KfXJAF5gQDYqZTC9KXrKKoy8AXUQL9W.hOlQOb7
 ymvG7Tev65VqCPbdT_N7e7cisrBJdFQqZZAC6BdppdrcEbx6iuUGpJ3NsvA6V7qloGqC8mMAybGd
 Zc.eyW0cvf9yAOEirbGnmRDPW3mEHCMdqB8EA9EZk_J7lZY_qbDFBPqKSckcEIk6xt6gQxrPFwku
 QQnhM7t27w1hTyIwSh03ey88lAHuiKKXW5Fvq2Spu1GKDDw--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: d6cb63db-699e-4f3e-a811-21fc3ff90a1b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ne1.yahoo.com with HTTP; Tue, 25 Nov 2025 00:33:26 +0000
Date: Tue, 25 Nov 2025 00:33:20 +0000 (UTC)
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, 
	"pavel@ucw.cz" <pavel@ucw.cz>, 
	"jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
Message-ID: <1454316610.906057.1764030800671@mail.yahoo.com>
Subject: [PATCH v2 2/2] leds: add "network" LED trigger (lan/wan/wlan)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1454316610.906057.1764030800671.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.24794 YMailNorrin

LED trigger for network interfaces.

- Aggregated per-family (lan/wan/wlan).
- Family and flags are taken from device tree properties:
=C2=A0=C2=A0 - "dev"=C2=A0=C2=A0: simple family string "lan" | "wan" | "wla=
n"
=C2=A0=C2=A0 - "mode" : any combination of "link", "tx", "rx" flags
=C2=A0=C2=A0Priority/combination:
=C2=A0=C2=A0 * If "mode" present: flags come from "mode" and take precedenc=
e.
=C2=A0=C2=A0=C2=A0=C2=A0 Family is taken from "dev" if present, otherwise f=
rom the LED name.
=C2=A0=C2=A0 * If only "dev" present: use its family and default flags =3D =
link+tx+rx.
=C2=A0=C2=A0 * If neither present: fall back to LED device name parsing.

- Suffix "-online" is valid ONLY in the LED name (label),
=C2=A0=C2=A0 e.g. "green:wlan-online". It indicates the online variant but =
is applied
=C2=A0=C2=A0 only when DT "mode" is absent.

Behaviour:
- wlan (normal): blink/solid driven by throughput table
- lan/wan (normal): one-shot blink on TX/RX packet change
- *-online variants: steady ON while any interface of the family has carrie=
r

Interfaces are auto-tracked by name match (lan0, wan1, wlan2, phy0, wl1,
ath0, ra0=C3=A2=E2=82=AC=C2=A6). Up to MAX_IFACES (16) interfaces per famil=
y

This trigger is intended for board/device authors and drivers to provide si=
mple
network-activity LED behaviour without per-interface wiring in userspace.

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
package/kernel/linux/modules/leds.mk=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0 16 +
target/linux/generic/config-6.12=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A0=C2=A01 +
target/linux/generic/config-6.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A01 +
.../820-ledtrig-network-module.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0| 1047 +++++++++++++++++
.../hack-6.6/820-ledtrig-network-module.patch | 1047 +++++++++++++++++
5 files changed, 2112 insertions(+)
create mode 100644 target/linux/generic/hack-6.12/820-ledtrig-network-modul=
e.patch
create mode 100644 target/linux/generic/hack-6.6/820-ledtrig-network-module=
.patch

diff --git a/package/kernel/linux/modules/leds.mk b/package/kernel/linux/mo=
dules/leds.mk
index 1de74c98c821cc..bd1c238f88bf3a 100644
--- a/package/kernel/linux/modules/leds.mk
+++ b/package/kernel/linux/modules/leds.mk
@@ -86,6 +86,22 @@ endef
$(eval $(call KernelPackage,ledtrig-gpio))


+define KernelPackage/ledtrig-network
+=C2=A0=C2=A0SUBMENU:=3D$(LEDS_MENU)
+=C2=A0=C2=A0TITLE:=3DLED Network Trigger
+=C2=A0=C2=A0KCONFIG:=3DCONFIG_LEDS_TRIGGER_NETWORK
+=C2=A0=C2=A0FILES:=3D$(LED_TRIGGER_DIR)/ledtrig-network.ko
+=C2=A0=C2=A0AUTOLOAD:=3D$(call AutoLoad,50,ledtrig-network)
+endef
+
+define KernelPackage/ledtrig-network/description
+ Kernel module that allows LEDs to be controlled by network interfaces
+ aggregated by family (lan/wan/wlan), with an optional per-LED '-online' m=
ode.
+endef
+
+$(eval $(call KernelPackage,ledtrig-network))
+
+
define KernelPackage/ledtrig-transient
=C2=A0=C2=A0 SUBMENU:=3D$(LEDS_MENU)
=C2=A0=C2=A0 TITLE:=3DLED Transient Trigger
diff --git a/target/linux/generic/config-6.12 b/target/linux/generic/config=
-6.12
index dbf4fe49ddb400..696fb381fc1899 100644
--- a/target/linux/generic/config-6.12
+++ b/target/linux/generic/config-6.12
@@ -3206,6 +3206,7 @@ CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
# CONFIG_LEDS_TRIGGER_INPUT_EVENTS is not set
# CONFIG_LEDS_TRIGGER_MTD is not set
CONFIG_LEDS_TRIGGER_NETDEV=3Dy
+# CONFIG_LEDS_TRIGGER_NETWORK is not set
# CONFIG_LEDS_TRIGGER_ONESHOT is not set
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
diff --git a/target/linux/generic/config-6.6 b/target/linux/generic/config-=
6.6
index 980545120b4e46..3c6b19e1ae041e 100644
--- a/target/linux/generic/config-6.6
+++ b/target/linux/generic/config-6.6
@@ -3109,6 +3109,7 @@ CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
# CONFIG_LEDS_TRIGGER_MTD is not set
CONFIG_LEDS_TRIGGER_NETDEV=3Dy
+# CONFIG_LEDS_TRIGGER_NETWORK is not set
# CONFIG_LEDS_TRIGGER_ONESHOT is not set
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
diff --git a/target/linux/generic/hack-6.12/820-ledtrig-network-module.patc=
h b/target/linux/generic/hack-6.12/820-ledtrig-network-module.patch
new file mode 100644
index 00000000000000..ce60baaf0843a3
--- /dev/null
+++ b/target/linux/generic/hack-6.12/820-ledtrig-network-module.patch
@@ -0,0 +1,1047 @@
+--- a/drivers/leds/trigger/Kconfig
++++ b/drivers/leds/trigger/Kconfig
+@@ -129,6 +129,15 @@ config LEDS_TRIGGER_NETDEV
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0This allows LEDs to be controlled by =
network device activity.
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0If unsure, say Y.
+=20
++config LEDS_TRIGGER_NETWORK
++=C2=A0=C2=A0=C2=A0=C2=A0tristate "LED trigger for network interfaces"
++=C2=A0=C2=A0=C2=A0=C2=A0depends on NET
++=C2=A0=C2=A0=C2=A0=C2=A0help
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Per-family network LED trigger: aggre=
gates lan/wan/wlan stats;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0family from DT 'dev' or name; flags f=
rom DT 'mode';
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0'-online' - online-only if mode absen=
t.
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0If unsure, say Y.
++
+ config LEDS_TRIGGER_PATTERN
+ =C2=A0=C2=A0=C2=A0=C2=A0tristate "LED Pattern Trigger"
+ =C2=A0=C2=A0=C2=A0=C2=A0help
+--- /dev/null
++++ b/drivers/leds/trigger/ledtrig-network.c
+@@ -0,0 +1,1019 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * LED trigger for network interfaces.
++ *
++ * - Aggregated per-family (lan/wan/wlan).
++ * - Family and flags are taken from device tree properties:
++ *=C2=A0=C2=A0=C2=A0=C2=A0 - "dev"=C2=A0=C2=A0: simple family string "lan=
" | "wan" | "wlan"
++ *=C2=A0=C2=A0=C2=A0=C2=A0 - "mode" : any combination of "link", "tx", "r=
x" flags
++ *=C2=A0=C2=A0 Priority/combination:
++ *=C2=A0=C2=A0=C2=A0=C2=A0 * If "mode" present: flags come from "mode" an=
d take precedence.
++ *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Family is taken from "dev" if pres=
ent, otherwise from the LED name.
++ *=C2=A0=C2=A0=C2=A0=C2=A0 * If only "dev" present: use its family and de=
fault flags =3D link+tx+rx.
++ *=C2=A0=C2=A0=C2=A0=C2=A0 * If neither present: fall back to LED device =
name parsing.
++ *
++ * - Suffix "-online" is valid ONLY in the LED name (label), e.g. "green:=
wlan-online".
++ *=C2=A0=C2=A0 It indicates the online variant but is applied only when D=
T "mode" is absent.
++ *
++ * Behaviour:
++ * - wlan (normal): blink/solid driven by throughput table
++ * - lan/wan (normal): one-shot blink on TX/RX packet change
++ * - *-online variants: steady ON while any interface of the family has c=
arrier
++ *
++ * Interfaces are auto-tracked by name match (lan0, wan1, wlan2, phy0, wl=
1, ath0, ra0=C3=A2=E2=82=AC=C2=A6).
++ * Up to MAX_IFACES (16) interfaces per family.
++ */
++
++#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
++
++#include <linux/module.h>
++#include <linux/kernel.h>
++#include <linux/slab.h>
++#include <linux/jiffies.h>
++#include <linux/leds.h>
++#include <linux/mutex.h>
++#include <linux/netdevice.h>
++#include <linux/workqueue.h>
++#include <linux/of.h>
++#include <linux/list.h>
++#include <linux/atomic.h>
++#include <linux/compiler.h>
++#include <linux/string.h>
++#include <linux/sysfs.h>
++#include <linux/device.h>
++#include <linux/ctype.h>
++#include <linux/err.h>
++#include "../leds.h"
++
++#define MAX_IFACES 16
++#define DEFAULT_INTERVAL_MS 50
++
++enum net_trig_type {
++=C2=A0=C2=A0=C2=A0=C2=A0NET_TRIG_LAN =3D 0,
++=C2=A0=C2=A0=C2=A0=C2=A0NET_TRIG_WAN,
++=C2=A0=C2=A0=C2=A0=C2=A0NET_TRIG_WLAN,
++=C2=A0=C2=A0=C2=A0=C2=A0NET_TRIG_TYPE_MAX,
++};
++
++static const char * const type_names[] =3D {
++=C2=A0=C2=A0=C2=A0=C2=A0[NET_TRIG_LAN] =3D "lan",
++=C2=A0=C2=A0=C2=A0=C2=A0[NET_TRIG_WAN] =3D "wan",
++=C2=A0=C2=A0=C2=A0=C2=A0[NET_TRIG_WLAN] =3D "wlan",
++};
++
++/* labels indexed by bitmask: (link<<2)|(tx<<1)|(rx<<0) */
++static const char *const labels[] =3D {
++=C2=A0=C2=A0=C2=A0=C2=A0"",=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* 0 */
++=C2=A0=C2=A0=C2=A0=C2=A0"(tx)",=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /* 1 */
++=C2=A0=C2=A0=C2=A0=C2=A0"(rx)",=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /* 2 */
++=C2=A0=C2=A0=C2=A0=C2=A0"(tx rx)",=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* =
3 */
++=C2=A0=C2=A0=C2=A0=C2=A0"(link)",=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
4 */
++=C2=A0=C2=A0=C2=A0=C2=A0"(link rx)",=C2=A0=C2=A0=C2=A0=C2=A0/* 5 */
++=C2=A0=C2=A0=C2=A0=C2=A0"(link tx)",=C2=A0=C2=A0=C2=A0=C2=A0/* 6 */
++=C2=A0=C2=A0=C2=A0=C2=A0"(link tx rx)", /* 7 */
++};
++
++/* wlan throughput table */
++static const struct {
++=C2=A0=C2=A0=C2=A0=C2=A0u32 throughput;
++=C2=A0=C2=A0=C2=A0=C2=A0unsigned long on_ms;
++=C2=A0=C2=A0=C2=A0=C2=A0unsigned long off_ms;
++} wlan_tpt_table[] =3D {
++=C2=A0=C2=A0=C2=A0=C2=A0{=C2=A0=C2=A0 64, 200, 800 },
++=C2=A0=C2=A0=C2=A0=C2=A0{=C2=A0=C2=A0512, 200, 300 },
++=C2=A0=C2=A0=C2=A0=C2=A0{ 2048, 200, 150 },
++=C2=A0=C2=A0=C2=A0=C2=A0{10000, 200,=C2=A0=C2=A050 },
++=C2=A0=C2=A0=C2=A0=C2=A0{54000, 100,=C2=A0=C2=A050 },
++};
++
++struct net_mgr {
++=C2=A0=C2=A0=C2=A0=C2=A0enum net_trig_type type; /* family: lan/wan/wlan =
*/
++
++=C2=A0=C2=A0=C2=A0=C2=A0struct mutex lock;
++=C2=A0=C2=A0=C2=A0=C2=A0struct notifier_block notifier;
++=C2=A0=C2=A0=C2=A0=C2=A0struct delayed_work work;
++
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_device *devs[MAX_IFACES];
++=C2=A0=C2=A0=C2=A0=C2=A0int dev_count;
++
++=C2=A0=C2=A0=C2=A0=C2=A0u64 agg_rx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0u64 agg_tx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0u64 agg_rx_bytes;
++=C2=A0=C2=A0=C2=A0=C2=A0u64 agg_tx_bytes;
++
++=C2=A0=C2=A0=C2=A0=C2=A0struct list_head leds;
++=C2=A0=C2=A0=C2=A0=C2=A0atomic_t refcnt;
++};
++
++struct net_led {
++=C2=A0=C2=A0=C2=A0=C2=A0struct list_head node;
++=C2=A0=C2=A0=C2=A0=C2=A0struct led_classdev *led_cdev;
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_mgr *mgr;
++
++=C2=A0=C2=A0=C2=A0=C2=A0u64 last_rx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0u64 last_tx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0u64 last_rx_bytes;
++=C2=A0=C2=A0=C2=A0=C2=A0u64 last_tx_bytes;
++
++=C2=A0=C2=A0=C2=A0=C2=A0bool link;
++=C2=A0=C2=A0=C2=A0=C2=A0bool rx;
++=C2=A0=C2=A0=C2=A0=C2=A0bool tx;
++};
++
++static DEFINE_MUTEX(managers_lock);
++static struct net_mgr *managers[NET_TRIG_TYPE_MAX];
++
++static ssize_t net_flag_show(struct device *dev, struct device_attribute =
*attr, char *buf);
++static ssize_t net_flag_store(struct device *dev, struct device_attribute=
 *attr,
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *buf, size_t count);
++static ssize_t net_dev_show(struct device *dev, struct device_attribute *=
attr, char *buf);
++static ssize_t net_dev_store(struct device *dev, struct device_attribute =
*attr,
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf, size_t count);
++
++/* helpers */
++static inline void led_set_off_full(struct led_classdev *led, bool on)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0led_stop_software_blink(led);
++=C2=A0=C2=A0=C2=A0=C2=A0led_set_brightness(led, on ? LED_FULL : LED_OFF);
++}
++
++static inline void led_set_oneshot_ms(struct led_classdev *led, unsigned =
long ms, bool invert)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0led_stop_software_blink(led);
++=C2=A0=C2=A0=C2=A0=C2=A0led_blink_set_oneshot(led, &ms, &ms, invert);
++}
++
++/* helper: check that next char after prefix is digit, '-' or NUL */
++static inline bool next_char_ok(const char *s, size_t pos)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0char c =3D s[pos];
++=C2=A0=C2=A0=C2=A0=C2=A0return c =3D=3D '\0' || c =3D=3D '-' || (c >=3D '=
0' && c <=3D '9');
++}
++
++/* name matching: lan/wan; wlan matched by various wifi prefixes with res=
triction
++ * additionally accept ath (Atheros) and ra/rai (Ralink/MediaTek) prefixe=
s.
++ * For lan and wan require next char to be digit/'-' or end to avoid acci=
dental matches.
++ */
++static bool name_matches_type(const char *name, enum net_trig_type type)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0if (!name)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;
++=C2=A0=C2=A0=C2=A0=C2=A0switch (type) {
++
++=C2=A0=C2=A0=C2=A0=C2=A0case NET_TRIG_LAN:
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* accept "lan", "lanX", =
"lan-X" */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strncmp(name, "lan",=
 3))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn next_char_ok(name, 3);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;
++=C2=A0=C2=A0=C2=A0=C2=A0case NET_TRIG_WAN:
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* accept "wan", "wanX", =
"wan-X" */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strncmp(name, "wan",=
 3))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn next_char_ok(name, 3);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;
++=C2=A0=C2=A0=C2=A0=C2=A0case NET_TRIG_WLAN:
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* accept "phyX", "wlX"/"=
wl-..." or "wlan" and common driver prefixes */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strncmp(name, "phy",=
 3))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn next_char_ok(name, 3);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strncmp(name, "wlan"=
, 4))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn next_char_ok(name, 4);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strncmp(name, "wl", =
2))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn next_char_ok(name, 2);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Atheros (athX) */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strncmp(name, "ath",=
 3))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn next_char_ok(name, 3);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Ralink/MediaTek: check=
 "rai" (e.g. rai0) first, then "ra" (ra0) */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strncmp(name, "rai",=
 3))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn next_char_ok(name, 3);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strncmp(name, "ra", =
2))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn next_char_ok(name, 2);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;
++=C2=A0=C2=A0=C2=A0=C2=A0default:
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++}
++
++/* Simplified parse_function_string: accepts exact family token optionall=
y
++ * suffixed with "-online", e.g. "wlan" or "wlan-online".
++ * Returns NET_TRIG_* or -1.
++ */
++static int parse_function_string(const char *fn, bool *online)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0size_t len;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (!fn || !online)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
++=C2=A0=C2=A0=C2=A0=C2=A0
++=C2=A0=C2=A0=C2=A0=C2=A0*online =3D false;
++
++=C2=A0=C2=A0=C2=A0=C2=A0len =3D strlen(fn);
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (len > 7 && !strcmp(fn + len - 7, "-online")) =
{
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*online =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0len -=3D 7;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (len =3D=3D 3 && !strncmp(fn, "lan", 3))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NET_TRIG_LAN;
++=C2=A0=C2=A0=C2=A0=C2=A0if (len =3D=3D 3 && !strncmp(fn, "wan", 3))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NET_TRIG_WAN;
++=C2=A0=C2=A0=C2=A0=C2=A0if (len =3D=3D 4 && !strncmp(fn, "wlan", 4))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NET_TRIG_WLAN;
++
++=C2=A0=C2=A0=C2=A0=C2=A0return -1;
++}
++
++/* Parse only flags from a string: recognized tokens are "link", "tx", "r=
x".
++ * Any other token =3D> -EINVAL. If no flags found, set all three true.
++ * Suitable for DT "mode" (strict) or parsing flags from name when no mod=
e present.
++ */
++static int parse_flags_from_string(const char *fn, bool *link, bool *tx, =
bool *rx)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0size_t len;
++=C2=A0=C2=A0=C2=A0=C2=A0const char *buf =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0size_t buflen =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0size_t i;
++=C2=A0=C2=A0=C2=A0=C2=A0bool found =3D false;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (!fn || !link || !tx || !rx)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
++
++=C2=A0=C2=A0=C2=A0=C2=A0*link =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0*tx =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0*rx =3D false;
++
++=C2=A0=C2=A0=C2=A0=C2=A0len =3D strlen(fn);
++=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < len; i++) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char c =3D fn[i];
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (c =3D=3D ' ' || c =3D=
=3D '\t' || c =3D=3D ',') {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
uf =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
uflen =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c=
ontinue;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!buf) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
uf =3D fn + i;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
uflen =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0buflen++;
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ((i + 1 =3D=3D len) ||=
 fn[i + 1] =3D=3D ' ' || fn[i + 1] =3D=3D '\t' || fn[i + 1] =3D=3D ',') {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (buflen =3D=3D 4 && !memcmp(buf, "link", 4)) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0*link =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0found =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}=
 else if (buflen =3D=3D 2 && !memcmp(buf, "tx", 2)) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0*tx =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0found =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}=
 else if (buflen =3D=3D 2 && !memcmp(buf, "rx", 2)) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0*rx =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0found =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}=
 else {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0/* unknown token */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
uf =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
uflen =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* default: if no flags found, set all true */
++=C2=A0=C2=A0=C2=A0=C2=A0if (!found) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*link =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*tx =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*rx =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0return 0;
++}
++
++/* parse simple dev string "lan"/"wan"/"wlan" -> enum or -1 */
++static int parse_dev_string(const char *s)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0if (!s)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
++=C2=A0=C2=A0=C2=A0=C2=A0if (!strcmp(s, "lan"))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NET_TRIG_LAN;
++=C2=A0=C2=A0=C2=A0=C2=A0if (!strcmp(s, "wan"))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NET_TRIG_WAN;
++=C2=A0=C2=A0=C2=A0=C2=A0if (!strcmp(s, "wlan"))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NET_TRIG_WLAN;
++=C2=A0=C2=A0=C2=A0=C2=A0return -1;
++}
++
++/* safe stats read wrapper */
++static void get_dev_stats_safe(struct net_device *dev, struct rtnl_link_s=
tats64 *st)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0memset(st, 0, sizeof(*st));
++=C2=A0=C2=A0=C2=A0=C2=A0dev_get_stats(dev, st);
++}
++
++/* Update single LED according to manager aggregates and per-LED flags.
++ * any_online indicates whether any tracked interface currently has carri=
er.
++ * If LED is online-only (link && !tx && !rx) it is driven directly by an=
y_online.
++ */
++static void update_led(struct net_led *e, struct net_mgr *m, bool any_onl=
ine)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0long unsigned int on_ms, off_ms;
++=C2=A0=C2=A0=C2=A0=C2=A0struct led_classdev *led =3D e->led_cdev;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* defensive: avoid deref if led unexpectedly NUL=
L */
++=C2=A0=C2=A0=C2=A0=C2=A0if (!led)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* If LED requested online-only, reflect any_onli=
ne */
++=C2=A0=C2=A0=C2=A0=C2=A0if (e->link && !e->tx && !e->rx) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0led_set_off_full(led, any=
_online);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* For non-online-only LEDs: if no tracked interf=
ace has carrier,
++=C2=A0=C2=A0=C2=A0=C2=A0 * keep the LED off and reset history baseline to=
 avoid spurious deltas
++=C2=A0=C2=A0=C2=A0=C2=A0 * when carrier later returns.
++=C2=A0=C2=A0=C2=A0=C2=A0 */
++=C2=A0=C2=A0=C2=A0=C2=A0if (!any_online) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0led_set_off_full(led, fal=
se);
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e->last_tx_packets =3D m-=
>agg_tx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e->last_rx_packets =3D m-=
>agg_rx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e->last_tx_bytes=C2=A0=C2=
=A0 =3D m->agg_tx_bytes;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e->last_rx_bytes=C2=A0=C2=
=A0 =3D m->agg_rx_bytes;
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* non-online-only behaviour depends on family */
++=C2=A0=C2=A0=C2=A0=C2=A0if (m->type =3D=3D NET_TRIG_WLAN) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* throughput-driven */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 bytes_delta =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const u64 mul =3D 8ULL * =
1000ULL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 bits_per_sec =3D 0;
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (e->tx)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
ytes_delta +=3D m->agg_tx_bytes - e->last_tx_bytes;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (e->rx)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
ytes_delta +=3D m->agg_rx_bytes - e->last_rx_bytes;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Avoid overflow when mu=
ltiplying bytes_delta; cap to max u64. */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (bytes_delta) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (bytes_delta > ((u64)-1) / mul)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0bits_per_sec =3D (u64)-1;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e=
lse
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0bits_per_sec =3D div64_u64(bytes_delta * mul, 2 * D=
EFAULT_INTERVAL_MS);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 kbps =3D div64_u64(bi=
ts_per_sec, 1000ULL);
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (kbps =3D=3D 0)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l=
ed_set_off_full(led, e->link);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
nt idx =3D 0, t;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f=
or (t =3D 0; t < ARRAY_SIZE(wlan_tpt_table); t++) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if (kbps >=3D wlan_tpt_table[t].throughput)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0idx =3D t;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0else
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0o=
n_ms =3D wlan_tpt_table[idx].on_ms;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0o=
ff_ms =3D wlan_tpt_table[idx].off_ms;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (e->link)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0led_blink_set(led, &on_ms, &off_ms);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e=
lse
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0led_blink_set(led, &off_ms, &on_ms);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e->last_tx_bytes =3D m->a=
gg_tx_bytes;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e->last_rx_bytes =3D m->a=
gg_rx_bytes;
++=C2=A0=C2=A0=C2=A0=C2=A0} else {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* LAN/WAN: oneshot on pa=
cket-count change */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 tx_sum =3D m->agg_tx_=
packets;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 rx_sum =3D m->agg_rx_=
packets;
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ((e->tx && tx_sum !=3D=
 e->last_tx_packets) || (e->rx && rx_sum !=3D e->last_rx_packets)) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u=
nsigned long ms =3D DEFAULT_INTERVAL_MS;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l=
ed_set_oneshot_ms(led, ms, e->link);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l=
ed_set_off_full(led, e->link);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e->last_tx_packets =3D tx=
_sum;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e->last_rx_packets =3D rx=
_sum;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++}
++
++/* core work: aggregate + update LEDs */
++static void net_mgr_work(struct work_struct *work)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_mgr *m =3D container_of(work, struct n=
et_mgr, work.work);
++=C2=A0=C2=A0=C2=A0=C2=A0bool any_online =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0int i;
++
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&m->lock);
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (m->dev_count =3D=3D 0) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct net_led *e;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m->agg_tx_packets =3D m->=
agg_rx_packets =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m->agg_tx_bytes =3D m->ag=
g_rx_bytes =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0list_for_each_entry(e, &m=
->leds, node) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l=
ed_set_off_full(e->led_cdev, false);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e=
->last_tx_packets =3D e->last_rx_packets =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e=
->last_tx_bytes =3D e->last_rx_bytes =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0schedule_delayed_work(&m-=
>work, msecs_to_jiffies(2 * DEFAULT_INTERVAL_MS));
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* aggregate */
++=C2=A0=C2=A0=C2=A0=C2=A0m->agg_tx_packets =3D m->agg_rx_packets =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0m->agg_tx_bytes =3D m->agg_rx_bytes =3D 0;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* detect any tracked-interface online (carrier) =
and sum stats */
++=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < m->dev_count; i++) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct net_device *dev =
=3D m->devs[i];
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct rtnl_link_stats64 =
st;
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!dev)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c=
ontinue;
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0get_dev_stats_safe(dev, &=
st);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m->agg_tx_packets +=3D st=
.tx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m->agg_rx_packets +=3D st=
.rx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m->agg_tx_bytes +=3D st.t=
x_bytes;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m->agg_rx_bytes +=3D st.r=
x_bytes;
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (netif_running(dev) &&=
 netif_carrier_ok(dev))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0a=
ny_online =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* update each subscribed LED according to its fl=
ags and family */
++=C2=A0=C2=A0=C2=A0=C2=A0{
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct net_led *e;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0list_for_each_entry(e, &m=
->leds, node)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u=
pdate_led(e, m, any_online);
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0schedule_delayed_work(&m->work, msecs_to_jiffies(=
2 * DEFAULT_INTERVAL_MS));
++}
++
++/* notifier: manage tracked devices */
++static int net_mgr_notify(struct notifier_block *nb, unsigned long event,=
 void *ptr)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0struct netdev_notifier_info *info =3D ptr;
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_device *tmp, *dev =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_mgr *m =3D container_of(nb, struct net=
_mgr, notifier);
++=C2=A0=C2=A0=C2=A0=C2=A0int i, id =3D -1, newid;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (event !=3D NETDEV_REGISTER && event !=3D NETD=
EV_UNREGISTER &&
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0event !=3D NETDEV_CHANGEN=
AME)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NOTIFY_DONE;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (!info)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NOTIFY_DONE;
++
++=C2=A0=C2=A0=C2=A0=C2=A0dev =3D info->dev;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (!dev)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NOTIFY_DONE;
++
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < m->dev_count; i++) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (m->devs[i] && m->devs=
[i] =3D=3D dev) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
d =3D i;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
reak;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0switch (event) {
++=C2=A0=C2=A0=C2=A0=C2=A0case NETDEV_UNREGISTER:
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (id >=3D 0) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t=
mp =3D m->devs[id];
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m=
->devs[id] =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0p=
r_info("%s - interface %s unregistered\n", type_names[m->type], dev->name);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (m->dev_count =3D=3D id + 1)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0m->dev_count--;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m=
utex_unlock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d=
ev_put(tmp);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m=
utex_lock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
++=C2=A0=C2=A0=C2=A0=C2=A0case NETDEV_CHANGENAME:
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (id >=3D 0 && !name_ma=
tches_type(dev->name, m->type)) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t=
mp =3D m->devs[id];
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m=
->devs[id] =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0p=
r_info("%s - interface %s unregistered (name changed)\n",
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0type_names[m->type], dev->name);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (m->dev_count =3D=3D id + 1)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0m->dev_count--;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m=
utex_unlock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d=
ev_put(tmp);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m=
utex_lock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
reak;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fallthrough;
++=C2=A0=C2=A0=C2=A0=C2=A0case NETDEV_REGISTER:
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (id < 0 && name_matche=
s_type(dev->name, m->type)) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0n=
ewid =3D -1;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f=
or (i =3D 0; i < m->dev_count; i++) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if (!m->devs[i]) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0newid =3D i;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (newid < 0 && m->dev_count < MAX_IFACES)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0newid =3D m->dev_count++;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (newid >=3D 0) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0dev_hold(dev);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0m->devs[newid] =3D dev;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0pr_info("%s - interface %s registered\n", type_name=
s[m->type], dev->name);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0return NOTIFY_DONE;
++}
++
++/* find/create manager for base family */
++static struct net_mgr *net_mgr_get(enum net_trig_type type)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_mgr *m, *existing =3D NULL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (type >=3D NET_TRIG_TYPE_MAX)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NULL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* fast-path: if already exists, bump ref and ret=
urn */
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&managers_lock);
++=C2=A0=C2=A0=C2=A0=C2=A0m =3D managers[type];
++=C2=A0=C2=A0=C2=A0=C2=A0if (m) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0atomic_inc(&m->refcnt);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&managers_lo=
ck);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return m;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&managers_lock);
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* allocate and init (not yet published) */
++=C2=A0=C2=A0=C2=A0=C2=A0m =3D kzalloc(sizeof(*m), GFP_KERNEL);
++=C2=A0=C2=A0=C2=A0=C2=A0if (!m)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NULL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0m->type =3D type;
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_init(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0INIT_LIST_HEAD(&m->leds);
++=C2=A0=C2=A0=C2=A0=C2=A0atomic_set(&m->refcnt, 1);
++=C2=A0=C2=A0=C2=A0=C2=A0INIT_DELAYED_WORK(&m->work, net_mgr_work);
++
++=C2=A0=C2=A0=C2=A0=C2=A0m->notifier.notifier_call =3D net_mgr_notify;
++=C2=A0=C2=A0=C2=A0=C2=A0m->notifier.priority =3D 0;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* try to register notifier; on failure clean up =
and return */
++=C2=A0=C2=A0=C2=A0=C2=A0if (register_netdevice_notifier(&m->notifier)) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(m);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* publish manager, but handle rare race where an=
other thread created it */
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&managers_lock);
++=C2=A0=C2=A0=C2=A0=C2=A0existing =3D managers[type];
++=C2=A0=C2=A0=C2=A0=C2=A0if (existing) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* use existing one: incr=
ease refcount, drop our resources */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0atomic_inc(&existing->ref=
cnt);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&managers_lo=
ck);
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unregister_netdevice_noti=
fier(&m->notifier);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(m);
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return existing;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* no existing manager -> publish ours */
++=C2=A0=C2=A0=C2=A0=C2=A0managers[type] =3D m;
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&managers_lock);
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* start background work */
++=C2=A0=C2=A0=C2=A0=C2=A0schedule_delayed_work(&m->work, 0);
++
++=C2=A0=C2=A0=C2=A0=C2=A0return m;
++}
++
++static void net_mgr_put(struct net_mgr *m)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0int i;
++=C2=A0=C2=A0=C2=A0=C2=A0if (!m)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (atomic_dec_and_test(&m->refcnt)) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&managers_lock=
);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (managers[m->type] =3D=
=3D m)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m=
anagers[m->type] =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&managers_lo=
ck);
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cancel_delayed_work_sync(=
&m->work);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unregister_netdevice_noti=
fier(&m->notifier);
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < m->dev_=
count; i++)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (m->devs[i])
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0dev_put(m->devs[i]);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&m->lock);
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(m);
++=C2=A0=C2=A0=C2=A0=C2=A0}
++}
++
++static DEVICE_ATTR(link, S_IRUGO | S_IWUSR, net_flag_show, net_flag_store=
);
++static DEVICE_ATTR(tx, S_IRUGO | S_IWUSR, net_flag_show, net_flag_store);
++static DEVICE_ATTR(rx, S_IRUGO | S_IWUSR, net_flag_show, net_flag_store);
++static DEVICE_ATTR(dev, S_IRUGO | S_IWUSR, net_dev_show, net_dev_store);
++
++/* sysfs attributes: link, tx, rx (per-LED) */
++
++static ssize_t net_flag_show(struct device *dev, struct device_attribute =
*attr, char *buf)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0struct led_classdev *led_cdev =3D dev_get_drvdata=
(dev);
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_led *entry;
++=C2=A0=C2=A0=C2=A0=C2=A0int val;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (!led_cdev || !led_cdev->trigger_data)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENODEV;
++
++=C2=A0=C2=A0=C2=A0=C2=A0entry =3D led_cdev->trigger_data;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (attr =3D=3D &dev_attr_link)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0val =3D entry->link;
++=C2=A0=C2=A0=C2=A0=C2=A0else if (attr =3D=3D &dev_attr_tx)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0val =3D entry->tx;
++=C2=A0=C2=A0=C2=A0=C2=A0else if (attr =3D=3D &dev_attr_rx)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0val =3D entry->rx;
++=C2=A0=C2=A0=C2=A0=C2=A0else
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0return sprintf(buf, "%d\n", val);
++}
++
++static ssize_t net_flag_store(struct device *dev, struct device_attribute=
 *attr,
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *buf, size_t count)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0struct led_classdev *led_cdev =3D dev_get_drvdata=
(dev);
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_led *entry;
++=C2=A0=C2=A0=C2=A0=C2=A0bool val;
++=C2=A0=C2=A0=C2=A0=C2=A0int ret;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (!led_cdev || !led_cdev->trigger_data)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENODEV;
++
++=C2=A0=C2=A0=C2=A0=C2=A0entry =3D led_cdev->trigger_data;
++
++=C2=A0=C2=A0=C2=A0=C2=A0ret =3D kstrtobool(buf, &val);
++=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (attr =3D=3D &dev_attr_link)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0entry->link =3D val;
++=C2=A0=C2=A0=C2=A0=C2=A0else if (attr =3D=3D &dev_attr_tx)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0entry->tx =3D val;
++=C2=A0=C2=A0=C2=A0=C2=A0else if (attr =3D=3D &dev_attr_rx)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0entry->rx =3D val;
++=C2=A0=C2=A0=C2=A0=C2=A0else
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* request immediate update */
++=C2=A0=C2=A0=C2=A0=C2=A0if (entry->mgr)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0schedule_delayed_work(&en=
try->mgr->work, 0);
++
++=C2=A0=C2=A0=C2=A0=C2=A0pr_info("LED %s - network trigger flags changed t=
o %s%s%s\n",
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_name(led_cdev->dev),
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0entry->link ? "link " : "=
",
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0entry->tx ? "tx " : "",
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0entry->rx ? "rx" : "");
++
++=C2=A0=C2=A0=C2=A0=C2=A0return count;
++}
++
++static ssize_t net_dev_show(struct device *dev, struct device_attribute *=
attr, char *buf)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0struct led_classdev *led_cdev =3D dev_get_drvdata=
(dev);
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_led *entry;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (!led_cdev || !led_cdev->trigger_data)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENODEV;
++
++=C2=A0=C2=A0=C2=A0=C2=A0entry =3D led_cdev->trigger_data;
++=C2=A0=C2=A0=C2=A0=C2=A0if (!entry->mgr)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENODEV;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (entry->mgr->type < 0 || entry->mgr->type >=3D=
 NET_TRIG_TYPE_MAX)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0return sprintf(buf, "%s\n", type_names[entry->mgr=
->type]);
++}
++
++static ssize_t net_dev_store(struct device *dev, struct device_attribute =
*attr,
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf, size_t count)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0char tmp[32];
++=C2=A0=C2=A0=C2=A0=C2=A0size_t len =3D min(sizeof(tmp) - 1, count);
++=C2=A0=C2=A0=C2=A0=C2=A0struct led_classdev *led_cdev =3D dev_get_drvdata=
(dev);
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_led *entry;
++=C2=A0=C2=A0=C2=A0=C2=A0int parsed;
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_mgr *old_mgr, *new_mgr;
++=C2=A0=C2=A0=C2=A0=C2=A0size_t i;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* basic checks */
++=C2=A0=C2=A0=C2=A0=C2=A0if (!led_cdev || !led_cdev->trigger_data)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENODEV;
++=C2=A0=C2=A0=C2=A0=C2=A0entry =3D led_cdev->trigger_data;
++=C2=A0=C2=A0=C2=A0=C2=A0if (!entry->mgr)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENODEV;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (len =3D=3D 0 || len >=3D sizeof(tmp))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* copy raw input (no trimming). allow optional t=
erminal '\n' / '\r\n' only */
++=C2=A0=C2=A0=C2=A0=C2=A0memcpy(tmp, buf, len);
++=C2=A0=C2=A0=C2=A0=C2=A0tmp[len] =3D '\0';
++=C2=A0=C2=A0=C2=A0=C2=A0/* Accept and strip one trailing LF and optional =
preceding CR, but reject spaces/tabs anywhere */
++=C2=A0=C2=A0=C2=A0=C2=A0if (len > 0 && tmp[len - 1] =3D=3D '\n') {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tmp[--len] =3D '\0';
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (len > 0 && tmp[len - =
1] =3D=3D '\r') {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t=
mp[--len] =3D '\0';
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0/* reject any spaces/tabs inside the token (no tr=
imming) */
++=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < len; i++) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (tmp[i] =3D=3D ' ' || =
tmp[i] =3D=3D '\t')
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn -EINVAL;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0parsed =3D parse_dev_string(tmp);
++=C2=A0=C2=A0=C2=A0=C2=A0if (parsed < 0)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0old_mgr =3D entry->mgr;
++=C2=A0=C2=A0=C2=A0=C2=A0if (old_mgr->type =3D=3D parsed)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return count; /* no chang=
e */
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* get or create new manager (increments refcnt) =
*/
++=C2=A0=C2=A0=C2=A0=C2=A0new_mgr =3D net_mgr_get(parsed);
++=C2=A0=C2=A0=C2=A0=C2=A0if (!new_mgr)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENOMEM;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* Move entry between manager lists.
++=C2=A0=C2=A0=C2=A0=C2=A0 * To avoid races, take managers_lock and both ma=
nager locks while
++=C2=A0=C2=A0=C2=A0=C2=A0 * manipulating lists and updating history.
++=C2=A0=C2=A0=C2=A0=C2=A0 */
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&managers_lock);
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&old_mgr->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0if (new_mgr !=3D old_mgr)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&new_mgr->lock=
);
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* remove from old manager list and add to new on=
e */
++=C2=A0=C2=A0=C2=A0=C2=A0list_del(&entry->node);
++=C2=A0=C2=A0=C2=A0=C2=A0list_add_tail(&entry->node, &new_mgr->leds);
++=C2=A0=C2=A0=C2=A0=C2=A0entry->mgr =3D new_mgr;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* initialize history so future reads won't see a=
 spurious delta */
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_tx_packets =3D new_mgr->agg_tx_packet=
s;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_rx_packets =3D new_mgr->agg_rx_packet=
s;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_tx_bytes=C2=A0=C2=A0 =3D new_mgr->agg=
_tx_bytes;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_rx_bytes=C2=A0=C2=A0 =3D new_mgr->agg=
_rx_bytes;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (new_mgr !=3D old_mgr)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&new_mgr->lo=
ck);
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&old_mgr->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&managers_lock);
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* drop old manager reference */
++=C2=A0=C2=A0=C2=A0=C2=A0net_mgr_put(old_mgr);
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* request immediate update */
++=C2=A0=C2=A0=C2=A0=C2=A0if (entry->mgr)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0schedule_delayed_work(&en=
try->mgr->work, 0);
++
++=C2=A0=C2=A0=C2=A0=C2=A0pr_info("LED %s - network trigger family changed =
to %s\n",
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_name(led_cdev->dev), =
type_names[parsed]);
++
++=C2=A0=C2=A0=C2=A0=C2=A0return count;
++}
++
++/* deactivate: detach led from manager */
++static void net_deactivate(struct led_classdev *led_cdev)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_led *entry =3D led_cdev->trigger_data;
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_mgr *m;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (!entry)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
++
++=C2=A0=C2=A0=C2=A0=C2=A0m =3D entry->mgr;
++=C2=A0=C2=A0=C2=A0=C2=A0if (!m) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* defensive: shouldn't h=
appen, but avoid crash */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0led_cdev->trigger_data =
=3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(entry);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0list_del(&entry->node);
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&m->lock);
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* remove sysfs files */
++=C2=A0=C2=A0=C2=A0=C2=A0device_remove_file(led_cdev->dev, &dev_attr_link)=
;
++=C2=A0=C2=A0=C2=A0=C2=A0device_remove_file(led_cdev->dev, &dev_attr_tx);
++=C2=A0=C2=A0=C2=A0=C2=A0device_remove_file(led_cdev->dev, &dev_attr_rx);
++=C2=A0=C2=A0=C2=A0=C2=A0device_remove_file(led_cdev->dev, &dev_attr_dev);
++
++=C2=A0=C2=A0=C2=A0=C2=A0led_set_off_full(led_cdev, false);
++=C2=A0=C2=A0=C2=A0=C2=A0led_cdev->trigger_data =3D NULL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0pr_info("LED %s - trigger %s%s detached\n",
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_name(led_cdev->dev),
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0type_names[m->type],
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0labels[(entry->link << 2)=
 | (entry->tx << 1) | (entry->rx << 0)]);
++
++=C2=A0=C2=A0=C2=A0=C2=A0kfree(entry);
++=C2=A0=C2=A0=C2=A0=C2=A0net_mgr_put(m);
++}
++
++/* activate/deactivate: attach led to manager and remember flags */
++static int net_activate(struct led_classdev *led_cdev)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0const char *fn =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0const char *dt_dev =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0const char *dt_mode =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0int parsed =3D -1;
++=C2=A0=C2=A0=C2=A0=C2=A0bool link =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0bool tx =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0bool rx =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0bool online =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_mgr *m;
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_led *entry;
++=C2=A0=C2=A0=C2=A0=C2=A0const char *name;
++=C2=A0=C2=A0=C2=A0=C2=A0const char *sep;
++=C2=A0=C2=A0=C2=A0=C2=A0int ret;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (!led_cdev) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_err("network: net_acti=
vate called with NULL led_cdev\n");
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0if (!led_cdev->dev) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_err("network: LED devi=
ce is NULL, aborting activate\n");
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0name =3D dev_name(led_cdev->dev);
++=C2=A0=C2=A0=C2=A0=C2=A0if (!name || !*name) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_err("network: LED has =
no name, aborting activate\n");
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0if (led_cdev->trigger_data) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_warn("network: LED %s =
already has trigger_data set, refusing attach\n",
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0n=
ame);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EBUSY;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (led_cdev->dev && led_cdev->dev->of_node) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0of_property_read_string(l=
ed_cdev->dev->of_node, "dev", &dt_dev);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0of_property_read_string(l=
ed_cdev->dev->of_node, "mode", &dt_mode);
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* function part from name (after last ':') */
++=C2=A0=C2=A0=C2=A0=C2=A0sep =3D strrchr(name, ':');
++=C2=A0=C2=A0=C2=A0=C2=A0if (sep && sep[1] !=3D '\0')
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fn =3D sep + 1;
++=C2=A0=C2=A0=C2=A0=C2=A0else
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fn =3D name;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* get family and online flag from name (family m=
ay be absent) */
++=C2=A0=C2=A0=C2=A0=C2=A0parsed =3D parse_function_string(fn, &online);
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (dt_mode) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* DT "mode" present: fla=
gs come from mode and take precedence */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D parse_flags_from_=
string(dt_mode, &link, &tx, &rx);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn -EINVAL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* family: from dt_dev if=
 present, otherwise from name */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dt_dev) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0p=
arsed =3D parse_dev_string(dt_dev);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (parsed < 0) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0pr_info("network: invalid dev '%s' for LED %s\n", d=
t_dev, name);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/=
* parsed already set from name above; require a valid family */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (parsed < 0) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0pr_info("network: no family in name and no dev for =
LED %s\n", name);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0} else if (dt_dev) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Only dt_dev present: u=
se its family. Flags depend on name "-online" */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0parsed =3D parse_dev_stri=
ng(dt_dev);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (parsed < 0) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0p=
r_info("network: invalid dev '%s' for LED %s\n", dt_dev, name);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn -EINVAL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (online) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/=
* name indicated online variant and no mode -> online-only */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l=
ink =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t=
x =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
x =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l=
ink =3D tx =3D rx =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0} else {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* No DT: family and flag=
s from name.
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If name had "-online" =
-> online-only.
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (parsed < 0) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0p=
r_info("network: unknown function '%s' for LED %s\n", fn ?: "<NULL>", name)=
;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn -EINVAL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (online) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/=
* online variant in name =3D> online-only */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l=
ink =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t=
x =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
x =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l=
ink =3D tx =3D rx =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0m =3D net_mgr_get(parsed);
++=C2=A0=C2=A0=C2=A0=C2=A0if (!m)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENOMEM;
++
++=C2=A0=C2=A0=C2=A0=C2=A0entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
++=C2=A0=C2=A0=C2=A0=C2=A0if (!entry) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0net_mgr_put(m);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENOMEM;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0entry->led_cdev =3D led_cdev;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->mgr =3D m;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_tx_packets =3D entry->last_rx_packets=
 =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_tx_bytes =3D entry->last_rx_bytes =3D=
 0;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->link =3D link;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->tx =3D tx;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->rx =3D rx;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* attach under manager lock and initialize histo=
ry to current aggregates */
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0list_add_tail(&entry->node, &m->leds);
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* initialize history so future reads won't see a=
 spurious delta */
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_tx_packets =3D m->agg_tx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_rx_packets =3D m->agg_rx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_tx_bytes=C2=A0=C2=A0 =3D m->agg_tx_by=
tes;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_rx_bytes=C2=A0=C2=A0 =3D m->agg_rx_by=
tes;
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&m->lock);
++
++=C2=A0=C2=A0=C2=A0=C2=A0led_cdev->trigger_data =3D entry;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* create per-LED sysfs files; on failure clean u=
p */
++=C2=A0=C2=A0=C2=A0=C2=A0ret =3D device_create_file(led_cdev->dev, &dev_at=
tr_link);
++=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_create;
++=C2=A0=C2=A0=C2=A0=C2=A0ret =3D device_create_file(led_cdev->dev, &dev_at=
tr_tx);
++=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_create_tx;
++=C2=A0=C2=A0=C2=A0=C2=A0ret =3D device_create_file(led_cdev->dev, &dev_at=
tr_rx);
++=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_create_rx;
++=C2=A0=C2=A0=C2=A0=C2=A0ret =3D device_create_file(led_cdev->dev, &dev_at=
tr_dev);
++=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_create_dev;
++
++=C2=A0=C2=A0=C2=A0=C2=A0pr_info("LED %s - trigger %s%s attached\n",
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0name,
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0type_names[m->type],
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0labels[(entry->link << 2)=
 | (entry->tx << 1) | (entry->rx << 0)]);
++=C2=A0=C2=A0=C2=A0=C2=A0return 0;
++
++err_create_dev:
++=C2=A0=C2=A0=C2=A0=C2=A0device_remove_file(led_cdev->dev, &dev_attr_rx);
++err_create_rx:
++=C2=A0=C2=A0=C2=A0=C2=A0device_remove_file(led_cdev->dev, &dev_attr_tx);
++err_create_tx:
++=C2=A0=C2=A0=C2=A0=C2=A0device_remove_file(led_cdev->dev, &dev_attr_link)=
;
++err_create:
++=C2=A0=C2=A0=C2=A0=C2=A0/* detach and free */
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0list_del(&entry->node);
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0led_cdev->trigger_data =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0kfree(entry);
++=C2=A0=C2=A0=C2=A0=C2=A0net_mgr_put(m);
++=C2=A0=C2=A0=C2=A0=C2=A0return ret;
++}
++
++static struct led_trigger network_trigger =3D {
++=C2=A0=C2=A0=C2=A0=C2=A0.name =3D "network",
++=C2=A0=C2=A0=C2=A0=C2=A0.activate =3D net_activate,
++=C2=A0=C2=A0=C2=A0=C2=A0.deactivate =3D net_deactivate,
++};
++
++module_led_trigger(network_trigger);
++
++MODULE_AUTHOR("Mieczyslaw Nalewaj <namiltd@yahoo.com>");
++MODULE_DESCRIPTION("LED trigger for network interfaces =C3=A2=E2=82=AC=E2=
=80=9D aggregated by family; supports link/tx/rx and -online");
++MODULE_LICENSE("GPL v2");
+--- a/drivers/leds/trigger/Makefile
++++ b/drivers/leds/trigger/Makefile
+@@ -16,3 +16,4 @@ obj-$(CONFIG_LEDS_TRIGGER_NETDEV)=C2=A0=C2=A0=C2=A0=C2=
=A0+=3D led
+ obj-$(CONFIG_LEDS_TRIGGER_PATTERN)=C2=A0=C2=A0=C2=A0=C2=A0+=3D ledtrig-pa=
ttern.o
+ obj-$(CONFIG_LEDS_TRIGGER_TTY)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0+=3D ledtrig-tty.o
+ obj-$(CONFIG_LEDS_TRIGGER_INPUT_EVENTS)=C2=A0=C2=A0=C2=A0=C2=A0+=3D ledtr=
ig-input-events.o
++obj-$(CONFIG_LEDS_TRIGGER_NETWORK)=C2=A0=C2=A0=C2=A0=C2=A0+=3D ledtrig-ne=
twork.o
diff --git a/target/linux/generic/hack-6.6/820-ledtrig-network-module.patch=
 b/target/linux/generic/hack-6.6/820-ledtrig-network-module.patch
new file mode 100644
index 00000000000000..f4c0ea241b8c93
--- /dev/null
+++ b/target/linux/generic/hack-6.6/820-ledtrig-network-module.patch
@@ -0,0 +1,1047 @@
+--- a/drivers/leds/trigger/Kconfig
++++ b/drivers/leds/trigger/Kconfig
+@@ -132,6 +132,15 @@ config LEDS_TRIGGER_NETDEV
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0This allows LEDs to be controlled by =
network device activity.
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0If unsure, say Y.
+=20
++config LEDS_TRIGGER_NETWORK
++=C2=A0=C2=A0=C2=A0=C2=A0tristate "LED trigger for network interfaces"
++=C2=A0=C2=A0=C2=A0=C2=A0depends on NET
++=C2=A0=C2=A0=C2=A0=C2=A0help
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Per-family network LED trigger: aggre=
gates lan/wan/wlan stats;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0family from DT 'dev' or name; flags f=
rom DT 'mode';
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0'-online' - online-only if mode absen=
t.
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0If unsure, say Y.
++
+ config LEDS_TRIGGER_PATTERN
+ =C2=A0=C2=A0=C2=A0=C2=A0tristate "LED Pattern Trigger"
+ =C2=A0=C2=A0=C2=A0=C2=A0help
+--- /dev/null
++++ b/drivers/leds/trigger/ledtrig-network.c
+@@ -0,0 +1,1019 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * LED trigger for network interfaces.
++ *
++ * - Aggregated per-family (lan/wan/wlan).
++ * - Family and flags are taken from device tree properties:
++ *=C2=A0=C2=A0=C2=A0=C2=A0 - "dev"=C2=A0=C2=A0: simple family string "lan=
" | "wan" | "wlan"
++ *=C2=A0=C2=A0=C2=A0=C2=A0 - "mode" : any combination of "link", "tx", "r=
x" flags
++ *=C2=A0=C2=A0 Priority/combination:
++ *=C2=A0=C2=A0=C2=A0=C2=A0 * If "mode" present: flags come from "mode" an=
d take precedence.
++ *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Family is taken from "dev" if pres=
ent, otherwise from the LED name.
++ *=C2=A0=C2=A0=C2=A0=C2=A0 * If only "dev" present: use its family and de=
fault flags =3D link+tx+rx.
++ *=C2=A0=C2=A0=C2=A0=C2=A0 * If neither present: fall back to LED device =
name parsing.
++ *
++ * - Suffix "-online" is valid ONLY in the LED name (label), e.g. "green:=
wlan-online".
++ *=C2=A0=C2=A0 It indicates the online variant but is applied only when D=
T "mode" is absent.
++ *
++ * Behaviour:
++ * - wlan (normal): blink/solid driven by throughput table
++ * - lan/wan (normal): one-shot blink on TX/RX packet change
++ * - *-online variants: steady ON while any interface of the family has c=
arrier
++ *
++ * Interfaces are auto-tracked by name match (lan0, wan1, wlan2, phy0, wl=
1, ath0, ra0=E2=80=A6).
++ * Up to MAX_IFACES (16) interfaces per family.
++ */
++
++#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
++
++#include <linux/module.h>
++#include <linux/kernel.h>
++#include <linux/slab.h>
++#include <linux/jiffies.h>
++#include <linux/leds.h>
++#include <linux/mutex.h>
++#include <linux/netdevice.h>
++#include <linux/workqueue.h>
++#include <linux/of.h>
++#include <linux/list.h>
++#include <linux/atomic.h>
++#include <linux/compiler.h>
++#include <linux/string.h>
++#include <linux/sysfs.h>
++#include <linux/device.h>
++#include <linux/ctype.h>
++#include <linux/err.h>
++#include "../leds.h"
++
++#define MAX_IFACES 16
++#define DEFAULT_INTERVAL_MS 50
++
++enum net_trig_type {
++=C2=A0=C2=A0=C2=A0=C2=A0NET_TRIG_LAN =3D 0,
++=C2=A0=C2=A0=C2=A0=C2=A0NET_TRIG_WAN,
++=C2=A0=C2=A0=C2=A0=C2=A0NET_TRIG_WLAN,
++=C2=A0=C2=A0=C2=A0=C2=A0NET_TRIG_TYPE_MAX,
++};
++
++static const char * const type_names[] =3D {
++=C2=A0=C2=A0=C2=A0=C2=A0[NET_TRIG_LAN] =3D "lan",
++=C2=A0=C2=A0=C2=A0=C2=A0[NET_TRIG_WAN] =3D "wan",
++=C2=A0=C2=A0=C2=A0=C2=A0[NET_TRIG_WLAN] =3D "wlan",
++};
++
++/* labels indexed by bitmask: (link<<2)|(tx<<1)|(rx<<0) */
++static const char *const labels[] =3D {
++=C2=A0=C2=A0=C2=A0=C2=A0"",=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* 0 */
++=C2=A0=C2=A0=C2=A0=C2=A0"(tx)",=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /* 1 */
++=C2=A0=C2=A0=C2=A0=C2=A0"(rx)",=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /* 2 */
++=C2=A0=C2=A0=C2=A0=C2=A0"(tx rx)",=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* =
3 */
++=C2=A0=C2=A0=C2=A0=C2=A0"(link)",=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
4 */
++=C2=A0=C2=A0=C2=A0=C2=A0"(link rx)",=C2=A0=C2=A0=C2=A0=C2=A0/* 5 */
++=C2=A0=C2=A0=C2=A0=C2=A0"(link tx)",=C2=A0=C2=A0=C2=A0=C2=A0/* 6 */
++=C2=A0=C2=A0=C2=A0=C2=A0"(link tx rx)", /* 7 */
++};
++
++/* wlan throughput table */
++static const struct {
++=C2=A0=C2=A0=C2=A0=C2=A0u32 throughput;
++=C2=A0=C2=A0=C2=A0=C2=A0unsigned long on_ms;
++=C2=A0=C2=A0=C2=A0=C2=A0unsigned long off_ms;
++} wlan_tpt_table[] =3D {
++=C2=A0=C2=A0=C2=A0=C2=A0{=C2=A0=C2=A0 64, 200, 800 },
++=C2=A0=C2=A0=C2=A0=C2=A0{=C2=A0=C2=A0512, 200, 300 },
++=C2=A0=C2=A0=C2=A0=C2=A0{ 2048, 200, 150 },
++=C2=A0=C2=A0=C2=A0=C2=A0{10000, 200,=C2=A0=C2=A050 },
++=C2=A0=C2=A0=C2=A0=C2=A0{54000, 100,=C2=A0=C2=A050 },
++};
++
++struct net_mgr {
++=C2=A0=C2=A0=C2=A0=C2=A0enum net_trig_type type; /* family: lan/wan/wlan =
*/
++
++=C2=A0=C2=A0=C2=A0=C2=A0struct mutex lock;
++=C2=A0=C2=A0=C2=A0=C2=A0struct notifier_block notifier;
++=C2=A0=C2=A0=C2=A0=C2=A0struct delayed_work work;
++
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_device *devs[MAX_IFACES];
++=C2=A0=C2=A0=C2=A0=C2=A0int dev_count;
++
++=C2=A0=C2=A0=C2=A0=C2=A0u64 agg_rx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0u64 agg_tx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0u64 agg_rx_bytes;
++=C2=A0=C2=A0=C2=A0=C2=A0u64 agg_tx_bytes;
++
++=C2=A0=C2=A0=C2=A0=C2=A0struct list_head leds;
++=C2=A0=C2=A0=C2=A0=C2=A0atomic_t refcnt;
++};
++
++struct net_led {
++=C2=A0=C2=A0=C2=A0=C2=A0struct list_head node;
++=C2=A0=C2=A0=C2=A0=C2=A0struct led_classdev *led_cdev;
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_mgr *mgr;
++
++=C2=A0=C2=A0=C2=A0=C2=A0u64 last_rx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0u64 last_tx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0u64 last_rx_bytes;
++=C2=A0=C2=A0=C2=A0=C2=A0u64 last_tx_bytes;
++
++=C2=A0=C2=A0=C2=A0=C2=A0bool link;
++=C2=A0=C2=A0=C2=A0=C2=A0bool rx;
++=C2=A0=C2=A0=C2=A0=C2=A0bool tx;
++};
++
++static DEFINE_MUTEX(managers_lock);
++static struct net_mgr *managers[NET_TRIG_TYPE_MAX];
++
++static ssize_t net_flag_show(struct device *dev, struct device_attribute =
*attr, char *buf);
++static ssize_t net_flag_store(struct device *dev, struct device_attribute=
 *attr,
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *buf, size_t count);
++static ssize_t net_dev_show(struct device *dev, struct device_attribute *=
attr, char *buf);
++static ssize_t net_dev_store(struct device *dev, struct device_attribute =
*attr,
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf, size_t count);
++
++/* helpers */
++static inline void led_set_off_full(struct led_classdev *led, bool on)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0led_stop_software_blink(led);
++=C2=A0=C2=A0=C2=A0=C2=A0led_set_brightness(led, on ? LED_FULL : LED_OFF);
++}
++
++static inline void led_set_oneshot_ms(struct led_classdev *led, unsigned =
long ms, bool invert)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0led_stop_software_blink(led);
++=C2=A0=C2=A0=C2=A0=C2=A0led_blink_set_oneshot(led, &ms, &ms, invert);
++}
++
++/* helper: check that next char after prefix is digit, '-' or NUL */
++static inline bool next_char_ok(const char *s, size_t pos)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0char c =3D s[pos];
++=C2=A0=C2=A0=C2=A0=C2=A0return c =3D=3D '\0' || c =3D=3D '-' || (c >=3D '=
0' && c <=3D '9');
++}
++
++/* name matching: lan/wan; wlan matched by various wifi prefixes with res=
triction
++ * additionally accept ath (Atheros) and ra/rai (Ralink/MediaTek) prefixe=
s.
++ * For lan and wan require next char to be digit/'-' or end to avoid acci=
dental matches.
++ */
++static bool name_matches_type(const char *name, enum net_trig_type type)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0if (!name)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;
++=C2=A0=C2=A0=C2=A0=C2=A0switch (type) {
++
++=C2=A0=C2=A0=C2=A0=C2=A0case NET_TRIG_LAN:
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* accept "lan", "lanX", =
"lan-X" */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strncmp(name, "lan",=
 3))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn next_char_ok(name, 3);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;
++=C2=A0=C2=A0=C2=A0=C2=A0case NET_TRIG_WAN:
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* accept "wan", "wanX", =
"wan-X" */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strncmp(name, "wan",=
 3))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn next_char_ok(name, 3);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;
++=C2=A0=C2=A0=C2=A0=C2=A0case NET_TRIG_WLAN:
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* accept "phyX", "wlX"/"=
wl-..." or "wlan" and common driver prefixes */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strncmp(name, "phy",=
 3))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn next_char_ok(name, 3);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strncmp(name, "wlan"=
, 4))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn next_char_ok(name, 4);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strncmp(name, "wl", =
2))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn next_char_ok(name, 2);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Atheros (athX) */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strncmp(name, "ath",=
 3))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn next_char_ok(name, 3);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Ralink/MediaTek: check=
 "rai" (e.g. rai0) first, then "ra" (ra0) */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strncmp(name, "rai",=
 3))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn next_char_ok(name, 3);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strncmp(name, "ra", =
2))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn next_char_ok(name, 2);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;
++=C2=A0=C2=A0=C2=A0=C2=A0default:
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++}
++
++/* Simplified parse_function_string: accepts exact family token optionall=
y
++ * suffixed with "-online", e.g. "wlan" or "wlan-online".
++ * Returns NET_TRIG_* or -1.
++ */
++static int parse_function_string(const char *fn, bool *online)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0size_t len;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (!fn || !online)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
++=C2=A0=C2=A0=C2=A0=C2=A0
++=C2=A0=C2=A0=C2=A0=C2=A0*online =3D false;
++
++=C2=A0=C2=A0=C2=A0=C2=A0len =3D strlen(fn);
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (len > 7 && !strcmp(fn + len - 7, "-online")) =
{
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*online =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0len -=3D 7;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (len =3D=3D 3 && !strncmp(fn, "lan", 3))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NET_TRIG_LAN;
++=C2=A0=C2=A0=C2=A0=C2=A0if (len =3D=3D 3 && !strncmp(fn, "wan", 3))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NET_TRIG_WAN;
++=C2=A0=C2=A0=C2=A0=C2=A0if (len =3D=3D 4 && !strncmp(fn, "wlan", 4))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NET_TRIG_WLAN;
++
++=C2=A0=C2=A0=C2=A0=C2=A0return -1;
++}
++
++/* Parse only flags from a string: recognized tokens are "link", "tx", "r=
x".
++ * Any other token =3D> -EINVAL. If no flags found, set all three true.
++ * Suitable for DT "mode" (strict) or parsing flags from name when no mod=
e present.
++ */
++static int parse_flags_from_string(const char *fn, bool *link, bool *tx, =
bool *rx)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0size_t len;
++=C2=A0=C2=A0=C2=A0=C2=A0const char *buf =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0size_t buflen =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0size_t i;
++=C2=A0=C2=A0=C2=A0=C2=A0bool found =3D false;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (!fn || !link || !tx || !rx)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
++
++=C2=A0=C2=A0=C2=A0=C2=A0*link =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0*tx =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0*rx =3D false;
++
++=C2=A0=C2=A0=C2=A0=C2=A0len =3D strlen(fn);
++=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < len; i++) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char c =3D fn[i];
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (c =3D=3D ' ' || c =3D=
=3D '\t' || c =3D=3D ',') {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
uf =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
uflen =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c=
ontinue;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!buf) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
uf =3D fn + i;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
uflen =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0buflen++;
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ((i + 1 =3D=3D len) ||=
 fn[i + 1] =3D=3D ' ' || fn[i + 1] =3D=3D '\t' || fn[i + 1] =3D=3D ',') {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (buflen =3D=3D 4 && !memcmp(buf, "link", 4)) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0*link =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0found =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}=
 else if (buflen =3D=3D 2 && !memcmp(buf, "tx", 2)) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0*tx =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0found =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}=
 else if (buflen =3D=3D 2 && !memcmp(buf, "rx", 2)) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0*rx =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0found =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}=
 else {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0/* unknown token */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
uf =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
uflen =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* default: if no flags found, set all true */
++=C2=A0=C2=A0=C2=A0=C2=A0if (!found) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*link =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*tx =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*rx =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0return 0;
++}
++
++/* parse simple dev string "lan"/"wan"/"wlan" -> enum or -1 */
++static int parse_dev_string(const char *s)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0if (!s)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
++=C2=A0=C2=A0=C2=A0=C2=A0if (!strcmp(s, "lan"))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NET_TRIG_LAN;
++=C2=A0=C2=A0=C2=A0=C2=A0if (!strcmp(s, "wan"))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NET_TRIG_WAN;
++=C2=A0=C2=A0=C2=A0=C2=A0if (!strcmp(s, "wlan"))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NET_TRIG_WLAN;
++=C2=A0=C2=A0=C2=A0=C2=A0return -1;
++}
++
++/* safe stats read wrapper */
++static void get_dev_stats_safe(struct net_device *dev, struct rtnl_link_s=
tats64 *st)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0memset(st, 0, sizeof(*st));
++=C2=A0=C2=A0=C2=A0=C2=A0dev_get_stats(dev, st);
++}
++
++/* Update single LED according to manager aggregates and per-LED flags.
++ * any_online indicates whether any tracked interface currently has carri=
er.
++ * If LED is online-only (link && !tx && !rx) it is driven directly by an=
y_online.
++ */
++static void update_led(struct net_led *e, struct net_mgr *m, bool any_onl=
ine)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0long unsigned int on_ms, off_ms;
++=C2=A0=C2=A0=C2=A0=C2=A0struct led_classdev *led =3D e->led_cdev;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* defensive: avoid deref if led unexpectedly NUL=
L */
++=C2=A0=C2=A0=C2=A0=C2=A0if (!led)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* If LED requested online-only, reflect any_onli=
ne */
++=C2=A0=C2=A0=C2=A0=C2=A0if (e->link && !e->tx && !e->rx) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0led_set_off_full(led, any=
_online);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* For non-online-only LEDs: if no tracked interf=
ace has carrier,
++=C2=A0=C2=A0=C2=A0=C2=A0 * keep the LED off and reset history baseline to=
 avoid spurious deltas
++=C2=A0=C2=A0=C2=A0=C2=A0 * when carrier later returns.
++=C2=A0=C2=A0=C2=A0=C2=A0 */
++=C2=A0=C2=A0=C2=A0=C2=A0if (!any_online) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0led_set_off_full(led, fal=
se);
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e->last_tx_packets =3D m-=
>agg_tx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e->last_rx_packets =3D m-=
>agg_rx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e->last_tx_bytes=C2=A0=C2=
=A0 =3D m->agg_tx_bytes;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e->last_rx_bytes=C2=A0=C2=
=A0 =3D m->agg_rx_bytes;
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* non-online-only behaviour depends on family */
++=C2=A0=C2=A0=C2=A0=C2=A0if (m->type =3D=3D NET_TRIG_WLAN) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* throughput-driven */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 bytes_delta =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const u64 mul =3D 8ULL * =
1000ULL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 bits_per_sec =3D 0;
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (e->tx)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
ytes_delta +=3D m->agg_tx_bytes - e->last_tx_bytes;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (e->rx)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
ytes_delta +=3D m->agg_rx_bytes - e->last_rx_bytes;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Avoid overflow when mu=
ltiplying bytes_delta; cap to max u64. */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (bytes_delta) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (bytes_delta > ((u64)-1) / mul)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0bits_per_sec =3D (u64)-1;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e=
lse
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0bits_per_sec =3D div64_u64(bytes_delta * mul, 2 * D=
EFAULT_INTERVAL_MS);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 kbps =3D div64_u64(bi=
ts_per_sec, 1000ULL);
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (kbps =3D=3D 0)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l=
ed_set_off_full(led, e->link);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
nt idx =3D 0, t;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f=
or (t =3D 0; t < ARRAY_SIZE(wlan_tpt_table); t++) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if (kbps >=3D wlan_tpt_table[t].throughput)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0idx =3D t;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0else
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0o=
n_ms =3D wlan_tpt_table[idx].on_ms;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0o=
ff_ms =3D wlan_tpt_table[idx].off_ms;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (e->link)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0led_blink_set(led, &on_ms, &off_ms);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e=
lse
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0led_blink_set(led, &off_ms, &on_ms);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e->last_tx_bytes =3D m->a=
gg_tx_bytes;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e->last_rx_bytes =3D m->a=
gg_rx_bytes;
++=C2=A0=C2=A0=C2=A0=C2=A0} else {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* LAN/WAN: oneshot on pa=
cket-count change */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 tx_sum =3D m->agg_tx_=
packets;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 rx_sum =3D m->agg_rx_=
packets;
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ((e->tx && tx_sum !=3D=
 e->last_tx_packets) || (e->rx && rx_sum !=3D e->last_rx_packets)) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u=
nsigned long ms =3D DEFAULT_INTERVAL_MS;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l=
ed_set_oneshot_ms(led, ms, e->link);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l=
ed_set_off_full(led, e->link);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e->last_tx_packets =3D tx=
_sum;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e->last_rx_packets =3D rx=
_sum;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++}
++
++/* core work: aggregate + update LEDs */
++static void net_mgr_work(struct work_struct *work)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_mgr *m =3D container_of(work, struct n=
et_mgr, work.work);
++=C2=A0=C2=A0=C2=A0=C2=A0bool any_online =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0int i;
++
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&m->lock);
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (m->dev_count =3D=3D 0) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct net_led *e;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m->agg_tx_packets =3D m->=
agg_rx_packets =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m->agg_tx_bytes =3D m->ag=
g_rx_bytes =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0list_for_each_entry(e, &m=
->leds, node) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l=
ed_set_off_full(e->led_cdev, false);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e=
->last_tx_packets =3D e->last_rx_packets =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e=
->last_tx_bytes =3D e->last_rx_bytes =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0schedule_delayed_work(&m-=
>work, msecs_to_jiffies(2 * DEFAULT_INTERVAL_MS));
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* aggregate */
++=C2=A0=C2=A0=C2=A0=C2=A0m->agg_tx_packets =3D m->agg_rx_packets =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0m->agg_tx_bytes =3D m->agg_rx_bytes =3D 0;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* detect any tracked-interface online (carrier) =
and sum stats */
++=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < m->dev_count; i++) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct net_device *dev =
=3D m->devs[i];
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct rtnl_link_stats64 =
st;
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!dev)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c=
ontinue;
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0get_dev_stats_safe(dev, &=
st);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m->agg_tx_packets +=3D st=
.tx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m->agg_rx_packets +=3D st=
.rx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m->agg_tx_bytes +=3D st.t=
x_bytes;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m->agg_rx_bytes +=3D st.r=
x_bytes;
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (netif_running(dev) &&=
 netif_carrier_ok(dev))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0a=
ny_online =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* update each subscribed LED according to its fl=
ags and family */
++=C2=A0=C2=A0=C2=A0=C2=A0{
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct net_led *e;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0list_for_each_entry(e, &m=
->leds, node)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u=
pdate_led(e, m, any_online);
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0schedule_delayed_work(&m->work, msecs_to_jiffies(=
2 * DEFAULT_INTERVAL_MS));
++}
++
++/* notifier: manage tracked devices */
++static int net_mgr_notify(struct notifier_block *nb, unsigned long event,=
 void *ptr)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0struct netdev_notifier_info *info =3D ptr;
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_device *tmp, *dev =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_mgr *m =3D container_of(nb, struct net=
_mgr, notifier);
++=C2=A0=C2=A0=C2=A0=C2=A0int i, id =3D -1, newid;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (event !=3D NETDEV_REGISTER && event !=3D NETD=
EV_UNREGISTER &&
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0event !=3D NETDEV_CHANGEN=
AME)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NOTIFY_DONE;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (!info)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NOTIFY_DONE;
++
++=C2=A0=C2=A0=C2=A0=C2=A0dev =3D info->dev;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (!dev)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NOTIFY_DONE;
++
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < m->dev_count; i++) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (m->devs[i] && m->devs=
[i] =3D=3D dev) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
d =3D i;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
reak;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0switch (event) {
++=C2=A0=C2=A0=C2=A0=C2=A0case NETDEV_UNREGISTER:
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (id >=3D 0) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t=
mp =3D m->devs[id];
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m=
->devs[id] =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0p=
r_info("%s - interface %s unregistered\n", type_names[m->type], dev->name);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (m->dev_count =3D=3D id + 1)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0m->dev_count--;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m=
utex_unlock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d=
ev_put(tmp);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m=
utex_lock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
++=C2=A0=C2=A0=C2=A0=C2=A0case NETDEV_CHANGENAME:
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (id >=3D 0 && !name_ma=
tches_type(dev->name, m->type)) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t=
mp =3D m->devs[id];
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m=
->devs[id] =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0p=
r_info("%s - interface %s unregistered (name changed)\n",
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0type_names[m->type], dev->name);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (m->dev_count =3D=3D id + 1)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0m->dev_count--;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m=
utex_unlock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d=
ev_put(tmp);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m=
utex_lock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b=
reak;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fallthrough;
++=C2=A0=C2=A0=C2=A0=C2=A0case NETDEV_REGISTER:
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (id < 0 && name_matche=
s_type(dev->name, m->type)) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0n=
ewid =3D -1;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f=
or (i =3D 0; i < m->dev_count; i++) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if (!m->devs[i]) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0newid =3D i;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (newid < 0 && m->dev_count < MAX_IFACES)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0newid =3D m->dev_count++;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (newid >=3D 0) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0dev_hold(dev);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0m->devs[newid] =3D dev;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0pr_info("%s - interface %s registered\n", type_name=
s[m->type], dev->name);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0return NOTIFY_DONE;
++}
++
++/* find/create manager for base family */
++static struct net_mgr *net_mgr_get(enum net_trig_type type)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_mgr *m, *existing =3D NULL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (type >=3D NET_TRIG_TYPE_MAX)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NULL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* fast-path: if already exists, bump ref and ret=
urn */
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&managers_lock);
++=C2=A0=C2=A0=C2=A0=C2=A0m =3D managers[type];
++=C2=A0=C2=A0=C2=A0=C2=A0if (m) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0atomic_inc(&m->refcnt);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&managers_lo=
ck);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return m;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&managers_lock);
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* allocate and init (not yet published) */
++=C2=A0=C2=A0=C2=A0=C2=A0m =3D kzalloc(sizeof(*m), GFP_KERNEL);
++=C2=A0=C2=A0=C2=A0=C2=A0if (!m)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NULL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0m->type =3D type;
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_init(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0INIT_LIST_HEAD(&m->leds);
++=C2=A0=C2=A0=C2=A0=C2=A0atomic_set(&m->refcnt, 1);
++=C2=A0=C2=A0=C2=A0=C2=A0INIT_DELAYED_WORK(&m->work, net_mgr_work);
++
++=C2=A0=C2=A0=C2=A0=C2=A0m->notifier.notifier_call =3D net_mgr_notify;
++=C2=A0=C2=A0=C2=A0=C2=A0m->notifier.priority =3D 0;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* try to register notifier; on failure clean up =
and return */
++=C2=A0=C2=A0=C2=A0=C2=A0if (register_netdevice_notifier(&m->notifier)) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(m);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* publish manager, but handle rare race where an=
other thread created it */
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&managers_lock);
++=C2=A0=C2=A0=C2=A0=C2=A0existing =3D managers[type];
++=C2=A0=C2=A0=C2=A0=C2=A0if (existing) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* use existing one: incr=
ease refcount, drop our resources */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0atomic_inc(&existing->ref=
cnt);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&managers_lo=
ck);
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unregister_netdevice_noti=
fier(&m->notifier);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(m);
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return existing;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* no existing manager -> publish ours */
++=C2=A0=C2=A0=C2=A0=C2=A0managers[type] =3D m;
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&managers_lock);
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* start background work */
++=C2=A0=C2=A0=C2=A0=C2=A0schedule_delayed_work(&m->work, 0);
++
++=C2=A0=C2=A0=C2=A0=C2=A0return m;
++}
++
++static void net_mgr_put(struct net_mgr *m)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0int i;
++=C2=A0=C2=A0=C2=A0=C2=A0if (!m)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (atomic_dec_and_test(&m->refcnt)) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&managers_lock=
);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (managers[m->type] =3D=
=3D m)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m=
anagers[m->type] =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&managers_lo=
ck);
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cancel_delayed_work_sync(=
&m->work);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unregister_netdevice_noti=
fier(&m->notifier);
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < m->dev_=
count; i++)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (m->devs[i])
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0dev_put(m->devs[i]);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&m->lock);
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(m);
++=C2=A0=C2=A0=C2=A0=C2=A0}
++}
++
++static DEVICE_ATTR(link, S_IRUGO | S_IWUSR, net_flag_show, net_flag_store=
);
++static DEVICE_ATTR(tx, S_IRUGO | S_IWUSR, net_flag_show, net_flag_store);
++static DEVICE_ATTR(rx, S_IRUGO | S_IWUSR, net_flag_show, net_flag_store);
++static DEVICE_ATTR(dev, S_IRUGO | S_IWUSR, net_dev_show, net_dev_store);
++
++/* sysfs attributes: link, tx, rx (per-LED) */
++
++static ssize_t net_flag_show(struct device *dev, struct device_attribute =
*attr, char *buf)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0struct led_classdev *led_cdev =3D dev_get_drvdata=
(dev);
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_led *entry;
++=C2=A0=C2=A0=C2=A0=C2=A0int val;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (!led_cdev || !led_cdev->trigger_data)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENODEV;
++
++=C2=A0=C2=A0=C2=A0=C2=A0entry =3D led_cdev->trigger_data;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (attr =3D=3D &dev_attr_link)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0val =3D entry->link;
++=C2=A0=C2=A0=C2=A0=C2=A0else if (attr =3D=3D &dev_attr_tx)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0val =3D entry->tx;
++=C2=A0=C2=A0=C2=A0=C2=A0else if (attr =3D=3D &dev_attr_rx)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0val =3D entry->rx;
++=C2=A0=C2=A0=C2=A0=C2=A0else
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0return sprintf(buf, "%d\n", val);
++}
++
++static ssize_t net_flag_store(struct device *dev, struct device_attribute=
 *attr,
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *buf, size_t count)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0struct led_classdev *led_cdev =3D dev_get_drvdata=
(dev);
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_led *entry;
++=C2=A0=C2=A0=C2=A0=C2=A0bool val;
++=C2=A0=C2=A0=C2=A0=C2=A0int ret;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (!led_cdev || !led_cdev->trigger_data)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENODEV;
++
++=C2=A0=C2=A0=C2=A0=C2=A0entry =3D led_cdev->trigger_data;
++
++=C2=A0=C2=A0=C2=A0=C2=A0ret =3D kstrtobool(buf, &val);
++=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (attr =3D=3D &dev_attr_link)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0entry->link =3D val;
++=C2=A0=C2=A0=C2=A0=C2=A0else if (attr =3D=3D &dev_attr_tx)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0entry->tx =3D val;
++=C2=A0=C2=A0=C2=A0=C2=A0else if (attr =3D=3D &dev_attr_rx)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0entry->rx =3D val;
++=C2=A0=C2=A0=C2=A0=C2=A0else
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* request immediate update */
++=C2=A0=C2=A0=C2=A0=C2=A0if (entry->mgr)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0schedule_delayed_work(&en=
try->mgr->work, 0);
++
++=C2=A0=C2=A0=C2=A0=C2=A0pr_info("LED %s - network trigger flags changed t=
o %s%s%s\n",
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_name(led_cdev->dev),
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0entry->link ? "link " : "=
",
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0entry->tx ? "tx " : "",
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0entry->rx ? "rx" : "");
++
++=C2=A0=C2=A0=C2=A0=C2=A0return count;
++}
++
++static ssize_t net_dev_show(struct device *dev, struct device_attribute *=
attr, char *buf)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0struct led_classdev *led_cdev =3D dev_get_drvdata=
(dev);
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_led *entry;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (!led_cdev || !led_cdev->trigger_data)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENODEV;
++
++=C2=A0=C2=A0=C2=A0=C2=A0entry =3D led_cdev->trigger_data;
++=C2=A0=C2=A0=C2=A0=C2=A0if (!entry->mgr)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENODEV;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (entry->mgr->type < 0 || entry->mgr->type >=3D=
 NET_TRIG_TYPE_MAX)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0return sprintf(buf, "%s\n", type_names[entry->mgr=
->type]);
++}
++
++static ssize_t net_dev_store(struct device *dev, struct device_attribute =
*attr,
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf, size_t count)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0char tmp[32];
++=C2=A0=C2=A0=C2=A0=C2=A0size_t len =3D min(sizeof(tmp) - 1, count);
++=C2=A0=C2=A0=C2=A0=C2=A0struct led_classdev *led_cdev =3D dev_get_drvdata=
(dev);
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_led *entry;
++=C2=A0=C2=A0=C2=A0=C2=A0int parsed;
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_mgr *old_mgr, *new_mgr;
++=C2=A0=C2=A0=C2=A0=C2=A0size_t i;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* basic checks */
++=C2=A0=C2=A0=C2=A0=C2=A0if (!led_cdev || !led_cdev->trigger_data)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENODEV;
++=C2=A0=C2=A0=C2=A0=C2=A0entry =3D led_cdev->trigger_data;
++=C2=A0=C2=A0=C2=A0=C2=A0if (!entry->mgr)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENODEV;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (len =3D=3D 0 || len >=3D sizeof(tmp))
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* copy raw input (no trimming). allow optional t=
erminal '\n' / '\r\n' only */
++=C2=A0=C2=A0=C2=A0=C2=A0memcpy(tmp, buf, len);
++=C2=A0=C2=A0=C2=A0=C2=A0tmp[len] =3D '\0';
++=C2=A0=C2=A0=C2=A0=C2=A0/* Accept and strip one trailing LF and optional =
preceding CR, but reject spaces/tabs anywhere */
++=C2=A0=C2=A0=C2=A0=C2=A0if (len > 0 && tmp[len - 1] =3D=3D '\n') {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tmp[--len] =3D '\0';
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (len > 0 && tmp[len - =
1] =3D=3D '\r') {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t=
mp[--len] =3D '\0';
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0/* reject any spaces/tabs inside the token (no tr=
imming) */
++=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < len; i++) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (tmp[i] =3D=3D ' ' || =
tmp[i] =3D=3D '\t')
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn -EINVAL;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0parsed =3D parse_dev_string(tmp);
++=C2=A0=C2=A0=C2=A0=C2=A0if (parsed < 0)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0old_mgr =3D entry->mgr;
++=C2=A0=C2=A0=C2=A0=C2=A0if (old_mgr->type =3D=3D parsed)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return count; /* no chang=
e */
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* get or create new manager (increments refcnt) =
*/
++=C2=A0=C2=A0=C2=A0=C2=A0new_mgr =3D net_mgr_get(parsed);
++=C2=A0=C2=A0=C2=A0=C2=A0if (!new_mgr)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENOMEM;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* Move entry between manager lists.
++=C2=A0=C2=A0=C2=A0=C2=A0 * To avoid races, take managers_lock and both ma=
nager locks while
++=C2=A0=C2=A0=C2=A0=C2=A0 * manipulating lists and updating history.
++=C2=A0=C2=A0=C2=A0=C2=A0 */
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&managers_lock);
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&old_mgr->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0if (new_mgr !=3D old_mgr)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&new_mgr->lock=
);
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* remove from old manager list and add to new on=
e */
++=C2=A0=C2=A0=C2=A0=C2=A0list_del(&entry->node);
++=C2=A0=C2=A0=C2=A0=C2=A0list_add_tail(&entry->node, &new_mgr->leds);
++=C2=A0=C2=A0=C2=A0=C2=A0entry->mgr =3D new_mgr;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* initialize history so future reads won't see a=
 spurious delta */
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_tx_packets =3D new_mgr->agg_tx_packet=
s;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_rx_packets =3D new_mgr->agg_rx_packet=
s;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_tx_bytes=C2=A0=C2=A0 =3D new_mgr->agg=
_tx_bytes;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_rx_bytes=C2=A0=C2=A0 =3D new_mgr->agg=
_rx_bytes;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (new_mgr !=3D old_mgr)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&new_mgr->lo=
ck);
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&old_mgr->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&managers_lock);
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* drop old manager reference */
++=C2=A0=C2=A0=C2=A0=C2=A0net_mgr_put(old_mgr);
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* request immediate update */
++=C2=A0=C2=A0=C2=A0=C2=A0if (entry->mgr)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0schedule_delayed_work(&en=
try->mgr->work, 0);
++
++=C2=A0=C2=A0=C2=A0=C2=A0pr_info("LED %s - network trigger family changed =
to %s\n",
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_name(led_cdev->dev), =
type_names[parsed]);
++
++=C2=A0=C2=A0=C2=A0=C2=A0return count;
++}
++
++/* deactivate: detach led from manager */
++static void net_deactivate(struct led_classdev *led_cdev)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_led *entry =3D led_cdev->trigger_data;
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_mgr *m;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (!entry)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
++
++=C2=A0=C2=A0=C2=A0=C2=A0m =3D entry->mgr;
++=C2=A0=C2=A0=C2=A0=C2=A0if (!m) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* defensive: shouldn't h=
appen, but avoid crash */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0led_cdev->trigger_data =
=3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(entry);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0list_del(&entry->node);
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&m->lock);
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* remove sysfs files */
++=C2=A0=C2=A0=C2=A0=C2=A0device_remove_file(led_cdev->dev, &dev_attr_link)=
;
++=C2=A0=C2=A0=C2=A0=C2=A0device_remove_file(led_cdev->dev, &dev_attr_tx);
++=C2=A0=C2=A0=C2=A0=C2=A0device_remove_file(led_cdev->dev, &dev_attr_rx);
++=C2=A0=C2=A0=C2=A0=C2=A0device_remove_file(led_cdev->dev, &dev_attr_dev);
++
++=C2=A0=C2=A0=C2=A0=C2=A0led_set_off_full(led_cdev, false);
++=C2=A0=C2=A0=C2=A0=C2=A0led_cdev->trigger_data =3D NULL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0pr_info("LED %s - trigger %s%s detached\n",
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_name(led_cdev->dev),
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0type_names[m->type],
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0labels[(entry->link << 2)=
 | (entry->tx << 1) | (entry->rx << 0)]);
++
++=C2=A0=C2=A0=C2=A0=C2=A0kfree(entry);
++=C2=A0=C2=A0=C2=A0=C2=A0net_mgr_put(m);
++}
++
++/* activate/deactivate: attach led to manager and remember flags */
++static int net_activate(struct led_classdev *led_cdev)
++{
++=C2=A0=C2=A0=C2=A0=C2=A0const char *fn =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0const char *dt_dev =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0const char *dt_mode =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0int parsed =3D -1;
++=C2=A0=C2=A0=C2=A0=C2=A0bool link =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0bool tx =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0bool rx =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0bool online =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_mgr *m;
++=C2=A0=C2=A0=C2=A0=C2=A0struct net_led *entry;
++=C2=A0=C2=A0=C2=A0=C2=A0const char *name;
++=C2=A0=C2=A0=C2=A0=C2=A0const char *sep;
++=C2=A0=C2=A0=C2=A0=C2=A0int ret;
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (!led_cdev) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_err("network: net_acti=
vate called with NULL led_cdev\n");
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0if (!led_cdev->dev) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_err("network: LED devi=
ce is NULL, aborting activate\n");
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0name =3D dev_name(led_cdev->dev);
++=C2=A0=C2=A0=C2=A0=C2=A0if (!name || !*name) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_err("network: LED has =
no name, aborting activate\n");
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0if (led_cdev->trigger_data) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_warn("network: LED %s =
already has trigger_data set, refusing attach\n",
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0n=
ame);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EBUSY;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (led_cdev->dev && led_cdev->dev->of_node) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0of_property_read_string(l=
ed_cdev->dev->of_node, "dev", &dt_dev);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0of_property_read_string(l=
ed_cdev->dev->of_node, "mode", &dt_mode);
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* function part from name (after last ':') */
++=C2=A0=C2=A0=C2=A0=C2=A0sep =3D strrchr(name, ':');
++=C2=A0=C2=A0=C2=A0=C2=A0if (sep && sep[1] !=3D '\0')
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fn =3D sep + 1;
++=C2=A0=C2=A0=C2=A0=C2=A0else
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fn =3D name;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* get family and online flag from name (family m=
ay be absent) */
++=C2=A0=C2=A0=C2=A0=C2=A0parsed =3D parse_function_string(fn, &online);
++
++=C2=A0=C2=A0=C2=A0=C2=A0if (dt_mode) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* DT "mode" present: fla=
gs come from mode and take precedence */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D parse_flags_from_=
string(dt_mode, &link, &tx, &rx);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn -EINVAL;
++
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* family: from dt_dev if=
 present, otherwise from name */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dt_dev) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0p=
arsed =3D parse_dev_string(dt_dev);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (parsed < 0) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0pr_info("network: invalid dev '%s' for LED %s\n", d=
t_dev, name);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/=
* parsed already set from name above; require a valid family */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
f (parsed < 0) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0pr_info("network: no family in name and no dev for =
LED %s\n", name);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0} else if (dt_dev) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Only dt_dev present: u=
se its family. Flags depend on name "-online" */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0parsed =3D parse_dev_stri=
ng(dt_dev);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (parsed < 0) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0p=
r_info("network: invalid dev '%s' for LED %s\n", dt_dev, name);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn -EINVAL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (online) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/=
* name indicated online variant and no mode -> online-only */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l=
ink =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t=
x =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
x =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l=
ink =3D tx =3D rx =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0} else {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* No DT: family and flag=
s from name.
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If name had "-online" =
-> online-only.
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (parsed < 0) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0p=
r_info("network: unknown function '%s' for LED %s\n", fn ?: "<NULL>", name)=
;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn -EINVAL;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (online) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/=
* online variant in name =3D> online-only */
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l=
ink =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t=
x =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
x =3D false;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l=
ink =3D tx =3D rx =3D true;
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0m =3D net_mgr_get(parsed);
++=C2=A0=C2=A0=C2=A0=C2=A0if (!m)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENOMEM;
++
++=C2=A0=C2=A0=C2=A0=C2=A0entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
++=C2=A0=C2=A0=C2=A0=C2=A0if (!entry) {
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0net_mgr_put(m);
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENOMEM;
++=C2=A0=C2=A0=C2=A0=C2=A0}
++
++=C2=A0=C2=A0=C2=A0=C2=A0entry->led_cdev =3D led_cdev;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->mgr =3D m;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_tx_packets =3D entry->last_rx_packets=
 =3D 0;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_tx_bytes =3D entry->last_rx_bytes =3D=
 0;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->link =3D link;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->tx =3D tx;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->rx =3D rx;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* attach under manager lock and initialize histo=
ry to current aggregates */
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0list_add_tail(&entry->node, &m->leds);
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* initialize history so future reads won't see a=
 spurious delta */
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_tx_packets =3D m->agg_tx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_rx_packets =3D m->agg_rx_packets;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_tx_bytes=C2=A0=C2=A0 =3D m->agg_tx_by=
tes;
++=C2=A0=C2=A0=C2=A0=C2=A0entry->last_rx_bytes=C2=A0=C2=A0 =3D m->agg_rx_by=
tes;
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&m->lock);
++
++=C2=A0=C2=A0=C2=A0=C2=A0led_cdev->trigger_data =3D entry;
++
++=C2=A0=C2=A0=C2=A0=C2=A0/* create per-LED sysfs files; on failure clean u=
p */
++=C2=A0=C2=A0=C2=A0=C2=A0ret =3D device_create_file(led_cdev->dev, &dev_at=
tr_link);
++=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_create;
++=C2=A0=C2=A0=C2=A0=C2=A0ret =3D device_create_file(led_cdev->dev, &dev_at=
tr_tx);
++=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_create_tx;
++=C2=A0=C2=A0=C2=A0=C2=A0ret =3D device_create_file(led_cdev->dev, &dev_at=
tr_rx);
++=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_create_rx;
++=C2=A0=C2=A0=C2=A0=C2=A0ret =3D device_create_file(led_cdev->dev, &dev_at=
tr_dev);
++=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_create_dev;
++
++=C2=A0=C2=A0=C2=A0=C2=A0pr_info("LED %s - trigger %s%s attached\n",
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0name,
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0type_names[m->type],
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0labels[(entry->link << 2)=
 | (entry->tx << 1) | (entry->rx << 0)]);
++=C2=A0=C2=A0=C2=A0=C2=A0return 0;
++
++err_create_dev:
++=C2=A0=C2=A0=C2=A0=C2=A0device_remove_file(led_cdev->dev, &dev_attr_rx);
++err_create_rx:
++=C2=A0=C2=A0=C2=A0=C2=A0device_remove_file(led_cdev->dev, &dev_attr_tx);
++err_create_tx:
++=C2=A0=C2=A0=C2=A0=C2=A0device_remove_file(led_cdev->dev, &dev_attr_link)=
;
++err_create:
++=C2=A0=C2=A0=C2=A0=C2=A0/* detach and free */
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0list_del(&entry->node);
++=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&m->lock);
++=C2=A0=C2=A0=C2=A0=C2=A0led_cdev->trigger_data =3D NULL;
++=C2=A0=C2=A0=C2=A0=C2=A0kfree(entry);
++=C2=A0=C2=A0=C2=A0=C2=A0net_mgr_put(m);
++=C2=A0=C2=A0=C2=A0=C2=A0return ret;
++}
++
++static struct led_trigger network_trigger =3D {
++=C2=A0=C2=A0=C2=A0=C2=A0.name =3D "network",
++=C2=A0=C2=A0=C2=A0=C2=A0.activate =3D net_activate,
++=C2=A0=C2=A0=C2=A0=C2=A0.deactivate =3D net_deactivate,
++};
++
++module_led_trigger(network_trigger);
++
++MODULE_AUTHOR("Mieczyslaw Nalewaj <namiltd@yahoo.com>");
++MODULE_DESCRIPTION("LED trigger for network interfaces =E2=80=94 aggregat=
ed by family; supports link/tx/rx and -online");
++MODULE_LICENSE("GPL v2");
+--- a/drivers/leds/trigger/Makefile
++++ b/drivers/leds/trigger/Makefile
+@@ -16,3 +16,4 @@ obj-$(CONFIG_LEDS_TRIGGER_NETDEV)=C2=A0=C2=A0=C2=A0=C2=
=A0+=3D led
+ obj-$(CONFIG_LEDS_TRIGGER_PATTERN)=C2=A0=C2=A0=C2=A0=C2=A0+=3D ledtrig-pa=
ttern.o
+ obj-$(CONFIG_LEDS_TRIGGER_AUDIO)=C2=A0=C2=A0=C2=A0=C2=A0+=3D ledtrig-audi=
o.o
+ obj-$(CONFIG_LEDS_TRIGGER_TTY)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0+=3D ledtrig-tty.o
++obj-$(CONFIG_LEDS_TRIGGER_NETWORK)=C2=A0=C2=A0=C2=A0=C2=A0+=3D ledtrig-ne=
twork.o

