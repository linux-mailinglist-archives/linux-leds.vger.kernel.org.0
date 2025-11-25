Return-Path: <linux-leds+bounces-6313-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F545C87705
	for <lists+linux-leds@lfdr.de>; Wed, 26 Nov 2025 00:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 59C64353A66
	for <lists+linux-leds@lfdr.de>; Tue, 25 Nov 2025 23:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722EC25CC63;
	Tue, 25 Nov 2025 23:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="EWh536Vf"
X-Original-To: linux-leds@vger.kernel.org
Received: from sonic305-22.consmr.mail.ne1.yahoo.com (sonic305-22.consmr.mail.ne1.yahoo.com [66.163.185.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680C1296BA2
	for <linux-leds@vger.kernel.org>; Tue, 25 Nov 2025 23:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.185.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764112482; cv=none; b=FJDOi7nNB6KM5MpBthnlLy2542kW4FBP2/hqM4eIcGjFgZxiO0LQClCn4iz8BBvH1KFzTN5hnALKl6v30j7XYhfkl1r390GLpYnGYOHTIIw6JxQxfD7nsrE0mGM2rWGFPJsKNJDqPV99kkA4toz0RAtzkuuMQsnFdkCzXqlth8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764112482; c=relaxed/simple;
	bh=MJTRLyA04tT6SoMrIKoMJE5c42QDSteB4ikIu4/sVJo=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type:
	 References; b=TZaLjIpd9O1oWe0Q9DfiqwK20iun+hralY4Np+YZvVc20MrC7MLhMUGtoPkQ8uKL4UXY/MwsXofmIDBUDivh1SAkzYL3h8/1jQQvYxriHzceBlAPMB0fE80iJV6W9H/MbIJ8nOZ+5Uhj3ls7BiHeIab3FqZ+2q5BvRsl7FL9cqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=EWh536Vf; arc=none smtp.client-ip=66.163.185.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1764112478; bh=MJTRLyA04tT6SoMrIKoMJE5c42QDSteB4ikIu4/sVJo=; h=Date:From:To:Cc:Subject:References:From:Subject:Reply-To; b=EWh536VfhoFgLEMu/TolffSujqw7XIZ30yIal8gOmeP6UEiu6gziEo+iYL0Bz0CMGx21lQyTN3N0s04i69FJ4QohpsEvF7I5gMCtnXOly0JTR9VnJqmyeSxQn+Vcv0JcnJFZRXILhZc+F1vcwnnWXqsIHHArgPB+qvYQVsxUDazm2zMydZTObbTKvUE9KAlFo7+7Haqn8VjCZuTLY3r3Pmki7jf3q7+1cU58JHbJ7KPbqrflaJD/vHCza22R3scbe5lTA1xjCjPXZgEFaNAJE50Ut0R7SwD1Fcq1+3NkSz3B4yvzteXfmvMXuZwUU2nM2qIisR9q/XQn2X+joG/WYA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1764112478; bh=XE844DKARSRoC1TZWK2xKt4HLPTWEF1qgheMEQcFK75=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=jT8nC+/+61/Jmj5DCkS3QmnXjOCSBuo4LF+KKSsbZHOcqJpBOoIfM4cOHQZDxDeWhyZzOGvbbeJcyzVTdwRVtoBXeqI6Oef66yGSTdkI4rUXSpWrp73OThrDW1y7JNwFL955Tp0PD5hQ8gJTItAyp8Ya/31fj7WY+VtBBmm7LtgxixFwRwQH89pPRjBqB50DkrcHZ+CMh5ur5YqcHtrYIJOy2k+fJvd5TcgzTbJ/ZT1hew+726ekQJEws5ysur0xW60qZwHH8Gt5TEhLkNYnaUZJtsOMooP8lKrgE1nj9x9ZSvtIB56ulmb9+K4YmwzVGi91BpY44I3YleMsZaZ7sw==
X-YMail-OSG: dp_xnzIVM1nMyjCzihKO9L8CIc94zdzeMkkd4FC6SPs3s6gzq6OTP1i8rRKe1fK
 IqT89sknpSvb79pTSaoFoUMaDVK.uLwRuUGJTm2bIMHjyY0c3ON5KRAAOAmMEJidO5SWHPlEJYDw
 8UJ0DwDWMOZzSDlOgneNnTYho2YUQRKCuM5OJsN2Hmgzvr9uSUVnruBWV24sxyqkf8SSrjfKUsO3
 a7yT1HJ6VWLlmO5oYKk5iOcPuDWVX88YtmGhFfjH77mhOubitAosSXYCAV9sW8m75EFrOa3Sp0n.
 1VAcVFIx8k0VWHWcJBPYzgd1ZxfrFa5zuNFr0J7iGfaBBlm50i3BHgwvxo2gdQRpBbuem20Fax9g
 JaxjmyLJUt3YzO4W1TItNckJ9XVTQzihA1UWXR79.UzBbRekCG9QmbPQwlWK.D8EWppsWEzM9PHR
 kErM5LChQLwLOK1HCxfxQCbj0BN5p0xB9W7ootJlaOKUGNfFYF8zwGMt8qf90v3BW.Y5k8FPzL4r
 95TaIgWWpekJfGvCysQiaCyRA_p60ODJYLhF_KY0U5olS1UtsSr0GM5.vqRFvpiWE7dw0rwMSPuL
 rxum8wDgDQUDRYZkev6S_wd5f0pLeowBSyI34B8wpPfq.LeUbs6QGNNMLykZ4jJvcFfw.Ic50HrZ
 VoK9o2Uz8sOj1CLj7eVEetLOVpxFTgHDzizBbnsSu3M1Jpahx6w5VWC7o9xI7jesp09ew4W8cxJ3
 4gBM66DkaXAFZYv7Ge8NnTIOLmUYrcKW3UNFpepIeSYL9Se.v9CJIivMLprnMA1ui40KrbxU49M2
 vr_t_i43vbC2BfdQ2LwpIx4mTBf37JuS5bf8Zzy29qhjz0qDDJc0heZBQO6kONVEe1e6gr_DP0xL
 jq0VHl0WCCBij_listbQoEfJsmDZcadeiQK5.VGRoVRjxrOqMQkSXenJzNuvJlWmkD3MbsLb_Zfd
 vOKdX65hjazcPfmuSC89OqwAtSkuzJOF0jqubKUzQ2QNOxwU4RrRvFpm760f6BNEFfZ_yVc0FxOh
 qMf4iA8pnJtUH6Q_Riidma.QE9vuEX6_cGkyaurQdS2kuaIXwOuup0wdFoYBEvhHJzpIidP3.o5L
 qINluCGsQZCgiKd3zQCXGI7RGI_fW6GOWCp8qMd1_EHKj9_Y4UvzqR15frkSO6imXuKBbz0ww8Rb
 G_GTW.kXaE5L0S0mM0NQmYuak8Ja8GRGXl3SLVCWeqtmAuqr6Nwi_MPAc0rmiS9NSZW7kdDJGx8y
 C2HpNvZcvcFn4Wi84D85RQkXSMKegbWHQHz9XiGWadARbbLOiwQfLHK2lCjofDkhCYUuWi6RQhZv
 KQtxmYWBD1p8xKxc9.2D9.pc.uDDzVi8qYAUz5SDfuwtP4NB3rINC8XIeUwCmFcjka.lFDPaVaEt
 fP76ndubOYPvWUJXv7Sj1UD6UEq3LvC_6JCNspScy6y1DxCvGd6QmK.mpn_q37y_A8I6c9v1teR1
 xBPhXzgpZCFjjiXWXz7vEYKIjR6_vQV3P.cF2wp0zGwvoK9TdCmTB7orPG9bxdVRbfRyzlZtNcxS
 mPfylJ9.dbBLqtp.DWQos8Q7xraczF_Be9NZ8dz7pGBg._BOcEt8K7VF7TqXvB8rk8MibNFh1kPE
 n48g9yjXkSOfO1gm5Rs1ATVeoUlMQD9yqMLinYoumZGNTq0OECv.MX7fcnHEoLJTj09t0DS98r4o
 GGVzyEndAqhbYdV1A3L9aKkb68oA8oLHw76Jg3rXodmav2ItDyxPJRXgHeqDUlmoozr9u9N7ZKQG
 S7xR9otJ.9ztvtv6_LFnqEBbZ2N6rFViNxv80V0CAYo0UgNlI_9ZVFN8mofOBeQSomorzO92vJyR
 yqG6zb9o58zMZ6Z2kC2oKOZqo_m0h2j5cFLyP1JveI_2cB1or4r61KRGJNdnZqo9c3s85.X_98NI
 ganbSkE.1eJOptr1zRqXZ00n0XuLMOBeAU758AIzHirGK5vAzViZ5DJxgL_.BncyEaUW3uQhIA2C
 TgpnDebnyqJ3ymBMRGzi7FVPkjxrzWN56V3UCoOiHp7aUkiHPxGEU9y5gUYMuIdF6Ezanth0Ev6o
 ctPPYyW9I9A4YYY9tGtA6N0MHw.ZU1KZp804GfOTGRahJ.9zOTmSSJZs7b1tDG.ILPLlWrprIp5q
 xLnDt.k_o52tHT4q5D4uooElp5JCEsDa1XBmkHbXVyuMQ2li.kIZYVWlxt0hzP9Z8nFYCvRP9H4G
 FDCF3HI7WXVoJrSE1Y15_0UW893I7mXgf6lW.WCsdyGzgeg--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 7d94d234-d0e0-4779-ad1e-94df0724c48d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ne1.yahoo.com with HTTP; Tue, 25 Nov 2025 23:14:38 +0000
Date: Tue, 25 Nov 2025 22:54:22 +0000 (UTC)
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, 
	"pavel@ucw.cz" <pavel@ucw.cz>, 
	"jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
Message-ID: <849726626.1275073.1764111262858@mail.yahoo.com>
Subject: [PATCH v4 2/2] leds: add "network" LED trigger (lan/wan/wlan)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <849726626.1275073.1764111262858.ref@mail.yahoo.com>
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

--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -129,6 +129,15 @@ config LEDS_TRIGGER_NETDEV
=C2=A0 =C2=A0 =C2=A0 =C2=A0This allows LEDs to be controlled by network dev=
ice activity.
=C2=A0 =C2=A0 =C2=A0 =C2=A0If unsure, say Y.
=C2=A0
+config LEDS_TRIGGER_NETWORK
+=C2=A0 =C2=A0 tristate "LED trigger for network interfaces"
+=C2=A0 =C2=A0 depends on NET
+=C2=A0 =C2=A0 help
+=C2=A0 =C2=A0 =C2=A0 Per-family network LED trigger: aggregates lan/wan/wl=
an stats;
+=C2=A0 =C2=A0 =C2=A0 family from DT 'dev' or name; flags from DT 'mode';
+=C2=A0 =C2=A0 =C2=A0 '-online' - online-only if mode absent.
+=C2=A0 =C2=A0 =C2=A0 If unsure, say Y.
+
=C2=A0config LEDS_TRIGGER_PATTERN
=C2=A0 =C2=A0 =C2=A0tristate "LED Pattern Trigger"
=C2=A0 =C2=A0 =C2=A0help
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-network.c
@@ -0,0 +1,1009 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * LED trigger for network interfaces.
+ *
+ * - Aggregated per-family (lan/wan/wlan).
+ * - Family and flags are taken from device tree properties:
+ *=C2=A0 =C2=A0 =C2=A0- "dev"=C2=A0 : simple family string "lan" | "wan" |=
 "wlan"
+ *=C2=A0 =C2=A0 =C2=A0- "mode" : any combination of "link", "tx", "rx" fla=
gs
+ *=C2=A0 =C2=A0Priority/combination:
+ *=C2=A0 =C2=A0 =C2=A0* If "mode" present: flags come from "mode" and take=
 precedence.
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0Family is taken from "dev" if present, otherw=
ise from the LED name.
+ *=C2=A0 =C2=A0 =C2=A0* If only "dev" present: use its family and default =
flags =3D link+tx+rx.
+ *=C2=A0 =C2=A0 =C2=A0* If neither present: fall back to LED device name p=
arsing.
+ *
+ * - Suffix "-online" is valid ONLY in the LED name (label), e.g. "green:w=
lan-online".
+ *=C2=A0 =C2=A0It indicates the online variant but is applied only when DT=
 "mode" is absent.
+ *
+ * Behaviour:
+ * - wlan (normal): blink/solid driven by throughput table
+ * - lan/wan (normal): one-shot blink on TX/RX packet change
+ * - *-online variants: steady ON while any interface of the family has ca=
rrier
+ *
+ * Interfaces are auto-tracked by name match (lan0, wan1, wlan2, phy0, wl1=
, ath0, ra0=E2=80=A6).
+ * Up to MAX_IFACES (16) interfaces per family.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/jiffies.h>
+#include <linux/leds.h>
+#include <linux/mutex.h>
+#include <linux/netdevice.h>
+#include <linux/workqueue.h>
+#include <linux/of.h>
+#include <linux/list.h>
+#include <linux/atomic.h>
+#include <linux/compiler.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/device.h>
+#include <linux/ctype.h>
+#include <linux/err.h>
+#include "../leds.h"
+
+#define MAX_IFACES 16
+#define DEFAULT_INTERVAL_MS 50
+
+enum net_trig_type {
+=C2=A0 =C2=A0 NET_TRIG_LAN =3D 0,
+=C2=A0 =C2=A0 NET_TRIG_WAN,
+=C2=A0 =C2=A0 NET_TRIG_WLAN,
+=C2=A0 =C2=A0 NET_TRIG_TYPE_MAX,
+};
+
+static const char * const type_names[] =3D {
+=C2=A0 =C2=A0 [NET_TRIG_LAN] =3D "lan",
+=C2=A0 =C2=A0 [NET_TRIG_WAN] =3D "wan",
+=C2=A0 =C2=A0 [NET_TRIG_WLAN] =3D "wlan",
+};
+
+/* labels indexed by bitmask: (link<<2)|(tx<<1)|(rx<<0) */
+static const char *const labels[] =3D {
+=C2=A0 =C2=A0 "",=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 0 */
+=C2=A0 =C2=A0 "(tx)",=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 1 */
+=C2=A0 =C2=A0 "(rx)",=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2 */
+=C2=A0 =C2=A0 "(tx rx)",=C2=A0 =C2=A0 =C2=A0 /* 3 */
+=C2=A0 =C2=A0 "(link)",=C2=A0 =C2=A0 =C2=A0 =C2=A0/* 4 */
+=C2=A0 =C2=A0 "(link rx)",=C2=A0 =C2=A0 /* 5 */
+=C2=A0 =C2=A0 "(link tx)",=C2=A0 =C2=A0 /* 6 */
+=C2=A0 =C2=A0 "(link tx rx)", /* 7 */
+};
+
+/* wlan throughput table */
+static const struct {
+=C2=A0 =C2=A0 u32 throughput;
+=C2=A0 =C2=A0 unsigned long on_ms;
+=C2=A0 =C2=A0 unsigned long off_ms;
+} wlan_tpt_table[] =3D {
+=C2=A0 =C2=A0 {=C2=A0 =C2=A064, 200, 800 },
+=C2=A0 =C2=A0 {=C2=A0 512, 200, 300 },
+=C2=A0 =C2=A0 { 2048, 200, 150 },
+=C2=A0 =C2=A0 {10000, 200,=C2=A0 50 },
+=C2=A0 =C2=A0 {54000, 100,=C2=A0 50 },
+};
+
+struct net_mgr {
+=C2=A0 =C2=A0 enum net_trig_type type; /* family: lan/wan/wlan */
+
+=C2=A0 =C2=A0 struct mutex lock;
+=C2=A0 =C2=A0 struct notifier_block notifier;
+=C2=A0 =C2=A0 struct delayed_work work;
+
+=C2=A0 =C2=A0 struct net_device *devs[MAX_IFACES];
+=C2=A0 =C2=A0 int dev_slot_limit;
+
+=C2=A0 =C2=A0 u64 agg_rx_packets;
+=C2=A0 =C2=A0 u64 agg_tx_packets;
+=C2=A0 =C2=A0 u64 agg_rx_bytes;
+=C2=A0 =C2=A0 u64 agg_tx_bytes;
+
+=C2=A0 =C2=A0 struct list_head leds;
+=C2=A0 =C2=A0 atomic_t refcnt;
+};
+
+struct net_led {
+=C2=A0 =C2=A0 struct list_head node;
+=C2=A0 =C2=A0 struct led_classdev *led_cdev;
+=C2=A0 =C2=A0 struct net_mgr *mgr;
+
+=C2=A0 =C2=A0 u64 last_rx_packets;
+=C2=A0 =C2=A0 u64 last_tx_packets;
+=C2=A0 =C2=A0 u64 last_rx_bytes;
+=C2=A0 =C2=A0 u64 last_tx_bytes;
+
+=C2=A0 =C2=A0 bool link;
+=C2=A0 =C2=A0 bool rx;
+=C2=A0 =C2=A0 bool tx;
+};
+
+static DEFINE_MUTEX(managers_lock);
+static struct net_mgr *managers[NET_TRIG_TYPE_MAX];
+
+static ssize_t net_flag_show(struct device *dev, struct device_attribute *=
attr, char *buf);
+static ssize_t net_flag_store(struct device *dev, struct device_attribute =
*attr,
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char =
*buf, size_t count);
+static ssize_t net_dev_show(struct device *dev, struct device_attribute *a=
ttr, char *buf);
+static ssize_t net_dev_store(struct device *dev, struct device_attribute *=
attr,
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *=
buf, size_t count);
+
+/* helpers */
+static inline void led_set_off_full(struct led_classdev *led, bool on)
+{
+=C2=A0 =C2=A0 led_stop_software_blink(led);
+=C2=A0 =C2=A0 led_set_brightness(led, on ? LED_FULL : LED_OFF);
+}
+
+static inline void led_set_oneshot_ms(struct led_classdev *led, unsigned l=
ong ms, bool invert)
+{
+=C2=A0 =C2=A0 led_stop_software_blink(led);
+=C2=A0 =C2=A0 led_blink_set_oneshot(led, &ms, &ms, invert);
+}
+
+/* helper: check that next char after prefix is digit, '-' or NUL */
+static inline bool next_char_ok(const char *s, size_t pos)
+{
+=C2=A0 =C2=A0 char c =3D s[pos];
+=C2=A0 =C2=A0 return c =3D=3D '\0' || c =3D=3D '-' || (c >=3D '0' && c <=
=3D '9');
+}
+
+/* name matching: lan/wan; wlan matched by various wifi prefixes with rest=
riction
+ * additionally accept ath (Atheros) and ra/rai (Ralink/MediaTek) prefixes=
.
+ * For lan and wan require next char to be digit/'-' or end to avoid accid=
ental matches.
+ */
+static bool name_matches_type(const char *name, enum net_trig_type type)
+{
+=C2=A0 =C2=A0 if (!name)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;
+=C2=A0 =C2=A0 switch (type) {
+
+=C2=A0 =C2=A0 case NET_TRIG_LAN:
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* accept "lan", "lanX", "lan-X" */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(name, "lan", 3))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return next_char_ok(name, 3);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;
+=C2=A0 =C2=A0 case NET_TRIG_WAN:
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* accept "wan", "wanX", "wan-X" */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(name, "wan", 3))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return next_char_ok(name, 3);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;
+=C2=A0 =C2=A0 case NET_TRIG_WLAN:
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* accept "phyX", "wlX"/"wl-..." or "wlan" and=
 common driver prefixes */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(name, "phy", 3))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return next_char_ok(name, 3);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(name, "wlan", 4))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return next_char_ok(name, 4);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(name, "wl", 2))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return next_char_ok(name, 2);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Atheros (athX) */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(name, "ath", 3))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return next_char_ok(name, 3);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Ralink/MediaTek: check "rai" (e.g. rai0) fi=
