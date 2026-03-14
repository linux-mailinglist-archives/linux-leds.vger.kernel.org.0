Return-Path: <linux-leds+bounces-7347-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLISA8PotWmD6wAAu9opvQ
	(envelope-from <linux-leds+bounces-7347-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 15 Mar 2026 00:01:23 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EF128F680
	for <lists+linux-leds@lfdr.de>; Sun, 15 Mar 2026 00:01:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C372C3019F16
	for <lists+linux-leds@lfdr.de>; Sat, 14 Mar 2026 23:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC9A223336;
	Sat, 14 Mar 2026 23:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="jNoLUkCw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B857B2772D;
	Sat, 14 Mar 2026 23:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773529279; cv=none; b=Z834SB3q3sZHPMpp5cTpqKj+p0uHOor6fK5AKn0BrIV5MYljdJHdiuALC5jL7K11oX09YOMDNygXjJZpDT7qM8NodSeYMapl10WPSKc+psH1WszQGLFdhO7ef+aOItCbIah3pP0FDadRs2qF5EQO3aav+gV4KjjT8W6rBt4e+GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773529279; c=relaxed/simple;
	bh=/FWS6rH02I22OdU/Q2NkPIaTsj5qkkVH8uNnfc5Caug=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D3dF2k6w+K+1JvUKVmHXb8D0IDDMs62EnCsJTBG8H7k9TTG5AmoGEq257Ou8MZaJhAUazabbCMXMEYIv7lc9IbeyuhJJxRKlBH4nC6JxGX2Eo04APtfjN5w8PtF71ZbQFP9n9add42l8IPZXm4XxNrbGd/y2HIcUatFaZ27Q0aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=jNoLUkCw; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773529276; x=1774134076; i=w_armin@gmx.de;
	bh=KeMLytZF+knJaTdQR2FJFWxBDXsZWbLgaoauuRwMzcQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jNoLUkCwQXLg6ymAUbPxPrfjwW+dtKuY4y4c/6dihw5abRyMuCq1vABZl1E0tzuH
	 QMD9FQf8HjO4/83SVToso13Id185m2r6ncj7cjLMGRNCOBOYqDmFz0sqr6NlKzvpp
	 krOul4SUzeRLEYcadC+po74IbLZcmQ+mNdi3DtHoZThobK6IjG92FehfwKSu3BmDQ
	 xBk07IpwvWMBxFaJ5pFcaHoHFy4c7QLpj/555TRoycbbLmSelwhxvDGK8DYZ0bUeN
	 7hykuKFbqbsgVHJ0lrS2/19fesDTMXj81M82J3Mgxuex2kEJqvhQNmAS7GxdeQorg
	 C1Q5noAI025SsCZlhQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIMfW-1vnEcx3dye-00F8Tn; Sun, 15
 Mar 2026 00:01:16 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wse@tuxedocomputers.com,
	pobrn@protonmail.com
Subject: [RFC PATCH 0/1] leds: Introduce the multi_max_intensity sysfs attribute
Date: Sun, 15 Mar 2026 00:01:06 +0100
Message-Id: <20260314230107.65444-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lTJG0sofcVMzeSY2SRnIpbSBK1pIq3c9tFPoYyo+B8f3fVx3s3l
 p4lFPkaRkrLkN/j3N40fgAT5btuZrCDYtT1bWsBqlz2r7T9/XhH3dyu0GlcucuzBGq9y10U
 1o42/yL/8YFuwr6g8n0Gl7JUtb0EGihQcTTJC3gziASC5deWzuifOcGWv0tlDaalHaQMG6H
 Ok8xnlZEGtMpG0U4UpM1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ljowesbt7S0=;cATg2Kcx//4Sc8uHcxQRHrksDhJ
 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
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,vger.kernel.org,tuxedocomputers.com,protonmail.com];
	TAGGED_FROM(0.00)[bounces-7347-lists,linux-leds=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmx.de:+];
	TAGGED_RCPT(0.00)[linux-leds];
	FREEMAIL_FROM(0.00)[gmx.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:dkim,gmx.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 50EF128F680
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
values inside the "multi_intensity" sysfs atribute. I also decided to
cap intensity values comming from userspace to said maximum intensity
values to relieve drivers from doing it themself. This was already
proposed in a unrelated patch [2] and might break some misbehaving
userspace applications that do not respect max_brightness.

[1] https://lore.kernel.org/linux-leds/2d91a44e-fce2-42dc-b529-133ab4a191f=
0@gmx.de/
[2] https://lore.kernel.org/linux-leds/20260123-leds-multicolor-limit-inte=
nsity-v1-1-b37761c2fdfd@pengutronix.de/

Armin Wolf (1):
  leds: Introduce the multi_max_intensity sysfs attribute

 .../ABI/testing/sysfs-class-led-multicolor    | 16 +++++++--
 Documentation/leds/leds-class-multicolor.rst  | 21 ++++++++++-
 drivers/hid/hid-lg-g15.c                      |  3 ++
 drivers/hid/hid-playstation.c                 |  3 ++
 drivers/leds/flash/leds-mt6360.c              |  8 ++---
 drivers/leds/led-class-multicolor.c           | 36 +++++++++++++++++--
 drivers/leds/leds-blinkm.c                    |  3 ++
 drivers/leds/leds-cros_ec.c                   |  1 +
 drivers/leds/leds-lp50xx.c                    |  1 +
 drivers/leds/leds-lp55xx-common.c             |  7 ++--
 drivers/leds/leds-max77705.c                  |  1 +
 drivers/leds/leds-sun50i-a100.c               |  3 ++
 drivers/leds/leds-turris-omnia.c              |  1 +
 drivers/leds/rgb/leds-group-multicolor.c      |  1 +
 drivers/leds/rgb/leds-ktd202x.c               |  1 +
 drivers/leds/rgb/leds-lp5812.c                |  1 +
 drivers/leds/rgb/leds-mt6370-rgb.c            |  8 ++---
 drivers/leds/rgb/leds-ncp5623.c               |  4 +--
 drivers/leds/rgb/leds-pwm-multicolor.c        |  1 +
 drivers/leds/rgb/leds-qcom-lpg.c              |  1 +
 drivers/platform/x86/silicom-platform.c       | 30 ++++++++++++++++
 drivers/platform/x86/uniwill/uniwill-acpi.c   |  4 +--
 include/linux/led-class-multicolor.h          | 32 ++++++++++++++++-
 23 files changed, 164 insertions(+), 23 deletions(-)

=2D-=20
2.39.5


