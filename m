Return-Path: <linux-leds+bounces-32-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA1E7EFFB2
	for <lists+linux-leds@lfdr.de>; Sat, 18 Nov 2023 13:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 883AAB20A2B
	for <lists+linux-leds@lfdr.de>; Sat, 18 Nov 2023 12:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B56125CF;
	Sat, 18 Nov 2023 12:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ShYQcOd4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC228B3;
	Sat, 18 Nov 2023 04:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700311390; x=1700916190; i=wahrenst@gmx.net;
	bh=HR6koxbLHfU1PLH0ktzrr5zUB6pdF380Odvqsc1xiIM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=ShYQcOd4tpfW3XLxvVlVBjDyYnX5dK/frOoTIAqRpxzULLYyrrPycc6wNBMjlwJH
	 P/dvXPNLL6rgdiPf3q6Cp4CQuxbwAMJXM64+Gx9F8Phxy09ZhG1p0wKHK9nqV7fc9
	 B82l2TS13h3JnT3ZiqHYqCxfCvbB9zM2o+2wnHN6xDbbiDhUiVC7mTFaqWtpxah/3
	 93m6b/rZxOj+UTmFQUh9GV4S7EbWjM2e1MY9dRPxIfpCERTLK1rSvDPcLhfh76A2H
	 IAUb8zSX9SW5YS9aEOyD1zR4XTTa6U786JH3dHo2gmNRQfALi+nhWl2f4a3xOXViY
	 XAJiJxMJFEF5FEFXtQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MplXz-1rgvbf20WD-00qEDd; Sat, 18
 Nov 2023 13:43:10 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-leds@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 1/2] leds: gpio: Add kernel log if devm_fwnode_gpiod_get fails
Date: Sat, 18 Nov 2023 13:42:51 +0100
Message-Id: <20231118124252.14838-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231118124252.14838-1-wahrenst@gmx.net>
References: <20231118124252.14838-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:q0GAkZRr/Y8I8XzOn+mDTl/H/sY92WAqSgmUYSEt5pmAX/cvP3N
 uEMbRNS3dZUv8ILqHj+aB8aAQJ78G0421D8rJ1AUBascm8GEneQgqdsy+7VUbW5K8kI+Fe3
 5loHFX7J08vuKaDa62IK8j95nIleUXZQ+aMbuIQV8t93fMnLpxCuahH8rqpHyrW0FtYtACl
 UOgnquNua4NeHe6Y0F88Q==
UI-OutboundReport: notjunk:1;M01:P0:Cj71fqjZ0iU=;ka7CUlJQN91shKmH2E5i+lXDr5M
 1+MPu2OWcXGNoSVMfZT/h1zAV5K/mSH6rCvzhiiQ5Wtyt31YFdjW4mMg7ccYFdQ3SzOdSH9/C
 ySKdj1uJjxwFONk3c22TgJ7inbY5tv+i2Sgv4AJQEeg7eQ4I3sSGQ3/jgZmqLeMHXxMQn59Pg
 ekOkSX5ayo+50WvR4Y3mqAjyouVjAQPGJlHh2mm1jCRsgKVV2cbzGkwRaOF1fL9AwBNBVnusX
 WeOaWsxmhC3JxAkyNRuwXbUMr8nNrvplFE/pfkEuS4kMO8sv2Vm0aQR4dh0LLi22J8AcpoULw
 Pz4i/SrP/kof4J7NijxgekbsjUTYNlD6QtzjaVg48R6TLUb2ELoqqBB84PZd45jJTnIdQrLUv
 Dd8iQ6oo9PgRsD0RWWoe2I2O/2HZphmTY2NfPp5hz0060ac7uV3kuceH8DaGOSRU2JgBZ8AYN
 cVqAn90SFm5GogFdoBCHMDk4SwPa2I/3CXC96KiHC8F8RFE29/8MSuk5eSj/p9a8s09lqNNxu
 4q1csLhhltcKyi+laC5Mm39T/rN92JaOPA9r9aWW5E8L3Q1B1RUiRQ38GdjVxjeGhDuakLE61
 ky/ZD9Ox71FlJ2QxZ9JLKrW054ylujJ4zsruiLYDxGPl3nscWgGq0oHKZEzW6RoSijiJOJgUo
 vJkkyHa2Yvut1xkTrvWDNqa2fpGu+Gx8boVw/8d5dl2eVWonoO9abSH6Nna3OGUna1b8lZt+b
 15Ldxm3XvVBsSp7ztvsBCNarozVQWhthfyC0s8Wbgm+tT1DQitLoBhjCP9zOu21lBf2bGy+Wj
 wm1Rjc5ZsZ3Z2IoKOAvliWP5ldyWB16Tv07VFCIeRnYyYdzD82vUEnMEiwRPhYIVG6xoeuLPN
 ok74Oe8t6qs/4lbh+BAqWobx11rhR3ymOa9r3N1ACxPqu+dCODVdVoZhwEzcF4T8q0NbQWvwq
 le5uZSVhkcjg7lQhIcFEuG955i4=

In case leds-gpio fails to get the GPIO from the DT (e.g. the GPIO is
already requested) the driver doesn't provide any helpful error log:

    leds-gpio: probe of leds failed with error -16

So add a new error log in case devm_fwnode_gpiod_get() fails.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/leds/leds-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 710c319ad312..0159cedffa9e 100644
=2D-- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -172,6 +172,8 @@ static struct gpio_leds_priv *gpio_leds_create(struct =
device *dev)
 		led.gpiod =3D devm_fwnode_gpiod_get(dev, child, NULL, GPIOD_ASIS,
 						  NULL);
 		if (IS_ERR(led.gpiod)) {
+			dev_err_probe(dev, PTR_ERR(led.gpiod), "Failed to get gpio '%pfw'\n",
+				      child);
 			fwnode_handle_put(child);
 			return ERR_CAST(led.gpiod);
 		}
=2D-
2.34.1


