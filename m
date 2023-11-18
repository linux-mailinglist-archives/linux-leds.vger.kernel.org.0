Return-Path: <linux-leds+bounces-31-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D23F87EFFAE
	for <lists+linux-leds@lfdr.de>; Sat, 18 Nov 2023 13:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A31C1F23095
	for <lists+linux-leds@lfdr.de>; Sat, 18 Nov 2023 12:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DBA111B2;
	Sat, 18 Nov 2023 12:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="QuEWURhh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 150F4A2;
	Sat, 18 Nov 2023 04:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700311390; x=1700916190; i=wahrenst@gmx.net;
	bh=eoy17ezwHzirLCmlfoGhUFFjmsZQ3ZrtrTWw+ETLhKM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=QuEWURhh1fDeMaeUtp5TglP2UHp0Q50+J7MbVgliBYld9kBBYmEsxoCWo76piNL7
	 7QAwHb0JYdsOtW1W3575+XhPmZVcM7Rh71H+IOq+av1A0c+tmmkcRsviDMmAQmhJL
	 MjumaslBmPxuHgegeL6Pn4C2ndmH3wh0iwZ8TuI3xviHjNycupAiOCzCtLlYwo7Ks
	 CfWDDI1M+IYt16imtbbHE6a734lQFgqiH2CKGJFXPIS4qu02hllkxeotxfP50QqzS
	 cRHRry0zZZNXIMw9WTg5PIMADZ2CNewTpLrsrPek/ztjUBoNGx2j4qTIvEAmsm/mH
	 hd2Gq+vWxQaowvLf0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTiPv-1quknz02QP-00U2XV; Sat, 18
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
Subject: [PATCH V2 0/2] ARM: dts: bcm2711-rpi-400: Fix delete-node of led_act
Date: Sat, 18 Nov 2023 13:42:50 +0100
Message-Id: <20231118124252.14838-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iFKgKJtus0q2PlxYmUiMpiHp3Aa6enwSlfpEim+lkvAhOoGmPCD
 LoKJKupqhuzNjxut1Sbv8TnCuiscie3SmrvZBXtYCrMO/d8yzOJHopyKKVuoXuZfFp+tPVR
 qb3ANwvSOQOiPpHlkq558YD9L17HjfixjGImeVZ7BUyMxf7EIxLvoccaX4AdbS37bQNKEaY
 isxH3oAJeisx2B3xGQVwA==
UI-OutboundReport: notjunk:1;M01:P0:fQNLhEMCBKw=;6Ehkxg0MhHeZisto8EljTxQywS9
 AITD2+hOZWigIFPQsHtZdUTIPPtAt3ou3STbtpDtUSicumHGZfV/ggOY/EuaJmczPt2SM4xX1
 LhnmiabTQnMIaeaXAvV8yvzD8vrh9kR7gxS62PXx9tO4UnSoQRZyqzNjVera5pF7QWiF3eLp8
 dsyBEBDsh1/gNHp8FeQySo1UZmLzRSdPohE0G4a5Nr7C+an4JUDiaLbdQS0GXpkoSMmcBYpY+
 L14u+Ohl7G5GP3m/LbJfU0lbiy8Jx1fbkOAN38WVJ5npWAQKnbEsfNp936t9d+MYvZwJ8I0mI
 nM48dUdNzvKU8pfP+4CffJAWHeJPynJgaviFoMvoSpBs1XUPDCm6x8vXr+QomCVsItgTh7MJ9
 TQjrATzxe8fXxfGRBiIrKA+L8qA/3vfFkGdypKBbvzHKwpRF2JeYMxqgFeJxRQoYfU0TKN6JV
 6J2o+DxlenlYQ950Tlj524O3Jwz/CGBCmbKd26uUzNfQ9Eg0MDVSCAETwi8gibMa3CkhFpgS0
 37U9jhGJlkypY90warjlkNO0pdCcMuk+EaeIe+kXnGCUyq8qiamsT52HXjjPFxwh3jOD4HWfA
 pw1q1R8LAMiPqj+D5BlfRUjHsqUhzJOweVBN4jVOKPEuGNf5b1HsxPFoCaVZkj+9zL3OxWKME
 1y2/YWGSAN35dCS00s5PnE/SdM0lKsbM2Pxpo9k1lTa0T3BAjyww5fy0XPT/L+klhB4GNOvGm
 e+yPI3sf0EjKDyRCKvQoGfOa/4gKgSNP0G3h4mZBQqRRbZELpj9vnaf4ExaitATj8gh/inUcj
 4TaNHbGTGULhfvTV1+A+yIPYp4tXc/oPkVlvdKc4i0XgX6e+/YRfvaGVnbGYgNXxjlVsACqHM
 NtnEj3jWl6obLb3LV28AqNwfhjaG9NVzNFIdQtxtWXJ4Oug0fQxwgXui7R87UES+xjYNoWzjQ
 d7Q8gA==

This series fixes the probing of leds-gpio on the Raspberry Pi 400.
Also try to improve the error logging of leds-gpio.

Changes in V2:
- replace dev_err with dev_err_probe in patch 1 to handle EPROBE_DEFER
  properly

Stefan Wahren (2):
  leds: gpio: Add kernel log if devm_fwnode_gpiod_get fails
  ARM: dts: bcm2711-rpi-400: Fix delete-node of led_act

 arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dts | 4 +---
 drivers/leds/leds-gpio.c                       | 2 ++
 2 files changed, 3 insertions(+), 3 deletions(-)

=2D-
2.34.1


