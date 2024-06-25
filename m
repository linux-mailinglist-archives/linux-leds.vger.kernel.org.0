Return-Path: <linux-leds+bounces-2118-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E56916164
	for <lists+linux-leds@lfdr.de>; Tue, 25 Jun 2024 10:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB0BDB2570A
	for <lists+linux-leds@lfdr.de>; Tue, 25 Jun 2024 08:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670C21487DC;
	Tue, 25 Jun 2024 08:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YcpttwyY"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86991487D8;
	Tue, 25 Jun 2024 08:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719304433; cv=none; b=XdFAAI3kmGl4R9tegP+pka5O8lc4ne2huVim6X0uiBqU1vY/rj719ySliDQJaQZMg4HzRzVEtjZDxfheC31q1wMClLthIXvpxQduCxMb5phX0wM7Ku7TJK8Mil7f85JIAU5Gep37nqXjfMm5tkn0lEuzKNS8AfsA2dT1IhK/h8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719304433; c=relaxed/simple;
	bh=qUiCiqC9GjOXjpDqJDzGglq2DQBYlmLGvM+DwbLoGT8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GZIeVO2lZNrtzb8/V/DY8AuUEkPxvn22SSJtxUet9ijimJXAhuMHRPQUynqDbsc9V/P/Z72SRKzX0LLnzuECXXe+IsOfEb1xMnM5crhZEsX6d5Wg79xhnxC1v1tT3QsfHsovMSmbeE4V2Q2OMa9RlRvG3yOfFFSVIrTfXPJjYts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YcpttwyY; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADE2B40007;
	Tue, 25 Jun 2024 08:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719304423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ovx21pLRuAxb+/yjFvgIIMXLhzJEwVSptulPdjJOChs=;
	b=YcpttwyYgg8o5uYYocK+zDh8jLoTp65dpfZrAHrUXPJA3nyuaBf5hl27yE1Xm36eKrp8tp
	QEHdwom5Ns6lBXK704n+4vJsdGowEsiJlCKQpCTyAkMqZjAdnTC78HyeS7cDrza+2FPTc6
	natEKoDPm9Kmsz9TQHpADVk019qvq5ZQ2BoNz766xC53BDTcjVvJZKZ4fQGwi7nQ+w2kwN
	7bzTyWfkKU+uwVhcxKt3J+Ig+t7gsXqBPGhDRHQSjdzb8AKC+jIvtt2s69K2PpjAb056tR
	ZabGnEIFVoveOUSkzWenl4tmrBT6PA+chYIo85tdXEFk23QLIAHDzftNhh5hnw==
Date: Tue, 25 Jun 2024 10:33:41 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Miaoqian Lin
 <linmq006@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "leds: led-core: Fix refcount leak in
 of_led_get()"
Message-ID: <20240625103341.0c53c052@booty>
In-Reply-To: <20240625100709.307568fd@bootlin.com>
References: <20240625-led-class-device-leak-v1-1-9eb4436310c2@bootlin.com>
	<20240625100709.307568fd@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Herv=C3=A9,

On Tue, 25 Jun 2024 10:07:09 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

...

> > Fixes: da1afe8e6099 ("leds: led-core: Fix refcount leak in of_led_get()=
")
> > Co-developed-by: Herv=C3=A9 Codina <herve.codina@bootlin.com>
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com> =20
>=20
> As there is a Co-developer, you have to add his/her Signed-off-by:
> https://elixir.bootlin.com/linux/v6.10-rc5/source/Documentation/process/s=
ubmitting-patches.rst#L494
>=20
> So feel free to:
>   a) Add Signed-off-by: Herv=C3=A9 Codina <herve.codina@bootlin.com>
> or
>   b) Remove Co-developed-by: Herv=C3=A9 Codina <herve.codina@bootlin.com>
>=20
> Even if I participate in that fix, I will not be upset if you remove the
> Co-developed-by :)

Dammit, I forgot to run checkpatch... :-(

Sorry about that!

Sending v2 with the SoB line added.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

