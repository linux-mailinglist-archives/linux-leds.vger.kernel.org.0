Return-Path: <linux-leds+bounces-7765-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGwtJsop4mmQ2QAAu9opvQ
	(envelope-from <linux-leds+bounces-7765-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 14:38:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A8A41B450
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 14:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 114473058483
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 12:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6332A39BFEC;
	Fri, 17 Apr 2026 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKvfZEOF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4240538AC8C
	for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 12:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776429475; cv=pass; b=XoMJ7Okc5/wTJVCpYJtd2NFaRPFkG+x0W0j9YcyMbziZ36VqFyC0mcoE+9vfwLPBx/bDtSLj8Kbn5erZKJDDHeFtQKIVk9wJLjDJaRyfkk/dmVv1UgLLhMEYz/fC2h89hvSAaeq5Szi7xC7VgnMLpqnzLgMmqvqXAkONtKA2rME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776429475; c=relaxed/simple;
	bh=oIu6DN+Yo1GS9V6OFVEhLzwsWKEJ4+izexh3mPX7P/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6TQ+ywBXNkv6rGnxYTp+xfO4nHJNHtFmINwTpy12IdvK5oyozHp3ZimzrnduQ5QNeQuWVuLKjt6aPchIloYrKn+A3biE+DTim42m1FknaVXGat7sI4Ai4+/X3vU3WtpRRJ7NI7ktwEfptdKk5ExZEYK4Ic5w4dVANIWW+mFlwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKvfZEOF; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d7a5e77b1so470929f8f.1
        for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 05:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776429470; cv=none;
        d=google.com; s=arc-20240605;
        b=CSUwKx9CdJq5SHd7vVdBKzKuBWfaqShCYOfRg+A2XM4jsgxdNLzJYZEcUPorAlVUkg
         cDMn4EZcF+UDJQcF1kLTn4pCQkDUIZJl3EYRKCwzzGVS9Gb7wGkC/8Z/79ujxa/ne6rv
         zXKEfRETu2ubhQae3phLlXQmDGPHxFfxo+66c4hBfCGAZPy6dTTfkq3DA3DPbuZCsLxz
         WXitpdt1o53Mt8tk0zNNrtM/OGqIlZQ8Qsm/Pe9fY3EWgxgDNtg5zjM35/YhfKCSd6P6
         P79RNTV/Gq+66Rw9ki4JY/YIifq2AOpgOo/44MTjTBZyR3RrHn0EEg1zuAzYkY6pg9dj
         2fNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8M8W+2/vzBUP6Rhy7Ku2bFhd+eWXXf0DKZ7ykkT4Jdw=;
        fh=9jIqXfROldwDz27w7ECdFAYtJyiKv1a8cOj50d0t52I=;
        b=elAgOfxkv99Sh/W2KEFcR1zJc+oNeOzcAKbiMCDhRFgqD8VbS+aOSKBcOM3viLHL4h
         9R9oTHlaDyxPOFsnyIVA465OCF8ssq+4IV8SUuPNprvd6R7d4W1BZvVy1lHrIU9mht4d
         1CCMEjJXV6ufCu0yF0SC2++/zIVfxod6RQuKdnhF5VfLZpgSmm1XpmML///brQfDBzZx
         Gm3uOOKS/o2jeq2Vqzik7yyyOt/CYvJf2YQ2Rpotbt3hr7n6PZSiVpQKoBoXCfB7cv8l
         bdSt9kKOfhFq/vdOtzKHvPus/CIavXQ+EXuJS50c2L03ThLPFGpOUC9PXiic4oyLr4xZ
         NC/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776429470; x=1777034270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8M8W+2/vzBUP6Rhy7Ku2bFhd+eWXXf0DKZ7ykkT4Jdw=;
        b=DKvfZEOFlif43UowkBTiqnBqo4w51hQ1NFE+e3B9wKKJmkL4Dnk3gfxApDI3ObV9i1
         RzS9mvQ3X/R7E+DPEnUSs2AhquNJuCPY7v4Fxdp8ID6l7VihnPSBXV/V2o7+atG/TYUa
         g39OwaJop8TMOXSsDrdpQ3o+v2t1jlG4ca0YMuHBJs4c/CBiaquJ6nJka/DLSi7f3z3r
         H7uduTF2cSl4ZGjxgWcMrkdG3VD0TrbK3IwHaBDau7r7ziu/S4aLEZO9lVqZxwmHLo7V
         KB6FZ1EI9zs93NgzJjHfneT8GEXgZ5lwX8sbwzrv//QnhECprjlcu8U/PC7ctZzyjQ9W
         Xjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776429470; x=1777034270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8M8W+2/vzBUP6Rhy7Ku2bFhd+eWXXf0DKZ7ykkT4Jdw=;
        b=Ht32A4fVCUmuAZYM3z3/TSn6P4ikkO9K7qD7bC5+s5ptcX99AkIYUWFGKMqaOM5QUU
         Se3nWrZ9Sh/WqEh15qtSQQmukiB7QNrptXVCSW5CwGG9YqfqklnW6QhwgOS8B0LpeLF4
         mrnw3Sjwxp+76Eyyh8z0NbfdhBncLVMYp2eclLNqUlFwGfoGBg9VMGNqU+nk7dqSt3Ft
         cFmzBi0zAmV3eivgK82F9a4H1jQpZ5OK+q1ZmJFPAJTQCKYsHSV+zLXDrNlU5M4jNBdG
         Iak1gpFMmcYVUAXJ2xN95l0pQgDJZULb7vqZ8LQ2Jz4wKwlkp/n9zYsyQBLyezR8TX1J
         r81w==
X-Forwarded-Encrypted: i=1; AFNElJ9tphZEWhbr7zNJQdFWdtDrZVQ8dzoVI1AEmylOBu15uII1Xf/qZa16bFSTht/uq7NVT4k6NdA3g3t5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvv1JU2DXe7gZDIYeXpujNhD81UcqPVEb+QvKw8Lzwa+CLSviE
	tbstMwhLvCnmedUbhKX6PfefHhPsFHDO40l8TIq7mn0H4UESC8+HgGsgIC4L57mylA9ypccFkYM
	TGSPbE6oAzrQ6TpQnBdFbbZS7YG2xMfM=
X-Gm-Gg: AeBDieuvbqh+Z6j3vDO51VN8xbnV3K2fC/I6YMs4+mGJxV4iq3G5zwN1jFzIZSw3WF1
	lR93K5wcdHQpyPW2NEvhIndrTEnWmNS/J0KOAnKW8f+3QZNukD+f4mSB6Db41ElLmOHbFGr32NB
	ITc/I7HbDPdBXDW3qrYydSnS+AhaLOje8cTO/46FRzE1GI0oULgXwTySWxY+IxIuBTboDrjer6b
	NQISNJsE+nfqJcUqL1zy97z740K4cBbwdUa+dqHpU8+lNGyfMFQm7mS8NpRfFqhGGGv8T+gbUI4
	BB6KtmnDIiy6qjumq4k=
X-Received: by 2002:a05:6000:1ac5:b0:43d:73d4:b1a with SMTP id
 ffacd0b85a97d-43fe407c0d8mr4468477f8f.19.1776429470199; Fri, 17 Apr 2026
 05:37:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417114226.100033-1-clamor95@gmail.com> <20260417114226.100033-3-clamor95@gmail.com>
 <aeIk3z8f4dvjEXBQ@kekkonen.localdomain>
In-Reply-To: <aeIk3z8f4dvjEXBQ@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 17 Apr 2026 15:37:37 +0300
X-Gm-Features: AQROBzCGajxfHOMdb-jAWC2IPNr-tHIUYgt6Ny8fWbZU1eaEM3yL-TGQmmJHhU0
Message-ID: <CAPVz0n0vf_Re-4s4ygOP8aAMA+b=o7yM+UYVZiRUfkrJ931J2A@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] media: lm3560: Add IN supply support
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-7765-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 12A8A41B450
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D0=BF=D1=82, 17 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:1=
7 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Fri, Apr 17, 2026 at 02:42:23PM +0300, Svyatoslav Ryhel wrote:
> > Add IN supply (2.5V - 5.5V) found in LM3560 to ensure its proper work.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/media/i2c/lm3560.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
> > index e6af61415821..a2674af6c9fb 100644
> > --- a/drivers/media/i2c/lm3560.c
> > +++ b/drivers/media/i2c/lm3560.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/mutex.h>
> >  #include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <linux/videodev2.h>
> >  #include <media/i2c/lm3560.h>
> >  #include <media/v4l2-ctrls.h>
> > @@ -434,6 +435,11 @@ static int lm3560_probe(struct i2c_client *client)
> >               return dev_err_probe(&client->dev, PTR_ERR(flash->hwen_gp=
io),
> >                                    "failed to get hwen gpio\n");
> >
> > +     rval =3D devm_regulator_get_enable(&client->dev, "vin");
>
> I'd also enable this via runtime PM.
>
> Sensor drivers such as imx219 serve as a good example here.
>

Would you mind if I squash adding hwen, vin and pm into single commit?
It would be tricky to separate them from PM addition. I will add
descriptions of what was changed.

> > +     if (rval)
> > +             return dev_err_probe(&client->dev, rval,
> > +                                  "failed to enable regulator\n");
> > +
> >       rval =3D lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
> >       if (rval < 0)
> >               return rval;
>
> --
> Kind regards,
>
> Sakari Ailus

