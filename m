Return-Path: <linux-leds+bounces-6389-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B42BCB0526
	for <lists+linux-leds@lfdr.de>; Tue, 09 Dec 2025 15:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58A3A30446B3
	for <lists+linux-leds@lfdr.de>; Tue,  9 Dec 2025 14:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D172B2FE566;
	Tue,  9 Dec 2025 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmZK83vK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459EA2D3ED2
	for <linux-leds@vger.kernel.org>; Tue,  9 Dec 2025 14:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765291493; cv=none; b=WC1RENE739ISEvF0BeLnBz+08zMaF/2XNWWxZx8UsG3ya75K+EhswFjucjVt0YRwiTE4b2py91+4mod8O+l22d9QAoT+Jw3nXlJXUCAoK4PJGXFlXcAU3UbraKH5gcLsSN9x8VP6Ty22TMwBBlvt26TLR1MRLqmBNXqjvQEz86A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765291493; c=relaxed/simple;
	bh=BlpAZCDnwHr9455jjRxretpQo3HGozhGiH/ICIs6jYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXKFZWym6c5Hofxug3gXf8A0guRrGn3BjXD+DFsELJQ11519by/k8tC7ZZZ8teJd6URQ76t8Y88LwTo5iYIFvHhbp3FAaA2C8FbJJnfKX3Xl8Hhh7RyRmFZqiYF576MHpXx7Tiz3ecTilCBn+YlkNMpyFRCu9RENWeMghvjy+l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmZK83vK; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b7370698a8eso784082566b.0
        for <linux-leds@vger.kernel.org>; Tue, 09 Dec 2025 06:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765291491; x=1765896291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmmKyXizmwFRHYBw+rj6ApnRSR2KMeEtE9aA5GHfniw=;
        b=kmZK83vKqzh6Vq1x4hFsOTwevQZdkoZM3fJ6aQvgFw23PCyVKhgafjhXesY2iccfcP
         hG9pLM7qkXlnxOm+q9ORoE4L7VkxU+X0Tpngcdijy7pfq3shLN6R/xFfO7B1JHm9SpxS
         5cNHDpRu58pPif+dGAqtr4m04BjmPFXpDi9LBItVG5MLw9BSWXEHrvmsiXkT13LKvM5H
         Uj6F+39Wfv2uKnKCSoJE5QLjzu6dzrOM5W4lbny3DGzM0jU42GWh5n1IrintNLPq0Cy1
         tG+dLMq1EI2I1fXPeixWkQPbzsq2RiAJqSmMxzcewgcx1/lGghFw0r6YmaNDXCRhiBOm
         jlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765291491; x=1765896291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pmmKyXizmwFRHYBw+rj6ApnRSR2KMeEtE9aA5GHfniw=;
        b=um2NZ5N0X0aTL5kzsQ7RH7T0s1WT3uyC12EKZyV9as0af8+sDwtcxSvwlMBAq3eJNp
         SADLibxxbeO1seRp5uDHn8C9XxEJSXlBgZuZsFqzqQEdAK7Vs0vx1RWJoLS9MYRoYGU/
         LUYMcB/hA06rBOd++TJ16gQ0ZaCUbfhN1PV4o6tIj6sm7+0d6pDbI9uz7z5ts320YXAo
         xlNtXilEfZmN75ef5jeNlJAfm6bjYKvASDGT+9VuHM8mUoFkcapbNQpBr7JsX4LbOPGH
         4Fj5qImSogxdD3hbUSybJn3iaqFPTn29mB7Foe3clKurfuzfA1P71maNODemn3CKg7CM
         fWag==