rst, then "ra" (ra0) */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(name, "rai", 3))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return next_char_ok(name, 3);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(name, "ra", 2))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return next_char_ok(name, 2);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;
+=C2=A0 =C2=A0 default:
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;
+=C2=A0 =C2=A0 }
+}
+
+/* Extract family type (lan/wan/wlan) from a string.
+ * If "online" is supplied, also detects and strips the "-online" suffix.
+ * Returns enum net_trig_type or -1 on error.
+ */
+static int parse_family_token(const char *fn, bool *online)
+{
+=C2=A0 =C2=A0 size_t len;
+
+=C2=A0 =C2=A0 if (!fn)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
+
+=C2=A0 =C2=A0 len =3D strlen(fn);
+
+=C2=A0 =C2=A0 if (online) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len > 7 && !strcmp(fn + len - 7, "-online"=
)) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *online =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D 7;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *online =3D false;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 if (len =3D=3D 3 && !strncmp(fn, "lan", 3))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NET_TRIG_LAN;
+=C2=A0 =C2=A0 if (len =3D=3D 3 && !strncmp(fn, "wan", 3))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NET_TRIG_WAN;
+=C2=A0 =C2=A0 if (len =3D=3D 4 && !strncmp(fn, "wlan", 4))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NET_TRIG_WLAN;
+
+=C2=A0 =C2=A0 return -1;
+}
+
+/* Parse only flags from a string: recognized tokens are "link", "tx", "rx=
".
+ * Any other token =3D> -EINVAL. If no flags found, set all three true.
+ * Suitable for DT "mode" (strict) or parsing flags from name when no mode=
 present.
+ */
+static int parse_flags_from_string(const char *fn, bool *link, bool *tx, b=
ool *rx)
+{
+=C2=A0 =C2=A0 size_t len;
+=C2=A0 =C2=A0 const char *buf =3D NULL;
+=C2=A0 =C2=A0 size_t buflen =3D 0;
+=C2=A0 =C2=A0 size_t i;
+=C2=A0 =C2=A0 bool found =3D false;
+
+=C2=A0 =C2=A0 if (!fn || !link || !tx || !rx)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
+
+=C2=A0 =C2=A0 *link =3D false;
+=C2=A0 =C2=A0 *tx =3D false;
+=C2=A0 =C2=A0 *rx =3D false;
+
+=C2=A0 =C2=A0 len =3D strlen(fn);
+=C2=A0 =C2=A0 for (i =3D 0; i < len; i++) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fn[i] =3D=3D ' ' || fn[i] =3D=3D '\t' || f=
n[i] =3D=3D ',') {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D NULL;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buflen =3D 0;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!buf) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D fn + i;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buflen =3D 0;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 buflen++;
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((i + 1 =3D=3D len) || fn[i + 1] =3D=3D ' '=
 || fn[i + 1] =3D=3D '\t' || fn[i + 1] =3D=3D ',') {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (buflen =3D=3D 4 && !memcmp(b=
uf, "link", 4)) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *link =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (buflen =3D=3D 2 && !m=
emcmp(buf, "tx", 2)) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *tx =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (buflen =3D=3D 2 && !m=
emcmp(buf, "rx", 2)) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *rx =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* unknown token *=
/
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D NULL;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buflen =3D 0;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 /* default: if no flags found, set all true */
+=C2=A0 =C2=A0 if (!found) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *link =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *tx =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *rx =3D true;
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 return 0;
+}
+
+/* safe stats read wrapper */
+static void get_dev_stats_safe(struct net_device *dev, struct rtnl_link_st=
ats64 *st)
+{
+=C2=A0 =C2=A0 memset(st, 0, sizeof(*st));
+=C2=A0 =C2=A0 dev_get_stats(dev, st);
+}
+
+/* Update single LED according to manager aggregates and per-LED flags.
+ * any_online indicates whether any tracked interface currently has carrie=
r.
+ * If LED is online-only (link && !tx && !rx) it is driven directly by any=
_online.
+ */
+static void update_led(struct net_led *e, struct net_mgr *m, bool any_onli=
ne)
+{
+=C2=A0 =C2=A0 long unsigned int on_ms, off_ms;
+=C2=A0 =C2=A0 struct led_classdev *led =3D e->led_cdev;
+
+=C2=A0 =C2=A0 /* defensive: avoid deref if led unexpectedly NULL */
+=C2=A0 =C2=A0 if (!led)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
+
+=C2=A0 =C2=A0 /* If LED requested online-only, reflect any_online */
+=C2=A0 =C2=A0 if (e->link && !e->tx && !e->rx) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 led_set_off_full(led, any_online);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 /* For non-online-only LEDs: if no tracked interface has car=
rier,
+=C2=A0 =C2=A0 =C2=A0* keep the LED off and reset history baseline to avoid=
 spurious deltas
+=C2=A0 =C2=A0 =C2=A0* when carrier later returns.
+=C2=A0 =C2=A0 =C2=A0*/
+=C2=A0 =C2=A0 if (!any_online) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 led_set_off_full(led, false);
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 e->last_tx_packets =3D m->agg_tx_packets;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 e->last_rx_packets =3D m->agg_rx_packets;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 e->last_tx_bytes=C2=A0 =C2=A0=3D m->agg_tx_byt=
es;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 e->last_rx_bytes=C2=A0 =C2=A0=3D m->agg_rx_byt=
es;
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 /* non-online-only behaviour depends on family */
+=C2=A0 =C2=A0 if (m->type =3D=3D NET_TRIG_WLAN) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* throughput-driven */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 bytes_delta =3D 0;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const u64 mul =3D 8ULL * 1000ULL;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 bits_per_sec =3D 0;
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (e->tx)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes_delta +=3D m->agg_tx_bytes=
 - e->last_tx_bytes;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (e->rx)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes_delta +=3D m->agg_rx_bytes=
 - e->last_rx_bytes;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Avoid overflow when multiplying bytes_delta=
; cap to max u64. */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bytes_delta) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bytes_delta > ((u64)-1) / mu=
l)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bits_per_sec =3D (=
u64)-1;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bits_per_sec =3D d=
iv64_u64(bytes_delta * mul, 2 * DEFAULT_INTERVAL_MS);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 kbps =3D div64_u64(bits_per_sec, 1000ULL);
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (kbps =3D=3D 0)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 led_set_off_full(led, e->link);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int idx =3D 0, t;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (t =3D 0; t < ARRAY_SIZE(wla=
n_tpt_table); t++) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (kbps >=3D wlan=
_tpt_table[t].throughput)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 idx =
=3D t;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 on_ms =3D wlan_tpt_table[idx].on=
_ms;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 off_ms =3D wlan_tpt_table[idx].o=
ff_ms;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (e->link)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 led_blink_set(led,=
 &on_ms, &off_ms);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 led_blink_set(led,=
 &off_ms, &on_ms);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 e->last_tx_bytes =3D m->agg_tx_bytes;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 e->last_rx_bytes =3D m->agg_rx_bytes;
