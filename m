Return-Path: <linux-leds+bounces-8061-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJGFNT+r/2ng8wAAu9opvQ
	(envelope-from <linux-leds+bounces-8061-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 09 May 2026 23:46:39 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2A3501926
	for <lists+linux-leds@lfdr.de>; Sat, 09 May 2026 23:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 753B4300D92F
	for <lists+linux-leds@lfdr.de>; Sat,  9 May 2026 21:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8FA39D6E2;
	Sat,  9 May 2026 21:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="hkMD/n3G"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F3531F9BE;
	Sat,  9 May 2026 21:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778363192; cv=none; b=j2QK93dmQz7QiHiK2IzYI+vkgtFIULw+ZBzzcALnPm6JLkgAKsMPjuVX6WQ6TMWhqhPPpYGFLrqVCp8/m6fBECm0YTLBA/JrpC7KVxI2bNfdhCUJxkRvjN7HTSipX3oRxhzKUBbUJFVHg8K9aaZp5yv3Ay2yj0hjNsSG/jcSS/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778363192; c=relaxed/simple;
	bh=f7DJE5FqscjW7QPSJBwV8uPtuqwxhe+YYOJ8ww/9cyg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LbrPIOviyiW2f6ZABaJELlQLRjlBMlSzzQzrRqYhyO50nzku2mhRMUbCRnjvG/OyA3ju5TBU0IzN8DPt3rZV7ey6v8FQyHZ2fpiThIEHDhVEkCUX55dBwmavOI03N+/fSePIUlV9i8QLzURc4Mx2n9gQukq7nNiz+5scxKmQczA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=hkMD/n3G; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778363169; x=1778967969; i=w_armin@gmx.de;
	bh=byclfFiy5zXNuO4KtmtLl3BV6RJadkf5Od4Q39wrmjk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hkMD/n3GxVWJfIebwRmOG9kboNNOQUnPSyIGNOBNSLLcVwK7nKmhwTuETf2pl+dn
	 XC1x9EEhZj5QOjrkhicA+Zpnp44Q/UKOGdIjCbksmrXbH1QOZ/VwEsM4NZUpeBupJ
	 WZUpxEuRF2YzBtUK4cQDem1cB7zrgG6Yg/wdc4qMNZA1F1ZJfYfRy5pE94mU1wWaX
	 YCUAP7M0rxpahThj8WJ1nxjIFUGmo6KFJlEnm0YcHTnYGmvQCFDsBnfLDBGZFIWyJ
	 f28mff33ZHLTlDUdkgPRYrUbxM0K7osjzoBCTNHrFF+MAUIHM5y+3U4OJzipoefgQ
	 H14Z5+JyULE+IPUluQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zFj-1vGv8E2exP-00rBTT; Sat, 09
 May 2026 23:46:09 +0200
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
Subject: [PATCH v4 0/1] leds: Introduce the multi_max_intensity sysfs attribute
Date: Sat,  9 May 2026 23:46:02 +0200
Message-Id: <20260509214603.262368-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:usQtLFiuQb4B6QmoDtfjikjxTsKrP6Ed5YzVL6PysMS19ukevO8
 W+vU2kWxmlixGnHFT6RG+idU0INFdU23ZUTXlopZMkt/BOtObyRWESJJSOWjUoJgcpkLMiQ
 6KWFJtmsIOdqCrFYLAdm/txJoeqnd+Nq/kxioK+X0/U9WxeZkGJNN8XGzn6WeANWcROijEI
 GcX8bzAG78XaUxfu1TY0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5LBhHbpUFX0=;JSmaxERZQ3xuKIATBTqbb1dlTpW
 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
 xaKLJ1wehiTGCnj4wqBhVIbjqS3tmgVRUbPY=
X-Rspamd-Queue-Id: 7B2A3501926
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lwn.net,linuxfoundation.org,tuxedocomputers.com,gmail.com,protonmail.com,pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8061-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmx.de];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,gmx.de:mid,gmx.de:dkim]
X-Rspamd-Action: no action

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

Changes since v3:
- add additional Reviewed-by tag
- fix coding style and spelling issues

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