X-Forwarded-Encrypted: i=1; AJvYcCVpYVz4Y30HyDZbE57gtuzrJpBuGv4G/Vgr0s8YWDjmF7UoI8G8q8wWvr5AbFaRVO1lvf6OTU+x1U+4@vger.kernel.org
X-Gm-Message-State: AOJu0YyZgTJUPqmkMGjlOAqhn7p8X4rH0l11UPcS2GaTW5xw70bIeXAh
	lu0Yy208va1J+Zs7yXY4GMrFwAOw9xQZ6++g8pKL+cmuaB4Fv5XKhz6YqYguY7uBdCb7w0ZJtel
	eYZyoeU7+HkfBNVm8Cf/ju64nJ39nEvw=
X-Gm-Gg: ASbGncsrI17+TVCg4mHjBG+StFUsEohdFv9flt8FYXklbZp/Y9/j4bhySCg4n7mfYW3
	2PnxI5Pu8WcOw9mMugXc/hnQUK4F5xUy7nAJaHUtF7ETmG1TVvuviMXlCF1KvpEPvh0DevE0hVD
	VzoAKJ5Z0/zJvxbL8ayNK+AI2MEaTl/gOMyHNStzAlx8ErBPaCGYDuV+DInVQLqRIkfLmcpWbGE
	nj4d8FTJCrke/gSTduErerU0Zm9BedJGF/B41YVrsZw/bSjxsM9n2TuXKRIDPd3UWGyHb1VoQw8
	0ADsKABkWvmhY7Xn3dpDjeRuBNeAT5rWCky5VvGLQUQoAMhBtOETju5xvw5aPWEs2OBgGV4=
X-Google-Smtp-Source: AGHT+IFH9ELHERV4YaUpPOa7MyJWrqa7aJnusg8/a7Ft5iBxRVwlgdxdr0WXpf25/lLlbkE4uM68CVbFu3PMd6Rpt68=
X-Received: by 2002:a17:907:7291:b0:b6d:6c1a:31ae with SMTP id
 a640c23a62f3a-b7a247aba82mr1183196366b.49.1765291490506; Tue, 09 Dec 2025
 06:44:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aTfIHE_2-iKIrwqv@stanley.mountain> <CAHp75VdHEVsj9o1UPSS1ikJYofDuiA7KwUaj8v79cJ3Xs=N5xw@mail.gmail.com>
 <aTg1F1MH5qnmUkaG@stanley.mountain>
In-Reply-To: <aTg1F1MH5qnmUkaG@stanley.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Dec 2025 16:44:14 +0200
X-Gm-Features: AQt7F2rgX69gYV5TWTkxNL_ItPlQf6G8DMs45VG8H7QohvS2dfJkGwFckj1exwc
Message-ID: <CAHp75Vc4O-fzsAuSY_zmpXFROO1Qa+7WLUVPuZm9uxNj00kZ3g@mail.gmail.com>
Subject: Re: [PATCH] leds: rgb: leds-ktd202x: Fix error code in ktd202x_setup_led_rgb()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kate Hsuan <hpa@redhat.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 4:41=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
> On Tue, Dec 09, 2025 at 04:14:03PM +0200, Andy Shevchenko wrote:
> > On Tue, Dec 9, 2025 at 8:56=E2=80=AFAM Dan Carpenter <dan.carpenter@lin=
aro.org> wrote:

...

> > >                 if (ret !=3D 0 || reg >=3D chip->num_leds) {
> > >                         dev_err(chip->dev, "invalid 'reg' of %pfw\n",=
 child);
> > >                         fwnode_handle_put(child);
> > > -                       return ret;
> > > +                       return ret ?: -EINVAL;
> > >                 }
> >
> > I think the better fix is to split the original conditional to two.
> >
> > And make the message something like
> > "can't retrieve 'reg' property of %pfw\n'
> > for the case if (ret).
>
> These are never going to show up for users, the messages are only for
> developers bringing up a board...

Even better,

  if (ret) {
    fwnode_handle_put(...);
    return ret;
  }

  if (reg >=3D ...) {
    ...
  }

Since it's a fix likely for a backporting, the separate change can
move to the _scoped() for_each loop and drop those fwnode_handle_put()
calls.

--=20
With Best Regards,
Andy Shevchenko

