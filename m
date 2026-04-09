Return-Path: <linux-leds+bounces-7675-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMZdEFwV2GmFXQgAu9opvQ
	(envelope-from <linux-leds+bounces-7675-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 23:08:44 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A3D3CFCB5
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 23:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32D033043F9B
	for <lists+linux-leds@lfdr.de>; Thu,  9 Apr 2026 21:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3E4374E5B;
	Thu,  9 Apr 2026 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="SO8jysQc"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CCA370D5E;
	Thu,  9 Apr 2026 21:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775768802; cv=none; b=gtjJ5o1JcgGLChB/2U4wryV0vDtgiw32XryKI3k0So9jLQtCAvYLeNIr42sQzaLTg21PmWK3BlQiCgkDrXuY7t7otki/xKjxdCtvHBvOWVRfAIha8eFO23hJxqefp+Y032hG2AZ855rc0tp49Jx81DCUTgigGEd7TBSyVG+tDxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775768802; c=relaxed/simple;
	bh=4irb7gXVLB128N4wh7FMaZEC50I/xyE0/Lt9e52ZlQU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G8ogu/FPFhS7n8JpAARd7hiHd7xqd/WkkdPu42/552Mvy5rwsWvYyYVvhU994ISmX8Ra/IcTleDh9UBHa+lp9gqJTeYHNg1+EKsQmZycMHl9j9uQlK2oDClJqxNVEMHyvqTgoP0douPMQzCoRB2WeSGaqWWLfi8FLm8qVI4iGH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=SO8jysQc; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775768793; x=1776373593; i=w_armin@gmx.de;
	bh=krzyAimNjECvodNL+61YaZ1GihD49alclCp2q84EnEI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SO8jysQc8AtSizkPmoKIgI7HZ2MjEAOL6qcMCbEmBYvGtHDe86m28t5FDpX8eCck
	 fmsh/K5kp3mdJNTJcl+eTqNhuNiN010+BDIaCAc1Q/E5K6VUs8Vp5wS7ecO0YELvw
	 ywqngJbabMy3Cj3K+Pp3pyeC1agFfoTxfJtOGd/dG8aT42B0t3DnL8D/NOq6KGTU6
	 iamDatm4zU6F/EZa4GIM7ywKR0MmfBI7KtEkEysVCjA0mYxutRTpSnUK+GaczQ64C
	 qZvYjxoysRLVX0qhQICHLi72BkcMpu1/N2zCIM2lxp3xrNjU/56ft8TNGXtgwnMsQ
	 riaqR5n9nr4iR+A7jQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWzfl-1vvunw2Isj-00Ruke; Thu, 09
 Apr 2026 23:06:33 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	jacek.anaszewski@gmail.com,
	pobrn@protonmail.com,
	m.tretter@pengutronix.de,
	wse@tuxedocomputers.com
Subject: [PATCH v3 0/1] leds: Introduce the multi_max_intensity sysfs attribute
Date: Thu,  9 Apr 2026 23:06:28 +0200
Message-Id: <20260409210629.9934-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cw7OdDvUTcs+qC0TB/XOj/nMakcWTyEEunso/5XlXlrthbwOnNI
 i/2WhrdQug6P+5Fa8C1l97hbl1qZz0TRK5RywvU0nF4OTI94qxHw/K/eKYQZJms5wjlFyQZ
 yTn7kBumAd7JvEhq9DFq33FSTRKybiZVPjb5sejUg1b+f4RfswzWOiegg6GX9ORI63hhilp
 xRBntsnDemFM0GgkXPR4Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lPdBKHQJybU=;aatEBdIK6Zk9LoNIqQsmhMpPg1d
 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
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lwn.net,linuxfoundation.org,gmail.com,protonmail.com,pengutronix.de,tuxedocomputers.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-7675-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 94A3D3CFCB5
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

Changes since v2:
- add Reviewed-by tags
- fix spelling mistake

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


