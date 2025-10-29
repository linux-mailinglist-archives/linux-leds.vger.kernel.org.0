Return-Path: <linux-leds+bounces-5937-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC41C1AA1E
	for <lists+linux-leds@lfdr.de>; Wed, 29 Oct 2025 14:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 75AEE5049AC
	for <lists+linux-leds@lfdr.de>; Wed, 29 Oct 2025 13:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9EF34320D;
	Wed, 29 Oct 2025 13:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wSayh/xO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F09A33F385
	for <linux-leds@vger.kernel.org>; Wed, 29 Oct 2025 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743353; cv=none; b=eS01q+j6uWDmLX56v1D9wPCs+Odimgrb8F7pVSwDHqCBS8ZznreNuK6bhf0uacl/30ykcVFZBUDQm242mvH0fDmjVvz4o6FR6rrPYCGSqGsFNRqXSey4EFtrxH2w+WzAzOrvJPUQvnBgQE0j5egUpXyuPtqYrqpCfACZmz7Vj4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743353; c=relaxed/simple;
	bh=fyeNQjPbHba2zQACV1XwHgrmcj9u7mbSw/E0lwVQwQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RhixaiLcbRq/kde905ffSnem2/KekVyJhlMVJ6QIG7Ic1/1o5ulsU53a6uTLt9bAy4RmHnIPFHUZbA7cRO+ScqBrO6U17+pyRKKu3P1iwGFGNQgYSqudDmySjRcGVuuXbDvwXLHlUvEbRttCQUSihGFxrDNw/oaoKdKsYr+ILNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wSayh/xO; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-592f098f7adso9277202e87.0
        for <linux-leds@vger.kernel.org>; Wed, 29 Oct 2025 06:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761743347; x=1762348147; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpAhRZEcISe/L4obGO6K/aBf0H3CSDRAh1WJSbvQ7BI=;
        b=wSayh/xOnAy3dXi4ntAukqEAHjvP9ucW73ZNIZyHbw2cHQsLL1Szf+DGPNGYsn58u6
         J0lwB0G/6WXg8TK1O1xAu8Frak99gd/QnbDsG5k9aR5NWpMNTDbuTL7oxRWZPWpRSOFx
         xVvP+51Ubm/kNNqZYitAOZdba2XhAhmt56BKrWjh3RH4FNJICFR+nON5Pti46FzTT5X3
         V25xSseaffbJRROIyrMREOd1AAqVkx51lYyblWTF4trc7wR1xEMOfoXA5rLlso0sYxnx
         sgyo4EO5o2qzKCCrqcLaGoGl+Pw64TwIG1bOSVwYd4/QlwFZqZYmuo7DnuaZmUHhVtZr
         9GHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761743347; x=1762348147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpAhRZEcISe/L4obGO6K/aBf0H3CSDRAh1WJSbvQ7BI=;
        b=UoBOtkCQ8X+NO0yKexa0Blp3HkstApUzEgbye/lh52gkyOZcwzNUFdFkZCOEmQCtti
         gvSqxczxMYVsOL+Tmk5JrGi6E8wMc+pztVE8fEXSRF9AG1CI6vgw887PEKDW9iIM1zXl
         bIiZ5TPBWfkTWUNhigg6X+0cHNdGLmTCI066yuqO2q9gGJaxmjvbx8NKzfsgfXyMbLnH
         CL01hDcHOFMzNm7E2TRE4SU8Gudc39w/QmhugKy0GeQW9Na1w8oAowJinc55GPstVWfg
         +ZhxIlHo42YZ0rL4e77KYE1knh+S6t4SQy29y3JgvlfIEOWPauq7dVakNhsIRNT5QLQC
         nhJw==
X-Forwarded-Encrypted: i=1; AJvYcCU39wSrGYB25LCSXcIIVxlMlLUki0avYh+ChTxbuFm/uUDuZwdnHSAHIQ+M4Xuqln3hGAqHcoDFP/Ts@vger.kernel.org
X-Gm-Message-State: AOJu0YyZv+iBpdPD6oy4/gWv4IyZZsf/aGQtWI///Jj/qCNTG7LSeVzQ
	gAmaptC7CD5j+W3dn/xOixG9aq2tzlxjgRJue3e4p0Oo4a3fczwJqSbxG3ZDfK5Sxz+aRNZG7qR
	2u00VZa3nOX01JwLckw7dh71W1M2nn0tOQxTXYfYahQ==
