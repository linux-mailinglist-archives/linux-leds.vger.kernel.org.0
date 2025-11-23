Return-Path: <linux-leds+bounces-6290-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E73C7E7CC
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 22:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3E2D34E07E7
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 21:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557AC231827;
	Sun, 23 Nov 2025 21:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="pc3KQgTh"
X-Original-To: linux-leds@vger.kernel.org
Received: from sonic304-22.consmr.mail.ne1.yahoo.com (sonic304-22.consmr.mail.ne1.yahoo.com [66.163.191.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC67221DB3
	for <linux-leds@vger.kernel.org>; Sun, 23 Nov 2025 21:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.191.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763934004; cv=none; b=BnLIoohybA8DFULJBRp4OyEjsP59AMpnBkfG5kzYe5uHBUXsmkZIFK6NOYHr0uOFIaPszP7HxLFmySsmIBf47nG9t4tF4I7uZjB4yy0p3mxtcwsrxlDbM9WI2xcC317Ccx1ADfmtADnS9myNT4Yo+vdQeUjAN6UX4/jPqJuqKE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763934004; c=relaxed/simple;
	bh=RNZkwmfYTuwbZqpf7Xc6uCblZYtliROxjy64rlx5Xsc=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type:
	 References; b=sfcEVrCz5Y43XbKslHpfex4ESeyoF//mtYsIeqOIYzP3Ag0zGH2DvExyWB0KQQMaFeU/Pn0ZmrA/27YnfoXpsBCqZZofHbxaanLRGIM+7WLatV/RJ2nMjR9dP6xmBV6sPNTnzqt/MuEIrgyUgvQPuaP2vyIG0DyWgK6revbWoY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=pc3KQgTh; arc=none smtp.client-ip=66.163.191.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763933995; bh=RNZkwmfYTuwbZqpf7Xc6uCblZYtliROxjy64rlx5Xsc=; h=Date:From:To:Cc:Subject:References:From:Subject:Reply-To; b=pc3KQgThZR6K3Yr7MVMJnOnxsYhUGBtWmWe1Z6S9Ks9XJXx9wMztZtEsEo3nb60f+EE0P2Br6rMt7oNtrwpvgIiUxnFql5kMNqGb83xvr/UTN+FXZl1uPLBw9BrJmnsdC8W/19X6ass5bM+Q6VPH3bBC5SOBvadxepIItbqqItO4Um3Ox5vR2jkOslgMaO/t0zGcs/GKqkgI9elnU4ePaihmdxxTdTKkywHGY2YLcqoh6FztRRdkZOsrGcliYta03pgYlldfwl2ZNE3WuNByfCNfQhlMxXdLABoWGhWAdduU7R50aKQOJRki33rjhHM2EgTaFLIzF12iteHjmqu8Iw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763933995; bh=c+LwQPreAUcdbs6Of0M+o3wfHtEOYfzxxiDoYn4Siy7=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=FUQASBVAFsHy5vU7cD+dnyJz65E8QlDBV+MhH58DXeB64wiVUIqUWH1yzSDSO4ZSwXjqnXjeP9Yia0QE44SCph9zPbaoo0GG2fcbjK32m8+8MMd47ak5hy6zR/iN9FwtEp7rYx/Da5o567QLap5Fmt7Aw3lxMcxKCBF4NFj8OL+HRz4nNvCej+7TFewW2ZNWKMqd2o0O8Ty8600HEcXz98tLlAO8AkxyyxL5VMhGqT8bq4DWFRmE+esnTg/PHVaWqvYHTxpcp4/QvIjCuJzg+MVOLyt3p0uVxryz8qLNox1CZ+W8uPuHsE+ZNYmTDIGNC+SrQDvbHZ9zM6FPlu1pUg==
X-YMail-OSG: vmgLKmQVM1mvsd2KvBLTrMciQibE8ZbbbT2ECx._2r3YRQF7pi4FsIZhxH9MKD8
 lr65_qEbEjUfuXoBI58lky80o2k4llzA7oA_Fzx.38KbB6XmM1BYszSpAXC7uKQSmk5kzaoSxP_r
 vd8LF4HwfSYIthBU0.YQIQhvqsEs_XuNwZwvmNY1NKnmkvDt2Ghn7y6D3jfG7bUxHp8eIPRuBnx4
 D2L4Ums76i.hPsNJp.Yo0Lt7PEWy_X0GWTv4LLMIkcyRqsU3x9nrk_rP7yoqg3iWODN6V5N4kO6H
 f7qqwBbNQvZEnuod5ELVOcg0S.2Htv_lOwNm7iweG9hqnaCwMm5L4qenHxPuSNUzpJesrA9v9oVT
 fZQQ6aRV1uRLdGwrtph29G340Pn.akZtjs3agKUTX_lPngPpC1YI3keDc3Y2btDugZDrpixch1.B
 R4JffSVpI7uc_M9XwV9UA.eiCM3NT1aGf.oSwcVerscJg8kMQZgK9G4O6GNEkGhPNZDREF1fsXV9
 4pOHy4uqZk22Nnst4dKKfxw_z90w0yNzDXAIPN1ZrOcH9y7HRw7EpdP7Y0QVxGAaBI8NGyad79qw
 HyYID3tuHK44RgJ8r04l8ZCEttnH1SqA3d4.f0iGtVhfGpTLo_3S50fwIRKJke654KrUPbVUP0So
 1eqJHyGa9A7Rrrc468ApzQCfIlftrpzdyvMRvlUF9QMIQbwr8yZZiNGpPtlxb.MJ9d7EhMhVRB.v
 X8yov1hoXk8ImKYWypUSKVr2oKYM1HQz_u_zrmpSHcgdX0dOGEZjfdWQ_.zvW3vqVr4E2PNk0FJa
 DXTXPxtyZPFg4O1Sv1yrGJZWCsQfITxKK8KwQZ66LviFxMfSATxLFJQ00kSAYwdVWcRsqBJvGULg
 SMdJM63g756PolMvDvgFsY7QZ3T1knJXlviRBlq0wR2.89ACkkz3S8Pc2_XF53mgGVUhE.tIkulS
 eHj6PK7lpKQfKMOQxR5lMzazQvF7FxCMh91cr55VFu85EJ.o5Rnk2HV9w2U1QVrLXzwQgU2AyVUR
 EUthB39i47jXBRKNtAmgo8QNky9KqA99lZW_nQJNz_Mj05esqi72pIOgBEJ1.v9ca30ZHfUYOqPn
 4NbLNv8xn_gPuddUqZbBjLHwiBlvUd_eGyBKAEDcV4HZwWA2vSa71jeRUbwS0iAszXj2GUTqQzWf
 VdqGyMcJK7g8rSD7FREdeXWw140ZiGB5rUroqW7exr81SKzo3EK3ZiuSni5sN_UH2BE53nOqjyPv
 rxWPeKMEU5qJecKbZNKr5Kg6nNPTlvvGhCwERhq1GliFU1PQIovGqJthgS_TvvJKtLlXZuUlml7x
 fMXMrVl4MIe574TH52EM_LeRdFg_nvetId0ZYPo2hZDQbUB6FEJjWJfdjwe5WcTqaUPi5cwwL5Am
 h1pd0z5p_35RJ8qTapXAR8yf88T6Bp._E6f0Dcy9akU0LQ7Jyj7YB3wz1DelgeJsrE67.Lj5w3kR
 maHM2rkIQMrbY1LEgU.PL3.k9xcaVGydMZ.2117qAYBl_aXykosPoxhNjzEVaPcGgvMZC2s_e_0A
 MnRJL6eh4V1EU9Itj9agNltjtGRDiOGefNnksyefK2esJYKKsibdq4D5CL05su0unM8.Divq5Lhw
 ykPxwCsjMbdy99BCTwHf_b2UUTwXBiSIkOM_Ej_gfFzmyDXIfx1awPcd2mMNMETfDuY5teJbOBnD
 AR1Ksp5Jj0enzKgZqRk6aOPsMFFEjftUu8i3SWDRRHiCJjfYYuly6EQlBYFBW_MGEsciyYzdwQ6V
 B6WFIXxwrKOnyCrd7r9spqDFArZXmhzgYN4Vd.ufXGqGBOH_EO4tBZPuBVebJRBMlsbewbydjmJ3
 tH5wyADPy3u4nfiirP_0h2wN_oDsF3VSqFxyFfkrdkP0VSLnbPPpRXRd6x48fkUHWGvEiLwEeN5J
 Ac7Ezv.OZIyl9lYR52X3SvPqUdvhgdtkLqrnzUgqF4u17tcxx40LJ95F_snBLfUJRnLoesjTEhMC
 YgnztxJTTz0.rJ6FyMuhG1uLzbftI_r749WGB3LxLf_0xZLe.lY6.YaitAnspNpKOulEz0gNRBXq
 EvrtW.7jkjTr4rPSb67imHo6NpBEl9Zuq3vaHms8FqMfzfMKbpi.kwMN4Zmw98TYV3T9cfB5FsNb
 iBzcauPp99kv_3bY0mKridBsgqsgx5bLZYHzpjyhB26aRIFw9yYObhqEfVZaTNm5lhd6j2x_Nl60
 9JZBKmpAJUFpCaW9jA79M43ONhuE2Ur8Tj4gEY3B8I263BAAYpErUYWyDCg--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 58a7c911-6dc0-4a54-8e81-80c2d85b3172
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.ne1.yahoo.com with HTTP; Sun, 23 Nov 2025 21:39:55 +0000
Date: Sun, 23 Nov 2025 21:29:43 +0000 (UTC)
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, 
	"pavel@ucw.cz" <pavel@ucw.cz>, 
	"jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
Message-ID: <2110132361.480390.1763933383779@mail.yahoo.com>
Subject: [PATCH 2/2] leds: add "network" LED trigger (lan/wan/wlan)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <2110132361.480390.1763933383779.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.24794 YMailNorrin

LED trigger for network interfaces.

- Aggregated per-family (lan/wan/wlan).
- Family and flags (link/tx/rx) are taken from led_cdev->params if present
=C2=A0=C2=A0 (format "network:<family>[ link][ tx][ rx]" or "<family>-onlin=
e").
=C2=A0=C2=A0 If params is NULL/empty they fall back to the LED device name:
=C2=A0=C2=A0=C2=A0=C2=A0 <colour>:<family>[-online]=C2=A0=C2=A0 e.g.=C2=A0=
=C2=A0"green:wlan", "red:wan-online"
=C2=A0=C2=A0 or, if no colon exists, to the whole name.

Behaviour:
- wlan (normal): blink/solid driven by throughput table
- lan/wan (normal): one-shot blink on TX/RX packet change
- *-online variants: steady ON while any interface of the family has carrie=
r

Interfaces are auto-tracked by name match (lan0, wan1, wlan2, phy0, wl1, at=
h0, ra0=E2=80=A6).
Up to MAX_IFACES (16) interfaces per family.

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
+=C2=A0 =C2=A0 =C2=A0 Family (lan/wan/wlan) and flags are read from led_cde=
v->params
+=C2=A0 =C2=A0 =C2=A0 ("network:wlan tx rx" or "network:lan-online") and, i=
f missing,
+=C2=A0 =C2=A0 =C2=A0 parsed from the LED name itself.
+=C2=A0 =C2=A0 =C2=A0 If unsure, say Y.
+
=C2=A0config LEDS_TRIGGER_PATTERN
=C2=A0 =C2=A0 =C2=A0tristate "LED Pattern Trigger"
=C2=A0 =C2=A0 =C2=A0help
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-network.c
@@ -0,0 +1,718 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * LED trigger for network interfaces.
+ *
+ * - Aggregated per-family (lan/wan/wlan).
+ * - Family and flags (link/tx/rx) are taken from led_cdev->params if pres=
ent
+ *=C2=A0 =C2=A0(format "network:<family>[ link][ tx][ rx]" or "<family>-on=
line").
+ *=C2=A0 =C2=A0If params is NULL/empty they fall back to the LED device na=
me:
+ *=C2=A0 =C2=A0 =C2=A0<colour>:<family>[-online]=C2=A0 =C2=A0e.g.=C2=A0 "g=
reen:wlan", "red:wan-online"
+ *=C2=A0 =C2=A0or, if no colon exists, to the whole name.
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
+
+};
+
+static DEFINE_MUTEX(managers_lock);
+static struct net_mgr *managers[NET_TRIG_TYPE_MAX];
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
+/* Parse comma-separated tokens (exact match, no trimming).
+ * Recognized tokens:
+ *=C2=A0 =C2=A0- "lan"/"wan"/"wlan" =3D> return NET_TRIG_*
+ *=C2=A0 =C2=A0- "link", "tx", "rx"=C2=A0 =3D> set boolean flags via point=
ers
+ * Special-case: "lan-online", "wan-online", "wlan-online" =3D> return NET=
_TRIG_* and set link.
+ * If none of link/tx/rx found, set all three to true.
+ */
+static int parse_function_string(const char *fn, bool *link, bool *tx, boo=
l *rx)
+{
+=C2=A0 =C2=A0 size_t len;
+=C2=A0 =C2=A0 const char *buf =3D NULL; /* pointer into fn (use const) */
+=C2=A0 =C2=A0 size_t buflen =3D 0;
+=C2=A0 =C2=A0 size_t i;
+=C2=A0 =C2=A0 int ret =3D -1;
+
+=C2=A0 =C2=A0 if (!fn || !link || !tx || !rx)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
+
+=C2=A0 =C2=A0 *link =3D false;
+=C2=A0 =C2=A0 *tx =3D false;
+=C2=A0 =C2=A0 *rx =3D false;
+
+=C2=A0 =C2=A0 /* whole-string "-online" special case */
+=C2=A0 =C2=A0 len =3D strlen(fn);
+=C2=A0 =C2=A0 if (len > 7 && !strcmp(fn + len - 7, "-online")) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *link =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len =3D=3D 7 + 3 && !strncmp(fn, "lan", 3)=
)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NET_TRIG_LAN;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len =3D=3D 7 + 3 && !strncmp(fn, "wan", 3)=
)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NET_TRIG_WAN;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len =3D=3D 7 + 4 && !strncmp(fn, "wlan", 4=
))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NET_TRIG_WLAN;
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Suffix "-online" present but base is unreco=
gnized -> failure */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 /* parse fields by pointing into fn and comparing via memcmp=
 (no copying) */
+=C2=A0 =C2=A0 for (i =3D 0; i < len; i++) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((fn[i] =3D=3D ' ') || (fn[i] =3D=3D '\t'))=
 {
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* token end: next is end or comma (short-circ=
uit prevents OOB) */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((i + 1 =3D=3D len) || (fn[i + 1] =3D=3D ' =
') || (fn[i + 1] =3D=3D '\t')) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Note: if multiple family toke=
ns are present, the last matching family wins. */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (buflen =3D=3D 3 && !memcmp(b=
uf, "lan", 3))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D NET_TRIG_L=
AN;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (buflen =3D=3D 3 && !mem=
cmp(buf, "wan", 3))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D NET_TRIG_W=
AN;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (buflen =3D=3D 4 && !mem=
cmp(buf, "wlan", 4))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D NET_TRIG_W=
LAN;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (buflen =3D=3D 4 && !mem=
cmp(buf, "link", 4))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *link =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (buflen =3D=3D 2 && !mem=
cmp(buf, "tx", 2))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *tx =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (buflen =3D=3D 2 && !mem=
cmp(buf, "rx", 2))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *rx =3D true;
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D NULL;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buflen =3D 0;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 /* default: if no flags found, set all true */
+=C2=A0 =C2=A0 if (!*link && !*tx && !*rx) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *link =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *tx =3D true;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *rx =3D true;
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 return ret;
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
+=C2=A0 =C2=A0 int parsed;
+=C2=A0 =C2=A0 bool link =3D false;
+=C2=A0 =C2=A0 bool tx =3D false;
+=C2=A0 =C2=A0 bool rx =3D false;
+=C2=A0 =C2=A0 struct net_mgr *m;
+=C2=A0 =C2=A0 struct net_led *entry;
+=C2=A0 =C2=A0 const char *name;
+=C2=A0 =C2=A0 const char *sep;
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
+=C2=A0 =C2=A0 /*=C2=A0
+=C2=A0 =C2=A0 =C2=A0* Prefer core-supplied transient params if present (fo=
rmat: "network:params").
+=C2=A0 =C2=A0 =C2=A0* Do NOT consume or free led_cdev->params here - core =
will free it
+=C2=A0 =C2=A0 =C2=A0* after activate returns if the trigger doesn't take o=
wnership.
+=C2=A0 =C2=A0 =C2=A0*/
+=C2=A0 =C2=A0 if (led_cdev->params && led_cdev->params[0]) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fn =3D led_cdev->params;
+=C2=A0 =C2=A0 } else {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fallback: parse function from LED name "<co=
lor>:<function>" */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sep =3D strrchr(name, ':');
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sep && sep[1] !=3D '\0') {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn =3D sep + 1;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fallback: try the whole name =
*/
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn =3D name;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 }
+
+=C2=A0 =C2=A0 /* If function not recognised, return -EINVAL to signal inva=
lid configuration to userspace */
+=C2=A0 =C2=A0 parsed =3D parse_function_string(fn, &link, &tx, &rx);
+=C2=A0 =C2=A0 if (parsed < 0) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info("network: unknown function '%s' for LE=
D %s\n", fn ?: "<NULL>", name);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
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
+=C2=A0 =C2=A0 pr_info("LED %s - trigger %s%s attached\n",
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 name,
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 type_names[m->type],
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 labels[(entry->link << 2) | (entry->tx << 1) |=
 (entry->rx << 0)]);
+=C2=A0 =C2=A0 return 0;
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

