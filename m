Return-Path: <linux-leds+bounces-2776-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E5F97D533
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 14:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D076F1C20E03
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 12:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BA014290C;
	Fri, 20 Sep 2024 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=milecki.pl header.i=@milecki.pl header.b="hirYtoOn"
X-Original-To: linux-leds@vger.kernel.org
Received: from 5.mo576.mail-out.ovh.net (5.mo576.mail-out.ovh.net [46.105.43.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1471428E3
	for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 12:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.43.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726834075; cv=none; b=NyIE6o6gTjA3Y6TiS8UZu0WzN5WsFYOUweJUSToRCwYdB59VC+HZhu19i6kBjB6Gae4KVRQtz1HlcCpXPkd0RFBgxDe6V0anqkikGxkGOtB95R8gxDeptO53UkOjSSZ6AWxM+KUhdd8fDW/sXkwl6pQnFemDbt0Jc+ng9Ubrq9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726834075; c=relaxed/simple;
	bh=VX5s+5yuGFQRhfbP/V5xvT1lBMIF7VZpfVBcjgm2Emg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=sykQVJ3a31fBLKPUYAWo57vJWaU64MuvdDB2VbQGnsuJuJQ2dpigJdEZUj6pmENuluEjYZocsFvnr/QRXeb5W9P1b9zEwjeUH4mGYAxl0Vi1L2D/WHApP9h7A87PQHAgmvz0ZPHLMqUyU2W6A0Ge+eMql76Gs43WyZLX3rpHhvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl; spf=pass smtp.mailfrom=milecki.pl; dkim=pass (2048-bit key) header.d=milecki.pl header.i=@milecki.pl header.b=hirYtoOn; arc=none smtp.client-ip=46.105.43.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=milecki.pl
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.140.140])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4X99DZ3xMzz26fS
	for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 11:30:38 +0000 (UTC)
Received: from ghost-submission-55b549bf7b-p2jxt (unknown [10.108.42.32])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 98C481FDBA;
	Fri, 20 Sep 2024 11:30:35 +0000 (UTC)
Received: from milecki.pl ([37.59.142.102])
	by ghost-submission-55b549bf7b-p2jxt with ESMTPSA
	id arP+Fdtc7WaAIjEAGFBLig
	(envelope-from <rafal@milecki.pl>); Fri, 20 Sep 2024 11:30:35 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-102R004ac0ce6d4-cdd8-4c4f-950f-43d261164fb7,
                    81FEEB5978853F9BF3B0EAA5D8951869BE0D21DF) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp:176.31.238.120
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 20 Sep 2024 13:30:35 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, William Zhang <william.zhang@broadcom.com>, Anand
 Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel
 review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] leds: bcmbca: Add new driver for Broadcom BCMBCA
In-Reply-To: <20240920-bcmbca-leds-v1-2-5f70e692c6ff@linaro.org>
References: <20240920-bcmbca-leds-v1-0-5f70e692c6ff@linaro.org>
 <20240920-bcmbca-leds-v1-2-5f70e692c6ff@linaro.org>
Message-ID: <12ea4d8609b3defa8782a37c62a22820@milecki.pl>
X-Sender: rafal@milecki.pl
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6691786097647987480
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrudelfedggedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghfkfigihgtgfesthekjhdttddtjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepjeejkeekgeejtdffffevffeivedtueeifeeuffegkeehkeeliedugfelfedutdeunecukfhppeduvdejrddtrddtrddupdefuddruddurddvudekrddutdeipddujeeirdefuddrvdefkedruddvtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqlhgvughssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=Hk1db6I33prPcdmUSsL4zs5Cr51+2sEVCNVhiqbyuBg=;
 c=relaxed/relaxed; d=milecki.pl; h=From; s=ovhmo3028686-selector1;
 t=1726831838; v=1;
 b=hirYtoOnEYkrHDy180lsA6Na4sjePhx6f5TvQVqcWT8PLLwgsDCU7o7ipsKL/w6vxoGu3n1d
 rRZZ9r/DUfWsmIrVps0TD/n/IOhLAW30OTCkpIg+hh5vQJdFfayG809fxpyV3yeakCyqBtPX4SZ
 31ctTv7clJMHSWneMUHBxr0RH3lTLXQ8jgwhEIUyPYPzIXisyACN+0inGUiPbNbgZ5ExoKbhHEE
 ARh67zG0abMuSpM1kIkrmSISKII/UDtaCQulWRjDeMsgSSTujNoZosfN0lYhTr1oteKNicK+726
 iNFGRwk6XB/ohd/kzBs2KPE4R/WgNgLu/9sGMmWXTdPuA==

On 2024-09-20 13:15, Linus Walleij wrote:
> The Broadcom BCA (Broadband Access) SoCs have a LED control
> block that can support either parallel (directly connected)
> LEDs or serial (connected to 1-4 shift registers) LEDs.
> 
> Add a driver for that hardware.

There is an existing driver for this hw block, please see:
drivers/leds/blink/leds-bcm63138.c

It may need some work (I didn't compare your submission with my minimal
driver) and I think it would be preferred over adding a new driver for
the same hw.

-- 
Rafał Miłecki