+=C2=A0 =C2=A0 } else {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* LAN/WAN: oneshot on packet-count change */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 tx_sum =3D m->agg_tx_packets;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 rx_sum =3D m->agg_rx_packets;
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((e->tx && tx_sum !=3D e->last_tx_packets) =
|| (e->rx && rx_sum !=3D e->last_rx_packets)) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long ms =3D DEFAULT_INT=
ERVAL_MS;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 led_set_oneshot_ms(led, ms, e->l=
ink);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 led_set_off_full(led, e->link);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 e->last_tx_packets =3D tx_sum;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 e->last_rx_packets =3D rx_sum;
+=C2=A0 =C2=A0 }
+}
+
+/* core work: aggregate + update LEDs */
+static void net_mgr_work(struct work_struct *work)
+{
+=C2=A0 =C2=A0 struct net_mgr *m =3D container_of(work, struct net_mgr, wor=
k.work);
+=C2=A0 =C2=A0 bool any_online =3D false;
+=C2=A0 =C2=A0 int i;
+
+=C2=A0 =C2=A0 mutex_lock(&m->lock);
+
+=C2=A0 =C2=A0 if (m->dev_slot_limit =3D=3D 0) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct net_led *e;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 m->agg_tx_packets =3D m->agg_rx_packets =3D 0;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 m->agg_tx_bytes =3D m->agg_rx_bytes =3D 0;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 list_for_each_entry(e, &m->leds, node) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 led_set_off_full(e->led_cdev, fa=
lse);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e->last_tx_packets =3D e->last_r=
x_packets =3D 0;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e->last_tx_bytes =3D e->last_rx_=
bytes =3D 0;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&m->lock);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 schedule_delayed_work(&m->work, msecs_to_jiffi=
es(2 * DEFAULT_INTERVAL_MS));
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 /* aggregate */
+=C2=A0 =C2=A0 m->agg_tx_packets =3D m->agg_rx_packets =3D 0;
+=C2=A0 =C2=A0 m->agg_tx_bytes =3D m->agg_rx_bytes =3D 0;
+
+=C2=A0 =C2=A0 /* detect any tracked-interface online (carrier) and sum sta=
ts */
+=C2=A0 =C2=A0 for (i =3D 0; i < m->dev_slot_limit; i++) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct net_device *dev =3D m->devs[i];
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct rtnl_link_stats64 st;
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dev)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_dev_stats_safe(dev, &st);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 m->agg_tx_packets +=3D st.tx_packets;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 m->agg_rx_packets +=3D st.rx_packets;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 m->agg_tx_bytes +=3D st.tx_bytes;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 m->agg_rx_bytes +=3D st.rx_bytes;
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (netif_running(dev) && netif_carrier_ok(dev=
))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 any_online =3D true;
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 /* update each subscribed LED according to its flags and fam=
ily */
+=C2=A0 =C2=A0 {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct net_led *e;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 list_for_each_entry(e, &m->leds, node)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update_led(e, m, any_online);
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 mutex_unlock(&m->lock);
+=C2=A0 =C2=A0 schedule_delayed_work(&m->work, msecs_to_jiffies(2 * DEFAULT=
_INTERVAL_MS));
+}
+
+/* notifier: manage tracked devices */
+static int net_mgr_notify(struct notifier_block *nb, unsigned long event, =
void *ptr)
+{
+=C2=A0 =C2=A0 struct netdev_notifier_info *info =3D ptr;
+=C2=A0 =C2=A0 struct net_device *tmp, *dev =3D NULL;
+=C2=A0 =C2=A0 struct net_mgr *m =3D container_of(nb, struct net_mgr, notif=
ier);
+=C2=A0 =C2=A0 int i, id =3D -1, newid;
+
+=C2=A0 =C2=A0 if (event !=3D NETDEV_REGISTER && event !=3D NETDEV_UNREGIST=
ER &&
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 event !=3D NETDEV_CHANGENAME)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NOTIFY_DONE;
+
+=C2=A0 =C2=A0 if (!info)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NOTIFY_DONE;
+
+=C2=A0 =C2=A0 dev =3D info->dev;
+
+=C2=A0 =C2=A0 if (!dev)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NOTIFY_DONE;
+
+=C2=A0 =C2=A0 mutex_lock(&m->lock);
+=C2=A0 =C2=A0 for (i =3D 0; i < m->dev_slot_limit; i++) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (m->devs[i] && m->devs[i] =3D=3D dev) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 id =3D i;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 switch (event) {
+=C2=A0 =C2=A0 case NETDEV_UNREGISTER:
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (id >=3D 0) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp =3D m->devs[id];
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tmp) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m->devs[id] =3D NU=
LL;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info("%s - inte=
rface %s unregistered\n", type_names[m->type], dev->name);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (m->dev_slot_li=
mit =3D=3D id + 1)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m->d=
ev_slot_limit--;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&m->l=
ock);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_put(tmp);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_lock(&m->loc=
k);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
+=C2=A0 =C2=A0 case NETDEV_CHANGENAME:
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (id >=3D 0 && !name_matches_type(dev->name,=
 m->type)) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp =3D m->devs[id];
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tmp) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m->devs[id] =3D NU=
LL;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info("%s - inte=
rface %s unregistered (name changed)\n",
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type=
_names[m->type], dev->name);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (m->dev_slot_li=
mit =3D=3D id + 1)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m->d=
ev_slot_limit--;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&m->l=
ock);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_put(tmp);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_lock(&m->loc=
k);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fallthrough;
+=C2=A0 =C2=A0 case NETDEV_REGISTER:
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (id < 0 && name_matches_type(dev->name, m->=
type)) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newid =3D -1;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < m->dev_slot_li=
mit; i++) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!m->devs[i]) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newi=
d =3D i;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (newid < 0 && m->dev_slot_lim=
it < MAX_IFACES)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newid =3D m->dev_s=
lot_limit++;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (newid >=3D 0) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_hold(dev);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m->devs[newid] =3D=
 dev;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info("%s - inte=
rface %s registered\n", type_names[m->type], dev->name);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
+=C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 mutex_unlock(&m->lock);
+=C2=A0 =C2=A0 return NOTIFY_DONE;
+}
+
+/* find/create manager for base family */
+static struct net_mgr *net_mgr_get(enum net_trig_type type)
+{
+=C2=A0 =C2=A0 struct net_mgr *m, *existing =3D NULL;
+
+=C2=A0 =C2=A0 if (type >=3D NET_TRIG_TYPE_MAX)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;
+
+=C2=A0 =C2=A0 /* fast-path: if already exists, bump ref and return */
+=C2=A0 =C2=A0 mutex_lock(&managers_lock);
+=C2=A0 =C2=A0 m =3D managers[type];
+=C2=A0 =C2=A0 if (m) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 atomic_inc(&m->refcnt);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&managers_lock);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return m;
+=C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 mutex_unlock(&managers_lock);
+
+=C2=A0 =C2=A0 /* allocate and init (not yet published) */
+=C2=A0 =C2=A0 m =3D kzalloc(sizeof(*m), GFP_KERNEL);
+=C2=A0 =C2=A0 if (!m)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;
+
+=C2=A0 =C2=A0 m->type =3D type;
+=C2=A0 =C2=A0 mutex_init(&m->lock);
+=C2=A0 =C2=A0 INIT_LIST_HEAD(&m->leds);
+=C2=A0 =C2=A0 atomic_set(&m->refcnt, 1);
+=C2=A0 =C2=A0 INIT_DELAYED_WORK(&m->work, net_mgr_work);
+
+=C2=A0 =C2=A0 m->notifier.notifier_call =3D net_mgr_notify;
+=C2=A0 =C2=A0 m->notifier.priority =3D 0;
+
+=C2=A0 =C2=A0 /* try to register notifier; on failure clean up and return =
*/
+=C2=A0 =C2=A0 if (register_netdevice_notifier(&m->notifier)) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(m);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 /* publish manager, but handle rare race where another threa=
d created it */
+=C2=A0 =C2=A0 mutex_lock(&managers_lock);
+=C2=A0 =C2=A0 existing =3D managers[type];
+=C2=A0 =C2=A0 if (existing) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* use existing one: increase refcount, drop o=
ur resources */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 atomic_inc(&existing->refcnt);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&managers_lock);
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unregister_netdevice_notifier(&m->notifier);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(m);
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return existing;
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 /* no existing manager -> publish ours */
+=C2=A0 =C2=A0 managers[type] =3D m;
+=C2=A0 =C2=A0 mutex_unlock(&managers_lock);
+
+=C2=A0 =C2=A0 /* start background work */
+=C2=A0 =C2=A0 schedule_delayed_work(&m->work, 0);
+
+=C2=A0 =C2=A0 return m;
+}
+
+static void net_mgr_put(struct net_mgr *m)
+{
+=C2=A0 =C2=A0 int i;
+=C2=A0 =C2=A0 if (!m)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
+
+=C2=A0 =C2=A0 if (atomic_dec_and_test(&m->refcnt)) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_lock(&managers_lock);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (managers[m->type] =3D=3D m)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 managers[m->type] =3D NULL;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&managers_lock);
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cancel_delayed_work_sync(&m->work);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unregister_netdevice_notifier(&m->notifier);
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_lock(&m->lock);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < m->dev_slot_limit; i++)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (m->devs[i])
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_put(m->devs[i]=
);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&m->lock);
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(m);
+=C2=A0 =C2=A0 }
+}
+
+static DEVICE_ATTR(link, S_IRUGO | S_IWUSR, net_flag_show, net_flag_store)=
;
+static DEVICE_ATTR(tx, S_IRUGO | S_IWUSR, net_flag_show, net_flag_store);
+static DEVICE_ATTR(rx, S_IRUGO | S_IWUSR, net_flag_show, net_flag_store);
+static DEVICE_ATTR(dev, S_IRUGO | S_IWUSR, net_dev_show, net_dev_store);
+
+/* sysfs attributes: link, tx, rx (per-LED) */
+
+static ssize_t net_flag_show(struct device *dev, struct device_attribute *=
attr, char *buf)
+{
+=C2=A0 =C2=A0 struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+=C2=A0 =C2=A0 struct net_led *entry;
+=C2=A0 =C2=A0 int val;
+
+=C2=A0 =C2=A0 if (!led_cdev || !led_cdev->trigger_data)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
+
+=C2=A0 =C2=A0 entry =3D led_cdev->trigger_data;
+
+=C2=A0 =C2=A0 if (attr =3D=3D &dev_attr_link)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D entry->link;
+=C2=A0 =C2=A0 else if (attr =3D=3D &dev_attr_tx)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D entry->tx;
+=C2=A0 =C2=A0 else if (attr =3D=3D &dev_attr_rx)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D entry->rx;
+=C2=A0 =C2=A0 else
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
+
+=C2=A0 =C2=A0 return sprintf(buf, "%d\n", val);
+}
+
+static ssize_t net_flag_store(struct device *dev, struct device_attribute =
*attr,
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char =
*buf, size_t count)
+{
+=C2=A0 =C2=A0 struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+=C2=A0 =C2=A0 struct net_led *entry;
+=C2=A0 =C2=A0 bool val;
+=C2=A0 =C2=A0 int ret;
+
+=C2=A0 =C2=A0 if (!led_cdev || !led_cdev->trigger_data)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
+
+=C2=A0 =C2=A0 entry =3D led_cdev->trigger_data;
+
+=C2=A0 =C2=A0 ret =3D kstrtobool(buf, &val);
+=C2=A0 =C2=A0 if (ret)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;
+
+=C2=A0 =C2=A0 if (attr =3D=3D &dev_attr_link)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry->link =3D val;
+=C2=A0 =C2=A0 else if (attr =3D=3D &dev_attr_tx)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry->tx =3D val;
+=C2=A0 =C2=A0 else if (attr =3D=3D &dev_attr_rx)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry->rx =3D val;
+=C2=A0 =C2=A0 else
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
+
+=C2=A0 =C2=A0 /* request immediate update */
+=C2=A0 =C2=A0 if (entry->mgr)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 schedule_delayed_work(&entry->mgr->work, 0);
+
+=C2=A0 =C2=A0 pr_info("LED %s - network trigger flags changed to %s%s%s\n"=
,
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_name(led_cdev->dev),
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry->link ? "link " : "",
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry->tx ? "tx " : "",
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry->rx ? "rx" : "");
+
+=C2=A0 =C2=A0 return count;
+}
+
+static ssize_t net_dev_show(struct device *dev, struct device_attribute *a=
ttr, char *buf)
+{
+=C2=A0 =C2=A0 struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+=C2=A0 =C2=A0 struct net_led *entry;
+
+=C2=A0 =C2=A0 if (!led_cdev || !led_cdev->trigger_data)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
+
+=C2=A0 =C2=A0 entry =3D led_cdev->trigger_data;
+=C2=A0 =C2=A0 if (!entry->mgr)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
+
+=C2=A0 =C2=A0 if (entry->mgr->type < 0 || entry->mgr->type >=3D NET_TRIG_T=
YPE_MAX)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
+
+=C2=A0 =C2=A0 return sprintf(buf, "%s\n", type_names[entry->mgr->type]);
+}
+
+static ssize_t net_dev_store(struct device *dev, struct device_attribute *=
attr,
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *=
buf, size_t count)
+{
+=C2=A0 =C2=A0 char tmp[32];
+=C2=A0 =C2=A0 size_t len =3D min(sizeof(tmp) - 1, count);
+=C2=A0 =C2=A0 struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+=C2=A0 =C2=A0 struct net_led *entry;
+=C2=A0 =C2=A0 int parsed;
+=C2=A0 =C2=A0 struct net_mgr *old_mgr, *new_mgr;
+=C2=A0 =C2=A0 size_t i;
+
+=C2=A0 =C2=A0 /* basic checks */
+=C2=A0 =C2=A0 if (!led_cdev || !led_cdev->trigger_data)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
+=C2=A0 =C2=A0 entry =3D led_cdev->trigger_data;
+=C2=A0 =C2=A0 if (!entry->mgr)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
+
+=C2=A0 =C2=A0 if (len =3D=3D 0 || len >=3D sizeof(tmp))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
+
+=C2=A0 =C2=A0 /* copy raw input (no trimming). allow optional terminal '\n=
' / '\r\n' only */
+=C2=A0 =C2=A0 memcpy(tmp, buf, len);
+=C2=A0 =C2=A0 tmp[len] =3D '\0';
+=C2=A0 =C2=A0 /* Accept and strip one trailing LF and optional preceding C=
R, but reject spaces/tabs anywhere */
+=C2=A0 =C2=A0 if (len > 0 && tmp[len - 1] =3D=3D '\n') {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp[--len] =3D '\0';
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len > 0 && tmp[len - 1] =3D=3D '\r') {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp[--len] =3D '\0';
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 /* reject any spaces/tabs inside the token (no trimming) */
+=C2=A0 =C2=A0 for (i =3D 0; i < len; i++) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tmp[i] =3D=3D ' ' || tmp[i] =3D=3D '\t')
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 parsed =3D parse_family_token(tmp, NULL);
+=C2=A0 =C2=A0 if (parsed < 0)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
+
+=C2=A0 =C2=A0 old_mgr =3D entry->mgr;
+=C2=A0 =C2=A0 if (old_mgr->type =3D=3D parsed)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return count; /* no change */
+
+=C2=A0 =C2=A0 /* get or create new manager (increments refcnt) */
+=C2=A0 =C2=A0 new_mgr =3D net_mgr_get(parsed);
+=C2=A0 =C2=A0 if (!new_mgr)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;
+
+=C2=A0 =C2=A0 /* Move entry between manager lists.
+=C2=A0 =C2=A0 =C2=A0* To avoid races, take managers_lock and both manager =
locks while
+=C2=A0 =C2=A0 =C2=A0* manipulating lists and updating history.
+=C2=A0 =C2=A0 =C2=A0*/
+=C2=A0 =C2=A0 mutex_lock(&managers_lock);
+=C2=A0 =C2=A0 mutex_lock(&old_mgr->lock);
+=C2=A0 =C2=A0 if (new_mgr !=3D old_mgr)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_lock(&new_mgr->lock);
+
+=C2=A0 =C2=A0 /* remove from old manager list and add to new one */
+=C2=A0 =C2=A0 list_del(&entry->node);
+=C2=A0 =C2=A0 list_add_tail(&entry->node, &new_mgr->leds);
+=C2=A0 =C2=A0 entry->mgr =3D new_mgr;
+
+=C2=A0 =C2=A0 /* initialize history so future reads won't see a spurious d=
elta */
+=C2=A0 =C2=A0 entry->last_tx_packets =3D new_mgr->agg_tx_packets;
+=C2=A0 =C2=A0 entry->last_rx_packets =3D new_mgr->agg_rx_packets;
+=C2=A0 =C2=A0 entry->last_tx_bytes=C2=A0 =C2=A0=3D new_mgr->agg_tx_bytes;
+=C2=A0 =C2=A0 entry->last_rx_bytes=C2=A0 =C2=A0=3D new_mgr->agg_rx_bytes;
+
+=C2=A0 =C2=A0 if (new_mgr !=3D old_mgr)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&new_mgr->lock);
+=C2=A0 =C2=A0 mutex_unlock(&old_mgr->lock);
+=C2=A0 =C2=A0 mutex_unlock(&managers_lock);
+
+=C2=A0 =C2=A0 /* drop old manager reference */
+=C2=A0 =C2=A0 net_mgr_put(old_mgr);
+
+=C2=A0 =C2=A0 /* request immediate update */
+=C2=A0 =C2=A0 if (entry->mgr)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 schedule_delayed_work(&entry->mgr->work, 0);
+
+=C2=A0 =C2=A0 pr_info("LED %s - network trigger family changed to %s\n",
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_name(led_cdev->dev), type_names[parsed]);
+
+=C2=A0 =C2=A0 return count;
+}
+
+/* deactivate: detach led from manager */
+static void net_deactivate(struct led_classdev *led_cdev)
+{
+=C2=A0 =C2=A0 struct net_led *entry =3D led_cdev->trigger_data;
+=C2=A0 =C2=A0 struct net_mgr *m;
+
+=C2=A0 =C2=A0 if (!entry)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
+
+=C2=A0 =C2=A0 m =3D entry->mgr;
+=C2=A0 =C2=A0 if (!m) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* defensive: shouldn't happen, but avoid cras=
h */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 led_cdev->trigger_data =3D NULL;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(entry);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
+=C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 mutex_lock(&m->lock);
+=C2=A0 =C2=A0 list_del(&entry->node);
+=C2=A0 =C2=A0 mutex_unlock(&m->lock);
+
+=C2=A0 =C2=A0 /* remove sysfs files */
+=C2=A0 =C2=A0 device_remove_file(led_cdev->dev, &dev_attr_link);
+=C2=A0 =C2=A0 device_remove_file(led_cdev->dev, &dev_attr_tx);
+=C2=A0 =C2=A0 device_remove_file(led_cdev->dev, &dev_attr_rx);
+=C2=A0 =C2=A0 device_remove_file(led_cdev->dev, &dev_attr_dev);
+
+=C2=A0 =C2=A0 led_set_off_full(led_cdev, false);
+=C2=A0 =C2=A0 led_cdev->trigger_data =3D NULL;
+
+=C2=A0 =C2=A0 pr_info("LED %s - trigger %s%s detached\n",
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_name(led_cdev->dev),
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 type_names[m->type],
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 labels[(entry->link << 2) | (entry->tx << 1) |=
 (entry->rx << 0)]);
+
+=C2=A0 =C2=A0 kfree(entry);
+=C2=A0 =C2=A0 net_mgr_put(m);
+}
+
+/* activate/deactivate: attach led to manager and remember flags */
+static int net_activate(struct led_classdev *led_cdev)
+{
+=C2=A0 =C2=A0 const char *fn =3D NULL;
+=C2=A0 =C2=A0 const char *dt_dev =3D NULL;
+=C2=A0 =C2=A0 const char *dt_mode =3D NULL;
+=C2=A0 =C2=A0 int parsed =3D -1;
+=C2=A0 =C2=A0 bool link =3D false;
+=C2=A0 =C2=A0 bool tx =3D false;
+=C2=A0 =C2=A0 bool rx =3D false;
+=C2=A0 =C2=A0 bool online =3D false;
+=C2=A0 =C2=A0 struct net_mgr *m;
+=C2=A0 =C2=A0 struct net_led *entry;
+=C2=A0 =C2=A0 const char *name;
+=C2=A0 =C2=A0 const char *sep;
+=C2=A0 =C2=A0 int ret;
+
+=C2=A0 =C2=A0 if (!led_cdev) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("network: net_activate called with NULL=
 led_cdev\n");
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
+=C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 if (!led_cdev->dev) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("network: LED device is NULL, aborting =
activate\n");
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
+=C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 name =3D dev_name(led_cdev->dev);
+=C2=A0 =C2=A0 if (!name || !*name) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("network: LED has no name, aborting act=
ivate\n");
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
+=C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 if (led_cdev->trigger_data) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_warn("network: LED %s already has trigger_d=
ata set, refusing attach\n",
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EBUSY;
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 if (led_cdev->dev && led_cdev->dev->of_node) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 of_property_read_string(led_cdev->dev->of_node=
, "dev", &dt_dev);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 of_property_read_string(led_cdev->dev->of_node=
, "mode", &dt_mode);
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 /* function part from name (after last ':') */
+=C2=A0 =C2=A0 sep =3D strrchr(name, ':');
+=C2=A0 =C2=A0 if (sep && sep[1] !=3D '\0')
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fn =3D sep + 1;
+=C2=A0 =C2=A0 else
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fn =3D name;
+
+=C2=A0 =C2=A0 /* get family and online flag from name (family may be absen=
t) */
+=C2=A0 =C2=A0 parsed =3D parse_family_token(fn, &online);
+
+=C2=A0 =C2=A0 if (dt_mode) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* DT "mode" present: flags come from mode and=
 take precedence */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D parse_flags_from_string(dt_mode, &link=
, &tx, &rx);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* family: from dt_dev if present, otherwise f=
rom name */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dt_dev) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parsed =3D parse_family_token(dt=
_dev, NULL);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (parsed < 0) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info("network: =
invalid dev '%s' for LED %s\n", dt_dev, name);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* parsed already set from name =
above; require a valid family */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (parsed < 0) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info("network: =
no family in name and no dev for LED %s\n", name);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 } else if (dt_dev) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Only dt_dev present: use its family. Flags =
depend on name "-online" */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parsed =3D parse_family_token(dt_dev, NULL);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (parsed < 0) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info("network: invalid dev '%=
s' for LED %s\n", dt_dev, name);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (online) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* name indicated online variant=
 and no mode -> online-only */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tx =3D false;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rx =3D false;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link =3D tx =3D rx =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 } else {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No DT: family and flags from name.
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If name had "-online" -> online-only.
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (parsed < 0) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info("network: unknown functi=
on '%s' for LED %s\n", fn ?: "<NULL>", name);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (online) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* online variant in name =3D> o=
nline-only */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tx =3D false;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rx =3D false;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link =3D tx =3D rx =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 m =3D net_mgr_get(parsed);
+=C2=A0 =C2=A0 if (!m)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;
+
+=C2=A0 =C2=A0 entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
+=C2=A0 =C2=A0 if (!entry) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 net_mgr_put(m);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 entry->led_cdev =3D led_cdev;
+=C2=A0 =C2=A0 entry->mgr =3D m;
+=C2=A0 =C2=A0 entry->last_tx_packets =3D entry->last_rx_packets =3D 0;
+=C2=A0 =C2=A0 entry->last_tx_bytes =3D entry->last_rx_bytes =3D 0;
+=C2=A0 =C2=A0 entry->link =3D link;
+=C2=A0 =C2=A0 entry->tx =3D tx;
+=C2=A0 =C2=A0 entry->rx =3D rx;
+
+=C2=A0 =C2=A0 /* attach under manager lock and initialize history to curre=
nt aggregates */
+=C2=A0 =C2=A0 mutex_lock(&m->lock);
+=C2=A0 =C2=A0 list_add_tail(&entry->node, &m->leds);
+
+=C2=A0 =C2=A0 /* initialize history so future reads won't see a spurious d=
elta */
+=C2=A0 =C2=A0 entry->last_tx_packets =3D m->agg_tx_packets;
+=C2=A0 =C2=A0 entry->last_rx_packets =3D m->agg_rx_packets;
+=C2=A0 =C2=A0 entry->last_tx_bytes=C2=A0 =C2=A0=3D m->agg_tx_bytes;
+=C2=A0 =C2=A0 entry->last_rx_bytes=C2=A0 =C2=A0=3D m->agg_rx_bytes;
+=C2=A0 =C2=A0 mutex_unlock(&m->lock);
+
+=C2=A0 =C2=A0 led_cdev->trigger_data =3D entry;
+
+=C2=A0 =C2=A0 /* create per-LED sysfs files; on failure clean up */
+=C2=A0 =C2=A0 ret =3D device_create_file(led_cdev->dev, &dev_attr_link);
+=C2=A0 =C2=A0 if (ret)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_create;
+=C2=A0 =C2=A0 ret =3D device_create_file(led_cdev->dev, &dev_attr_tx);
+=C2=A0 =C2=A0 if (ret)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_create_tx;
+=C2=A0 =C2=A0 ret =3D device_create_file(led_cdev->dev, &dev_attr_rx);
+=C2=A0 =C2=A0 if (ret)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_create_rx;
+=C2=A0 =C2=A0 ret =3D device_create_file(led_cdev->dev, &dev_attr_dev);
+=C2=A0 =C2=A0 if (ret)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_create_dev;
+
+=C2=A0 =C2=A0 pr_info("LED %s - trigger %s%s attached\n",
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 name,
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 type_names[m->type],
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 labels[(entry->link << 2) | (entry->tx << 1) |=
 (entry->rx << 0)]);
+=C2=A0 =C2=A0 return 0;
+
+err_create_dev:
+=C2=A0 =C2=A0 device_remove_file(led_cdev->dev, &dev_attr_rx);
+err_create_rx:
+=C2=A0 =C2=A0 device_remove_file(led_cdev->dev, &dev_attr_tx);
+err_create_tx:
+=C2=A0 =C2=A0 device_remove_file(led_cdev->dev, &dev_attr_link);
+err_create:
+=C2=A0 =C2=A0 /* detach and free */
+=C2=A0 =C2=A0 mutex_lock(&m->lock);
+=C2=A0 =C2=A0 list_del(&entry->node);
+=C2=A0 =C2=A0 mutex_unlock(&m->lock);
+=C2=A0 =C2=A0 led_cdev->trigger_data =3D NULL;
+=C2=A0 =C2=A0 kfree(entry);
+=C2=A0 =C2=A0 net_mgr_put(m);
+=C2=A0 =C2=A0 return ret;
+}
+
+static struct led_trigger network_trigger =3D {
+=C2=A0 =C2=A0 .name =3D "network",
+=C2=A0 =C2=A0 .activate =3D net_activate,
+=C2=A0 =C2=A0 .deactivate =3D net_deactivate,
+};
+
+module_led_trigger(network_trigger);
+
+MODULE_AUTHOR("Mieczyslaw Nalewaj <namiltd@yahoo.com>");
+MODULE_DESCRIPTION("LED trigger for network interfaces =E2=80=94 aggregate=
d by family; supports link/tx/rx and -online");
+MODULE_LICENSE("GPL v2");
--- a/drivers/leds/trigger/Makefile
+++ b/drivers/leds/trigger/Makefile
@@ -16,3 +16,4 @@ obj-$(CONFIG_LEDS_TRIGGER_NETDEV)=C2=A0 =C2=A0 +=3D led
=C2=A0obj-$(CONFIG_LEDS_TRIGGER_PATTERN)=C2=A0 =C2=A0 +=3D ledtrig-pattern.=
o
=C2=A0obj-$(CONFIG_LEDS_TRIGGER_TTY)=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D ledtri=
g-tty.o
=C2=A0obj-$(CONFIG_LEDS_TRIGGER_INPUT_EVENTS)=C2=A0 =C2=A0 +=3D ledtrig-inp=
ut-events.o
+obj-$(CONFIG_LEDS_TRIGGER_NETWORK)=C2=A0 =C2=A0 +=3D ledtrig-network.o

