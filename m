Return-Path: <linux-leds+bounces-5486-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7684B51F5D
	for <lists+linux-leds@lfdr.de>; Wed, 10 Sep 2025 19:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 738F7A048F8
	for <lists+linux-leds@lfdr.de>; Wed, 10 Sep 2025 17:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ADA932F741;
	Wed, 10 Sep 2025 17:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxXIqeoF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2287B33438E
	for <linux-leds@vger.kernel.org>; Wed, 10 Sep 2025 17:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757526466; cv=none; b=TskceEFL6e7smXreExXTeeATWsa2UkZ+Mm3jyEyIn+grCopoTwSCmzLZRlq7bRGW+11V6qxwPrAKtpznLfK7Ipa9q2Qv/5uYbV7e5cYMrIiesBu4LSSOUkvkNId8WO43vY+csafAk9hjIPxKQAXJFy6t8aMjshBKM5mOozKzppY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757526466; c=relaxed/simple;
	bh=4cQwm7Q2pRjHNrxMhXKFmcxzEdebTfOxr8vSlGhts8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nsL5ljRGC0For6+22Hb9bXpXxvWNk3hjWmBR+LlJuahwYtgWB+11Rj8jmeaW0amP2ltnaa8z+ckAO5PBREDsQnkzBbr1vQNDGalFntquV4nMhtIzAHp3AglWipvKDmpzJaw+BFX576MhwW0vgYlD52Yt+ZkGHuDXXplbT+RTRq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxXIqeoF; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6089a13961cso2699014d50.0
        for <linux-leds@vger.kernel.org>; Wed, 10 Sep 2025 10:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757526463; x=1758131263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=043TJq6hpWw8pYqx0PWm3cQzQQkOF8ixWKwRpDFzK+o=;
        b=XxXIqeoFCiTE6dLksjPMry56lc+fBNBEuDI7T9Lr55owuYSvvejsFeYoAm5fsSwGHJ
         tYhJySfG52UcikCsX6p1kqq/jw+xHkYVcejry4QiYKT8vJ+XR1bcI1Nogh3DpsUIbHtN
         yEzO8XZEiTpb1k+g+qL8TlIi4DdXaBAF3iFTlwA2BO3dWnqhivt2I1Y8rGcqlmwcTXdJ
         B8XUQM/b+NmmrqTWaVIIUo7tNEcTJm+KRkD1rCueZ2Aw4g9yLmNWBEv1/ZOMozYT9lgH
         05hdeP6yPf/c2aT18Y3KsU4+GjF/u2XLVMWRMgKWFyQxUg4M7w7UkjhSdindYlPT9sUH
         Kpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757526463; x=1758131263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=043TJq6hpWw8pYqx0PWm3cQzQQkOF8ixWKwRpDFzK+o=;
        b=wryo5m6WaTnNDfasDr6HSgiK8Itee33OTkXAuRzw67EkArnipn7gHZbJVbZSd62NPk
         5fTNjyOE0ULlf1Rwa/1me6zINDGZ7MeDIZLnwVfYgmA5k4ricLN6xCRo+9Fu6kKLu2rD
         x2PjSaYP3eBXzQ/Gy5BYpJJfjjpze93L0/BnzkWLotqRpVajQDYpWgY2aVVxPG74PcCr
         cVYj1TFn8ni0VMYarfeoX290TgpuKueNczssAx1YDIcRRm+Yq82QbAq5BjcMRdm9YeaQ
         UukR6u2F/9j2Vzpxsw4fe9uc8JHwOGLyR71hF6ce9UgJiDGvLnosxD/+3loGsK5EUGaZ
         VkbA==
X-Forwarded-Encrypted: i=1; AJvYcCWuvGPfsBoCtZ50u3X43X7oV3PMsgTUH+V6+/lxK2XDsKYpjXMlpNJJ4ba2qNPzhoXnP68AkCv/AG14@vger.kernel.org
X-Gm-Message-State: AOJu0YzY2qAj8a39FscJhk9r6x2FEToY3N64eA2HS3HnRtuTJQfsvcIK
	48Wk9AhlGJ60S3TEHHFeSInNGhWLpGr4lXzdCdtyHrC7bYVOHRsN0ELlA66OpJpoWLpN0oTfbYu
	aTJll54aOqcZ19/2iuIsgIucZsFKH1MY=
