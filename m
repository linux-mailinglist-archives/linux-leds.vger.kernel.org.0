Return-Path: <linux-leds+bounces-7614-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOGOGCYfzGnHPgYAu9opvQ
	(envelope-from <linux-leds+bounces-7614-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 21:23:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D21370891
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 21:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB970306DA69
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 19:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB263A4532;
	Tue, 31 Mar 2026 19:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="svdK8tTy"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D06390223;
	Tue, 31 Mar 2026 19:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774984596; cv=none; b=F8+fPR2CNSV4MhY/3hJJDYJBSToT8v4oqwDeXALhwVfXwjWdhP/mkROuUFM7CazzCiaMWtXW/8Uh9sG1Jfhk61TV0LM8kMh9a1blfcPqhVql0uq6KaVGMogMRXNvlnR3Y5XvZb+Q3uNRZ2KYryfIxri0uMb+1DMUQddpehiM54g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774984596; c=relaxed/simple;
	bh=JidcmiTU8eBC9Mni9M5XD9lWYREaIBqOl5ENcW2xGvc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I+d2jWtBV/FDVC+2EddUkWeTvRu0Gn1+16CHZfSqFxV5p+OivJKEy/tmVZrMxqVCCzL9mWqxHctQiFmlI3vpIkeTXMwubolzkClorZfXtzgUdJbwXzt0Q0sc09MTLQ4MjkvO+y+6bVbL2M13uqD8/ebMpqfKK7L19C0ozI81Hfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=svdK8tTy; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1774984581; x=1775589381; i=w_armin@gmx.de;
	bh=nAT0ArDIDqPsNI1gpL/CE0dEKvyI/xkk+OFNiVwdZt4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=svdK8tTynWfALuXu5YdIeN9FemGP4TAcSAQzdE89sdwYrkxUF6n38KYFOoCwShVd
	 nhcaNlCFCidWbYLtOKjl50ccM5lGXUmyJ4CUwCPONd1B1hWT/batTHPJFE3CbynVH
	 D4IVHz+EAZWpwq/hPIinxV5QULYyVhdwltcXmaybrsJ9UxnopmfDVRUefbP2yFJDU
	 2Wtszw8HtgfVzI2iorC3kooLoOWlZwjO+/4wmFnXZEKgzZ/BESfZeNXCQXVHD2ORw
	 xzt1crhHEK4ygOfuKXeJqPwsHFQOZVipVNqmCTzIzczJqReE9Oc/g2vzKDO1q9RCX
	 qyWRKl5bK6Rv5JnV6Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVNAr-1vygB03GkR-00TwOD; Tue, 31
 Mar 2026 21:16:21 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	wse@tuxedocomputers.com,
	jacek.anaszewski@gmail.com,
	pobrn@protonmail.com,
	m.tretter@pengutronix.de
Subject: [PATCH v2 0/1] leds: Introduce the multi_max_intensity sysfs attribute
Date: Tue, 31 Mar 2026 21:16:18 +0200
Message-Id: <20260331191619.3729-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tnWgt349VB42aBwClZyxhhrWnb3BfSgTfdpFX4nGSGzIw7Ckc0k
 cscr75jtoJpeRVbJnOfJhd9aAB9Gg/fWc4icaTirWrapueVuFpZVsdO3bgmz4IRfQShYxPg
 p0BPnTJyUfMd5Wknwq05dJcMzqvbEMCWb+NVSU0uNvsk1nf+qrd1NR9mQ0VApbjK47cTdKn
 7npO5JSu/g1p9MjtqgKXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:az77oTNhsRU=;SBjKVOmVb8EUlNiWYNe24QesbHb
 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
 l6n90TojyKw/JVHZsyulGvrjtvd6I2cWA==
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lwn.net,linuxfoundation.org,tuxedocomputers.com,gmail.com,protonmail.com,pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-7614-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmx.de];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:dkim,gmx.de:email,gmx.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D0D21370891
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series was born out of of a mailing list thread [1] where
i asked how to properly model a RGB LED as a multicolor LED. Said
LED has some exotic properties:

1. 5 global brightness levels.
2. 50 intensity levels for each R/G/B color components.

The current sysfs interface mandates that the maximum intensity value
for each color component should be the same as the maximum global
brightness. This makes sense for LEDs that only emulate global
brightness using led_mc_calc_color_components(), but causes problems
for LEDs that perform global brightness control in hardware.

Faking a maximum global brightness of 50 will not work in this case,
as the hardware can change the global brightness on its own. Userspace
applications might also prefer to know the true maximum brightness
value.

Because of this i decided to add a new sysfs attribute called
"multi_max_intensity". This attribute is similar to the
"max_brightness" sysfs attribute, except that it targets the intensity
values inside the "multi_intensity" sysfs atribute. I also decided to=20
cap intensity values comming from userspace to said maximum intensity
values to relieve drivers from doing it themself. This was already
proposed in a unrelated patch [2] and might break some misbehaving
userspace applications that do not respect max_brightness.

#include <linux/module.h>
#include <linux/init.h>
#include <linux/led-class-multicolor.h>

static int test_brightness_set_blocking(struct led_classdev *led_cdev,
					enum led_brightness brightness)
{
	struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(led_cdev);

	for (int i =3D 0; i < mc_cdev->num_colors; i++) {
		if (mc_cdev->subled_info[i].intensity > 30)
			return -EIO;
	}

	return 0;
}

static struct mc_subled subleds[] =3D {
	{
		.color_index =3D LED_COLOR_ID_RED,
		.max_intensity =3D 0,
		.channel =3D 1,
	},
	{
		.color_index =3D LED_COLOR_ID_GREEN,
		.max_intensity =3D 0,
		.channel =3D 2,
	},
	{
		.color_index =3D LED_COLOR_ID_BLUE,
		.max_intensity =3D 0,
		.channel =3D 3,
	},
};

static struct led_classdev_mc led_mc_cdev =3D {
	.led_cdev =3D {
		.max_brightness =3D 255,
		.color =3D LED_COLOR_ID_MULTI,
		.flags =3D LED_CORE_SUSPENDRESUME | LED_REJECT_NAME_CONFLICT,
		.brightness_set_blocking =3D test_brightness_set_blocking,
	},
	.num_colors =3D ARRAY_SIZE(subleds),
	.subled_info =3D subleds,
};

static int __init test_init(void)
{
	struct led_init_data init_data =3D {
		.devicename =3D "test-led",
		.default_label =3D "multicolor:" LED_FUNCTION_KBD_BACKLIGHT,
		.devname_mandatory =3D true,
	};

	return led_classdev_multicolor_register_ext(NULL, &led_mc_cdev, &init_dat=
a);
}
module_init(test_init);

static void __exit test_exit(void)
{
	led_classdev_multicolor_unregister(&led_mc_cdev);
}
module_exit(test_exit);

MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
MODULE_DESCRIPTION("Multicolor LED test device");
MODULE_LICENSE("GPL");

[1] https://lore.kernel.org/linux-leds/2d91a44e-fce2-42dc-b529-133ab4a191f=
0@gmx.de/
[2] https://lore.kernel.org/linux-leds/20260123-leds-multicolor-limit-inte=
nsity-v1-1-b37761c2fdfd@pengutronix.de/

Changes since v1:
- use sysfs_emit_at()
- fix documentation issues

Changes since RFC:
- rework documentation
- drop useless defines
- reduce amount of driver code churn

Armin Wolf (1):
  leds: Introduce the multi_max_intensity sysfs attribute

 .../ABI/testing/sysfs-class-led-multicolor    | 19 ++++++--
 Documentation/leds/leds-class-multicolor.rst  | 21 ++++++++-
 drivers/leds/led-class-multicolor.c           | 47 ++++++++++++++++++-
 drivers/leds/leds-lp50xx.c                    |  1 +
 drivers/leds/rgb/leds-ncp5623.c               |  4 +-
 include/linux/led-class-multicolor.h          | 30 +++++++++++-
 6 files changed, 113 insertions(+), 9 deletions(-)

=2D-=20
2.39.5


