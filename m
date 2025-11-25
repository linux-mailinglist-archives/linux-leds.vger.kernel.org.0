Return-Path: <linux-leds+bounces-6306-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4A7C839B7
	for <lists+linux-leds@lfdr.de>; Tue, 25 Nov 2025 08:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 110293ABD31
	for <lists+linux-leds@lfdr.de>; Tue, 25 Nov 2025 07:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3918218AB9;
	Tue, 25 Nov 2025 07:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="ILIlf3TE"
X-Original-To: linux-leds@vger.kernel.org
Received: from sonic321-25.consmr.mail.ne1.yahoo.com (sonic321-25.consmr.mail.ne1.yahoo.com [66.163.185.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C663D523A
	for <linux-leds@vger.kernel.org>; Tue, 25 Nov 2025 07:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.185.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764054142; cv=none; b=lML0VMuyvD110UTyGEeu8amIgfOj2ih/kxMUoAHMCEy1G34kdECRKsZSYjLR+5k7lF9TK/YURYunFeA1c1/Ii40EWaafo8Kw40oKBCLeFqL1H5sbeJiq1EAx03MMHFHPJA1RyY1y8Ye2nqjFkkuk38iQW+1w48LhMMvETLP1ahg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764054142; c=relaxed/simple;
	bh=o6BzDOqOFP3jLDH4fokh+qZsTfTGNgynsKzVTGFuBvA=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type:
	 References; b=lz5iUu2zV+qhA/8Lq3DYGrYtPLqeK5QE0+KLlzMqvTTqCzOMjTwM6J5gnGcECSdxTu02qFbmMwGvDWA9TsPnTfK9pV2VX7OfZhA6xXNQdKy4+AHXRq3nF6uENUGQDi0uDhZ64k8CHyrxIrSfmwV3C6eAsfs6lJS9p0lUO9lohDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=ILIlf3TE; arc=none smtp.client-ip=66.163.185.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1764054139; bh=o6BzDOqOFP3jLDH4fokh+qZsTfTGNgynsKzVTGFuBvA=; h=Date:From:To:Cc:Subject:References:From:Subject:Reply-To; b=ILIlf3TEkycBvl7UpqUFI5aUhKTdxFNQw0ib0oPAdFuJhIe24ruy9GQNTrlvcrygkXdyem45Xa7zNQ2Mz6aFbJYMKoTEilyDNCDyqIgiXbTn3v8LuHZ9fF3w7XyWGHn5zrSk6P0TqhY9kte/uAmejQUAtUj5KgT8Ev36EB9oGYRMGABOzDKldv8MSB8cXE4+CZFGsYmYpOxKlZsf4otzb6I5bOb3Q8UDHxw9eoSHDfaodvgO8esiMLbc6Ab2YgNxx3Qg6NfkAhPT48WMaUYIEsL160GIwYPJhQmNpx14repMn+kewxsbzXkL4PJyynyu0d2K+OHkpA6AkvBKkm+eXg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1764054139; bh=TovThnbTtBYYthMoxuZzBHD0m1LbC13GfAVH2ajpUjw=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=CYJVz0w2v+YCZlI/cBktS2FDrjVzRAzKFiwZuD8mhbJL2OQ6804npLBn5DTlPz3LOgJmdPrgOIuWpRQSW8p3WKLINKaa5y06yJfkm48CCT0bF4h/6CvIIUSJ/Ztjr9v6atlgkxlMFSNIgtmnFOP5DYzbyCZsFjviFms/YlPvs7E+C0s9o+Pireu6lfAZETcS2qdq9d+2nrbSkTuYUgoDnrSKipDsrpzKkkZmyALrEzwz4LNYnRBNqmuNGx7fF8rNre4nJEze0Lx/GvyZNdillPUKhRyc9ULP8q2VHy9LaCDMY7T06jUCw8lkdVSUILnt2tBdFhFe6pWgrgQ5sfsiAQ==
X-YMail-OSG: 7oz4SwQVM1l8X0vmswAerpEgSV3fEl9GZ_jM6FxVvZaDMr3BGhBdFy_yAWtCdcA
 T9sNnsxvsctvKsafXnIyiPz9vJc6kDillSB7jFMwmFHSd1x7lYVLVwsq7VHEyqRe3IVR0ogtFIlc
 78.cfdUu4gjSRznkJX7aZhjbgzcpJnSzAT8gWhdcTFfWMSnx1qBfwkKDAAqoRwmvR_ORc9DUl_sP
 00MyyvFsQFAbJOTVH7LOLE9b1d6kJ0pccGOGsP4SmKG.V.zHKiaRRllbvIXqGKVF6H1yHwe5WoWO
 UvTCWzxixx1rVwBF7DG2LnxjD0grfya.g_gd1fODAKiOvhcFkNerk9dNxUGXKDfVhpYTFwNZvCru
 je1TDk5Y98_g8Yxu88wEyfEcUVPAADQkdeXs2HPVf1VOr60kib88q3kjByllVDycfv659wzprzkC
 nU2qG62G77vZY6Lfmkzaw45lUGBgcExlZT3rquYpv3evDEoTrBpRuBj1kT7R4GLw.xBWoEMgzAqe
 U0o.12hrO2qkhSYou6OjgRG3nSLz2_dip9uvkx71o2UEMNmRuIuDFLa8AnvFB836dPX9MSMMhlYy
 12zLFah3jTJEhPdgjSzRmZdNL4WJixEr5Oz8i1j0GFGPHkrpjZB0J3OSgzI7D7KtnlW4bJB8PBf0
 DU2yOwBTL1x53AqfeWiWGgmSobYVPYs8YhmFCcEyjM.nosoSRboiGyM4cpi1t.6W5HIlLe.Ynzos
 0K8riv0.B1s7g9bXJrqzCo2ImkNAOqNRXq0rBSjvEJYoMJICFaPRyq6gsnYxdXvh1rSZkl_UpNPF
 cmdZQqlEXLriXESiEAJgqXki2y8viAvV1T77mgBHO_UwOo44cctgDRkKzwpyWrIJXmfbdpjhFzMk
 T9naIVG6H1WzJxT99LvrnlZaV9hXPiNqPqJLfw69UQ6066k3394ZYRXyL.W2xI9OgMT0dZu6KSjB
 htI.gkTFpz1B1qsrGXzWcrGW6C7VMAkpPDKJtxqUl1D.grJfrlU194Nz_CDk1N.04gpAdUmbbJOG
 HeN9jnhITcbkjkImUdFQLF6PA86Cu41QCpx2DuvY4OyiqaeiwIdznbbArndyyksGrRnOixgOatLN
 qmKwG.TxpL0Rr4WYrWFejF10SpH7FeyqBH9FNiK3hXR9XKdYq36jC7kkPLfPnzCCL0mZxygzfh3a
 8fbQtPA2ZVZ4qiK2Xu4WuJso2za0bC8U7vPMfnuRk6hNF7aip30EvMQpSow1trqlYCNriE.UZ9fk
 a6aT1dgKOkCi7w7u9eEv4oXZ.wLv3wjYYdOPS29OfvlodDFo.PdpBcmxwBi.mJ1q1BOmLeBELtOk
 zTJCe5yMGQiviyidUbiC27NlRLjDXxKaf5gJHkLL5s21Ll0O580YzQo06Bp9RB3RznNfnC_cJFkr
 jqihHULM3A2orv4HNExrLJ_NoDyhSuYCpDT_IVOOXptPVguKi8Rw4feq4s8FyB7U8nMiqRPHqZ_i
 FWfYnusprx5s6NPKvAcp580TAPcZs0VWWGeN3TG8Lx52E6.eWcMDw1MSX3N1zYOQi_sQiWpljwB1
 HQ9Jk9QZYm0x7zzelWq_LQPr52UIBd03499PFUYPMPZMluoeKGSCTBrPxnyEOvOQo84zsEBomy.u
 sMHylvzxj6Y.QP_OUw7LquuSmDh4mU4at9SUAo523IP1IUxmxahUaNIyFrl9IZzh_amDnCRYERSc
 YHHHfFVbKDR0IgRsVSneEEsM0v1bcR8uS1folmlZcd6m7tG2tgtgNMJNyQs1A_HEM7JWvxf_Vh3c
 TCGa00SMb1yW3b6.5htVa59KWbXyqTBMtOKvC0j5TBc.HJE8JCDMsQAPKZgrqTcFkYZrmLUKwrMZ
 BmQqJlk69NGdKK.ogfhRRFayk1qE4eY9xBawR8RPYdIrRnrX6PhGjByrCWAwGl3lZX8BcPud9jnR
 QAnsA1j27i89a0BAZUfvy6cj6WNy2585T_FMLCHBruzd73sPDsHGGhS3Abo4suoo62PYMT8t0DNz
 IAFjLAOS47HJz5r7UFi92tv3wFPJfSrPt7SrD8N_kjLYCVPH.KvK6BFpzPKrpjEvVher5pELyLQK
 TkIMQsyLffwdim7iwybufSlTigYDbjUhPifJp1izP6B0RaKXL.SnyBxnzpI0CwltXq8YAU6aN7L.
 LIE.D6QsKs8TUw99jdJwd5zxcD6SDH1JlosBcJKplPkDpcSOPAPTd.Sc38yqq5lVn5XRzNP7Auq0
 31.fwS1LcwccaFRPvc.ZlJEIDXEHJTLoXB_V2zefm6flB
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 865c19bf-f9cf-41ed-96db-fdfd68b75482
Received: from sonic.gate.mail.ne1.yahoo.com by sonic321.consmr.mail.ne1.yahoo.com with HTTP; Tue, 25 Nov 2025 07:02:19 +0000
Date: Tue, 25 Nov 2025 06:31:55 +0000 (UTC)
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, 
	"pavel@ucw.cz" <pavel@ucw.cz>, 
	"jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
Message-ID: <1322575840.959909.1764052315696@mail.yahoo.com>
Subject: [PATCH v3 2/2] leds: add "network" LED trigger (lan/wan/wlan)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1322575840.959909.1764052315696.ref@mail.yahoo.com>
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
@@ -0,0 +1,1019 @@
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
+=C2=A0 =C2=A0 int dev_count;
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
+/* Simplified parse_function_string: accepts exact family token optionally
+ * suffixed with "-online", e.g. "wlan" or "wlan-online".
+ * Returns NET_TRIG_* or -1.
+ */
+static int parse_function_string(const char *fn, bool *online)
+{
+=C2=A0 =C2=A0 size_t len;
+
+=C2=A0 =C2=A0 if (!fn || !online)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
+=C2=A0 =C2=A0=C2=A0
+=C2=A0 =C2=A0 *online =3D false;
+
+=C2=A0 =C2=A0 len =3D strlen(fn);
+
+=C2=A0 =C2=A0 if (len > 7 && !strcmp(fn + len - 7, "-online")) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *online =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D 7;
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char c =3D fn[i];
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (c =3D=3D ' ' || c =3D=3D '\t' || c =3D=3D =
',') {
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
+/* parse simple dev string "lan"/"wan"/"wlan" -> enum or -1 */
+static int parse_dev_string(const char *s)
+{
+=C2=A0 =C2=A0 if (!s)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
+=C2=A0 =C2=A0 if (!strcmp(s, "lan"))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NET_TRIG_LAN;
+=C2=A0 =C2=A0 if (!strcmp(s, "wan"))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NET_TRIG_WAN;
+=C2=A0 =C2=A0 if (!strcmp(s, "wlan"))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NET_TRIG_WLAN;
+=C2=A0 =C2=A0 return -1;
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
+=C2=A0 =C2=A0 if (m->dev_count =3D=3D 0) {
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
+=C2=A0 =C2=A0 for (i =3D 0; i < m->dev_count; i++) {
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
+=C2=A0 =C2=A0 for (i =3D 0; i < m->dev_count; i++) {
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m->devs[id] =3D NULL;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info("%s - interface %s unreg=
istered\n", type_names[m->type], dev->name);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (m->dev_count =3D=3D id + 1)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m->dev_count--;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&m->lock);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_put(tmp);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_lock(&m->lock);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
+=C2=A0 =C2=A0 case NETDEV_CHANGENAME:
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (id >=3D 0 && !name_matches_type(dev->name,=
 m->type)) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp =3D m->devs[id];
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m->devs[id] =3D NULL;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info("%s - interface %s unreg=
istered (name changed)\n",
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type_names[m->type=
], dev->name);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (m->dev_count =3D=3D id + 1)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m->dev_count--;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&m->lock);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_put(tmp);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_lock(&m->lock);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fallthrough;
+=C2=A0 =C2=A0 case NETDEV_REGISTER:
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (id < 0 && name_matches_type(dev->name, m->=
type)) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newid =3D -1;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < m->dev_count; =
i++) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!m->devs[i]) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newi=
d =3D i;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (newid < 0 && m->dev_count < =
MAX_IFACES)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newid =3D m->dev_c=
ount++;
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < m->dev_count; i++)
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
+=C2=A0 =C2=A0 parsed =3D parse_dev_string(tmp);
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
+=C2=A0 =C2=A0 parsed =3D parse_function_string(fn, &online);
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parsed =3D parse_dev_string(dt_d=
ev);
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parsed =3D parse_dev_string(dt_dev);
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


