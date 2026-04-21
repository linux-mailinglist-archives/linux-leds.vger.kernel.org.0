Return-Path: <linux-leds+bounces-7793-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CGZFN+052lU/wEAu9opvQ
	(envelope-from <linux-leds+bounces-7793-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 19:33:19 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1786C43E03D
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 19:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BE203019D44
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2026 17:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4136B2BE62E;
	Tue, 21 Apr 2026 17:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXtnpz+v"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC419314D0D
	for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2026 17:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792751; cv=pass; b=K9IZ/JKmUznCi30clsYvkceyBL3VgZeRPaypZs2zN3ARklLh3myYZq/eyvURL29sWvpNQgXCdJett5QxwYYjxbsXC9putgVzMZ7NP0fgb+AAg4pTr7q1eWZFKdaS178FluiVMazmFEV0shkJifsuu2cPxxP6UFrMI5t4Ny6f6eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792751; c=relaxed/simple;
	bh=3opUxn+/WZhxis9gCx5CPLMTFPxNfsZrec7JCcuzKuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ke0/M5U2C7N09WSW3V2B9G7x925lu4Gvn5TMWQGNuUmNgHNJVHOQFvNdh1QchqPS9P11Vy9BgLXSOEbyn+vWsmhTvpowMBEx0E4QWcTRQDW+x5GR62tXqnhzfYVsh5xPJ9EKTyJ8NEsVTzEeWXW+a5oSvQ7v5OPztRFPHQMt8RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXtnpz+v; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cf7683a28so3102608f8f.2
        for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2026 10:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776792748; cv=none;
        d=google.com; s=arc-20240605;
        b=TYa7nYa5hIVQh4ev1Zgg6lKlrsmBDgeiODvqXYRMt/xHDRceuq4RubJwEN4d7vXC5S
         qZ1NFFQPV+lbQAazgl5wOQcbB0W8kLBe0/9Kw2Inpblg9OjLKPjxcgCGnapk1MMHe43P
         4QQuUre9lAcJlvBGVOhQhUaH9oCbCTiSIN9HlcbR7DIh6YzhyjddU1Z1gdsP+MgEH7iG
         DxuuhdN6+d9OGAH2FPDwhf/8W7k8b2ULEQwzCnH3P9/Re4mdrp5lHMtfc6HIZHIMUe6q
         LuaGs4kIjOi5RyJZa0mVUzYeJsOvZooGAFCNue8MLGcpEJCwNjs1/AwTAO6XZFUok+87
         ipjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d9JZP9LdDUJMwW5ThoMrsAh4NFGwSHn55PSCzhU6IQw=;
        fh=ry9lVNbBT7YyXii1POohfPvWRzD0joUiOWH4N+cBQw8=;
        b=GL0KopfoDGi1nnxWKM20wRUWZs2aSQc2muJ3/6uOmWQGGS6X3ldzSyrlfe+p39B0Jd
         U/UeehcT51F/T6Bp7ZsiKWAKfutqdNC6GFyeRAyZetVzduKYLgUercUhxPx/B26vXl6T
         RpMpbm0jC+MhJkFZGPGH9t9EWDJ1POTaLy1SJ1z3iec6YdfqDsTNT4CJ5aJZLsJWcc4Y
         PLu1lELBq6TENn38GNbGZzt9HbVCs0OQipXIdMadq4KGfWbILPhQ3xADiqqDsjZuhPhp
         o+I7y+drO3xmNieb7C94EuvmnLrxA18xLvFuMMbaBpb/EzcaaWv0ShatIAWgLQETrsY1
         eEVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776792748; x=1777397548; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9JZP9LdDUJMwW5ThoMrsAh4NFGwSHn55PSCzhU6IQw=;
        b=RXtnpz+vVsfieKGkBLCT524hhYy58bk1vQvzrpJm5mVTZ+ffZbyMFd5NAvxBUyZ5bz
         gOtn/3Azbt27XKOtGRA3h9IDU6TDUdg7vSieHeTllDEqapXeZ8tJKuLnCHa7sHBlBXKk
         Tk9gbWGI8RZDbIthvPRYHBg9cyDsY6RLYyJ3tAN74oCagC/GSRc6jifjdgh0H1DWBQaB
         Tel9o94nHI7nmE5m8uZ0JHEgNuz8QFieOlSJCPwhsuN7OwSHgsXargSXS6geEARw9fRx
         MI2h/mEHGZamV4Rsa5x5i1UCt0X40ZuKyRND7fdlLJAAxOyrMVt0MM/sGUKMiMu82xAT
         hKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792748; x=1777397548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d9JZP9LdDUJMwW5ThoMrsAh4NFGwSHn55PSCzhU6IQw=;
        b=C0C1b4gZE+5r/Foki4pdRA53fdEzV42/ynbiHrZhmc8XJddIo1oNlhaURyIatVKCII
         BHRJ4GAYJmWRHcNXh/ljde71OnE7BdQLaBeq4GsV1Fyjc5bQkAiQUNmdbAgFzOveDD9Y
         BF4onUQ3o9Xwt2HR2Y1BRYoGsww9JJgTjLVzsCNdQUdPhk65JqvDloOUiFiZf+SP2XD7
         tRqWVA/HI9Qs0IpjcGR47s88D07nVSQ/qKvhZBQBUloCiKJV9DCiuKp5hq+V0lGZVtkr
         7U55/EJ1Y/N+4/aIyUxIf++9b+kyRKVBNyGItxu29XeTi7G0pzqdyy0s8xWRukghbheb
         rb8A==
X-Forwarded-Encrypted: i=1; AFNElJ/KxhfPp7cvzZkf+FF6eBx3Bcum3VxuRpzjrmQAlv/14dPRWn5LixUbCQMzpYvsbwYCz6fj8dJ6QPS5@vger.kernel.org
X-Gm-Message-State: AOJu0YylYLP7thODUkaUAC8921F4o9ciNUW6o5QDM5TaMMPTxGiH75kE
	qwxrZcOG+9r58umDSJxQ9U7Eaip2VllTL452QsOpeUFrwT6ciV3W5u9UEeNWflOuR5fUqjgaaEv
	nTv35jvyQn0LB7Uy6IGoRvEto2c+92D4=
X-Gm-Gg: AeBDietKT0gAVnRqIMYvbW/vmU9nhlmmqNdnLTtWwVkuAtWXk/3XROT3m/hz9zhILKX
	vxjFBQYf3uPt0M+OEL0YBEPNMEiZnktQhCd0iRJkIWqG66x/hYCZbjgQ/HeUMIV25O7ymxTcsrJ
	xb9rcSbeMO8YLtwNfv14clDuYa0CCLU8NPvWhwHb/DKByM8LHUxRd2DuL++47rK0+8hXLWe0VSk
	RatJG9twLBcuCOd9oekiMmX+DJ3Bb57bnWtotvT3CX0oHOnaNeJU5HqfWZqolKdahCbJgrG3Okj
	W8qcIwC80xISdEbJlp4=
X-Received: by 2002:a5d:5f87:0:b0:43d:1c21:ead4 with SMTP id
 ffacd0b85a97d-43fe3dcb248mr30377905f8f.18.1776792747978; Tue, 21 Apr 2026
 10:32:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419093412.40796-1-clamor95@gmail.com> <20260419093412.40796-6-clamor95@gmail.com>
 <aeepbB72uWDxvnE_@kekkonen.localdomain>
In-Reply-To: <aeepbB72uWDxvnE_@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 21 Apr 2026 20:32:16 +0300
X-Gm-Features: AQROBzCbB1odtYIeJLEi8nmSeUo4a_e5KdU6vNd6lzpNhb-P2paG9uccQadFGds
Message-ID: <CAPVz0n1sNoJv=JcAZdv3srRY0vecrRO0spnqg58-VLnYdkfPSw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] media: i2c: lm3560: Add support for PM features
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-7793-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1786C43E03D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D0=B2=D1=82, 21 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:4=
4 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Shyvatoslav,
>
> On Sun, Apr 19, 2026 at 12:34:12PM +0300, Svyatoslav Ryhel wrote:
> > @@ -403,6 +423,60 @@ static int lm3560_init_device(struct lm3560_flash =
*flash)
> >       return rval;
> >  }
> >
> > +static void lm3560_power_off(struct lm3560_flash *flash)
> > +{
> > +     gpiod_set_value_cansleep(flash->hwen_gpio, 0);
> > +     regulator_disable(flash->vin_supply);
> > +}
> > +
> > +static int lm3560_power_on(struct lm3560_flash *flash)
> > +{
> > +     int rval;
> > +
> > +     rval =3D regulator_enable(flash->vin_supply);
> > +     if (rval < 0) {
> > +             dev_err(flash->dev, "failed to enable vin power supply\n"=
);
> > +             return rval;
> > +     }
> > +
> > +     gpiod_set_value_cansleep(flash->hwen_gpio, 1);
> > +
> > +     rval =3D lm3560_init_device(flash);
> > +     if (rval < 0) {
> > +             lm3560_power_off(flash);
> > +             return rval;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int __maybe_unused lm3560_pm_runtime_resume(struct device *dev)
> > +{
> > +     struct lm3560_flash *flash =3D dev_get_drvdata(dev);
> > +
> > +     return lm3560_power_on(flash);
> > +}
> > +
> > +static int __maybe_unused lm3560_pm_runtime_suspend(struct device *dev=
)
>
> Could you change lm3560_power_o{n,ff}() take struct device pointer as the
> argument?
>

What benefit it will bring? Unless you propose to use on/off functions
in pm directly, I don't see any benefit in this change.

> > +{
> > +     struct lm3560_flash *flash =3D dev_get_drvdata(dev);
> > +
> > +     lm3560_power_off(flash);
> > +
> > +     return 0;
> > +}
> > +
> > +static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i =3D LM3560_LED0; i < LM3560_LED_MAX; i++) {
>
> You could define i here.
>

You mean:
 for (unsigned int i =3D LM3560_LED0; i < LM3560_LED_MAX; i++)?

If yes, I would like to keep it as is, it looks cleaner to me, and
this part was transferred from remove as is.

> > +             v4l2_device_unregister_subdev(&flash->subdev_led[i]);
> > +             v4l2_ctrl_handler_free(&flash->ctrls_led[i]);
> > +             media_entity_cleanup(&flash->subdev_led[i].entity);
> > +     }
> > +}
> > +
> >  static int lm3560_probe(struct i2c_client *client)
> >  {
> >       struct lm3560_flash *flash;
>
> --
> Kind regards,
>
> Sakari Ailus

