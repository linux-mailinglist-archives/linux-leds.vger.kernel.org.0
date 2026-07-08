Return-Path: <linux-leds+bounces-8977-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jG89EcDTTmqZUwIAu9opvQ
	(envelope-from <linux-leds+bounces-8977-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 00:48:32 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB5472AF32
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 00:48:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmx.net header.s=s31663417 header.b=B6nZK3Vm;
	dmarc=pass (policy=quarantine) header.from=gmx.net;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8977-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8977-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0ED2C30CC337
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2026 22:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949FA3909AC;
	Wed,  8 Jul 2026 22:47:00 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879132DEA68;
	Wed,  8 Jul 2026 22:46:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783550820; cv=none; b=WxlLTVmd3uhdEmE7S9FgFaCo0kU+wZ+rGbw+O9sZ7eRYvwHczyE78ON+/ixtfTetpfvMqrVCz86nq/T2dxg9D/LJl5DB1roUuDCUDuih7xcB24HfcftVWv474NZ/qxoNNoiQ892uEZP1xVw4CAdPPlGnYhQrvQa6ex1UrAHhg4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783550820; c=relaxed/simple;
	bh=wzSgZWBYeboWQTU00UiNXKeUGwKDCsTsxdmnpzk1KHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHXAk2JXiC6SUt1juN3djpN2f4MJrWi4bSFfe+Ik7I9Y5fsTDEfeHSgVzGLPdNpJFcGDYBm8pe1Sm8mIM9OgrmFSbfqJxBAu3Mh/P6Wd6C2ZSCGs19p8R7JloeiwPBXmo1ta9ycjnpY4DiBvb436zhkV85bQPL8o5cZ7AkyTkoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=B6nZK3Vm; arc=none smtp.client-ip=212.227.17.21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1783550816; x=1784155616; i=wahrenst@gmx.net;
	bh=ylvl1jSQN7pWKK/cSYYP26/PJlYp9bmD37/8S6w3YQA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=B6nZK3VmV+K1YlfGgkhB7q1g++MRoa0b5s64W3fbErHjUNjNve9s1G7c/2k/bqP6
	 orh1njBPte+idR41LgoveUeiICSVEh8I/yu67dTLOEXCsk+iGYyFHlKEiDZwW1i4O
	 mHn5oZtpuVf5K772fxiVfvX6stJr36Km/SnSfXwbcNK9/X+t4P7u02ZdraLPzlXwC
	 /Dx992SK089TdqAiHhDDA3kPOZ3G5Dv2TzeF8pAA7w7c9rsD/Naw7LRHqfew34gIb
	 yj9nyflNOPv/KL0eZXlIb23ftB1tx9wIVXC1N0Q4I0th22E3VxgJW61jAouBv4Vdt
	 jSTfAJuHrz7xmjjN7w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKsj7-1wMupZ2bW9-00MK2U; Thu, 09
 Jul 2026 00:46:56 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH RFC 2/2] leds: rgb: leds-group-multicolor: Implement default-intensity
Date: Thu,  9 Jul 2026 00:46:52 +0200
Message-ID: <20260708224652.106632-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708224652.106632-1-wahrenst@gmx.net>
References: <20260708224652.106632-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o83T2hSY4bfW8jded5ob/2obED0xcolOeDwNKNQWt8fM+lsPmeH
 W7EHANvmLvCZSM+D1L24t0fS3F4EvTdw35RJBdT10WpPnyFR5nJLu7IoJdHvkA6pNrnCHFn
 ZYRQGWlm6f+2OSGqhACFyB3rWDV7w8dsa5Qv0KmDyJDPfH/3aCa+6ToiU+NAWxzmEU7xOnh
 qJCi+edMSp3nsw9dNYlbg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BFQfqV46Ie4=;jInaBzl/BVxjb0Jfyw6y8CrjSQo
 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
 fHYcfaRf0QQHPoEQRFrLhv8wLXs1lVZ0bLDdVTq
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.net,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.net:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8977-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jjhiblot@traphandler.com,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:wahrenst@gmx.net,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wahrenst@gmx.net,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[traphandler.com,vger.kernel.org,gmx.net];
	DKIM_TRACE(0.00)[gmx.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wahrenst@gmx.net,linux-leds@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmx.net];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DCB5472AF32

Until now the driver initialized all LEDs with maximum intensity.
This isn't useful for LEDs, which needs to be initialized via DT.
So introduce a new DT property to define the default intensity of all
indiviual LEDs. In case the property is missing, the old behavior
is kept.

Additionally this also works with triggers. So it should be possible
to blink with a specific RGB color.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/leds/rgb/leds-group-multicolor.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/l=
eds-group-multicolor.c
index 548c7dd63ba1..19913a43b8a1 100644
=2D-- a/drivers/leds/rgb/leds-group-multicolor.c
+++ b/drivers/leds/rgb/leds-group-multicolor.c
@@ -17,6 +17,7 @@
 #include <linux/math.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
=20
@@ -106,11 +107,27 @@ static int leds_gmc_probe(struct platform_device *pd=
ev)
=20
 	for (i =3D 0; i < count; i++) {
 		struct led_classdev *led_cdev =3D priv->monochromatics[i];
+		u32 intensity;
=20
 		subled[i].color_index =3D led_cdev->color;
=20
-		/* Configure the LED intensity to its maximum */
-		subled[i].intensity =3D max_brightness;
+		ret =3D of_property_read_u32_index(pdev->dev.of_node, "default-intensit=
y",
+						 i, &intensity);
+		if (ret) {
+			if (ret !=3D -EINVAL && ret !=3D -ENOSYS) {
+				return dev_err_probe(dev, ret,
+						     "Unable to get default-intensity[%d]\n", i);
+			}
+			subled[i].intensity =3D max_brightness;
+		} else if (intensity > max_brightness) {
+			return dev_err_probe(dev, -EINVAL, "default-intensity[%d] is invalid\n=
",
+					     i);
+		} else {
+			subled[i].intensity =3D intensity;
+		}
+
+		dev_dbg(dev, "subled[%d]: color_index: %u, intensity: %u\n",
+			i, subled[i].color_index, subled[i].intensity);
 	}
=20
 	/* Initialise the multicolor's LED class device */
=2D-=20
2.43.0


