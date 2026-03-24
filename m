Return-Path: <linux-leds+bounces-7469-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBIfNuHzwmnCnQQAu9opvQ
	(envelope-from <linux-leds+bounces-7469-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 21:28:17 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5243531C538
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 21:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49397301DC11
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2026 20:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FF234C990;
	Tue, 24 Mar 2026 20:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="TIIBHw9r"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4F634C9AB;
	Tue, 24 Mar 2026 20:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774384092; cv=none; b=HDyrNw+7rLZRrGWx+gusSYh3EcwjnfpjNuGpSYp3LFBSkH/AwxN0/dbq0Y9r8Fs9nStZo8wrbB4dgmK7Z/TDUXGRTVi+BI2NNFaFPlJGE+g8h5Nt/QSryyQZ/B7tEPTuWKz9L19kHB/G7MyE6mtR4/Fi76kwWqN2J/K2DMblJN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774384092; c=relaxed/simple;
	bh=9owk4fhfzLWmsMEAqabQb4lwtZJnd61xvGcNPnNc3ho=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U1nr5eLItlrCDrdQaac9nfYb22oC6eVZOCrmwmhALMzciY8L1vpWOcmB/20x4bXvr4JSWO7Tr5Sd8F/rmIxcOOJToawADlPPk93PmFO/R4n4NzZzF5Qx8pg3YmuO0LWRdKD4uOv2lndv7uGZITIkpdx5yoqvqIxR26tVDxUjevE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=TIIBHw9r; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1774384075; x=1774988875; i=w_armin@gmx.de;
	bh=/87Wi5H+RLlr0FEMtyqxYoYLxX0qhVMpr6/U0qWMSr8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TIIBHw9rHnHLeFmAi4M7ZzozZkHC0O8AG/DbZeWcY1PFRoPhCFU9fgRyXqDMRT8S
	 YncO6m3rx2/w5QRmI6fPY6vhdAu/Kpf09003RcluPuIytL61Eqxg8ugMLRdef2oHc
	 f/Aghq26PqJ3ZiusJdh6hkXKsJQ9br6GfxRkH+DcUTQZm1mR2ZJcHHNtYlofWlqnp
	 80wcIwaPI6qCkcrxdsZ/VBDdMCzYcc2kcm36M3YZgbiss5ZC9RLiwFKA1UxvHnuUl
	 9fwsFsu08olInv+PwL96xek+/9gV6x10j4x/56Rq0jS5hrqWV8lEuEkC6BJreMoF8
	 yxg2/bAsNyzR/dPSbw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBm1U-1wHDBH1xwy-007uhd; Tue, 24
 Mar 2026 21:27:55 +0100
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
Subject: [PATCH 0/1] leds: Introduce the multi_max_intensity sysfs attribute
Date: Tue, 24 Mar 2026 21:27:50 +0100
Message-Id: <20260324202751.6486-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:E/IOtGi4IVP5VqrV4gpUk3oGd2hznFppruYoSN2Nipa61Ds/COo
 DDuV2JJ8mQp2r3rI+R5eEagXeRYCmv5EVUqv5AI6fnR+/87apNhvwPI9W2qcsT0ZsqhfCZi
 NIZWWvq3RIopIIwlPmOVKPm4r1xUErtAJvP/1HcoVGcz3Z42yKXqUxlynlFwb2G0YPjMpYd
 SzFOYl0MduFHvKGwFOKpA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qldIZZGcjtw=;LSySzB4QM148tuWmOjSsDduLF6a
 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
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lwn.net,linuxfoundation.org,tuxedocomputers.com,gmail.com,protonmail.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7469-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmx.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5243531C538
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

I tested the new sysfs attribute using a custom kernel module:

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