X-Gm-Gg: ASbGnctdruiCq5xPdvueMpBFRD9CkKU5oxlEmmNGGpdzLzpnAUy/NzLKgP8fG6Dm1sh
	ZgPdjwJ4rbFocEpN0BF7Kq9EDTEdol79TfFvfwHVpZ1WJJrm8iJwmqEgjUEgm/fHS8S14kifcQB
	vP3Ywn0qU/4gCfTVjKEJ6FAGcaFgv4c+RF4yMNniJJztPMc/7GJyAo15X9DVDUp2iYWdZPByGSK
	1PDmhnx
X-Google-Smtp-Source: AGHT+IHxqld34a90SEM7ZlyhxBZvKGmf9aZideR0Sg0xlweL+lpFqlqovs0nnqC44Do1K8CC6oK2kjmZ56tu8gmw1Tg=
X-Received: by 2002:a05:690e:430e:b0:5fc:541b:cea3 with SMTP id
 956f58d0204a3-6102135dfeemr9750495d50.2.1757526462993; Wed, 10 Sep 2025
 10:47:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-4-bb90a0f897d5@vinarskis.com> <CAOvMTZhxJ3atv62ui5+ahNKV1vb7JXnwwm4xxvg5p=o5p2HnDQ@mail.gmail.com>
In-Reply-To: <CAOvMTZhxJ3atv62ui5+ahNKV1vb7JXnwwm4xxvg5p=o5p2HnDQ@mail.gmail.com>
From: Steev Klimaszewski <threeway@gmail.com>
Date: Wed, 10 Sep 2025 12:47:32 -0500
X-Gm-Features: Ac12FXwyR3KsW504KghsIm6qGTQ8W8fmNLhinJPGzylKTRxTbEJk3t0TSqYGRWY
Message-ID: <CAOvMTZhmacxPsM3GcLL9cNq-1BonkwycYKY=hwtVXTz5UF_LYQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera
 privacy indicator
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aleksandrs,

On Wed, Sep 10, 2025 at 12:04=E2=80=AFPM Steev Klimaszewski <threeway@gmail=
.com> wrote:
>
> Hi Aleksandrs,
>
> On Wed, Sep 10, 2025 at 7:01=E2=80=AFAM Aleksandrs Vinarskis <alex@vinars=
kis.com> wrote:
> >
> > Leverage newly introduced 'leds' and 'led-names' properties to pass
> > indicator's phandle and function to v4l2 subnode. The latter supports
> > privacy led since couple of years ago under 'privacy-led' designation.
> > Unlike initially proposed trigger-source based approach, this solution
> > cannot be easily bypassed from userspace, thus reducing privacy
> > concerns.
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 8 ++++---=
-
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts=
 b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > index 637430719e6d7d3c0eeb4abf2b80eea1f8289530..3b3f7137689a6fa292ffe4f=
ec8c1d1f20ee525bc 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > @@ -83,14 +83,11 @@ leds {
> >                 pinctrl-names =3D "default";
> >                 pinctrl-0 =3D <&cam_indicator_en>;
> >
> > -               led-camera-indicator {
> > -                       label =3D "white:camera-indicator";
> > +               privacy_led: privacy-led {
>
> Should this now be privacy_led: privacy { ?
>
> >                         function =3D LED_FUNCTION_INDICATOR;
> >                         color =3D <LED_COLOR_ID_WHITE>;
> >                         gpios =3D <&tlmm 28 GPIO_ACTIVE_HIGH>;
> > -                       linux,default-trigger =3D "none";
> >                         default-state =3D "off";
> > -                       /* Reuse as a panic indicator until we get a "c=
amera on" trigger */
> >                         panic-indicator;
> >                 };
> >         };
> > @@ -685,6 +682,9 @@ camera@10 {
> >                 pinctrl-names =3D "default";
> >                 pinctrl-0 =3D <&cam_rgb_default>;
> >
> > +               leds =3D <&privacy_led>;
> > +               led-names =3D "privacy";
> > +
> >                 clocks =3D <&camcc CAMCC_MCLK3_CLK>;
> >
> >                 orientation =3D <0>;      /* Front facing */
> >
> > --
> > 2.48.1
> >
>
> v5 does not turn the led on here on my X13s whereas v3 did (and v4 was
> not tested)

From IRC conversations, the issue was not having
https://lore.kernel.org/all/20250910104702.7470-1-hansg@kernel.org
applied - with this prerequisite, v5 works here

Tested-by: Steev Klimaszewski <threeway@gmail.com>