X-Gm-Gg: ASbGncttjvhejPuctimi2JFcLOpbPvNUZtLVGdhtQRxi84N2veXw3rOpw1L+d52RAn7
	evf4lHJwYcflAcf56TBXk14zUbni4chKnI4+DAWEI68fYLkX7871bHe8Wil8mKgVZdmgVyzZCOb
	2fXP4+l7qP39QAWTgPeBQjwP1Zc83r74v9+Fv4/8EF0h9KrPmncM65i+s+z4DPCCYdA0icmhF/R
	qFOYgjeu4Gvr8De3do4r6fDG17SzG5sGf6LhREjJrITxzvbxMSt+o5hMfUv
X-Google-Smtp-Source: AGHT+IHoNXhvs7nAEQT1Pr7YoG6bCNTomzDjqEik5GRK5GTNnbmdXX4kn01zdcQcoosBSkAxyYQ6vANHvlPp3vj1L2g=
X-Received: by 2002:a05:6512:3a8a:b0:592:f449:cbae with SMTP id
 2adb3069b0e04-594128617a3mr1173473e87.11.1761743347041; Wed, 29 Oct 2025
 06:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761564043.git.mazziesaccount@gmail.com>
 <a5957c4f83724d4f32527fb892fc340af4eeddde.1761564043.git.mazziesaccount@gmail.com>
 <CACRpkdYEUdJRvNPKhxx7orYHH3OE6BXXjrG9JVJo5MDHGKE88A@mail.gmail.com> <8b5dbbf6-bbde-4015-b0d1-12d6ec770ceb@gmail.com>
In-Reply-To: <8b5dbbf6-bbde-4015-b0d1-12d6ec770ceb@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 14:08:55 +0100
X-Gm-Features: AWmQ_bmctKf4r03BFEQZEB7--T8kdCIHNsOEFNutvbq6JrwVjRi4Ptn1KMtyXrQ
Message-ID: <CACRpkdaK52wY7MYhnqCqzOAFVu2V=NejDTjAAhkxhf9rmrV8iA@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] dt-bindings: mfd: ROHM BD72720
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 1:30=E2=80=AFPM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
> On 28/10/2025 00:42, Linus Walleij wrote:
> > Hi Matti,
> >
> > thanks for your patch!
> >
> > On Mon, Oct 27, 2025 at 12:45=E2=80=AFPM Matti Vaittinen
> > <mazziesaccount@gmail.com> wrote:
> >
> >> +  rohm,clkout-open-drain:
> >> +    description: clk32kout mode. Set to 1 for "open-drain" or 0 for "=
cmos".
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +    minimum: 0
> >> +    maximum: 1
> >
> > I think CMOS is the same as "push-pull" ( I could be wrong, but I think=
 I've
> > seen that before) so I would probably try to use the pin config standar=
d
> > names as strings here but I'm not sure.
> >
> > rohm,clkout-bias-open-drain;
> > rohm,clkout-bias-push-pull;
> >
> > Mutually exclusive.
> >
> > Or maybe use the pattern from rohm,pin-dvs0
> > with string enumerators?
> >
> > rohm,clkout-bias =3D "open-drain";
> > rohm,clkout-bias =3D "push-pull";
> >
>
> Hmm. I kind of agree with you. Still, the way it was done in this patch
> is used by the other existing ROHM PMICs (bd71815, bd71828, bd71879). I
> am kind of reluctant to support another way in the same driver - and I
> am also reluctant to change the existing bindings as that sounds a bit
> like asking for a nose-bleed :) (I've in the past worked with some
> devices which didn't update the device-trees when kernel was updated...)
>
> Do you think you could live with using this existing convention? :)

Yeah if there are precedents, either we can reuse that or we need to
change them all, and that invariably involves deprecation and re-implementi=
ng
the parsing in several drivers in that case, which is annoying and
takes time.

It's fine with me to keep like this.

Yours,
Linus Walleij

