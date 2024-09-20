Return-Path: <linux-leds+bounces-2775-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D573C97D4F1
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 13:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A3BC282C3C
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 11:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E5933985;
	Fri, 20 Sep 2024 11:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=milecki.pl header.i=@milecki.pl header.b="aX8DSaH7"
X-Original-To: linux-leds@vger.kernel.org
Received: from 18.mo561.mail-out.ovh.net (18.mo561.mail-out.ovh.net [87.98.172.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3B46FB6
	for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 11:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.172.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726832869; cv=none; b=EjgoQDfyf6inIgStC7Kd0rxIojO3uPR/0xO9b3+629RPBj56ZQLXzypA7sZsLPqA8UrrcL58+KweKdmzh+dyrfu4Apr9vLyu2jAFyE/hd6o+QjmCnx9G3OklTrBKDCkZW5MTiSSpW4j2cEQxWJ4yTyChIA0/Y4QCBLefSTqO9qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726832869; c=relaxed/simple;
	bh=3+v9eL6D2Dm8BIFU3RspD6lqMt9+w8Ri9OY5lMhQEb8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=eRYq72UHTl03+X6H0hdfOlcmbyN6d3GXIqlA/rqFh/IwTn1DUidGSjJApI+W6XAQNCT8fMofQwwV9i/DQNdmAjK62vSA5YeJKzJxmMOnZcHkUxxNQFEN2FzklRbaYKeZ2BDdAeL9LBDfdD9qeKNrKILx9GNGjqZnjHMtIfDuCIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl; spf=pass smtp.mailfrom=milecki.pl; dkim=pass (2048-bit key) header.d=milecki.pl header.i=@milecki.pl header.b=aX8DSaH7; arc=none smtp.client-ip=87.98.172.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=milecki.pl
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.25.23])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4X999w0xGjz1Wc0
	for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 11:28:20 +0000 (UTC)
Received: from ghost-submission-55b549bf7b-vt8xk (unknown [10.110.118.109])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 30A911FEBE;
	Fri, 20 Sep 2024 11:28:17 +0000 (UTC)
Received: from milecki.pl ([37.59.142.104])
	by ghost-submission-55b549bf7b-vt8xk with ESMTPSA
	id igwNA1Fc7WaesgAAhI//MA
	(envelope-from <rafal@milecki.pl>); Fri, 20 Sep 2024 11:28:17 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-104R0050a85ce99-6b80-47eb-8868-df5f6923f433,
                    81FEEB5978853F9BF3B0EAA5D8951869BE0D21DF) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp:176.31.238.120
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 20 Sep 2024 13:28:16 +0200
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
Subject: Re: [PATCH 1/2] dt-bindings: leds: bcmbca: Add bindings for BRCMBCA
 LEDs
In-Reply-To: <20240920-bcmbca-leds-v1-1-5f70e692c6ff@linaro.org>
References: <20240920-bcmbca-leds-v1-0-5f70e692c6ff@linaro.org>
 <20240920-bcmbca-leds-v1-1-5f70e692c6ff@linaro.org>
Message-ID: <e883f80b1135f547896a2fb59f8b6997@milecki.pl>
X-Sender: rafal@milecki.pl
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6652661076435249944
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrudelfedggedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghfkfigihgtgfesthekjhdttddtjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepjeejkeekgeejtdffffevffeivedtueeifeeuffegkeehkeeliedugfelfedutdeunecukfhppeduvdejrddtrddtrddupdefuddruddurddvudekrddutdeipddujeeirdefuddrvdefkedruddvtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqlhgvughssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=VyuZkAdrcGs1c+5X7UCe+1Dx2WS7RTmJvhT5b+BmNRU=;
 c=relaxed/relaxed; d=milecki.pl; h=From; s=ovhmo3028686-selector1;
 t=1726831700; v=1;
 b=aX8DSaH7m/dNONWjbFvbuycZXoYL48mCKdQZLq7nIKqSAVCcTY3m/ufhoNqO1z9Wv20IACAc
 1UswRa6BOTqQlNXQshC2eQa1Xdr2NfyoJ78QrSMAXa1AsKieBrh1OPpjNMGL88FFSu9/MP6us8p
 UhiWlXgCM4EkyHpW9CDRZVySfV27NAhntX4X8miD6I5J3wtQqD/fycywZ3DTQudnZASu/Ux8c27
 hc6Rd6YhdKjVOj8bYGpUpg/fdHr6l8cEjnCaGqo9gaRI7yQ0K3EBDzx57VdV+R/ISHW5RcYZSQ1
 1bPcwo8f9cwprUR7g1mVO6pSE9cteJrJ0qh4+hCKRT7dQ==

On 2024-09-20 13:15, Linus Walleij wrote:
> The Broadcom BCA (Broadband Access) SoCs contain a unique
> LED block. Add bindings for it.

I don't remember anymore what SoCs are part of the BCMBCA family but I
believe we already have bindings for those devices (depending on the hw
design variant). Please check:

Documentation/devicetree/bindings/leds/leds-bcm6328.yaml
Documentation/devicetree/bindings/leds/leds-bcm63138.yaml

It may be also worth to check my commit description:

commit 13344f8ce8a0d98aa7f5d69ce3b47393c73a343b
Author: Rafał Miłecki <rafal@milecki.pl>
Date:   Mon Dec 27 15:59:04 2021 +0100

     dt-bindings: leds: add Broadcom's BCM63138 controller

     Broadcom used 2 LEDs hardware blocks for their BCM63xx SoCs:
     1. Older one (BCM6318, BCM6328, BCM6362, BCM63268, BCM6838)
     2. Newer one (BCM6848, BCM6858, BCM63138, BCM63148, BCM63381, 
BCM68360)

     The newer one was also later also used on BCM4908 SoC.

     Old block is already documented in the leds-bcm6328.yaml. This 
binding
     documents the new one which uses different registers & programming. 
It's
     first used in BCM63138 thus the binding name.

     Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
     Reviewed-by: Rob Herring <robh@kernel.org>
     Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
     Signed-off-by: Pavel Machek <pavel@ucw.cz>

-- 
Rafał Miłecki

