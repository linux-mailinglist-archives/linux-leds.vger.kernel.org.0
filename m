Return-Path: <linux-leds+bounces-7799-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEg5F/Vq6GlZKAIAu9opvQ
	(envelope-from <linux-leds+bounces-7799-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 22 Apr 2026 08:30:13 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DE7442691
	for <lists+linux-leds@lfdr.de>; Wed, 22 Apr 2026 08:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8591B300D0E5
	for <lists+linux-leds@lfdr.de>; Wed, 22 Apr 2026 06:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDCFB30DD1F;
	Wed, 22 Apr 2026 06:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7J8FV05"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A7F3009D4
	for <linux-leds@vger.kernel.org>; Wed, 22 Apr 2026 06:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776839407; cv=pass; b=G0wm0Rus2Db2ssHx4L9XgGl6LtBMYd5GZ0fWzk/Iv1SWPMoL4Pz8g5HMcCHlfh3t6f+KBHua5af1ElVvnDQ4aL0riJZcYT+HIf9LKHBOk+06vglahK+UU1gNTEnZWldaLTHFxtZP1Py+wwq6QnGzOFni/CrEcEGMCNFVip1YFhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776839407; c=relaxed/simple;
	bh=N/aab0P1/zcuAtJ05K8PuDPEsKQcK5U1IySWx7B6g7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QyuQM40Ivpylbnk3ouC8guVXVcGKEu37gxZk72fdQqDD42eKiKjziFxKi4sgBQE7gf5WCG+M1HOHIMcrjVuV2SNwWgXL7ruSCXFBJY+uIkANUA4huymDPA0vW/D/uWWkzWOCX/IWGGxj5yiE5b7ztp4Zwm6kNeiPhsJCXxy4RKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7J8FV05; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-441209fb77eso935308f8f.1
        for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2026 23:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776839404; cv=none;
        d=google.com; s=arc-20240605;
        b=RkUprtU02RLe/LBQi9nBERMND/g2tUYy1Q0giCh127sR2CfI5f8WDVDFrqAkCDonfl
         /s/ckOxSAAw/+5ReoxUV5Cnhih6HSCn+hh53dW5tWV38Hr/cBqTUZmFMfxcKJHcrgcIz
         SKf2D3CQqAUlyYdaE3R4Qo/Pz4a+kFFNppxFvHuKf6Tk4ZfUjTrxGD8CKjOSEyh/HCt2
         bT54XclAzkbTWpN/uXgAaibbzGnt9tMeTNb8/MKtFvvZ5pITfGCib7kM57oYzQPMYy0z
         587WMpDs5cNIgYog+ymcYWHA5un3SdcsbIfLVI7gr+H6Rekethvv6g2lGxVq8ysPU2IU
         +mtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uA6c/hB6ZpWWtCuvOFBMWF6uspzTjy9pMfgJw70A3Jc=;
        fh=JnoxO3GcCUkkk+ePckzphrmzUwlJWW+c1XOPaj883K0=;
        b=jFQ4sRXbkeEcMVEcGLOYeq5CmE+Q85nhG+OD8WVT/lZXrP3MjW8K+XvFYN2QO191y7
         zbN5gRby3o54dT9SCDuVOIa4CvFDhbZIzkd2qUJS0RjL1so1Azmii8v902EIvPm+te3f
         UNbvVnOwbb1sQNQPL/rSAxXTGk4CFNcdilz/Q9ZzZbcPOGTGz7zlvGZQyK4J9M0chHdH
         0vCprArB2j7l0OszAg46QhXi/exZskrLRkKdyDRX5xqolE6fwuaL3ak73t3TZfsWxbtm
         FaqmVqCXp26eJQf7BH9/zO00nAueBlzTQZ8iANHZz9iagYJaMAKkrztqGyEiu0dYZISN
         L3ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776839404; x=1777444204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA6c/hB6ZpWWtCuvOFBMWF6uspzTjy9pMfgJw70A3Jc=;
        b=G7J8FV05RLy8+mWTi/dsxyKZPUPWLk2/zBOM/1xz8ByLwT/ghF4XexMUttDdX+XgfC
         IqHfpN4yhFHKSk9uJpCNM59gLroeIzTCygttourgcoCTwqyMCNXW2bVGA6I+c03QyMOF
         KDpozqQ4nO/8H/jgbaweAUqxMZHdWoZOXsiW0AelQLIU7NwBCv3aoxZVDIPuFFkS77CO
         A5Aw7+OlXLsf4kUagEH0lgIXwSqqG/yWfZPoHbBGsY5YPrYgsOPNF8NVjS3usCE51oA9
         /iwoCjwdYp1PGriYuiPuHXbdNldErYfp9FN4zxvgvnhAONLKXG/cA1dngTbi3l95PzPn
         vDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776839404; x=1777444204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uA6c/hB6ZpWWtCuvOFBMWF6uspzTjy9pMfgJw70A3Jc=;
        b=F/5rFpj0cB7J7M1TcnZoEgvSZAQJR2hL6FE/ONuAGDGk/WZAKol9YXl76ohFxxDPP3
         Alvr/YoR3hR+ZT7pmaQ7ExkOYTlLzKfnqmdxA3egvbUj88ocCDq7dQvllAOOoyacjxJa
         0A51u7bJ5xovWjJSlYF5SJpbmuhY+1BCHOddGoACR4cPq2aYBt1xeCbO4/DkrdCbTXIy
         fH7GNs554VeSu4el6bLr9SNHr/hxyWfKkRImXXyXX55Yo+DwYqofkqlEdPt3lRIrI5PZ
         elzJehQfWFbYdPa4qP7MgLNvjN+fRSgOJ9AQ0HPXdfcs1zrQnvlyLT0W/AWcSTWhcpdF
         P6Mw==
X-Forwarded-Encrypted: i=1; AFNElJ8DJcs53sinagl891NDHaD1DcMOnCVFweWRFqR2w3w4eBj8GBdSjijk1wY+DmT8Yn/ESqEFS0krsx95@vger.kernel.org
X-Gm-Message-State: AOJu0YwEq5ohIsxhSaVPSwtJygsB2cQq7YQQRKK78n35iRmQxomt1GVN
	kq3zk7ECtF9huxAUcK8os/M0hQdgwB2kWa6oJq3/VhqpnkQhL0E3DISmMQBckONzFTPSbU/cqBk
	LQ3wf0gPm8cWbXlLl6a3iMqkNFwFJUqU=
X-Gm-Gg: AeBDieu/86EVpwLjCRHEcMgR9zbqGQYdchqwADQzMFCIafMyMmUCgCuZ5RoaCw4YlTU
	0zOKJcyvXoRghUf5s9GWBeTQNv7N1LjJ2tTVe93kbpkuSxPnyuBEDjvXaAt/IEX6W3ds/7dKcJF
	RXduxlPn05xT63GLQp2u8sjaXTOCJXMygs2hgMWv1ubCkgWzSk63Wj4/wEmStMiPJtu6Ruu0tJ+
	icMg273DRFJwB8VF5wIw8PR7mz4GWwkRXZhO8mwKtU7kXzYDy//tVExChrJC/xbcaIr8IRBRJ9V
	pSqHkjhYVdRdyuQaQR0=
X-Received: by 2002:a05:6000:208a:b0:43e:531f:720c with SMTP id
 ffacd0b85a97d-43fe407383cmr31782916f8f.11.1776839403432; Tue, 21 Apr 2026
 23:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419093412.40796-1-clamor95@gmail.com> <20260419093412.40796-6-clamor95@gmail.com>
 <aeepbB72uWDxvnE_@kekkonen.localdomain> <CAPVz0n1sNoJv=JcAZdv3srRY0vecrRO0spnqg58-VLnYdkfPSw@mail.gmail.com>
 <aefXJebe2F4Z193F@kekkonen.localdomain>
In-Reply-To: <aefXJebe2F4Z193F@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Apr 2026 09:29:51 +0300
X-Gm-Features: AQROBzAhN7JR2HJrSfb1mWoH-p2DrxcB5H5ma8lTP3SIqR0-3wJUIBxxFdGDYh4
Message-ID: <CAPVz0n111oHa2UdJ9LO8PTYcRuAmUem6tQdPKABRq1YHH8ZDgw@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-7799-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 05DE7442691
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D0=B2=D1=82, 21 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:5=
9 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Tue, Apr 21, 2026 at 08:32:16PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 21 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
19:44 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > Hi Shyvatoslav,
> > >
> > > On Sun, Apr 19, 2026 at 12:34:12PM +0300, Svyatoslav Ryhel wrote:
> > > > @@ -403,6 +423,60 @@ static int lm3560_init_device(struct lm3560_fl=
ash *flash)
> > > >       return rval;
> > > >  }
> > > >
> > > > +static void lm3560_power_off(struct lm3560_flash *flash)
> > > > +{
> > > > +     gpiod_set_value_cansleep(flash->hwen_gpio, 0);
> > > > +     regulator_disable(flash->vin_supply);
> > > > +}
> > > > +
> > > > +static int lm3560_power_on(struct lm3560_flash *flash)
> > > > +{
> > > > +     int rval;
> > > > +
> > > > +     rval =3D regulator_enable(flash->vin_supply);
> > > > +     if (rval < 0) {
> > > > +             dev_err(flash->dev, "failed to enable vin power suppl=
y\n");
> > > > +             return rval;
> > > > +     }
> > > > +
> > > > +     gpiod_set_value_cansleep(flash->hwen_gpio, 1);
> > > > +
> > > > +     rval =3D lm3560_init_device(flash);
> > > > +     if (rval < 0) {
> > > > +             lm3560_power_off(flash);
> > > > +             return rval;
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int __maybe_unused lm3560_pm_runtime_resume(struct device *=
dev)
> > > > +{
> > > > +     struct lm3560_flash *flash =3D dev_get_drvdata(dev);
> > > > +
> > > > +     return lm3560_power_on(flash);
> > > > +}
> > > > +
> > > > +static int __maybe_unused lm3560_pm_runtime_suspend(struct device =
*dev)
> > >
> > > Could you change lm3560_power_o{n,ff}() take struct device pointer as=
 the
> > > argument?
> > >
> >
> > What benefit it will bring? Unless you propose to use on/off functions
> > in pm directly, I don't see any benefit in this change.
>
> You get rid of two redundant wrappers.
>

Noted. Any changes required into the other patches of the patchset?

> >
> > > > +{
> > > > +     struct lm3560_flash *flash =3D dev_get_drvdata(dev);
> > > > +
> > > > +     lm3560_power_off(flash);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
> > > > +{
> > > > +     unsigned int i;
> > > > +
> > > > +     for (i =3D LM3560_LED0; i < LM3560_LED_MAX; i++) {
> > >
> > > You could define i here.
> > >
> >
> > You mean:
> >  for (unsigned int i =3D LM3560_LED0; i < LM3560_LED_MAX; i++)?
> >
> > If yes, I would like to keep it as is, it looks cleaner to me, and
> > this part was transferred from remove as is.
>
> Works for me.
>
> --
> Regards,
>
> Sakari Ailus

